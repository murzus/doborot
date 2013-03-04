package doborot

import groovy.xml.MarkupBuilder
import groovy.util.XmlParser
import javax.net.ssl.HttpsURLConnection
import java.io.OutputStreamWriter

class DocumentController {

    static allowedMethods = [save: "POST", update: "POST"]

  def beforeInterceptor = [action:this.&auth]

  def auth() {
    if(!session.user) {
      redirect(controller:"user", action:"login")
      return false
    }
  }
	
	def index() {
        redirect(action: "list", params: params)
    }

    def list = {
      if(!params.max) params.max = 10
      flash.id = params.id
      if(!params.id) params.id = "No User Supplied"

      def documentList
      def documentCount
      def author = session.user
      if(author.login=="murzus"){
	    documentList = Document.list( params )
        documentCount = Document.count()
      }else{
        def query = { eq('author', author) }
        documentList = Document.createCriteria().list(params, query)        
        documentCount = Document.createCriteria().count(query) 
      }
      
      [ documentInstanceList:documentList, documentCount:documentCount  ]
  }  

    def create() {
	      [documentInstance: new Document(params)]
    }

    def save() {
	    (!params.ukraine)?(params.phone='7'+params.phone):(params.phone='38'+params.phone)
	    Document d = new Document(params)
		d.setAuthor(session.user)
		d.send=new Date()
		d.recieve=new Date()
		def documentInstance = d
        if (!documentInstance.save(flush: true)) {
            render(view: "create", model: [documentInstance: documentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
        redirect(action: "show", id: documentInstance.id)
    }

    def show(Long id) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }
        [documentInstance: documentInstance]
    }

    def update(Long id, Long version) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (documentInstance.version > version) {
                documentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'document.label', default: 'Document')] as Object[],
                          "Another user has updated this Document while you were editing")
                render(view: "edit", model: [documentInstance: documentInstance])
                return
            }
        }

        documentInstance.properties = params

        if (!documentInstance.save(flush: true)) {
            render(view: "edit", model: [documentInstance: documentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
        redirect(action: "show", id: documentInstance.id)
    }
	
 def xmlSend= { 
     def documentList = Document.findAllByStatus("")  
	 if (!documentList) {
            redirect(action: "list")
            return
     }
  	 def url = new URL("https://##########/")
	 String proxyHost = "192.168.1.114";
     Integer proxyPort = 3128;
     HttpsURLConnection connection = url.openConnection(new Proxy(Proxy.Type.HTTP, new InetSocketAddress(proxyHost, proxyPort)));
     connection.setRequestMethod("POST")
	 connection.setRequestProperty("Content-Type", "text/xml")
     connection.setRequestProperty("charset", "utf-8")
	 connection.doOutput = true
	 def writer = new OutputStreamWriter(connection.outputStream)
     def xml = new MarkupBuilder(writer)
		             xml.request{
                      for(d in documentList){
                        "message "(type:"sms"){
		                 sender("ShebRaySud")
		                 text(d.text)
		                 abonent(number_sms:d.id,phone:d.phone)
		                }
                      }
                      security{
		                 login(value:"#####")
		                 password(value:"#######")
		              }		  
                     }
     writer.flush()
     writer.close()
     connection.connect()
     def respon = connection.content.text
          
	 def response = new XmlParser().parseText(respon)
	    if(response!=null){
			response.children().each {
    		if (it.name() == 'information'){
			  def posStr = it.@number_sms
			  if(posStr.isLong()){
			  def pos = posStr.toLong()
			  def d = Document.get(pos)
			  d.outId = it.@id_sms
			  d.status =it.text()
			  d.save(flush: true)
			  }
			 }	     
			}
		}	 	
	if(connection != null){connection.disconnect()}
  
   redirect(action: "list")			
   return
 }
  
 def StatusRequest= { 
	 def documentList = Document.findAllByStatus("send")
	 if (!documentList) {
            redirect(action: "list")
            return
        }
  	  def url = new URL("https://#########")
      String proxyHost = "192.168.1.114";
      Integer proxyPort = 3128;
    HttpsURLConnection connection = url.openConnection(new Proxy(Proxy.Type.HTTP, new InetSocketAddress(proxyHost, proxyPort)));
    connection.setRequestMethod("POST")
	connection.setRequestProperty("Content-Type", "text/xml")
    connection.setRequestProperty("charset", "utf-8")
	connection.doOutput = true
    def writer = new OutputStreamWriter(connection.outputStream)
    def xml = new MarkupBuilder(writer)
		             xml.request{
					 security{
		                 login(value:"######")
		                 password(value:"#######")
		              }	
				       get_state{
					   for(d in documentList){
		                 id_sms(d.outId)
		                }
                      }
                    }
     writer.flush()
     writer.close()
     connection.connect()
	 def respon = connection.content.text
	 
	  /* def prt = new PrintStream(new BufferedOutputStream(
                       new FileOutputStream("respondStatus.txt", false)), false, "utf-8")
              prt.print(respon)
			  prt.flush()
              prt.close()
			  */
			  
	 def response = new XmlParser().parseText(respon)
		  if (response !=null ){
			response.children().each {
    		 if (it.name() == 'state'){
			 def d = Document.findByOutId(it.@id_sms)
			     if((d!=null)&&((d.status=it.text())!= null)&&(it.text()!="send")){
				    if ((it.@time != null) && (it.@time != "")){
				     def date = new Date().parse("yyyy-MM-dd HH:mm:SS", it.@time)
					                            //2012-09-28 11:33:27
					 if(date!=null){
                         d.recieve=date					 
			             d.save(flush: true)
					 }
					}
				   }
			 }
			}	     
		  }	
    if(connection!= null){connection.disconnect()}
		
  redirect(action: "list")			
  return
 }
}

package doborot

class Document {
    static belongsTo = [author:User]
    static constraints = {
      phone(minSize:10,maxSize:12,matches:"[0-9]+")
      text(maxSize:670,blank:false)
	  send()
	  recieve()
      status()
  }
  static mapping = {
    sort "send":"desc"
  }  
     String outId
     String phone
     String text
	 Date send	
	 Date recieve
	 String status
}

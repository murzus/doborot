package doborot

import java.text.SimpleDateFormat

class DateTagLib {
  def longDate = {attrs, body ->
    def b = attrs.body ?: body()
    def d = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(b)
        
    //если атрибут format не задан, то использовать следующий
    def pattern = attrs["format"] ?: "hh:mm MMM d, yyyy"
    out << new SimpleDateFormat(pattern).format(d)
  }
}

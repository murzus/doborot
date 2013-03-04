package doborot

import java.text.SimpleDateFormat

class DateTagLib {
  def longDate = {attrs, body ->
    def b = attrs.body ?: body()
    def d = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(b)
        
    //���� ������� format �� �����, �� ������������ ���������
    def pattern = attrs["format"] ?: "hh:mm MMM d, yyyy"
    out << new SimpleDateFormat(pattern).format(d)
  }
}

class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
            constraints {
                   // �������� ����������� �����
              }
        }
        "/"(controller:"document")
		"500"(view:'/error')
   }
}
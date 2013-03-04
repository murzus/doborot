class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
            constraints {
                   // добавьте ограничения здесь
              }
        }
        "/"(controller:"document")
		"500"(view:'/error')
   }
}
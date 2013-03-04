<div id="header">
  <p><g:link class="header-main" controller="document"> SMS Gate</g:link></p>
  	
	<g:if test="${(session.user)}">
     ${session.user.name}
	 ${link(action:"logout", controller:"user"){" Выйти"}}
   </g:if>
   <g:else>
     ${link(action:"login", controller:"user"){"Войти"}}
   </g:else>
</div>
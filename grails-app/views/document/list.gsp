
<%@ page import="doborot.Document" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Документ')}" />
		<title>Список документов</title>
	</head>
	<body>
		<a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	
		<div class="nav" role="navigation">
			 <ul>
				<li><g:link class="create" action="create">Создать новый документ</g:link></li>
			</ul>
		</div>
	
		<div id="list-document" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<col width="15%"><col width="40%" text-align="left"><col width="15%"><col width="15%"><col width="15%">
				<thead>
					<tr>
				    					   						
						<g:sortableColumn property="phone" title="${message(code: 'document.phone.label', default: 'Телефон')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'document.text.label', default: 'Текст сообщения')}" />
					
						<g:sortableColumn property="send" title="${message(code: 'document.send.label', default: 'Отправлено')}" />
					
						<g:sortableColumn property="recieve" title="${message(code: 'document.recieve.label', default: 'Смена статуса')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'document.status.label', default: 'Статус')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentInstanceList}" status="i" var="documentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					    						
                      						
						<td><g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "phone")}</g:link></td>
					
						
						<td><g:if test="${session.user.login=="murzus"}">${fieldValue(bean: documentInstance, field: "author.name")}:</g:if>	
						${fieldValue(bean: documentInstance, field: "text")}</td>
						
					
						<td><g:formatDate format="HH:mm dMMMyyyy" date="${documentInstance.send}" /></td>
					
						<td><g:formatDate format="HH:mm dMMMyyyy" date="${documentInstance.recieve}" /></td>
					    
						<td> 
						   <g:if test="${documentInstance.status == 'send'}"> Передано оператору </g:if> 
						   <g:elseif test="${documentInstance.status == 'deliver'}"> Доставлено </g:elseif>
						   <g:elseif test="${documentInstance.status == 'not_deliver'}"> Не доставлено </g:elseif>
						   <g:elseif test="${documentInstance.status == 'expired'}"> Время истекло </g:elseif>
						   <g:elseif test="${documentInstance.status == 'partly_deliver'}"> Статус не получен  </g:elseif>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${session.user.login=="murzus"}">
		        <g:link action="xmlSend" >Передать оператору</g:link>
			    <g:link action="StatusRequest" >Синхронизировать</g:link>
			</g:if>	
		</div>
		
		<div class="pagination">
		   <g:paginate total="${documentCount}" params="${flash}"/>
		</div>
	</body>
</html>

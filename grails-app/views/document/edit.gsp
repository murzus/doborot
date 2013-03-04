<%@ page import="doborot.Document" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Документ1')}" />
		<title>Список документов 1</title>
	</head>
	<body>
		<a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	
		<div class="nav" role="navigation">
			<ul>
			    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			    <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
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
					    						
                      						
						<td>${fieldValue(bean: documentInstance, field: "phone")}</td>
					
						<td><g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "text")}</g:link></td>
					
						<td><g:formatDate format="HH:mm dMMMyyyy" date="${documentInstance.send}" /></td>
					
						<td><g:formatDate format="HH:mm dMMMyyyy" date="${documentInstance.recieve}" /></td>
					
						<td>${fieldValue(bean: documentInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		        
		</div>
		
		<div class="pagination">
		   <g:paginate total="${documentCount}" params="${flash}"/>
		</div>
	</body>
</html>

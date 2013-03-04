
<%@ page import="doborot.Document" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title>Просмотр</title>
	</head>
	<body>
		<a href="#show-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list">Назад к списку</g:link></li>
				<li><g:link class="create" action="create">Создать еще документ</g:link></li>
			</ul>
		</div>
		<div id="show-document" class="content scaffold-show" role="main">
		
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list document">
			
			    <g:if test="${documentInstance?.id}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label">Идентификационный номер</span>
					<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${documentInstance}" field="id"/></span>
				</li>
				</g:if>
				
				<g:if test="${documentInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label">Номер телефона</span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${documentInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label">Текст сообщения</span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${documentInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.send}">
				<li class="fieldcontain">
					<span id="send-label" class="property-label">Отправлено</span>
					
						<span class="property-value" aria-labelledby="send-label"><g:formatDate format="HH:mm:ss  dd-MMM-yyyy" date="${documentInstance?.send}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.recieve}">
				<li class="fieldcontain">
					<span id="recieve-label" class="property-label">Смена состояния статуса</span>
					
						<span class="property-value" aria-labelledby="recieve-label"><g:formatDate format="HH:mm:ss  dd-MMM-yyyy" date="${documentInstance?.recieve}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label">Статус</span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${documentInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
		
		</div>
	</body>
</html>

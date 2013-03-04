<%@ page import="doborot.Document" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title>Создание</title>
	</head>
	<body>
	    <a href="#create-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list">Назад к списку сообщений</g:link></li>
			</ul>
		</div>
		<div id="create-document" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${documentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${documentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
			<g:hiddenField name="status" value= "" />
			<g:hiddenField name="outId" value= ""/>
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="ОТПРАВИТЬ" />
				</fieldset>
			</g:form>
		</div>
		<br/><br/><br/><br/><br/>
		<div id="footNote">
		 * Вводим 10-ти значный номер телефона </br></br>
		 
		<small >   примеры: <br>
           		если тел<span id="numbers"> 89201234567</span> то вводим <span id="numbers">9201234567</span> </br>
						           
				   для Украинских номеров: <br>
				если №тел <span id="numbers">380661234567</span> то ставим галочку "Украина" и вносим <span id="numbers">0661234567</span> </br>   
				
		</small>
		</div>		
	</body>
</html>

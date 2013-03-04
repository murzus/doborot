<%@ page import="doborot.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="user.documents.label" default="Documents" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.documents?}" var="d">
    <li><g:link controller="document" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="document" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'document.label', default: 'Document')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} ">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		
	</label>
	<g:textField name="login" value="${userInstance?.login}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${userInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}" />
</div>


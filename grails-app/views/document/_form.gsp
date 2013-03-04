<%@ page import="doborot.Document" %>



<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'phone', 'error')} required">
	
	<p>
	<label for="phone">Телефон * </label>
	<g:textField name="phone" maxlength="10" pattern="${documentInstance.constraints.phone.matches}" required="" value="${documentInstance?.phone}"/>
	<g:checkBox name="ukraine" value="${false}"/> Украина
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'text', 'error')} required">
	<label for="text">Текст сообщения</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="670" required="" value="${documentInstance?.text}"/>
</div>




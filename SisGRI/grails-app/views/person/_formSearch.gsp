<%@ page import="org.sisgri.people.Person" %>


<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="person.name.label" default="name" />
	</label>
	<g:textField name="name" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="person.church.label" default="Church" />
	</label>
	<g:textField name="church" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'situation', 'error')} required">
	<label for="situation">
		<g:message code="person.situation.label" default="situation" />
	</label>
	<g:textField name="situation" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="person.cpf.label" default="cpf" />
	</label>
	<g:textField name="cpf" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="person.post.label" default="post" />
	</label>
	<g:select name="post" from="${personInstance.constraints.post.inList}" value="${personInstance?.post}" valueMessagePrefix="person.post" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="person.type.label" default="type" />
	</label>
	<g:select name="type" from="${personInstance.constraints.type.inList}" value="${personInstance?.type}" valueMessagePrefix="person.type" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birth', 'error')} required">
	<label for="birth">
		<g:message code="person.birth.label" default="birth" />
	</label>
	<g:datePicker name="birth" years="[2013, 2014]" precision="month"  value="${personInstance?.birth}" default="none" noSelection="['': '']" />

</div>


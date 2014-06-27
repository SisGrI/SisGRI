<%@ page import="org.sisgri.register.Exit" %>



<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="exit.category.label" default="Category" />
		
	</label>
	<g:select name="category" from="${exitInstance.constraints.category.inList}" value="${exitInstance?.category}" valueMessagePrefix="exit.category" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="exit.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${exitInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="exit.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" value="${fieldValue(bean: exitInstance, field: 'value')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="exit.church.label" default="Church" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${exitInstance?.church?.id}" class="many-to-one"/>

</div>


<%@ page import="org.sisgri.register.Entry" %>



<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="entry.category.label" default="Category" />
		
	</label>
	<g:select name="category" from="${entryInstance.constraints.category.inList}" value="${entryInstance?.category}" valueMessagePrefix="entry.category" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="entry.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${entryInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="entry.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" value="${fieldValue(bean: entryInstance, field: 'value')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="entry.church.label" default="Church" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${entryInstance?.church?.id}" class="many-to-one"/>

</div>


<%@ page import="org.sisgri.register.Entry" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="entry.church.label" default="Church" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${entryInstance?.church?.id}" class="many-to-one"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'category', 'error')} required">
		<label class="control-label col-md-3" for="category">
			<g:message code="entry.category.label" default="Category" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select name="category" from="${entryInstance.constraints.category.inList}" required="" value="${entryInstance?.category}" valueMessagePrefix="entry.category"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="entry.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField name="name" required="" value="${entryInstance?.name}"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'value', 'error')} required">
		<label class="control-label col-md-3" for="value">
			<g:message code="entry.value.label" default="Value" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:field name="value" value="${fieldValue(bean: entryInstance, field: 'value')}" required=""/>

		</div>
	</div>
</div>


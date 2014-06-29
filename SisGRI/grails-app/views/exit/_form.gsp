<%@ page import="org.sisgri.register.Exit" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="exit.church.label" default="Church" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${exitInstance?.church?.id}" class="many-to-one"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'category', 'error')} ">
		<label class="control-label col-md-3" for="category">
			<g:message code="exit.category.label" default="Category" />
			
		</label>
		<div class="col-md-4">
			<g:select name="category" from="${exitInstance.constraints.category.inList}" value="${exitInstance?.category}" valueMessagePrefix="exit.category" noSelection="['': '']"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="exit.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField name="name" required="" value="${exitInstance?.name}"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: exitInstance, field: 'value', 'error')} required">
		<label class="control-label col-md-3" for="value">
			<g:message code="exit.value.label" default="Value" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:field name="value" value="${fieldValue(bean: exitInstance, field: 'value')}" required=""/>

		</div>
	</div>
</div>


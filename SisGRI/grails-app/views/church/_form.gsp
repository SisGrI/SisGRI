<%@ page import="org.sisgri.church.Church" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: churchInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="church.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${churchInstance?.name}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: churchInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="church.address.label" default="Address" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="address" required="" value="${churchInstance?.address}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: churchInstance, field: 'registers', 'error')} ">
		<label class="control-label col-md-3" for="registers">
			<g:message code="church.registers.label" default="Registers" />
			
		</label>
		<div class="col-md-4">
			
<ul class="one-to-many">
<li class="add">
<g:link class="btn blue" controller="register" action="create" params="['church.id': churchInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'register.label', default: 'Register')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>


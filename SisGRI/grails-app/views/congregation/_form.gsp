<%@ page import="org.sisgri.church.Congregation" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="congregation.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${congregationInstance?.name}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="congregation.address.label" default="Address" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="address" required="" value="${congregationInstance?.address}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'registers', 'error')} ">
		<label class="control-label col-md-3" for="registers">
			<g:message code="congregation.registers.label" default="Registers" />
			
		</label>
		<div class="col-md-4">
			
<ul class="one-to-many">
<li class="add">
<g:link class="btn blue" controller="register" action="create" params="['congregation.id': congregationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'register.label', default: 'Register')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'subHeadquarter', 'error')} required">
		<label class="control-label col-md-3" for="subHeadquarter">
			<g:message code="congregation.subHeadquarter.label" default="Sub Headquarter" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="subHeadquarter" name="subHeadquarter.id" from="${org.sisgri.church.SubHeadquarter.list()}" optionKey="id" required="" value="${congregationInstance?.subHeadquarter?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


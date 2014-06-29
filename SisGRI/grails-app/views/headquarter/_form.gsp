<%@ page import="org.sisgri.church.Headquarter" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: headquarterInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="headquarter.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField name="name" required="" value="${headquarterInstance?.name}"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: headquarterInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="headquarter.address.label" default="Address" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField name="address" required="" value="${headquarterInstance?.address}"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: headquarterInstance, field: 'registers', 'error')} ">
		<label class="control-label col-md-3" for="registers">
			<g:message code="headquarter.registers.label" default="Registers" />
			
		</label>
		<div class="col-md-4">
			
<ul class="one-to-many">
<g:each in="${headquarterInstance?.registers?}" var="r">
    <li><g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="register" action="create" params="['headquarter.id': headquarterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'register.label', default: 'Register')])}</g:link>
</li>
</ul>


		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: headquarterInstance, field: 'subHeadquarters', 'error')} ">
		<label class="control-label col-md-3" for="subHeadquarters">
			<g:message code="headquarter.subHeadquarters.label" default="Sub Headquarters" />
			
		</label>
		<div class="col-md-4">
			
<ul class="one-to-many">
<g:each in="${headquarterInstance?.subHeadquarters?}" var="s">
    <li><g:link controller="subHeadquarter" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subHeadquarter" action="create" params="['headquarter.id': headquarterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subHeadquarter.label', default: 'SubHeadquarter')])}</g:link>
</li>
</ul>


		</div>
	</div>
</div>


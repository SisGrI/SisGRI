<%@ page import="org.sisgri.church.SubHeadquarter" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="subHeadquarter.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField name="name" required="" value="${subHeadquarterInstance?.name}"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="subHeadquarter.address.label" default="Address" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField name="address" required="" value="${subHeadquarterInstance?.address}"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'registers', 'error')} ">
		<label class="control-label col-md-3" for="registers">
			<g:message code="subHeadquarter.registers.label" default="Registers" />
			
		</label>
		<div class="col-md-4">
			
<ul class="one-to-many">
<g:each in="${subHeadquarterInstance?.registers?}" var="r">
    <li><g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="register" action="create" params="['subHeadquarter.id': subHeadquarterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'register.label', default: 'Register')])}</g:link>
</li>
</ul>


		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'congregations', 'error')} ">
		<label class="control-label col-md-3" for="congregations">
			<g:message code="subHeadquarter.congregations.label" default="Congregations" />
			
		</label>
		<div class="col-md-4">
			
<ul class="one-to-many">
<g:each in="${subHeadquarterInstance?.congregations?}" var="c">
    <li><g:link controller="congregation" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="congregation" action="create" params="['subHeadquarter.id': subHeadquarterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'congregation.label', default: 'Congregation')])}</g:link>
</li>
</ul>


		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'headquarter', 'error')} required">
		<label class="control-label col-md-3" for="headquarter">
			<g:message code="subHeadquarter.headquarter.label" default="Headquarter" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select id="headquarter" name="headquarter.id" from="${org.sisgri.church.Headquarter.list()}" optionKey="id" required="" value="${subHeadquarterInstance?.headquarter?.id}" class="many-to-one"/>

		</div>
	</div>
</div>


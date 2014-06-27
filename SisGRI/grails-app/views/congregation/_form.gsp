<%@ page import="org.sisgri.church.Congregation" %>



<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="congregation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${congregationInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="congregation.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${congregationInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'registers', 'error')} ">
	<label for="registers">
		<g:message code="congregation.registers.label" default="Registers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${congregationInstance?.registers?}" var="r">
    <li><g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="register" action="create" params="['congregation.id': congregationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'register.label', default: 'Register')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'subHeadquarter', 'error')} required">
	<label for="subHeadquarter">
		<g:message code="congregation.subHeadquarter.label" default="Sub Headquarter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subHeadquarter" name="subHeadquarter.id" from="${org.sisgri.church.SubHeadquarter.list()}" optionKey="id" required="" value="${congregationInstance?.subHeadquarter?.id}" class="many-to-one"/>

</div>


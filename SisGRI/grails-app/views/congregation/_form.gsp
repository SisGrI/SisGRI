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

<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'subHeadquarter', 'error')} required">
	<label for="subHeadquarter">
		<g:message code="congregation.subHeadquarter.label" default="Sub Headquarter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subHeadquarter" name="subHeadquarter.id" from="${org.sisgri.church.SubHeadquarter.list()}" optionKey="id" required="" value="${congregationInstance?.subHeadquarter?.id}" class="many-to-one"/>

</div>


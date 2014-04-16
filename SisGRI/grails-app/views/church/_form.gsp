<%@ page import="org.sisgri.church.Church" %>



<div class="fieldcontain ${hasErrors(bean: churchInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="church.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${churchInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: churchInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="church.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${churchInstance?.address}"/>

</div>


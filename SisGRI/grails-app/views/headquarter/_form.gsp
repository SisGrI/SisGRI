<%@ page import="org.sisgri.church.Headquarter" %>



<div class="fieldcontain ${hasErrors(bean: headquarterInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="headquarter.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${headquarterInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headquarterInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="headquarter.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${headquarterInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headquarterInstance, field: 'subHeadquarters', 'error')} ">
	<label for="subHeadquarters">
		<g:message code="headquarter.subHeadquarters.label" default="Sub Headquarters" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${headquarterInstance?.subHeadquarters?}" var="s">
    <li><g:link controller="subHeadquarter" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subHeadquarter" action="create" params="['headquarter.id': headquarterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subHeadquarter.label', default: 'SubHeadquarter')])}</g:link>
</li>
</ul>


</div>


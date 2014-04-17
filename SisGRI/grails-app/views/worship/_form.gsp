<%@ page import="org.sisgri.worship.Worship" %>



<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="worship.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${worshipInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="worship.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" years="[2013, 2014]" precision="day"  value="${worshipInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'ruling', 'error')} required">
	<label for="ruling">
		<g:message code="worship.ruling.label" default="Ruling" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ruling" required="" value="${worshipInstance?.ruling}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'prelector', 'error')} required">
	<label for="prelector">
		<g:message code="worship.prelector.label" default="Prelector" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prelector" required="" value="${worshipInstance?.prelector}"/>

</div>


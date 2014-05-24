<%@ page import="org.sisgri.worship.Worship" %>



<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="worship.church.label" default="Church" />
	</label>
	<g:textField name="church" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="worship.type.label" default="Type" />
	</label>
	<g:select name="type" from="${worshipInstance.constraints.type.inList}" value="${worshipInstance?.type}" valueMessagePrefix="worship.type" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="worship.date.label" default="Date" />
	</label>
	<g:datePicker name="date" years="[2013, 2014]" precision="month"  value="${worshipInstance?.date}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'ruling', 'error')} required">
	<label for="ruling">
		<g:message code="worship.ruling.label" default="Ruling" />
	</label>
	<g:textField name="ruling" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'prelector', 'error')} required">
	<label for="prelector">
		<g:message code="worship.prelector.label" default="Prelector" />
	</label>
	<g:textField name="prelector" value=""/>

</div>


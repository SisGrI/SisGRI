<%@ page import="org.sisgri.worship.Worship" %>



<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="worship.church.label" default="Church" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${worshipInstance?.church?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="worship.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${worshipInstance.constraints.type.inList}" required="" value="${worshipInstance?.type}" valueMessagePrefix="worship.type"/>

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
	<g:select id="ruling" name="ruling.id" from="${org.sisgri.people.Person.list()}" optionKey="id" required="" value="${worshipInstance?.ruling?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'prelector', 'error')} required">
	<label for="prelector">
		<g:message code="worship.prelector.label" default="Prelector" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prelector" name="prelector.id" from="${org.sisgri.people.Person.list()}" optionKey="id" required="" value="${worshipInstance?.prelector?.id}" class="many-to-one"/>

</div>


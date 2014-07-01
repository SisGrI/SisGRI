<%@ page import="org.sisgri.worship.Worship" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="worship.church.label" default="Igreja" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${worshipInstance?.church?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="worship.type.label" default="Tipo" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="type" from="${worshipInstance.constraints.type.inList}" required="" value="${worshipInstance?.type}" valueMessagePrefix="worship.type"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'date', 'error')} required">
		<label class="control-label col-md-3" for="date">
			<g:message code="worship.date.label" default="Data" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:datePicker name="date" years="[2013, 2014]" precision="day"  value="${worshipInstance?.date}"  />
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'ruling', 'error')} required">
		<label class="control-label col-md-3" for="ruling">
			<g:message code="worship.ruling.label" default="Dirigente" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="ruling" name="ruling.id" from="${org.sisgri.people.Person.list()}" optionKey="id" required="" value="${worshipInstance?.ruling?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'prelector', 'error')} required">
		<label class="control-label col-md-3" for="prelector">
			<g:message code="worship.prelector.label" default="Preleitor" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="prelector" name="prelector.id" from="${org.sisgri.people.Person.list()}" optionKey="id" required="" value="${worshipInstance?.prelector?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


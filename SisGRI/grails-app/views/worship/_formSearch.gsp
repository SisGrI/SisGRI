<%@ page import="org.sisgri.worship.Worship" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'church', 'error')} ">
		<label class="control-label col-md-3" for="church">
			<g:message code="worship.church.label" default="Igreja" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="church" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="worship.type.label" default="Tipo" />
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="type" from="${worshipInstance.constraints.type.inList}" value="${worshipInstance?.type}" valueMessagePrefix="worship.type" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'date', 'error')} required">
		<label class="control-label col-md-3" for="date">
			<g:message code="worship.date.label" default="Data" />
		</label>
		<div class="col-md-4">
			<g:datePicker name="date" years="[2013, 2014]" precision="month"  value="${worshipInstance?.date}" default="none" noSelection="['': '']" />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'ruling', 'error')} ">
		<label class="control-label col-md-3" for="ruling">
			<g:message code="person.ruling.label" default="Dirigente" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="ruling" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'prelector', 'error')} ">
		<label class="control-label col-md-3" for="prelector">
			<g:message code="person.prelector.label" default="Preleitor" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="prelector" value=""/>
		</div>
	</div>
</div>

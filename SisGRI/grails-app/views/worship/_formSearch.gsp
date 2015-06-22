<%@ page import="org.sisgri.worship.Worship" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'church', 'error')} ">
		<label class="control-label col-md-3" for="church">
			<g:message code="worship.church.label" default="Igreja" />
		</label>
		<div class="col-md-6">
			<g:select class="form-control" name="church" from="${churchList}" value="${personInstance?.church?.id}" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="worship.type.label" default="Tipo" />
		</label>
		<div class="col-md-6">
			<g:select class="form-control" name="type" from="${worshipInstance.constraints.type.inList}" value="${worshipInstance?.type}" valueMessagePrefix="worship.type" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'date', 'error')} required">
		<label class="control-label col-md-3" for="date">
			<g:message code="worship.date.label" default="Data" />
		</label>
		<div class="col-md-6">
			<g:datePicker name="date" years="[2013, 2014, 2015]" precision="month"  value="" default="none" noSelection="['': '']" />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'rulingName', 'error')} ">
		<label class="control-label col-md-3" for="rulingName">
			<g:message code="person.rulingName.label" default="Dirigente" />
		</label>
		<div class="col-md-6">
			<g:textField class="form-control" name="rulingName" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'prelectorName', 'error')} ">
		<label class="control-label col-md-3" for="prelectorName">
			<g:message code="person.prelectorName.label" default="Preleitor" />
		</label>
		<div class="col-md-6">
			<g:textField class="form-control" name="prelectorName" value=""/>
		</div>
	</div>
</div>

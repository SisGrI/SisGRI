<%@ page import="org.sisgri.people.Person" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
		<label class="control-label col-md-3" for="name">
			<g:message code="person.name.label" default="Name" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'church', 'error')} ">
		<label class="control-label col-md-3" for="church">
			<g:message code="person.church.label" default="Church" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="church" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'situation', 'error')} ">
		<label class="control-label col-md-3" for="situation">
			<g:message code="person.situation.label" default="Situation" />
			
		</label>
		<div class="col-md-4">
			<g:radioGroup name="situation" labels="['Sim','Não']" values="['true','false']" value="">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cpf', 'error')} ">
		<label class="control-label col-md-3" for="cpf">
			<g:message code="person.cpf.label" default="CPF" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="cpf" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'post', 'error')} ">
		<label class="control-label col-md-3" for="post">
			<g:message code="person.post.label" default="Post" />
			
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="post" from="${personInstance.constraints.post.inList}" value="${personInstance?.post}" valueMessagePrefix="person.post" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="person.type.label" default="Type" />
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="type" from="${personInstance.constraints.type.inList}" value="${personInstance?.type}" valueMessagePrefix="person.type" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birth', 'error')} required">
		<label class="control-label col-md-3" for="birth">
			<g:message code="person.birth.label" default="Birth" />
		</label>
		<div class="col-md-4">
			<g:datePicker name="birth" years="[2013, 2014]" precision="month"  value="${personInstance?.birth}" default="none" noSelection="['': '']" />
		</div>
	</div>
</div>

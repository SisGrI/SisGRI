<%@ page import="org.sisgri.register.Register" %>

<g:javascript>
	$(document).ready(function() {
		$('#exit').hide();
		$('#exitRegister').attr("required",false);
	});
	function show_category() {
		var type = $('#type').val();
		
		if(type == "Entrada") {
			$('#entry').show();
			$('#exit').hide();
			$('#exit').attr("required",false);
		}
		else {
			$('#exit').show();
			$('#entry').hide();
			$('#entryRegister').attr("required",false);	
		}
	}
</g:javascript>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="register.church.label" default="Igreja" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="church" name="church.id" from="${churchList}" optionKey="id" required="" value="${registerInstance?.church?.id}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="register.type.label" default="Tipo" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="type" from="${registerInstance.constraints.type.inList}" required="" value="${registerInstance?.type}" valueMessagePrefix="register.type" onchange="show_category()"/>
		</div>
	</div>
</div>

<div class="form-group" id="entry">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'entryRegister', 'error')} required">
		<label class="control-label col-md-3" for="entryRegister">
			<g:message code="register.entryRegister.label" default="Entrada" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="entryRegister" from="${registerInstance.constraints.entryRegister.inList}" required="" value="${registerInstance?.entryRegister}" valueMessagePrefix="register.entryRegister" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group" id="exit">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'exitRegister', 'error')} required">
		<label class="control-label col-md-3" for="exitRegister">
			<g:message code="register.exitRegister.label" default="Saída" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="exitRegister" from="${registerInstance.constraints.exitRegister.inList}" required="" value="${registerInstance?.exitRegister}" valueMessagePrefix="register.exitRegister" noSelection="['': '']"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="register.name.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${registerInstance?.name}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'value', 'error')} required">
		<label class="control-label col-md-3" for="value">
			<g:message code="register.value.label" default="Valor" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:field class="form-control" name="value" value="${fieldValue(bean: registerInstance, field: 'value')}" required=""/>
		</div>
	</div>
</div>

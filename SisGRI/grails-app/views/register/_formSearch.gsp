<%@ page import="org.sisgri.register.Register" %>

<script type="text/javascript">
	$(document).ready(function() {
		$('#value').maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$('#exit').hide();
	});
	function show_category() {
		var type = $('#type').val();
		
		if(type == "Entrada") {
			$('#entry').show();
			$('#exit').hide();
		}
		else {
			$('#exit').show();
			$('#entry').hide();
		}
	}
</script>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'church', 'error')} ">
		<label class="control-label col-md-3" for="church">
			<g:message code="register.church.label" default="Igreja" />
		</label>
		<div class="col-md-6">
			<g:select class="form-control" name="church" from="${churchList}" value="${personInstance?.church?.id}"/>
		</div>
	</div>
</div>

<div class="form-group" id="dateToRegisters">
	<label class="control-label col-md-3">
		Data
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-4">
		<div class="input-group input-large date-picker input-daterange" data-date-format="dd/mm/yyyy">
			<input type="text" class="form-control" id="from" name="from" required="">
			<span class="input-group-addon">
				 até
			</span>
			<input type="text" class="form-control" id="to" name="to" required="">
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'type', 'error')}">
		<label class="control-label col-md-3" for="type">
			<g:message code="register.type.label" default="Tipo" />
		</label>
		<div class="col-md-6">
			<g:select class="form-control" name="type" from="${registerInstance.constraints.type.inList}" value="${registerInstance?.type}" valueMessagePrefix="register.type" onchange="show_category()" />
		</div>
	</div>
</div>

<div class="form-group" id="entry">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'entryRegister', 'error')}">
		<label class="control-label col-md-3" for="entryRegister">
			<g:message code="register.entryRegister.label" default="Entrada" />
		</label>
		<div class="col-md-6">
			<g:select class="form-control" name="entryRegister" from="${registerInstance.constraints.entryRegister.inList}" value="${registerInstance?.entryRegister}" valueMessagePrefix="register.entryRegister" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group" id="exit">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'exitRegister', 'error')}">
		<label class="control-label col-md-3" for="exitRegister">
			<g:message code="register.exitRegister.label" default="Saída" />
		</label>
		<div class="col-md-6">
			<g:select class="form-control" name="exitRegister" from="${registerInstance.constraints.exitRegister.inList}" value="${registerInstance?.exitRegister}" valueMessagePrefix="register.exitRegister" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'name', 'error')} ">
		<label class="control-label col-md-3" for="name">
			<g:message code="register.name.label" default="Nome" />
		</label>
		<div class="col-md-6">
			<g:textField class="form-control" name="name" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'value', 'error')}">
		<label class="control-label col-md-3" for="value">
			<g:message code="register.value.label" default="Valor" />
		</label>
		<div class="col-md-6">
			<g:field class="form-control" name="value" value="${fieldValue(bean: registerInstance, field: 'value')}" />
		</div>
	</div>
</div>
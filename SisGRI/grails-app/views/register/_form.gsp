<%@ page import="org.sisgri.register.Register" %>

<script type="text/javascript">
	$(document).ready(function() {
		$('#value').maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$('#exit').hide();
		$('#exitRegister').attr("required",false);

		$("#entryRegister").children('option[value="Saldo Anterior"]').hide();
		$("#exitRegister").children('option[value="2.01 - REPASSE P/ SEDE"]').hide();
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
	function clearNameField() {
		$('#nameField').val("");
		$('#personID').val("");
		$('#nameField').attr("readonly", false);
	}
	function hideName(value) {
		if (value != "1.01 - (*) DIZIMO OBREIROS" &&
			value != "1.02 - (*) DIZIMO MEMBROS" &&
			value != "1.05 - (*) OFERTAS ESPECÍFICAS" &&
			value != "1.16 - OFERTA MISSÕES" &&
			value != "1.21 - OFERTA P/ CONSTRUÇÃO" &&
			value != "1.23 - TAXA CONS. DIACONAL") {
			$('#nameDiv').hide();
			$('#nameField').attr("required",false);
		}
		else {
			$('#nameDiv').show();
			$('#nameField').attr("required",true);
		}
	}
</script>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="register.church.label" default="Igreja" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
			<g:select class="form-control" id="church" name="church.id" from="${churchList}" optionKey="id" required="" value="${registerInstance?.church?.id}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'date', 'error')} required">
		<label class="control-label col-md-3" for="date">
			<g:message code="worship.date.label" default="Data" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
			<g:textField class="form-control date-picker" id="mask_date" name="stringDate" maxlength="10" size="15" value="${registerInstance?.stringDate}" />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="register.type.label" default="Tipo" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
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
		<div class="col-md-6">
			<g:select class="form-control" name="entryRegister" from="${registerInstance.constraints.entryRegister.inList}" required="" value="${registerInstance?.entryRegister}" valueMessagePrefix="register.entryRegister" noSelection="['': '']" onchange="hideName(this.value);" />
		</div>
	</div>
</div>

<div class="form-group" id="exit">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'exitRegister', 'error')} required">
		<label class="control-label col-md-3" for="exitRegister">
			<g:message code="register.exitRegister.label" default="Saída" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
			<g:select class="form-control" name="exitRegister" from="${registerInstance.constraints.exitRegister.inList}" required="" value="${registerInstance?.exitRegister}" valueMessagePrefix="register.exitRegister" noSelection="['': '']" />
		</div>
	</div>
</div>


<div class="form-group" id="nameDiv">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="register.name.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
			<div class="input-group">
				<g:textField class="form-control" id="nameField" name="name" required="" value="${registerInstance?.name}"/>
				<span class="input-group-btn">
	                <a class="btn btn-default blue" id="searchPerson" data-toggle="modal" href="#modalSearchPerson" onclick="${remoteFunction(action: 'choosePerson', update: 'choosePerson', params: '\'personName=\' + escape(nameField.value)')};setPerson();" title="Pesquisar Pessoa"><i class="fa fa-search"></i></a>
	                <button type="button" class="btn btn-default yellow" id="clearName" onclick="clearNameField();"><i class="fa fa-refresh"></i>Limpar</button>
	            </span>
            </div>
		</div>
	</div>
</div>

<g:hiddenField name="personID" value="${registerInstance?.person?.id}" />

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'value', 'error')} required">
		<label class="control-label col-md-3" for="value">
			<g:message code="register.value.label" default="Valor" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
			<g:field class="form-control" name="value" value="${fieldValue(bean: registerInstance, field: 'formatedValue')}" required=""/>
		</div>
	</div>
</div>

<div class="modal fade" id="modalSearchPerson" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="myModalLabel">Pesquisar Pessoa</h4>
            </div>
            <div class="modal-body">
                <g:render template="choosePerson"/>
            </div>
        </div>
    </div>
</div>

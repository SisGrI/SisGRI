<%@ page import="org.sisgri.worship.Worship" %>

<script type="text/javascript">
	function setTypeSearch(element) {
		$('#typeSearch').val(element.id);
	}
	function clearRulingField() {
		$('#rulingName').val("");
		$('#rulingID').val("");
		$('#rulingName').attr("readonly", false);
	}
	function clearPrelectorField() {
		$('#prelectorName').val("");
		$('#prelectorID').val("");
		$('#prelectorName').attr("readonly", false);
	}
</script>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="worship.church.label" default="Igreja" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="church" name="church.id" from="${churchList}" optionKey="id" required="" value="${worshipInstance?.church?.id}"/>
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
			<g:textField class="form-control" id="mask_date" name="stringDate" required="" value="${worshipInstance?.stringDate}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'rulingName', 'error')} required">
		<label class="control-label col-md-3" for="rulingName">
			<g:message code="worship.rulingName.label" default="Dirigente" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
			<div class="input-group">
				<g:textField class="form-control" name="rulingName" value="${worshipInstance?.rulingName}" require=""/>
				<span class="input-group-btn">
	                <a class="btn btn-default blue" id="searchRuling" data-toggle="modal" href="#modalSearchPerson" onclick="${remoteFunction(action: 'choosePerson', update: 'choosePerson', params: '\'person=\' + escape(rulingName.value)')};setTypeSearch(this);setPerson();" title="Pesquisar Dirigente"><i class="fa fa-search"></i></a>
	                <button type="button" class="btn btn-default yellow" id="clearRuling" onclick="clearRulingField();"><i class="fa fa-refresh"></i>Limpar</button>
	            </span>
            </div>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'prelectorName', 'error')} required">
		<label class="control-label col-md-3" for="prelectorName">
			<g:message code="worship.prelectorName.label" default="Preleitor" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-6">
			<div class="input-group">
				<g:textField class="form-control" name="prelectorName" value="${worshipInstance?.prelectorName}" require=""/>
				<span class="input-group-btn">
	                <a class="btn btn-default blue" id="searchPrelector" data-toggle="modal" href="#modalSearchPerson" onclick="${remoteFunction(action: 'choosePerson', update: 'choosePerson', params: '\'person=\' + escape(prelectorName.value)')};setTypeSearch(this);setPerson();" title="Pesquisar Dirigente"><i class="fa fa-search"></i></a>
	                <button type="button" class="btn btn-default yellow" id="clearPrelector" onclick="clearPrelectorField();"><i class="fa fa-refresh"></i>Limpar</button>
	            </span>
            </div>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: worshipInstance, field: 'observation', 'error')} ">
		<label class="control-label col-md-3" for="observation">
			<g:message code="worship.observation.label" default="Observação" />
			
		</label>
		<div class="col-md-4">
			<g:textArea class="form-control" name="observation" cols="40" rows="5" value="${worshipInstance?.observation}"/>
		</div>
	</div>
</div>

<g:hiddenField name="typeSearch" value="" />
<g:hiddenField name="rulingID" value="${worshipInstance?.ruling?.id}" />
<g:hiddenField name="prelectorID" value="${worshipInstance?.prelector?.id}" />

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
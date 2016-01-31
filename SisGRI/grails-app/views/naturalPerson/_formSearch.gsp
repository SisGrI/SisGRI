<%@ page import="org.sisgri.people.NaturalPerson" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'church', 'error')} ">
		<label class="control-label col-md-3" for="church">
			<g:message code="person.church.label" default="Igreja" />
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="church" from="${churchList}" value="${naturalPersonInstance?.church?.id}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'name', 'error')} ">
		<label class="control-label col-md-3" for="name">
			<g:message code="person.name.label" default="Nome" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'situation', 'error')} ">
		<label class="control-label col-md-3" for="situation">
			<g:message code="person.situation.label" default="Situação" />
			
		</label>
		<div class="col-md-4">
			<g:radioGroup name="situation" labels="['Ativo','Inativo']" values="['true','false']" value="">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'cpf', 'error')} ">
		<label class="control-label col-md-3" for="cpf">
			<g:message code="person.cpf.label" default="CPF" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="cpf" value=""/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'department', 'error')} required">
		<label class="control-label col-md-3" for="department">
			<g:message code="person.department.label" default="Departamento" />
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="department" from="${naturalPersonInstance.constraints.department.inList}" value="${naturalPersonInstance?.department}" valueMessagePrefix="person.department" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'post', 'error')} ">
		<label class="control-label col-md-3" for="post">
			<g:message code="person.post.label" default="Cargo" />
			
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="post" from="${['Todos', 'Cooperador(a)','Diácono(a)','Presbítero','Evangelista','Missionário(a)','Pastor']}" value="${naturalPersonInstance?.post}" valueMessagePrefix="person.post" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="person.type.label" default="Tipo" />
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="type" from="${naturalPersonInstance.constraints.type.inList}" value="${naturalPersonInstance?.type}" valueMessagePrefix="person.type" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'birth', 'error')} required">
		<label class="control-label col-md-3" for="birth">
			<g:message code="person.birth.label" default="Nascimento" />
		</label>
		<div class="col-md-4">
			<select class="form-control" name="date_month">
				<option value=''></option>
				<option value='1'>Janeiro</option>
				<option value='2'>Fevereiro</option>
			    <option value='3'>Março</option>
			    <option value='4'>Abril</option>
			    <option value='5'>Maio</option>
			    <option value='6'>Junho</option>
			    <option value='7'>Julho</option>
			    <option value='8'>Agosto</option>
			    <option value='9'>Setembro</option>
			    <option value='10'>Outubro</option>
			    <option value='11'>Novembro</option>
			    <option value='12'>Dezembro</option>
			</select>
		</div>
	</div>
</div>

<%@ page import="org.sisgri.people.LegalPerson" %>

<script type="text/javascript">
    $(document).ready(function() {
    	$("#name").focus();
        $("#cnpj").inputmask("mask", {"mask": "99.999.999/9999-99"});
    });
</script>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="legalPerson.name.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${legalPersonInstance?.name}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'cnpj', 'error')} required">
		<label class="control-label col-md-3" for="cnpj">
			<g:message code="legalPerson.cnpj.label" default="CNPJ" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="cnpj" required="" value="${legalPersonInstance?.cnpj}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'field', 'error')} required">
		<label class="control-label col-md-3" for="field">
			<g:message code="legalPerson.field.label" default="Área de Atuação" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="field" value="${legalPersonInstance?.field}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="legalPerson.address.label" default="Endereço" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="address" value="${legalPersonInstance?.address}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'city', 'error')} required">
		<label class="control-label col-md-3" for="city">
			<g:message code="legalPerson.city.label" default="Cidade" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="city" value="${legalPersonInstance?.city}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'zipCode', 'error')} required">
		<label class="control-label col-md-3" for="zipCode">
			<g:message code="legalPerson.zipCode.label" default="CEP" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_cep" name="zipCode" value="${legalPersonInstance?.zipCode}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'telephone', 'error')} ">
		<label class="control-label col-md-3" for="telephone">
			<g:message code="legalPerson.telephone.label" default="Telefone" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="telephone" value="${legalPersonInstance?.telephone}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'email', 'error')} ">
		<label class="control-label col-md-3" for="email">
			<g:message code="legalPerson.email.label" default="E-mail" />
			
		</label>
		<div class="col-md-4">
			<g:field class="form-control" type="email" name="email" value="${legalPersonInstance?.email}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: legalPersonInstance, field: 'observation', 'error')} ">
		<label class="control-label col-md-3" for="observation">
			<g:message code="legalPerson.observation.label" default="Observação" />
			
		</label>
		<div class="col-md-4">
			<g:textArea class="form-control" name="observation" cols="40" rows="5" value="${legalPersonInstance?.observation}"/>
		</div>
	</div>
</div>

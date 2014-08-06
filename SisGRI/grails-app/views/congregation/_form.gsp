<%@ page import="org.sisgri.church.Congregation" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="congregation.name.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${congregationInstance?.name}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="congregation.address.label" default="Endereço" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="address" required="" value="${congregationInstance?.address}"/>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: congregationInstance, field: 'headquarter', 'error')} required">
		<label class="control-label col-md-3" for="headquarter">
			<g:message code="congregation.headquarter.label" default="Sede" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="headquarter" name="headquarter.id" from="${org.sisgri.church.Headquarter.list()}" optionKey="id" required="" value="${congregationInstance?.headquarter?.id}"/>
		</div>
	</div>
</div>


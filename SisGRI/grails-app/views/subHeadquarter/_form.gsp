<%@ page import="org.sisgri.church.SubHeadquarter" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="subHeadquarter.name.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${subHeadquarterInstance?.name}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="subHeadquarter.address.label" default="Endereço" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="address" required="" value="${subHeadquarterInstance?.address}"/>
		</div>
	</div>
</div>
<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: subHeadquarterInstance, field: 'headquarter', 'error')} required">
		<label class="control-label col-md-3" for="headquarter">
			<g:message code="subHeadquarter.headquarter.label" default="Sede" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="headquarter" name="headquarter.id" from="${org.sisgri.church.Headquarter.list()}" optionKey="id" required="" value="${subHeadquarterInstance?.headquarter?.id}"/>
		</div>
	</div>
</div>


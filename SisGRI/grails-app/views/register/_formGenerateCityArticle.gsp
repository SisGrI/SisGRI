<%@ page import="org.sisgri.register.Register" %>

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

<div class="form-group" id="dateToCityArticle">
	<label class="control-label col-md-3">
		Mês de Referência
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-4">
		<div class="input-group">
			<select class="form-control" id="month" name="month" required="">
				<option value=''></option>
				<option value='01'>Janeiro</option>
				<option value='02'>Fevereiro</option>
			    <option value='03'>Março</option>
			    <option value='04'>Abril</option>
			    <option value='05'>Maio</option>
			    <option value='06'>Junho</option>
			    <option value='07'>Julho</option>
			    <option value='08'>Agosto</option>
			    <option value='09'>Setembro</option>
			    <option value='10'>Outubro</option>
			    <option value='11'>Novembro</option>
			    <option value='12'>Dezembro</option>
			</select>
			<select class="form-control" id="year" name="year" required="">
				<option value=''></option>
				<option value='2014'>2014</option>
				<option value='2015'>2015</option>
			    <option value='2016'>2016</option>
			</select>
		</div>
	</div>
</div>

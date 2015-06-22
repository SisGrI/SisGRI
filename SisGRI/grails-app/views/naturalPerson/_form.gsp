<%@ page import="org.sisgri.people.NaturalPerson" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'photo', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="naturalPerson.photo.label" default="Foto" />
		</label>
		<div class="col-md-9">
			<div class="fileinput fileinput-new" data-provides="fileinput">
				<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
					<g:if test="${naturalPersonInstance.id != null}">
						<img src="${createLink(action:'showPhoto', id: naturalPersonInstance.id)}" />
					</g:if>
					<g:if test="${naturalPersonInstance.id == null}">
						<img src="${resource(dir: 'images', file: 'no_photo.gif')}" alt=""/>
					</g:if>
				</div>
				<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
				</div>
				<div>
					<span class="btn default btn-file">
						<span class="fileinput-new">
							 Selecionar Imagem
						</span>
						<span class="fileinput-exists">
							 Mudar
						</span>
						<input type="file" name="photo" />
					</span>
					<a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
						 Remover
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="naturalPerson.church.label" default="Igreja" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="church" name="church.id" from="${churchList}" optionKey="id" required="" value="${naturalPersonInstance?.church?.id}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="naturalPerson.name.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${naturalPersonInstance?.name}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'cpf', 'error')}">
		<label class="control-label col-md-3" for="cpf">
			<g:message code="naturalPerson.cpf.label" default="CPF" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_cpf" name="cpf" value="${naturalPersonInstance?.cpf}"/>
		</div>
	</div>
</div>
<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'rg', 'error')}">
		<label class="control-label col-md-3" for="rg">
			<g:message code="naturalPerson.rg.label" default="RG" />
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="rg" value="${naturalPersonInstance?.rg}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'situation', 'error')} ">
		<label class="control-label col-md-3" for="situation">
			<g:message code="naturalPerson.situation.label" default="Situação" />
			
		</label>
		<div class="col-md-4">
			<g:radioGroup name="situation" labels="['Ativo','Inativo']" values="['true','false']" value="${naturalPersonInstance?.situation}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'profession', 'error')} ">
		<label class="control-label col-md-3" for="profession">
			<g:message code="naturalPerson.profession.label" default="Profissão" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="profession" value="${naturalPersonInstance?.profession}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="naturalPerson.address.label" default="Endereço" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="address" required="" value="${naturalPersonInstance?.address}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'city', 'error')} required">
		<label class="control-label col-md-3" for="city">
			<g:message code="naturalPerson.city.label" default="Cidade" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="city" required="" value="${naturalPersonInstance?.city}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'zipCode', 'error')} required">
		<label class="control-label col-md-3" for="zipCode">
			<g:message code="naturalPerson.zipCode.label" default="CEP" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_cep" name="zipCode" required="" value="${naturalPersonInstance?.zipCode}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'telephone', 'error')} ">
		<label class="control-label col-md-3" for="telephone">
			<g:message code="naturalPerson.telephone.label" default="Telefone" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_phone" name="telephone" value="${naturalPersonInstance?.telephone}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'cellular', 'error')} ">
		<label class="control-label col-md-3" for="cellular">
			<g:message code="naturalPerson.cellular.label" default="Celular" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_cellular" name="cellular" value="${naturalPersonInstance?.cellular}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'email', 'error')} ">
		<label class="control-label col-md-3" for="email">
			<g:message code="naturalPerson.email.label" default="Email" />
			
		</label>
		<div class="col-md-4">
			<g:field class="form-control" type="email" name="email" value="${naturalPersonInstance?.email}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'birth', 'error')}">
		<label class="control-label col-md-3" for="birth">
			<g:message code="naturalPerson.birth.label" default="Nascimento" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_date" name="stringBirth" required="" value="${naturalPersonInstance?.stringBirth}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'birthPlace', 'error')} required">
		<label class="control-label col-md-3" for="birthPlace">
			<g:message code="naturalPerson.birthPlace.label" default="Naturalidade" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="birthPlace" required="" value="${naturalPersonInstance?.birthPlace}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'father', 'error')} ">
		<label class="control-label col-md-3" for="father">
			<g:message code="naturalPerson.father.label" default="Pai" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="father" value="${naturalPersonInstance?.father}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'mother', 'error')} ">
		<label class="control-label col-md-3" for="mother">
			<g:message code="naturalPerson.mother.label" default="Mãe" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="mother" value="${naturalPersonInstance?.mother}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'baptism', 'error')} ">
		<label class="control-label col-md-3" for="baptism">
			<g:message code="naturalPerson.baptism.label" default="Batismo" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_date2" name="stringBaptism" value="${naturalPersonInstance?.stringBaptism}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'memberSince', 'error')} ">
		<label class="control-label col-md-3" for="memberSince">
			<g:message code="naturalPerson.memberSince.label" default="Membro Desde" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_date3" name="stringMemberSince" value="${naturalPersonInstance?.stringMemberSince}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'conversion', 'error')} ">
		<label class="control-label col-md-3" for="conversion">
			<g:message code="naturalPerson.conversion.label" default="Conversão" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_date4" name="stringConversion" value="${naturalPersonInstance?.stringConversion}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'baptismHollySpirit', 'error')} ">
		<label class="control-label col-md-3" for="baptismHollySpirit">
			<g:message code="naturalPerson.baptismHollySpirit.label" default="Batismo com Espírito Santo" />
			
		</label>
		<div class="col-md-4">
			<g:radioGroup name="baptismHollySpirit" labels="['Sim','Não']" values="['true','false']" value="${naturalPersonInstance?.baptismHollySpirit}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'maritalStatus', 'error')} required">
		<label class="control-label col-md-3" for="maritalStatus">
			<g:message code="naturalPerson.maritalStatus.label" default="Estado Civil" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="maritalStatus" from="${naturalPersonInstance.constraints.maritalStatus.inList}" required="" value="${naturalPersonInstance?.maritalStatus}" valueMessagePrefix="naturalPerson.maritalStatus"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'spouse', 'error')} ">
		<label class="control-label col-md-3" for="spouse">
			<g:message code="naturalPerson.spouse.label" default="Conjuge" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="spouse" value="${naturalPersonInstance?.spouse}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'marriageDate', 'error')} ">
		<label class="control-label col-md-3" for="marriageDate">
			<g:message code="naturalPerson.marriageDate.label" default="Casamento" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" id="mask_date5" name="stringMarriageDate" value="${naturalPersonInstance?.stringMarriageDate}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'department', 'error')} required">
		<label class="control-label col-md-3" for="department">
			<g:message code="naturalPerson.department.label" default="Departamento" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="department" from="${naturalPersonInstance.constraints.department.inList}" required="" value="${naturalPersonInstance?.department}" valueMessagePrefix="naturalPerson.department"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="naturalPerson.type.label" default="Tipo" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="type" from="${naturalPersonInstance.constraints.type.inList}" required="" value="${naturalPersonInstance?.type}" valueMessagePrefix="naturalPerson.type"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'post', 'error')} ">
		<label class="control-label col-md-3" for="post">
			<g:message code="naturalPerson.post.label" default="Cargo" />
			
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="post" from="${naturalPersonInstance.constraints.post.inList}" value="${naturalPersonInstance?.post}" valueMessagePrefix="naturalPerson.post" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: naturalPersonInstance, field: 'observation', 'error')} ">
		<label class="control-label col-md-3" for="observation">
			<g:message code="naturalPerson.observation.label" default="Observação" />
			
		</label>
		<div class="col-md-4">
			<g:textArea class="form-control" name="observation" cols="40" rows="5" value="${naturalPersonInstance?.observation}"/>
		</div>
	</div>
</div>

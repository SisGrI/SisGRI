<%@ page import="org.sisgri.authentication.Profile" %>

<sec:ifAnyGranted roles="ROLE_ADMIN">
	<div class="form-group">
		<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'username', 'error')} required">
			<label class="control-label col-md-3" for="username">
				<g:message code="profile.username.label" default="Usuário" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-md-4">
				<g:textField class="form-control" name="username" required="" value="${profileInstance?.username}"/>
			</div>
		</div>
	</div>

	<g:if test="${profileInstance.password == null}">
		<div class="form-group">
			<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'password', 'error')} required">
				<label class="control-label col-md-3" for="password">
					<g:message code="profile.password.label" default="Senha" />
					<span class="required-indicator">*</span>
				</label>
				<div class="col-md-4">
					<g:textField class="form-control" name="password" required="" value="${profileInstance?.password}"/>
				</div>
			</div>
		</div>
	</g:if>

	<div class="form-group">
		<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'person', 'error')} required">
			<label class="control-label col-md-3" for="person">
				<g:message code="profile.person.label" default="Pessoa" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-md-4">
				<g:select class="form-control" id="person" name="person.id" from="${org.sisgri.people.Person.list()}" optionKey="id" required="" value="${profileInstance?.person?.id}"/>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'type', 'error')} required">
			<label class="control-label col-md-3" for="type">
				<g:message code="profile.type.label" default="Tipo" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-md-4">
				<g:select class="form-control" name="type" from="${['Administrador','Secretário','Tesoureiro']}" required="" valueMessagePrefix="profile.type"/>
			</div>
		</div>
	</div>
</sec:ifAnyGranted>

<g:if test="${profileInstance.password != null}">
	<div class="form-group">
		<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'password', 'error')} required">
			<label class="control-label col-md-3" for="newPassword">
				<g:message code="profile.newPassword.label" default="Nova Senha" />
			</label>
			<div class="col-md-4">
				<g:textField class="form-control" name="newPassword" value="" placeholder="Preencha para alterar sua senha!"/>
			</div>
		</div>
	</div>
</g:if>
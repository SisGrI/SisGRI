
<%@ page import="org.sisgri.people.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Pessoa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">Pessoa</h3>
	            <ul class="page-breadcrumb breadcrumb">
	                <li>
	                    <i class="fa fa-home"></i>
	                    <a href="${createLink(uri: '/')}">
							Página Inicial
						</a>
	                    <i class="fa fa-angle-right"></i>
	                </li>
	                <li>
	                	<g:link action="search">
							Pesquisar Pesoas
						</g:link>
						<i class="fa fa-angle-right"></i>
	                </li>
	                <li>
						Detalhar
	                </li>
	            </ul>
	        </div>
	    	<div class="col-md-12">
				<g:if test="${flash.message}">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					    ${flash.message}
					</div>
				</g:if>
			</div>
			<div class="col-md-12">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-reorder"></i>Detalhar Pessoa
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<g:form class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									
									<g:if test="${personInstance?.church}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Igreja</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="church" action="show" id="${personInstance?.church?.id}">${personInstance?.church?.encodeAsHTML()}</g:link>
												</p>
											</div>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.name}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Nome</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="name"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.cpf}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">CPF</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="cpf"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.rg}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">RG</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="rg"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.situation}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Situação</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:if test="${personInstance.situation == true}">
														Ativo
													</g:if>
													<g:if test="${personInstance.situation == false}">
														Inativo
													</g:if>
												</p>
											</div>	
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.profession}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Profissão</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="profession"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.address}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Endereço</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="address"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.city}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Cidade</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="city"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.zipCode}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">CEP</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="zipCode"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.telephone}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Telefone</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="telephone"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.cellular}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Celular</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="cellular"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.email}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Email</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="email"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.birth}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Nascimento</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${personInstance?.birth}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.birthPlace}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Naturalidade</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="birthPlace"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.father}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Pai</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="father"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.mother}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Mãe</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="mother"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.baptism}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Batismo</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${personInstance?.baptism}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.memberSince}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Membro Desde</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${personInstance?.memberSince}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.conversion}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Conversão</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${personInstance?.conversion}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.baptismHollySpirit}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Batismo com Espírito Santo</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:formatBoolean boolean="${personInstance?.baptismHollySpirit}" />
												</p>
											</div>	
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.maritalStatus}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Estado Civil</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="maritalStatus"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.spouse}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Conjuge</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="spouse"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.marriageDate}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Casamento</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${personInstance?.marriageDate}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.department}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Departamento</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="department"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.type}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Tipo</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="type"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.post}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Cargo</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="post"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.observation}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Observação</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${personInstance}" field="observation"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${personInstance?.profile}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Perfil</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="profile" action="show" id="${personInstance?.profile?.id}">${personInstance?.profile?.encodeAsHTML()}</g:link>
												</p>
											</div>
										
											</div>
										</div>
									</g:if>
									
									</div>
								</div>
							<div class="form-actions right">
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-offset-3 col-md-9">
											<g:hiddenField name="id" value="${personInstance?.id}" />

											<g:link class="btn blue" action="edit" id="${personInstance?.id}">
											<i class="fa fa-pencil"></i> Editar	</g:link>

											<g:if test="${personInstance?.profile == null}">
						 						<g:link controller="profile" action="create" class="btn blue" id="${personInstance?.id}"> <i class="fa fa-plus"></i> Criar Perfil</g:link>
						 					</g:if>
						 
						 					<g:if test="${personInstance?.profile != null}">
						 						<g:actionSubmit class="btn red" action="removeProfile" value="Remover Perfil" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						 					</g:if>

											<g:actionSubmit class="btn red" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');">
											</g:actionSubmit>
										</div>
									</div>
								</div>
							</div>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

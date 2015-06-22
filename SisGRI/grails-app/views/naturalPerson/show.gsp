
<%@ page import="org.sisgri.people.NaturalPerson" %>
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
				<g:if test="${naturalPersonInstance?.situation}">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-reorder"></i>Detalhes Pessoa - Ativa
						</div>
					</div>
				</g:if>
				<g:else>
				<div class="portlet box red">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-reorder"></i>Detalhes Pessoa - Inativa
						</div>
					</div>
				</g:else>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<div class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="col-md-9">
												<div class="fileinput fileinput-new" data-provides="fileinput">
													<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
														<img src="${createLink(action:'showPhoto', id: naturalPersonInstance.id)}" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<g:if test="${naturalPersonInstance?.church}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Igreja</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="church" action="show" id="${naturalPersonInstance?.church?.id}">${naturalPersonInstance?.church?.encodeAsHTML()}</g:link>
												</p>
											</div>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.name}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Nome</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="name"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.cpf}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">CPF</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="cpf"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.rg}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">RG</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="rg"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.profession}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Profissão</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="profession"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.address}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Endereço</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="address"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.city}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Cidade</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="city"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.zipCode}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">CEP</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="zipCode"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.telephone}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Telefone</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="telephone"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.cellular}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Celular</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="cellular"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.email}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Email</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="email"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.birth}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Nascimento</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${naturalPersonInstance?.birth}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.birthPlace}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Naturalidade</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="birthPlace"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.father}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Pai</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="father"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.mother}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Mãe</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="mother"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.baptism}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Batismo</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${naturalPersonInstance?.baptism}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.memberSince}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Membro Desde</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${naturalPersonInstance?.memberSince}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.conversion}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Conversão</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${naturalPersonInstance?.conversion}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.baptismHollySpirit}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Batismo com Espírito Santo</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:formatBoolean boolean="${naturalPersonInstance?.baptismHollySpirit}" />
												</p>
											</div>	
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.maritalStatus}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Estado Civil</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="maritalStatus"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.spouse}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Conjuge</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="spouse"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.marriageDate}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Casamento</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${naturalPersonInstance?.marriageDate}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.department}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Departamento</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="department"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.type}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Tipo</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="type"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.post}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Cargo</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="post"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.observation}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Observação</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${naturalPersonInstance}" field="observation"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${naturalPersonInstance?.profile}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Perfil</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="profile" action="show" id="${naturalPersonInstance?.profile?.id}">${naturalPersonInstance?.profile?.encodeAsHTML()}</g:link>
												</p>
											</div>
										
											</div>
										</div>
									</g:if>
									
								</div>
							</div>
							<g:form url="[resource:profileInstance, action:'delete']" method="DELETE">
								<div class="form-actions right">
									<div class="row">
										<div class="col-md-12">
											<div class="col-md-offset-3 col-md-9">
												<g:hiddenField name="id" value="${naturalPersonInstance?.id}" />

												<g:link class="btn blue" action="edit" id="${naturalPersonInstance?.id}">
												<i class="fa fa-pencil"></i> Editar	</g:link>

												<sec:ifAnyGranted roles="ROLE_ADMIN">
													<g:if test="${naturalPersonInstance?.profile == null}">
								 						<g:link controller="profile" action="create" class="btn blue" id="${naturalPersonInstance.id}"> <i class="fa fa-plus"></i> Criar Perfil</g:link>
								 					</g:if>

								 					<g:if test="${naturalPersonInstance?.profile != null}">
								 						<g:actionSubmit class="btn red" action="removeProfile" value="Remover Perfil" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								 					</g:if>

													<g:actionSubmit class="btn red" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');">
													</g:actionSubmit>
												</sec:ifAnyGranted>
											</div>
										</div>
									</div>
								</div>
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

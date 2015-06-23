
<%@ page import="org.sisgri.people.LegalPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'legalPerson.label', default: 'Empresa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">Empresa</h3>
	            <ul class="page-breadcrumb breadcrumb">
	                <li>
	                    <i class="fa fa-home"></i>
	                    <a href="${createLink(uri: '/')}">
							Página Inicial
						</a>
	                    <i class="fa fa-angle-right"></i>
	                </li>
	                <li>
	                	<g:link>
							Empresas
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
							<i class="fa fa-reorder"></i>Detalhar Empresa
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<div class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									
									<g:if test="${legalPersonInstance?.name}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Nome</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="name"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.cnpj}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">CNPJ</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="cnpj"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.field}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Área de Atuação</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="field"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.address}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Endereço</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="address"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.city}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Cidade</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="city"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.zipCode}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">CEP</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="zipCode"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.telephone}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Telefone</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="telephone"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.email}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">E-mail</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="email"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${legalPersonInstance?.observation}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Observação</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${legalPersonInstance}" field="observation"/>
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
												<g:hiddenField name="id" value="${legalPersonInstance?.id}" />

												<g:link class="btn blue" action="edit" id="${legalPersonInstance?.id}">
												<i class="fa fa-pencil"></i> Editar	</g:link>

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
		</div>
	</body>
</html>


<%@ page import="org.sisgri.register.Register" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'register.label', default: 'Registro Financeiro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">Registro Financeiro</h3>
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
							Pequisar Registros
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
							<i class="fa fa-reorder"></i>Detalhar Registro Financeiro
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<div class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									
									<g:if test="${registerInstance?.church}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Igreja</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="church" action="show" id="${registerInstance?.church?.id}">${registerInstance?.church?.encodeAsHTML()}</g:link>
												</p>
											</div>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${registerInstance?.date}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Data</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${registerInstance?.date}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${registerInstance?.type}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Tipo</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${registerInstance}" field="type"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${registerInstance?.entryRegister}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Entrada</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${registerInstance}" field="entryRegister"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${registerInstance?.exitRegister}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Saída</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${registerInstance}" field="exitRegister"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<div class="col-md-6">
										<div class="form-group">
											<label class="control-label col-md-3">Nome</label>
											
										<div class="col-md-9">
											<p class="form-control-static">
												<g:if test="${registerInstance?.person}">
													<g:link controller="person" action="show" id="${registerInstance?.person?.id}">${registerInstance?.person?.encodeAsHTML()}</g:link>
												</g:if>
												<g:else>
													<g:fieldValue bean="${registerInstance}" field="name"/>
												</g:else>
											</p>
										</div>
										
										</div>
									</div>
									
									<g:if test="${registerInstance?.value}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Valor</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${registerInstance}" field="formatedValue"/>
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
												<g:hiddenField name="id" value="${registerInstance?.id}" />

												<g:link class="btn blue" action="edit" id="${registerInstance?.id}">
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

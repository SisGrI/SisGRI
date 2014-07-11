
<%@ page import="org.sisgri.register.Exit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exit.label', default: 'Saída')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">Saída</h3>
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
							Saídas
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
							<i class="fa fa-reorder"></i>Detalhar Saída
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<div class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									
									<g:if test="${exitInstance?.date}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Data</label>
												
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="${exitInstance?.date}" />
													</p>
												</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${exitInstance?.church}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Igreja</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="church" action="show" id="${exitInstance?.church?.id}">${exitInstance?.church?.encodeAsHTML()}</g:link>
												</p>
											</div>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${exitInstance?.category}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Categoria</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${exitInstance}" field="category"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${exitInstance?.name}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Nome</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${exitInstance}" field="name"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${exitInstance?.value}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Valor</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${exitInstance}" field="value"/>
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
												<g:hiddenField name="id" value="${exitInstance?.id}" />

												<g:link class="btn blue" action="edit" id="${exitInstance?.id}">
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

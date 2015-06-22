<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'register.label', default: 'Registro Financeiro')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
						Criar Registro Financeiro
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
				<g:hasErrors bean="${registerInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${registerInstance}" var="error">
							<div class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								<g:if test="${error in org.springframework.validation.FieldError}">
									"${error.field}"
								</g:if>>
								<g:message error="${error}"/>
							</div>
						</g:eachError>
					</ul>
				</g:hasErrors>
			</div>

			<div class="col-md-12">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-list"></i>Criar novo Registro Financeiro
						</div>
					</div>
					<div class="portlet-body form">
						<g:form url="[resource:registerInstance, action:'save']"  class="form-horizontal">
							<div class="form-body">
								<div class="form-section">
								</div>
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									O formulário contêm erros. Por favor verifique abaixo.
								</div>
								<g:render template="form"/>
							</div>
							<div class="form-actions right">
								<div class="col-md-offset-3 col-md-9">
									<button type="submit" class="btn blue">Submeter</button>
								</div>
							</div>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

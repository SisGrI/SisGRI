<%@ page import="org.sisgri.register.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>		
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">Entry</h3>
	            <ul class="page-breadcrumb breadcrumb">
	                <li>
	                    <i class="fa fa-home"></i>
	                    <a href="${createLink(uri: '/')}">
							Página Inicial
						</a>
	                    <i class="fa fa-angle-right"></i>
	                </li>
	                <li>
	                	<g:link action="index">
							Entry
						</g:link>
						<i class="fa fa-angle-right"></i>
	                </li>
	                <li>
	                    <g:link  action="edit">
							Editar
						</g:link>
	                </li>
	            </ul>
	        </div>

		    <div id="edit-entry" class="content scaffold-edit" role="main">
				<h1><g:message code="default.edit.label" args="[entityName]" /></h1>

				<div class="row">
			    	<div class="col-md-12">
						<g:if test="${flash.message}">
							<div class="alert alert-info alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							    ${flash.message}
							</div>
						</g:if>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<g:hasErrors bean="${entryInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${entryInstance}" var="error">
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
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet box blue">
					<div class="portlet-body form">
						<div class="portlet box blue">
						</div>
						<g:form url="[resource:entryInstance, action:'update']" method="PUT" class="form-horizontal">
							<div class="form-body">
								<h3 class="form-section"><small>Edite uma Entry!</small></h3>
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									O formulário contêm erros. Por favor verifique abaixo.
								</div>
								<g:render template="form"/>
							</div>
							<div class="form-actions right">
								<g:hiddenField name="id" value="${entryInstance?.id}" />
								<g:hiddenField name="version" value="${entryInstance?.version}" />

								<div class="col-md-offset-3 col-md-9">
									<g:actionSubmit class="btn blue" action="update" value="Atualizar" />
								</div>
							</div>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

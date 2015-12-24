<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'worship.label', default: 'Boletim Financeiro')}" />
		<title><g:message code="default.search.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
	            <h3 class="page-title">Boletim Financeiro</h3>
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
							Pesquisar Registros
						</g:link>
						<i class="fa fa-angle-right"></i>
	                </li>
	                <li>
						Boletim Financeiro
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
				<g:hasErrors bean="${worshipInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${worshipInstance}" var="error">
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
							<i class="fa fa-list"></i>Boletim Financeiro ${params.from} - ${params.to}
						</div>
					</div>
					<div class="portlet-body form">
						<div class="form-horizontal">
							<div class="tabbable tabbable-custom boxless tabbable-reversed">
							    <ul class="nav nav-tabs">
							        <li class="active">
							            <a href="#entry" data-toggle="tab">
							                Entradas
							            </a>
							        </li>
							        <li>
							            <a href="#exit" data-toggle="tab">
							                Saídas
							            </a>
							        </li>
							        <li>
							            <a href="#general" data-toggle="tab">
							                Resultado Geral
							            </a>
							        </li>
							    </ul>

							    <div class="tab-content">
							        <div class="tab-pane active" id="entry">
							        	<div class="form-body">
							        		<div class="form-section">
							        		</div>
							        		<g:render template="cityArticleEntry" />
							        	</div>
							        </div>
							        <div class="tab-pane" id="exit">
							        	<div class="form-body">
							        		<div class="form-section">
							        		</div>
							        		<g:render template="cityArticleExit" />
							        	</div>
							        </div>
							        <div class="tab-pane" id="general">
							        	<div class="form-body">
							        		<div class="form-section">
							        		</div>
							        		<g:render template="cityArticleResult" />
							        	</div>
							        </div>
						        </div>
						    </div>
							<div class="form-actions right">
								<div class="col-md-offset-3 col-md-9">
									<g:link class="btn yellow" action="printCityArticle" params="${params}">Imprimir</g:link>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
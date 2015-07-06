<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'worship.label', default: 'Registro Financeiro')}" />
		<title><g:message code="default.search.label" args="[entityName]" /></title>
	</head>
	<body>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#month').attr("required",false);
				$('#year').attr("required",false);
			});
			function changeSearch(search) {
				if (search == "cityArticle") {
					$('#month').attr("required",true);
					$('#year').attr("required",true);
					$('#from').val("");
					$('#to').val("");
					$('#from').attr("required",false);
					$('#to').attr("required",false);
				}
				else {
					$('#from').attr("required",true);
					$('#to').attr("required",true);
					$('#month').val("");
					$('#year').val("");
					$('#month').attr("required",false);
					$('#year').attr("required",false);
				}
			}
		</script>

		<div class="row">
			<div class="col-md-12">
	            <h3 class="page-title">Registros</h3>
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
							<i class="fa fa-list"></i>Pesquisar Registros
						</div>
					</div>
					<div class="portlet-body form">
						<g:form url="[resource:registerInstance, action:'resultSearch']" class="form-horizontal">
							<div class="tabbable tabbable-custom boxless tabbable-reversed">
							    <ul class="nav nav-tabs">
							        <li class="active">
							            <a href="#registers" onclick="changeSearch('registers');" data-toggle="tab">
							                Ver Registros
							            </a>
							        </li>
							        <li>
							            <a href="#cityArticle" onclick="changeSearch('cityArticle');" data-toggle="tab">
							                Gerar Boletim
							            </a>
							        </li>
							    </ul>

					    	    <div class="tab-content">
					    	        <div class="tab-pane active" id="registers">
					    	        	<div class="form-body">
					    	        		<div class="form-section">
					    	        		</div>
					    	        		<g:render template="formSearch" />
					    	        	</div>
					    	        	<div class="form-actions right">
					    	        		<div class="col-md-offset-3 col-md-9">
					    	        			<g:submitButton id="registersButton" name="search" class="btn blue" value="Ver registros" />
					    	        		</div>
					    	        	</div>
					    	        </div>
					    	        <div class="tab-pane" id="cityArticle">
					    	        	<div class="form-body">
    										<div class="form-section">
    										</div>
    										<g:render template="formGenerateCityArticle"/>
    									</div>
    									<div class="form-actions right">
    										<div class="col-md-offset-3 col-md-9">
    											<g:submitButton id="cityArticleButton" name="search" class="btn yellow" value="Gerar Boletim" />
    										</div>
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
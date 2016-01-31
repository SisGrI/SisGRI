
<%@ page import="org.sisgri.church.Church" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'church.label', default: 'Igreja')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">Igreja</h3>
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
							Igrejas
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
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-list"></i>Igrejas
						</div>
						<div class="actions">
							<sec:ifAnyGranted roles="ROLE_ADMIN">
								<g:if test="${currentChurch?.type == 'Sede'}">
									<g:link class="btn green" action="create">
										<i class="fa fa-plus"></i> Novo
									</g:link>
								</g:if>
							</sec:ifAnyGranted>
							<a href="#" class="btn yellow">
								<i class="fa fa-print"></i> Imprimir
							</a>
						</div>
					</div>
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover" id="sample_2">
							<thead>
								<tr>
								
									<th><g:message code="church.name.label" default="Nome" /></th>
								
									<th><g:message code="church.address.label" default="Endereço" /></th>
								
								</tr>
							</thead>
							<tbody>
								<g:each in="${churchInstanceList}" status="i" var="churchInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${churchInstance.id}">${fieldValue(bean: churchInstance, field: "name")}</g:link></td>
									
										<td>${fieldValue(bean: churchInstance, field: "address")}</td>
									
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

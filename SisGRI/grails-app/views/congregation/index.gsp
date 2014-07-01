
<%@ page import="org.sisgri.church.Congregation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'congregation.label', default: 'Congregação')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">Congregação</h3>
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
							Congregações
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
							<i class="fa fa-list"></i>Congregações
						</div>
						<div class="actions">
							<g:link class="btn green" action="create">
								<i class="fa fa-plus"></i> Novo
							</g:link>
							<a href="#" class="btn yellow">
								<i class="fa fa-print"></i> Imprimir
							</a>
						</div>
					</div>
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover" id="sample_2">
							<thead>
								<tr>
								
									<th><g:message code="congregation.name.label" default="Nome" /></th>
								
									<th><g:message code="congregation.address.label" default="Endereço" /></th>
								
									<th><g:message code="congregation.subHeadquarter.label" default="Sub-Sede" /></th>
								
								</tr>
							</thead>
							<tbody>
								<g:each in="${congregationInstanceList}" status="i" var="congregationInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${congregationInstance.id}">${fieldValue(bean: congregationInstance, field: "name")}</g:link></td>
									
										<td>${fieldValue(bean: congregationInstance, field: "address")}</td>
									
										<td>${fieldValue(bean: congregationInstance, field: "subHeadquarter")}</td>
									
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

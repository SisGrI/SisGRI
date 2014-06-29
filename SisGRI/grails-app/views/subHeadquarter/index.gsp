
<%@ page import="org.sisgri.church.SubHeadquarter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subHeadquarter.label', default: 'SubHeadquarter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">SisGrI <small>Sistema de Gerênciamento de Igrejas</small></h3>
				<ul class="page-breadcrumb breadcrumb">
					<li>
						<i class="fa fa-home"></i>
						<a href="${createLink(uri: '/')}">
							Início
						</a>
						<i class="fa fa-angle-right"></i>
					</li>
					<li>
						<g:link>
							SubHeadquarters
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
							<i class="fa fa-list"></i>SubHeadquarters
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse">
							</a>
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
								
									<th><g:message code="subHeadquarter.name.label" default="Name" /></th>
								
									<th><g:message code="subHeadquarter.address.label" default="Address" /></th>
								
									<th><g:message code="subHeadquarter.headquarter.label" default="Headquarter" /></th>
								
								</tr>
							</thead>
							<tbody>
								<g:each in="${subHeadquarterInstanceList}" status="i" var="subHeadquarterInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${subHeadquarterInstance.id}">${fieldValue(bean: subHeadquarterInstance, field: "name")}</g:link></td>
									
										<td>${fieldValue(bean: subHeadquarterInstance, field: "address")}</td>
									
										<td>${fieldValue(bean: subHeadquarterInstance, field: "headquarter")}</td>
									
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

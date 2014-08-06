
<%@ page import="org.sisgri.people.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">Person</h3>
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
							Persons
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
							<i class="fa fa-list"></i>Persons
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
								
									<th><g:message code="person.church.label" default="Church" /></th>
								
									<th><g:message code="person.name.label" default="Name" /></th>
								
									<th><g:message code="person.cpf.label" default="Cpf" /></th>
								
									<th><g:message code="person.rg.label" default="Rg" /></th>
								
									<th><g:message code="person.situation.label" default="Situation" /></th>
								
									<th><g:message code="person.profession.label" default="Profession" /></th>
								
								</tr>
							</thead>
							<tbody>
								<g:each in="${personInstanceList}" status="i" var="personInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "church")}</g:link></td>
									
										<td>${fieldValue(bean: personInstance, field: "name")}</td>
									
										<td>${fieldValue(bean: personInstance, field: "cpf")}</td>
									
										<td>${fieldValue(bean: personInstance, field: "rg")}</td>
									
										<td><g:formatBoolean boolean="${personInstance.situation}" /></td>
									
										<td>${fieldValue(bean: personInstance, field: "profession")}</td>
									
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

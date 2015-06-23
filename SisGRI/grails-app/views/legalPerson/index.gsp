
<%@ page import="org.sisgri.people.LegalPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'legalPerson.label', default: 'Empresa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">Empresa</h3>
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
							Empresas
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
							<i class="fa fa-list"></i>Empresas
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
								
									<th><g:message code="legalPerson.name.label" default="Nome" /></th>
								
									<th><g:message code="legalPerson.address.label" default="Endereço" /></th>
								
									<th><g:message code="legalPerson.city.label" default="Cidade" /></th>
								
									<th><g:message code="legalPerson.zipCode.label" default="CEP" /></th>
								
									<th><g:message code="legalPerson.telephone.label" default="Telefone" /></th>
								
									<th><g:message code="legalPerson.email.label" default="E-mail" /></th>
								
								</tr>
							</thead>
							<tbody>
								<g:each in="${legalPersonInstanceList}" status="i" var="legalPersonInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${legalPersonInstance.id}">${fieldValue(bean: legalPersonInstance, field: "name")}</g:link></td>
									
										<td>${fieldValue(bean: legalPersonInstance, field: "address")}</td>
									
										<td>${fieldValue(bean: legalPersonInstance, field: "city")}</td>
									
										<td>${fieldValue(bean: legalPersonInstance, field: "zipCode")}</td>
									
										<td>${fieldValue(bean: legalPersonInstance, field: "telephone")}</td>
									
										<td>${fieldValue(bean: legalPersonInstance, field: "email")}</td>
									
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

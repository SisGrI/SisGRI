
<%@ page import="org.sisgri.register.Register" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'register.label', default: 'Registro Financeiro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-list"></i>Registros
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
									<th>Igreja</th>
									<th>Data</th>
									<th>Tipo</th>
									<g:if test="${typeRegister == 'Entrada'}">
										<th>Entrada</th>
									</g:if>
									<g:else>
										<th>Saída</th>
									</g:else>
									<th>Nome</th>
									<th>Valor</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${registerInstanceList}" status="i" var="registerInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${registerInstance.id}">${fieldValue(bean: registerInstance, field: "church")}</g:link></td>
									
										<td><g:formatDate date="${registerInstance.date}" /></td>
									
										<td>${fieldValue(bean: registerInstance, field: "type")}</td>
									
										<g:if test="${typeRegister == 'Entrada'}">
											<td>${fieldValue(bean: registerInstance, field: "entryRegister")}</td>
										</g:if>
										<g:else>
											<td>${fieldValue(bean: registerInstance, field: "exitRegister")}</td>
										</g:else>
									
										<g:if test="${registerInstance?.person}">
											<td><g:link controller="naturalPerson" action="show" id="${registerInstance.person.id}">${fieldValue(bean: registerInstance, field: "person")}</g:link></td>
										</g:if>
										<g:else>
											<td>${fieldValue(bean: registerInstance, field: "name")}</td>
										</g:else>
										<td>${fieldValue(bean: registerInstance, field: "formatedValue")}</td>
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

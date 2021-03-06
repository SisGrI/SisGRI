
<%@ page import="org.sisgri.people.NaturalPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Pessoa')}" />
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
						<i class="fa fa-search"></i>
						<g:link action="search">
							Pesquisar Pessoas
						</g:link>
						<i class="fa fa-angle-right"></i>
					</li>
					<li>
						Resultado da Pesquisa
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
							<i class="fa fa-list"></i>Pessoas
						</div>
						<div class="actions">
							<g:link class="btn green" action="create">
								<i class="fa fa-plus"></i> Novo
							</g:link>
							<g:if test="${params.post != ''}">
								<g:link class="btn yellow" action="printWorkers">
									<i class="fa fa-print"></i> Imprimir
								</g:link>
							</g:if>
							<g:else>
								<g:link class="btn yellow" action="print">
									<i class="fa fa-print"></i> Imprimir
								</g:link>
							</g:else>
						</div>
					</div>
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover" id="sample_2">
							<thead>
								<tr>
									<th>Nome</th>
									<th>Nascimento</th>
									<th>Batismo</th>
									<th>Telefone</th>
									<th>Celular</th>
									<th>Tipo</th>
									<th>Cargo</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${naturalPersonInstanceList}" status="i" var="naturalPersonInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${naturalPersonInstance.id}">${fieldValue(bean: naturalPersonInstance, field: "name")}</g:link></td>
					
										<td><g:formatDate date="${naturalPersonInstance.birth}" /></td>
									
										<td><g:formatDate date="${naturalPersonInstance.baptism}" /></td>
									
										<td>${fieldValue(bean: naturalPersonInstance, field: "telephone")}</td>

										<td>${fieldValue(bean: naturalPersonInstance, field: "cellular")}</td>

										<td>${fieldValue(bean: naturalPersonInstance, field: "type")}</td>

										<td>${fieldValue(bean: naturalPersonInstance, field: "post")}</td>
									
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

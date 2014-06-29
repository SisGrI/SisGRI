
<%@ page import="org.sisgri.worship.Worship" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'worship.label', default: 'Worship')}" />
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
							Pesquisar Cultos
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
							<i class="fa fa-list"></i>Cultos
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
									<th>Igreja</th>
									<th>Tipo</th>
									<th>Data</th>
									<th>Dirigente</th>
									<th>Preletor</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${worshipInstanceList}" status="i" var="worshipInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${worshipInstance.id}">${fieldValue(bean: worshipInstance, field: "church")}</g:link></td>
					
										<td>${fieldValue(bean: worshipInstance, field: "type")}</td>
									
										<td><g:formatDate date="${worshipInstance.date}" /></td>
									
										<td>${fieldValue(bean: worshipInstance, field: "ruling")}</td>
									
										<td>${fieldValue(bean: worshipInstance, field: "prelector")}</td>
									
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

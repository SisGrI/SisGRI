
<%@ page import="org.sisgri.worship.Worship" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'worship.label', default: 'Culto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">Culto</h3>
				<ul class="page-breadcrumb breadcrumb">
					<li>
						<i class="fa fa-home"></i>
						<a href="${createLink(uri: '/')}">
							Página Inicial
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
						<div class="actions">
							<g:link class="btn green" action="create">
								<i class="fa fa-plus"></i> Novo
							</g:link>
							<g:link class="btn yellow" action="print">
								<i class="fa fa-print"></i> Imprimir
							</g:link>
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
									<th>Preleitor</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${worshipInstanceList}" status="i" var="worshipInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${worshipInstance.id}">${fieldValue(bean: worshipInstance, field: "church")}</g:link></td>
					
										<td>${fieldValue(bean: worshipInstance, field: "type")}</td>
									
										<td><g:formatDate date="${worshipInstance.date}" /></td>
									
										<g:if test="${worshipInstance?.ruling}">
											<td><g:link controller="naturalPerson" action="show" id="${worshipInstance.ruling.id}">${fieldValue(bean: worshipInstance, field: "ruling")}</g:link></td>
										</g:if>
										<g:else>
											<td>${fieldValue(bean: worshipInstance, field: "rulingName")}</td>
										</g:else>
										<g:if test="${worshipInstance?.prelector}">
											<td><g:link controller="naturalPerson" action="show" id="${worshipInstance.prelector.id}">${fieldValue(bean: worshipInstance, field: "prelector")}</g:link></td>
										</g:if>
										<g:else>
											<td>${fieldValue(bean: worshipInstance, field: "prelectorName")}</td>
										</g:else>
									
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


<%@ page import="org.sisgri.register.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">Entry</h3>
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
							Entrys
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
							<i class="fa fa-list"></i>Entrys
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
								
									<th><g:message code="entry.church.label" default="Church" /></th>
								
									<th><g:message code="entry.category.label" default="Category" /></th>
								
									<th><g:message code="entry.name.label" default="Name" /></th>
								
									<th><g:message code="entry.value.label" default="Value" /></th>
								
								</tr>
							</thead>
							<tbody>
								<g:each in="${entryInstanceList}" status="i" var="entryInstance">
									<tr class="odd gradeX">
									
										<td><g:link action="show" id="${entryInstance.id}">${fieldValue(bean: entryInstance, field: "church")}</g:link></td>
									
										<td>${fieldValue(bean: entryInstance, field: "category")}</td>
									
										<td>${fieldValue(bean: entryInstance, field: "name")}</td>
									
										<td>${fieldValue(bean: entryInstance, field: "value")}</td>
									
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

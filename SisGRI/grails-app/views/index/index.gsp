
<%@ page import="org.sisgri.people.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Pessoa')}" />
		<title>SisGrI - Gerenciamento de Igrejas</title>
	</head>
	<body>

		<div class="row">
			<div class="col-md-12">
				<h3 class="page-title">SisGrI <small>Sistema de Gerênciamento de Igrejas</small></h3>
			</div>

			<div class="col-md-12">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-bell"></i>Aniversariantes do Mês
						</div>
					</div>
					<div class="portlet-body">
						<table class="table table-bordered table-hover">
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
								<g:each in="${personInstanceList}" status="i" var="personInstance">
									<tr class="odd gradeX">
									
										<td><g:link controller="person" action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "name")}</g:link></td>
					
										<td><g:formatDate date="${personInstance.birth}" /></td>
									
										<td><g:formatDate date="${personInstance.baptism}" /></td>
									
										<td>${fieldValue(bean: personInstance, field: "telephone")}</td>

										<td>${fieldValue(bean: personInstance, field: "cellular")}</td>

										<td>${fieldValue(bean: personInstance, field: "type")}</td>

										<td>${fieldValue(bean: personInstance, field: "post")}</td>
									
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

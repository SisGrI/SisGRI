
<%@ page import="org.sisgri.people.NaturalPerson" %>
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
								<g:each in="${naturalPersonInstanceList}" status="i" var="naturalPersonInstance">
									<tr class="odd gradeX">
									
										<td><g:link controller="naturalPerson" action="show" id="${naturalPersonInstance.id}">${fieldValue(bean: naturalPersonInstance, field: "name")}</g:link></td>
					
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

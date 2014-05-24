
<%@ page import="org.sisgri.people.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-person" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="person.church.label" default="Church" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="cpf" title="${message(code: 'person.cpf.label', default: 'Cpf')}" />
					
						<g:sortableColumn property="rg" title="${message(code: 'person.rg.label', default: 'Rg')}" />
					
						<g:sortableColumn property="situation" title="${message(code: 'person.situation.label', default: 'Situation')}" />
					
						<g:sortableColumn property="profession" title="${message(code: 'person.profession.label', default: 'Profession')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
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
			<div class="pagination">
				<g:paginate total="${personInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

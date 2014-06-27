
<%@ page import="org.sisgri.register.Exit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exit.label', default: 'Exit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-exit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-exit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="category" title="${message(code: 'exit.category.label', default: 'Category')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'exit.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'exit.value.label', default: 'Value')}" />
					
						<th><g:message code="exit.church.label" default="Church" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${exitInstanceList}" status="i" var="exitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${exitInstance.id}">${fieldValue(bean: exitInstance, field: "category")}</g:link></td>
					
						<td>${fieldValue(bean: exitInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: exitInstance, field: "value")}</td>
					
						<td>${fieldValue(bean: exitInstance, field: "church")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${exitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

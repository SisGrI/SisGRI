
<%@ page import="org.sisgri.church.SubHeadquarter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subHeadquarter.label', default: 'SubHeadquarter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subHeadquarter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subHeadquarter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'subHeadquarter.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'subHeadquarter.address.label', default: 'Address')}" />
					
						<th><g:message code="subHeadquarter.headquarter.label" default="Headquarter" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subHeadquarterInstanceList}" status="i" var="subHeadquarterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subHeadquarterInstance.id}">${fieldValue(bean: subHeadquarterInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: subHeadquarterInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: subHeadquarterInstance, field: "headquarter")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subHeadquarterInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

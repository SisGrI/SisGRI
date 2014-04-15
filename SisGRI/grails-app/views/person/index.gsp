
<%@ page import="org.sisgri.Person" %>
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
					
						<g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'person.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'person.city.label', default: 'City')}" />
					
						<g:sortableColumn property="zipCode" title="${message(code: 'person.zipCode.label', default: 'Zip Code')}" />
					
						<g:sortableColumn property="birth" title="${message(code: 'person.birth.label', default: 'Birth')}" />
					
						<g:sortableColumn property="birthPlace" title="${message(code: 'person.birthPlace.label', default: 'Birth Place')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: personInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "zipCode")}</td>
					
						<td><g:formatDate date="${personInstance.birth}" /></td>
					
						<td><g:formatDate date="${personInstance.birthPlace}" /></td>
					
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


<%@ page import="org.sisgri.church.Congregation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'congregation.label', default: 'Congregation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-congregation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-congregation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'congregation.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'congregation.address.label', default: 'Address')}" />
					
						<th><g:message code="congregation.subHeadquarter.label" default="Sub Headquarter" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${congregationInstanceList}" status="i" var="congregationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${congregationInstance.id}">${fieldValue(bean: congregationInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: congregationInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: congregationInstance, field: "subHeadquarter")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${congregationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

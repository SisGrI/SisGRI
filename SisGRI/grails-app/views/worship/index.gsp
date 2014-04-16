
<%@ page import="org.sisgri.worship.Worship" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'worship.label', default: 'Worship')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-worship" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-worship" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'worship.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="ruling" title="${message(code: 'worship.ruling.label', default: 'Ruling')}" />
					
						<g:sortableColumn property="prelector" title="${message(code: 'worship.prelector.label', default: 'Prelector')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'worship.date.label', default: 'Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${worshipInstanceList}" status="i" var="worshipInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${worshipInstance.id}">${fieldValue(bean: worshipInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: worshipInstance, field: "ruling")}</td>
					
						<td>${fieldValue(bean: worshipInstance, field: "prelector")}</td>
					
						<td><g:formatDate date="${worshipInstance.date}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${worshipInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

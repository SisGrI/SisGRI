
<%@ page import="org.sisgri.worship.Worship" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'worship.label', default: 'Worship')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-worship" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-worship" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list worship">
			
				<g:if test="${worshipInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="worship.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${worshipInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${worshipInstance?.ruling}">
				<li class="fieldcontain">
					<span id="ruling-label" class="property-label"><g:message code="worship.ruling.label" default="Ruling" /></span>
					
						<span class="property-value" aria-labelledby="ruling-label"><g:fieldValue bean="${worshipInstance}" field="ruling"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${worshipInstance?.prelector}">
				<li class="fieldcontain">
					<span id="prelector-label" class="property-label"><g:message code="worship.prelector.label" default="Prelector" /></span>
					
						<span class="property-value" aria-labelledby="prelector-label"><g:fieldValue bean="${worshipInstance}" field="prelector"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${worshipInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="worship.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${worshipInstance?.date}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:worshipInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${worshipInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="org.sisgri.register.Newsletter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsletter.label', default: 'Newsletter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsletter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsletter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsletter">
			
				<g:if test="${newsletterInstance?.church}">
				<li class="fieldcontain">
					<span id="church-label" class="property-label"><g:message code="newsletter.church.label" default="Church" /></span>
					
						<span class="property-value" aria-labelledby="church-label"><g:link controller="church" action="show" id="${newsletterInstance?.church?.id}">${newsletterInstance?.church?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsletterInstance?.registersEntry}">
				<li class="fieldcontain">
					<span id="registersEntry-label" class="property-label"><g:message code="newsletter.registersEntry.label" default="Registers Entry" /></span>
					
						<g:each in="${newsletterInstance.registersEntry}" var="r">
						<span class="property-value" aria-labelledby="registersEntry-label"><g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${newsletterInstance?.registersExit}">
				<li class="fieldcontain">
					<span id="registersExit-label" class="property-label"><g:message code="newsletter.registersExit.label" default="Registers Exit" /></span>
					
						<g:each in="${newsletterInstance.registersExit}" var="r">
						<span class="property-value" aria-labelledby="registersExit-label"><g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newsletterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newsletterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

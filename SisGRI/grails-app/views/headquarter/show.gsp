
<%@ page import="org.sisgri.church.Headquarter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'headquarter.label', default: 'Headquarter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-headquarter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-headquarter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list headquarter">
			
				<g:if test="${headquarterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="headquarter.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${headquarterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headquarterInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="headquarter.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${headquarterInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headquarterInstance?.registers}">
				<li class="fieldcontain">
					<span id="registers-label" class="property-label"><g:message code="headquarter.registers.label" default="Registers" /></span>
					
						<g:each in="${headquarterInstance.registers}" var="r">
						<span class="property-value" aria-labelledby="registers-label"><g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${headquarterInstance?.subHeadquarters}">
				<li class="fieldcontain">
					<span id="subHeadquarters-label" class="property-label"><g:message code="headquarter.subHeadquarters.label" default="Sub Headquarters" /></span>
					
						<g:each in="${headquarterInstance.subHeadquarters}" var="s">
						<span class="property-value" aria-labelledby="subHeadquarters-label"><g:link controller="subHeadquarter" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:headquarterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${headquarterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

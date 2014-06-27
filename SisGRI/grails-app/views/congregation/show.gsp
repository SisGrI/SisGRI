
<%@ page import="org.sisgri.church.Congregation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'congregation.label', default: 'Congregation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-congregation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-congregation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list congregation">
			
				<g:if test="${congregationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="congregation.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${congregationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${congregationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="congregation.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${congregationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${congregationInstance?.registers}">
				<li class="fieldcontain">
					<span id="registers-label" class="property-label"><g:message code="congregation.registers.label" default="Registers" /></span>
					
						<g:each in="${congregationInstance.registers}" var="r">
						<span class="property-value" aria-labelledby="registers-label"><g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${congregationInstance?.subHeadquarter}">
				<li class="fieldcontain">
					<span id="subHeadquarter-label" class="property-label"><g:message code="congregation.subHeadquarter.label" default="Sub Headquarter" /></span>
					
						<span class="property-value" aria-labelledby="subHeadquarter-label"><g:link controller="subHeadquarter" action="show" id="${congregationInstance?.subHeadquarter?.id}">${congregationInstance?.subHeadquarter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:congregationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${congregationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

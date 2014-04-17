
<%@ page import="org.sisgri.church.SubHeadquarter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subHeadquarter.label', default: 'SubHeadquarter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subHeadquarter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subHeadquarter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subHeadquarter">
			
				<g:if test="${subHeadquarterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="subHeadquarter.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${subHeadquarterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subHeadquarterInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="subHeadquarter.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${subHeadquarterInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subHeadquarterInstance?.congregations}">
				<li class="fieldcontain">
					<span id="congregations-label" class="property-label"><g:message code="subHeadquarter.congregations.label" default="Congregations" /></span>
					
						<g:each in="${subHeadquarterInstance.congregations}" var="c">
						<span class="property-value" aria-labelledby="congregations-label"><g:link controller="congregation" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subHeadquarterInstance?.headquarter}">
				<li class="fieldcontain">
					<span id="headquarter-label" class="property-label"><g:message code="subHeadquarter.headquarter.label" default="Headquarter" /></span>
					
						<span class="property-value" aria-labelledby="headquarter-label"><g:link controller="headquarter" action="show" id="${subHeadquarterInstance?.headquarter?.id}">${subHeadquarterInstance?.headquarter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subHeadquarterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${subHeadquarterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

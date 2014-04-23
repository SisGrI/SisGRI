
<%@ page import="org.sisgri.authentication.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="user.cpf.label" default="Cpf" /></span>
					
						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${userInstance}" field="cpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.rg}">
				<li class="fieldcontain">
					<span id="rg-label" class="property-label"><g:message code="user.rg.label" default="Rg" /></span>
					
						<span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${userInstance}" field="rg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.situation}">
				<li class="fieldcontain">
					<span id="situation-label" class="property-label"><g:message code="user.situation.label" default="Situation" /></span>
					
						<span class="property-value" aria-labelledby="situation-label"><g:formatBoolean boolean="${userInstance?.situation}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.profession}">
				<li class="fieldcontain">
					<span id="profession-label" class="property-label"><g:message code="user.profession.label" default="Profession" /></span>
					
						<span class="property-value" aria-labelledby="profession-label"><g:fieldValue bean="${userInstance}" field="profession"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="user.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${userInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="user.zipCode.label" default="Zip Code" /></span>
					
						<span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue bean="${userInstance}" field="zipCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="user.telephone.label" default="Telephone" /></span>
					
						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${userInstance}" field="telephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.cellular}">
				<li class="fieldcontain">
					<span id="cellular-label" class="property-label"><g:message code="user.cellular.label" default="Cellular" /></span>
					
						<span class="property-value" aria-labelledby="cellular-label"><g:fieldValue bean="${userInstance}" field="cellular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.birth}">
				<li class="fieldcontain">
					<span id="birth-label" class="property-label"><g:message code="user.birth.label" default="Birth" /></span>
					
						<span class="property-value" aria-labelledby="birth-label"><g:formatDate date="${userInstance?.birth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.birthPlace}">
				<li class="fieldcontain">
					<span id="birthPlace-label" class="property-label"><g:message code="user.birthPlace.label" default="Birth Place" /></span>
					
						<span class="property-value" aria-labelledby="birthPlace-label"><g:fieldValue bean="${userInstance}" field="birthPlace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.father}">
				<li class="fieldcontain">
					<span id="father-label" class="property-label"><g:message code="user.father.label" default="Father" /></span>
					
						<span class="property-value" aria-labelledby="father-label"><g:fieldValue bean="${userInstance}" field="father"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.mother}">
				<li class="fieldcontain">
					<span id="mother-label" class="property-label"><g:message code="user.mother.label" default="Mother" /></span>
					
						<span class="property-value" aria-labelledby="mother-label"><g:fieldValue bean="${userInstance}" field="mother"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.baptism}">
				<li class="fieldcontain">
					<span id="baptism-label" class="property-label"><g:message code="user.baptism.label" default="Baptism" /></span>
					
						<span class="property-value" aria-labelledby="baptism-label"><g:formatDate date="${userInstance?.baptism}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.memberSince}">
				<li class="fieldcontain">
					<span id="memberSince-label" class="property-label"><g:message code="user.memberSince.label" default="Member Since" /></span>
					
						<span class="property-value" aria-labelledby="memberSince-label"><g:formatDate date="${userInstance?.memberSince}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.conversion}">
				<li class="fieldcontain">
					<span id="conversion-label" class="property-label"><g:message code="user.conversion.label" default="Conversion" /></span>
					
						<span class="property-value" aria-labelledby="conversion-label"><g:formatDate date="${userInstance?.conversion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.baptismHollySpirit}">
				<li class="fieldcontain">
					<span id="baptismHollySpirit-label" class="property-label"><g:message code="user.baptismHollySpirit.label" default="Baptism Holly Spirit" /></span>
					
						<span class="property-value" aria-labelledby="baptismHollySpirit-label"><g:formatBoolean boolean="${userInstance?.baptismHollySpirit}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.maritalStatus}">
				<li class="fieldcontain">
					<span id="maritalStatus-label" class="property-label"><g:message code="user.maritalStatus.label" default="Marital Status" /></span>
					
						<span class="property-value" aria-labelledby="maritalStatus-label"><g:fieldValue bean="${userInstance}" field="maritalStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.spouse}">
				<li class="fieldcontain">
					<span id="spouse-label" class="property-label"><g:message code="user.spouse.label" default="Spouse" /></span>
					
						<span class="property-value" aria-labelledby="spouse-label"><g:fieldValue bean="${userInstance}" field="spouse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.marriageDate}">
				<li class="fieldcontain">
					<span id="marriageDate-label" class="property-label"><g:message code="user.marriageDate.label" default="Marriage Date" /></span>
					
						<span class="property-value" aria-labelledby="marriageDate-label"><g:formatDate date="${userInstance?.marriageDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="user.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:fieldValue bean="${userInstance}" field="department"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.post}">
				<li class="fieldcontain">
					<span id="post-label" class="property-label"><g:message code="user.post.label" default="Post" /></span>
					
						<span class="property-value" aria-labelledby="post-label"><g:fieldValue bean="${userInstance}" field="post"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.observation}">
				<li class="fieldcontain">
					<span id="observation-label" class="property-label"><g:message code="user.observation.label" default="Observation" /></span>
					
						<span class="property-value" aria-labelledby="observation-label"><g:fieldValue bean="${userInstance}" field="observation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

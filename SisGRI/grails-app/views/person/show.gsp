
<%@ page import="org.sisgri.people.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">

				<g:if test="${personInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="person.name.label" default="Name" /></span>

						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${personInstance}" field="name"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="person.cpf.label" default="Cpf" /></span>

						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${personInstance}" field="cpf"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.rg}">
				<li class="fieldcontain">
					<span id="rg-label" class="property-label"><g:message code="person.rg.label" default="Rg" /></span>

						<span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${personInstance}" field="rg"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.situation}">
				<li class="fieldcontain">
					<span id="situation-label" class="property-label"><g:message code="person.situation.label" default="Situation" /></span>

						<span class="property-value" aria-labelledby="situation-label"><g:formatBoolean boolean="${personInstance?.situation}" /></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.profession}">
				<li class="fieldcontain">
					<span id="profession-label" class="property-label"><g:message code="person.profession.label" default="Profession" /></span>

						<span class="property-value" aria-labelledby="profession-label"><g:fieldValue bean="${personInstance}" field="profession"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="person.address.label" default="Address" /></span>

						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${personInstance}" field="address"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="person.city.label" default="City" /></span>

						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${personInstance}" field="city"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="person.zipCode.label" default="Zip Code" /></span>

						<span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue bean="${personInstance}" field="zipCode"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="person.telephone.label" default="Telephone" /></span>

						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${personInstance}" field="telephone"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.cellular}">
				<li class="fieldcontain">
					<span id="cellular-label" class="property-label"><g:message code="person.cellular.label" default="Cellular" /></span>

						<span class="property-value" aria-labelledby="cellular-label"><g:fieldValue bean="${personInstance}" field="cellular"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="person.email.label" default="Email" /></span>

						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personInstance}" field="email"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.birth}">
				<li class="fieldcontain">
					<span id="birth-label" class="property-label"><g:message code="person.birth.label" default="Birth" /></span>

						<span class="property-value" aria-labelledby="birth-label"><g:formatDate date="${personInstance?.birth}" /></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.birthPlace}">
				<li class="fieldcontain">
					<span id="birthPlace-label" class="property-label"><g:message code="person.birthPlace.label" default="Birth Place" /></span>

						<span class="property-value" aria-labelledby="birthPlace-label"><g:fieldValue bean="${personInstance}" field="birthPlace"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.father}">
				<li class="fieldcontain">
					<span id="father-label" class="property-label"><g:message code="person.father.label" default="Father" /></span>

						<span class="property-value" aria-labelledby="father-label"><g:fieldValue bean="${personInstance}" field="father"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.mother}">
				<li class="fieldcontain">
					<span id="mother-label" class="property-label"><g:message code="person.mother.label" default="Mother" /></span>

						<span class="property-value" aria-labelledby="mother-label"><g:fieldValue bean="${personInstance}" field="mother"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.baptism}">
				<li class="fieldcontain">
					<span id="baptism-label" class="property-label"><g:message code="person.baptism.label" default="Baptism" /></span>

						<span class="property-value" aria-labelledby="baptism-label"><g:formatDate date="${personInstance?.baptism}" /></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.memberSince}">
				<li class="fieldcontain">
					<span id="memberSince-label" class="property-label"><g:message code="person.memberSince.label" default="Member Since" /></span>

						<span class="property-value" aria-labelledby="memberSince-label"><g:formatDate date="${personInstance?.memberSince}" /></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.conversion}">
				<li class="fieldcontain">
					<span id="conversion-label" class="property-label"><g:message code="person.conversion.label" default="Conversion" /></span>

						<span class="property-value" aria-labelledby="conversion-label"><g:formatDate date="${personInstance?.conversion}" /></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.baptismHollySpirit}">
				<li class="fieldcontain">
					<span id="baptismHollySpirit-label" class="property-label"><g:message code="person.baptismHollySpirit.label" default="Baptism Holly Spirit" /></span>

						<span class="property-value" aria-labelledby="baptismHollySpirit-label"><g:formatBoolean boolean="${personInstance?.baptismHollySpirit}" /></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.maritalStatus}">
				<li class="fieldcontain">
					<span id="maritalStatus-label" class="property-label"><g:message code="person.maritalStatus.label" default="Marital Status" /></span>

						<span class="property-value" aria-labelledby="maritalStatus-label"><g:fieldValue bean="${personInstance}" field="maritalStatus"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.spouse}">
				<li class="fieldcontain">
					<span id="spouse-label" class="property-label"><g:message code="person.spouse.label" default="Spouse" /></span>

						<span class="property-value" aria-labelledby="spouse-label"><g:fieldValue bean="${personInstance}" field="spouse"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.marriageDate}">
				<li class="fieldcontain">
					<span id="marriageDate-label" class="property-label"><g:message code="person.marriageDate.label" default="Marriage Date" /></span>

						<span class="property-value" aria-labelledby="marriageDate-label"><g:formatDate date="${personInstance?.marriageDate}" /></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="person.department.label" default="Department" /></span>

						<span class="property-value" aria-labelledby="department-label"><g:fieldValue bean="${personInstance}" field="department"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.post}">
				<li class="fieldcontain">
					<span id="post-label" class="property-label"><g:message code="person.post.label" default="Post" /></span>

						<span class="property-value" aria-labelledby="post-label"><g:fieldValue bean="${personInstance}" field="post"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.observation}">
				<li class="fieldcontain">
					<span id="observation-label" class="property-label"><g:message code="person.observation.label" default="Observation" /></span>

						<span class="property-value" aria-labelledby="observation-label"><g:fieldValue bean="${personInstance}" field="observation"/></span>

				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personInstance?.id}" />

					<g:if test="${personInstance?.profile?.id == null}">
						<g:link controller="profile" action="create" class="edit">Criar Perfil</g:link>
					</g:if>

					<g:if test="${personInstance?.profile?.id != null}">
						<g:actionSubmit class="delete" action="removeProfile" value="Remover Perfil" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:if>

					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

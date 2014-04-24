<%@ page import="org.sisgri.authentication.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="profile.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${profileInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="profile.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${profileInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="profile.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${org.sisgri.people.Person.list()}" optionKey="id" required="" value="${profileInstance?.person?.id}" class="many-to-one"/>

</div>


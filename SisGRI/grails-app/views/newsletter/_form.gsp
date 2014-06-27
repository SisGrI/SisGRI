<%@ page import="org.sisgri.register.Newsletter" %>



<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="newsletter.church.label" default="Church" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${newsletterInstance?.church?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'registersEntry', 'error')} ">
	<label for="registersEntry">
		<g:message code="newsletter.registersEntry.label" default="Registers Entry" />
		
	</label>
	<g:select name="registersEntry" from="${org.sisgri.register.Register.list()}" multiple="multiple" optionKey="id" size="5" value="${newsletterInstance?.registersEntry*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'registersExit', 'error')} ">
	<label for="registersExit">
		<g:message code="newsletter.registersExit.label" default="Registers Exit" />
		
	</label>
	<g:select name="registersExit" from="${org.sisgri.register.Register.list()}" multiple="multiple" optionKey="id" size="5" value="${newsletterInstance?.registersExit*.id}" class="many-to-many"/>

</div>


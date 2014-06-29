<%@ page import="org.sisgri.register.Newsletter" %>




<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="newsletter.church.label" default="Church" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${newsletterInstance?.church?.id}" class="many-to-one"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'registersEntry', 'error')} ">
		<label class="control-label col-md-3" for="registersEntry">
			<g:message code="newsletter.registersEntry.label" default="Registers Entry" />
			
		</label>
		<div class="col-md-4">
			<g:select name="registersEntry" from="${org.sisgri.register.Register.list()}" multiple="multiple" optionKey="id" size="5" value="${newsletterInstance?.registersEntry*.id}" class="many-to-many"/>

		</div>
	</div>
</div>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'registersExit', 'error')} ">
		<label class="control-label col-md-3" for="registersExit">
			<g:message code="newsletter.registersExit.label" default="Registers Exit" />
			
		</label>
		<div class="col-md-4">
			<g:select name="registersExit" from="${org.sisgri.register.Register.list()}" multiple="multiple" optionKey="id" size="5" value="${newsletterInstance?.registersExit*.id}" class="many-to-many"/>

		</div>
	</div>
</div>


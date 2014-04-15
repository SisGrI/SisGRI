<%@ page import="org.sisgri.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${personInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="person.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${personInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="person.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${personInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'zipCode', 'error')} required">
	<label for="zipCode">
		<g:message code="person.zipCode.label" default="Zip Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zipCode" required="" value="${personInstance?.zipCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birth', 'error')} required">
	<label for="birth">
		<g:message code="person.birth.label" default="Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birth" precision="day"  value="${personInstance?.birth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthPlace', 'error')} required">
	<label for="birthPlace">
		<g:message code="person.birthPlace.label" default="Birth Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthPlace" precision="day"  value="${personInstance?.birthPlace}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="person.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${personInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'rg', 'error')} required">
	<label for="rg">
		<g:message code="person.rg.label" default="Rg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" required="" value="${personInstance?.rg}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'maritalStatus', 'error')} required">
	<label for="maritalStatus">
		<g:message code="person.maritalStatus.label" default="Marital Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maritalStatus" from="${personInstance.constraints.maritalStatus.inList}" required="" value="${personInstance?.maritalStatus}" valueMessagePrefix="person.maritalStatus"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="person.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="department" required="" value="${personInstance?.department}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="person.post.label" default="Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="post" required="" value="${personInstance?.post}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'function', 'error')} required">
	<label for="function">
		<g:message code="person.function.label" default="Function" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="function" required="" value="${personInstance?.function}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'baptismHollySpirit', 'error')} ">
	<label for="baptismHollySpirit">
		<g:message code="person.baptismHollySpirit.label" default="Baptism Holly Spirit" />
		
	</label>
	<g:radioGroup name="baptismHollySpirit" labels="['Sim','Não']" values="['true','false']" value="${personInstance?.baptismHollySpirit}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'batism', 'error')} required">
	<label for="batism">
		<g:message code="person.batism.label" default="Batism" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="batism" precision="day"  value="${personInstance?.batism}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellular', 'error')} ">
	<label for="cellular">
		<g:message code="person.cellular.label" default="Cellular" />
		
	</label>
	<g:textField name="cellular" value="${personInstance?.cellular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'conversion', 'error')} required">
	<label for="conversion">
		<g:message code="person.conversion.label" default="Conversion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="conversion" precision="day"  value="${personInstance?.conversion}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${personInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'father', 'error')} ">
	<label for="father">
		<g:message code="person.father.label" default="Father" />
		
	</label>
	<g:textField name="father" value="${personInstance?.father}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'marriageDate', 'error')} required">
	<label for="marriageDate">
		<g:message code="person.marriageDate.label" default="Marriage Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="marriageDate" precision="day"  value="${personInstance?.marriageDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'memberSince', 'error')} required">
	<label for="memberSince">
		<g:message code="person.memberSince.label" default="Member Since" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="memberSince" precision="day"  value="${personInstance?.memberSince}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'mother', 'error')} ">
	<label for="mother">
		<g:message code="person.mother.label" default="Mother" />
		
	</label>
	<g:textField name="mother" value="${personInstance?.mother}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'observation', 'error')} ">
	<label for="observation">
		<g:message code="person.observation.label" default="Observation" />
		
	</label>
	<g:textField name="observation" value="${personInstance?.observation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="person.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="photo" name="photo" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'profession', 'error')} ">
	<label for="profession">
		<g:message code="person.profession.label" default="Profession" />
		
	</label>
	<g:textField name="profession" value="${personInstance?.profession}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'situation', 'error')} ">
	<label for="situation">
		<g:message code="person.situation.label" default="Situation" />
		
	</label>
	<g:radioGroup name="situation" labels="['Sim','Não']" values="['true','false']" value="${personInstance?.situation}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'spouse', 'error')} ">
	<label for="spouse">
		<g:message code="person.spouse.label" default="Spouse" />
		
	</label>
	<g:textField name="spouse" value="${personInstance?.spouse}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="person.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" value="${personInstance?.telephone}"/>

</div>


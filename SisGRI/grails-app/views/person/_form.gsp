<%@ page import="org.sisgri.people.Person" %>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="person.photo.label" default="Photo" />
		
	</label>
	<input type="file" name="photo" />

	<g:actionSubmit action="deletePhoto" value="${message(code: 'default.button.deletePhoto.label', default: 'Delete Photo')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="person.church.label" default="Church" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${personInstance?.church?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${personInstance?.name}"/>

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

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'situation', 'error')} ">
	<label for="situation">
		<g:message code="person.situation.label" default="Situation" />
		
	</label>
	<g:radioGroup name="situation" labels="['Sim','Não']" values="['true','false']" value="${personInstance?.situation}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'profession', 'error')} ">
	<label for="profession">
		<g:message code="person.profession.label" default="Profession" />
		
	</label>
	<g:textField name="profession" value="${personInstance?.profession}"/>

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

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="person.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" value="${personInstance?.telephone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellular', 'error')} ">
	<label for="cellular">
		<g:message code="person.cellular.label" default="Cellular" />
		
	</label>
	<g:textField name="cellular" value="${personInstance?.cellular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${personInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birth', 'error')} required">
	<label for="birth">
		<g:message code="person.birth.label" default="Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birth" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.birth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthPlace', 'error')} required">
	<label for="birthPlace">
		<g:message code="person.birthPlace.label" default="Birth Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="birthPlace" required="" value="${personInstance?.birthPlace}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'father', 'error')} ">
	<label for="father">
		<g:message code="person.father.label" default="Father" />
		
	</label>
	<g:textField name="father" value="${personInstance?.father}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'mother', 'error')} ">
	<label for="mother">
		<g:message code="person.mother.label" default="Mother" />
		
	</label>
	<g:textField name="mother" value="${personInstance?.mother}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'baptism', 'error')} ">
	<label for="baptism">
		<g:message code="person.baptism.label" default="Baptism" />
		
	</label>
	<g:datePicker name="baptism" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.baptism}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'memberSince', 'error')} ">
	<label for="memberSince">
		<g:message code="person.memberSince.label" default="Member Since" />
		
	</label>
	<g:datePicker name="memberSince" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.memberSince}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'conversion', 'error')} ">
	<label for="conversion">
		<g:message code="person.conversion.label" default="Conversion" />
		
	</label>
	<g:datePicker name="conversion" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.conversion}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'baptismHollySpirit', 'error')} ">
	<label for="baptismHollySpirit">
		<g:message code="person.baptismHollySpirit.label" default="Baptism Holly Spirit" />
		
	</label>
	<g:radioGroup name="baptismHollySpirit" labels="['Sim','Não']" values="['true','false']" value="${personInstance?.baptismHollySpirit}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'maritalStatus', 'error')} required">
	<label for="maritalStatus">
		<g:message code="person.maritalStatus.label" default="Marital Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maritalStatus" from="${personInstance.constraints.maritalStatus.inList}" required="" value="${personInstance?.maritalStatus}" valueMessagePrefix="person.maritalStatus"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'spouse', 'error')} ">
	<label for="spouse">
		<g:message code="person.spouse.label" default="Spouse" />
		
	</label>
	<g:textField name="spouse" value="${personInstance?.spouse}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'marriageDate', 'error')} ">
	<label for="marriageDate">
		<g:message code="person.marriageDate.label" default="Marriage Date" />
		
	</label>
	<g:datePicker name="marriageDate" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.marriageDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="person.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="department" from="${personInstance.constraints.department.inList}" required="" value="${personInstance?.department}" valueMessagePrefix="person.department"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="person.post.label" default="Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="post" from="${personInstance.constraints.post.inList}" required="" value="${personInstance?.post}" valueMessagePrefix="person.post"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'observation', 'error')} ">
	<label for="observation">
		<g:message code="person.observation.label" default="Observation" />
		
	</label>
	<g:textArea name="observation" cols="40" rows="5" value="${personInstance?.observation}"/>

</div>


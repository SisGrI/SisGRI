<%@ page import="org.sisgri.authentication.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="user.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${userInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'rg', 'error')} required">
	<label for="rg">
		<g:message code="user.rg.label" default="Rg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" required="" value="${userInstance?.rg}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'situation', 'error')} ">
	<label for="situation">
		<g:message code="user.situation.label" default="Situation" />
		
	</label>
	<g:radioGroup name="situation" labels="['Sim','Não']" values="['true','false']" value="${userInstance?.situation}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profession', 'error')} ">
	<label for="profession">
		<g:message code="user.profession.label" default="Profession" />
		
	</label>
	<g:textField name="profession" value="${userInstance?.profession}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="user.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${userInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="user.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${userInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'zipCode', 'error')} required">
	<label for="zipCode">
		<g:message code="user.zipCode.label" default="Zip Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zipCode" required="" value="${userInstance?.zipCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="user.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" value="${userInstance?.telephone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cellular', 'error')} ">
	<label for="cellular">
		<g:message code="user.cellular.label" default="Cellular" />
		
	</label>
	<g:textField name="cellular" value="${userInstance?.cellular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birth', 'error')} required">
	<label for="birth">
		<g:message code="user.birth.label" default="Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birth" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${userInstance?.birth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birthPlace', 'error')} required">
	<label for="birthPlace">
		<g:message code="user.birthPlace.label" default="Birth Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="birthPlace" required="" value="${userInstance?.birthPlace}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'father', 'error')} ">
	<label for="father">
		<g:message code="user.father.label" default="Father" />
		
	</label>
	<g:textField name="father" value="${userInstance?.father}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mother', 'error')} ">
	<label for="mother">
		<g:message code="user.mother.label" default="Mother" />
		
	</label>
	<g:textField name="mother" value="${userInstance?.mother}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'baptism', 'error')} ">
	<label for="baptism">
		<g:message code="user.baptism.label" default="Baptism" />
		
	</label>
	<g:datePicker name="baptism" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${userInstance?.baptism}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'memberSince', 'error')} ">
	<label for="memberSince">
		<g:message code="user.memberSince.label" default="Member Since" />
		
	</label>
	<g:datePicker name="memberSince" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${userInstance?.memberSince}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'conversion', 'error')} ">
	<label for="conversion">
		<g:message code="user.conversion.label" default="Conversion" />
		
	</label>
	<g:datePicker name="conversion" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${userInstance?.conversion}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'baptismHollySpirit', 'error')} ">
	<label for="baptismHollySpirit">
		<g:message code="user.baptismHollySpirit.label" default="Baptism Holly Spirit" />
		
	</label>
	<g:radioGroup name="baptismHollySpirit" labels="['Sim','Não']" values="['true','false']" value="${userInstance?.baptismHollySpirit}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'maritalStatus', 'error')} required">
	<label for="maritalStatus">
		<g:message code="user.maritalStatus.label" default="Marital Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maritalStatus" from="${userInstance.constraints.maritalStatus.inList}" required="" value="${userInstance?.maritalStatus}" valueMessagePrefix="user.maritalStatus"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'spouse', 'error')} ">
	<label for="spouse">
		<g:message code="user.spouse.label" default="Spouse" />
		
	</label>
	<g:textField name="spouse" value="${userInstance?.spouse}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'marriageDate', 'error')} ">
	<label for="marriageDate">
		<g:message code="user.marriageDate.label" default="Marriage Date" />
		
	</label>
	<g:datePicker name="marriageDate" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${userInstance?.marriageDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="user.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="department" from="${userInstance.constraints.department.inList}" required="" value="${userInstance?.department}" valueMessagePrefix="user.department"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="user.post.label" default="Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="post" from="${userInstance.constraints.post.inList}" required="" value="${userInstance?.post}" valueMessagePrefix="user.post"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'observation', 'error')} ">
	<label for="observation">
		<g:message code="user.observation.label" default="Observation" />
		
	</label>
	<g:textArea name="observation" cols="40" rows="5" value="${userInstance?.observation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:radioGroup name="accountExpired" labels="['Sim','Não']" values="['true','false']" value="${userInstance?.accountExpired}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:radioGroup name="accountLocked" labels="['Sim','Não']" values="['true','false']" value="${userInstance?.accountLocked}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:radioGroup name="enabled" labels="['Sim','Não']" values="['true','false']" value="${userInstance?.enabled}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:radioGroup name="passwordExpired" labels="['Sim','Não']" values="['true','false']" value="${userInstance?.passwordExpired}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>

</div>


<%@ page import="org.sisgri.people.Person" %>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'photo', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="person.photo.label" default="Foto" />
		</label>
		<div class="col-md-9">
			<div class="fileinput fileinput-new" data-provides="fileinput">
				<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
					<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=Sem+Imagem" alt=""/>
				</div>
				<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
				</div>
				<div>
					<span class="btn default btn-file">
						<span class="fileinput-new">
							 Selecionar Imagem
						</span>
						<span class="fileinput-exists">
							 Mudar
						</span>
						<input type="file" name="photo" />
					</span>
					<a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
						 Remover
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'church', 'error')} required">
		<label class="control-label col-md-3" for="church">
			<g:message code="person.church.label" default="Igreja" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" id="church" name="church.id" from="${org.sisgri.church.Church.list()}" optionKey="id" required="" value="${personInstance?.church?.id}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
		<label class="control-label col-md-3" for="name">
			<g:message code="person.name.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="name" required="" value="${personInstance?.name}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cpf', 'error')} required">
		<label class="control-label col-md-3" for="cpf">
			<g:message code="person.cpf.label" default="CPF" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="cpf" required="" value="${personInstance?.cpf}"/>
		</div>
	</div>
</div>
<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'rg', 'error')} required">
		<label class="control-label col-md-3" for="rg">
			<g:message code="person.rg.label" default="RG" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="rg" required="" value="${personInstance?.rg}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'situation', 'error')} ">
		<label class="control-label col-md-3" for="situation">
			<g:message code="person.situation.label" default="Situação" />
			
		</label>
		<div class="col-md-4">
			<g:radioGroup name="situation" labels="['Sim','Não']" values="['true','false']" value="${personInstance?.situation}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'profession', 'error')} ">
		<label class="control-label col-md-3" for="profession">
			<g:message code="person.profession.label" default="Profissão" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="profession" value="${personInstance?.profession}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address', 'error')} required">
		<label class="control-label col-md-3" for="address">
			<g:message code="person.address.label" default="Endereço" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="address" required="" value="${personInstance?.address}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'city', 'error')} required">
		<label class="control-label col-md-3" for="city">
			<g:message code="person.city.label" default="Cidade" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="city" required="" value="${personInstance?.city}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'zipCode', 'error')} required">
		<label class="control-label col-md-3" for="zipCode">
			<g:message code="person.zipCode.label" default="CEP" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="zipCode" required="" value="${personInstance?.zipCode}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'telephone', 'error')} ">
		<label class="control-label col-md-3" for="telephone">
			<g:message code="person.telephone.label" default="Telefone" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="telephone" value="${personInstance?.telephone}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellular', 'error')} ">
		<label class="control-label col-md-3" for="cellular">
			<g:message code="person.cellular.label" default="Celular" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="cellular" value="${personInstance?.cellular}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
		<label class="control-label col-md-3" for="email">
			<g:message code="person.email.label" default="Email" />
			
		</label>
		<div class="col-md-4">
			<g:field class="form-control" type="email" name="email" value="${personInstance?.email}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birth', 'error')} required">
		<label class="control-label col-md-3" for="birth">
			<g:message code="person.birth.label" default="Nascimento" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:datePicker name="birth" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.birth}"  />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthPlace', 'error')} required">
		<label class="control-label col-md-3" for="birthPlace">
			<g:message code="person.birthPlace.label" default="Naturalidade" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="birthPlace" required="" value="${personInstance?.birthPlace}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'father', 'error')} ">
		<label class="control-label col-md-3" for="father">
			<g:message code="person.father.label" default="Pai" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="father" value="${personInstance?.father}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'mother', 'error')} ">
		<label class="control-label col-md-3" for="mother">
			<g:message code="person.mother.label" default="Mãe" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="mother" value="${personInstance?.mother}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'baptism', 'error')} ">
		<label class="control-label col-md-3" for="baptism">
			<g:message code="person.baptism.label" default="Batismo" />
			
		</label>
		<div class="col-md-4">
			<g:datePicker name="baptism" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.baptism}" default="none" noSelection="['': '']" />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'memberSince', 'error')} ">
		<label class="control-label col-md-3" for="memberSince">
			<g:message code="person.memberSince.label" default="Membro Desde" />
			
		</label>
		<div class="col-md-4">
			<g:datePicker name="memberSince" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.memberSince}" default="none" noSelection="['': '']" />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'conversion', 'error')} ">
		<label class="control-label col-md-3" for="conversion">
			<g:message code="person.conversion.label" default="Conversão" />
			
		</label>
		<div class="col-md-4">
			<g:datePicker name="conversion" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.conversion}" default="none" noSelection="['': '']" />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'baptismHollySpirit', 'error')} ">
		<label class="control-label col-md-3" for="baptismHollySpirit">
			<g:message code="person.baptismHollySpirit.label" default="Batismo com Espírito Santo" />
			
		</label>
		<div class="col-md-4">
			<g:radioGroup name="baptismHollySpirit" labels="['Sim','Não']" values="['true','false']" value="${personInstance?.baptismHollySpirit}">
		<span>${it.radio} ${it.label}</span>
	</g:radioGroup>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'maritalStatus', 'error')} required">
		<label class="control-label col-md-3" for="maritalStatus">
			<g:message code="person.maritalStatus.label" default="Estado Civil" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="maritalStatus" from="${personInstance.constraints.maritalStatus.inList}" required="" value="${personInstance?.maritalStatus}" valueMessagePrefix="person.maritalStatus"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'spouse', 'error')} ">
		<label class="control-label col-md-3" for="spouse">
			<g:message code="person.spouse.label" default="Conjuge" />
			
		</label>
		<div class="col-md-4">
			<g:textField class="form-control" name="spouse" value="${personInstance?.spouse}"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'marriageDate', 'error')} ">
		<label class="control-label col-md-3" for="marriageDate">
			<g:message code="person.marriageDate.label" default="Casamento" />
			
		</label>
		<div class="col-md-4">
			<g:datePicker name="marriageDate" years="[1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]" precision="day"  value="${personInstance?.marriageDate}" default="none" noSelection="['': '']" />
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'department', 'error')} required">
		<label class="control-label col-md-3" for="department">
			<g:message code="person.department.label" default="Departamento" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="department" from="${personInstance.constraints.department.inList}" required="" value="${personInstance?.department}" valueMessagePrefix="person.department"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'type', 'error')} required">
		<label class="control-label col-md-3" for="type">
			<g:message code="person.type.label" default="Tipo" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="type" from="${personInstance.constraints.type.inList}" required="" value="${personInstance?.type}" valueMessagePrefix="person.type"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'post', 'error')} ">
		<label class="control-label col-md-3" for="post">
			<g:message code="person.post.label" default="Cargo" />
			
		</label>
		<div class="col-md-4">
			<g:select class="form-control" name="post" from="${personInstance.constraints.post.inList}" value="${personInstance?.post}" valueMessagePrefix="person.post" noSelection="['': '']"/>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'observation', 'error')} ">
		<label class="control-label col-md-3" for="observation">
			<g:message code="person.observation.label" default="Observação" />
			
		</label>
		<div class="col-md-4">
			<g:textArea class="form-control" name="observation" cols="40" rows="5" value="${personInstance?.observation}"/>
		</div>
	</div>
</div>


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Recuperar Dados</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="sendEmail" class="content scaffold-create" role="main">
			<h1>Recuperar Dados</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:form controller="login" action="sendMail" method="post">
				<fieldset class="form">
					<label for='email'>Email:</label>
					<span class="required-indicator">*</span>
					<g:textField name="email" required="" value=""/>

					<g:submitButton name="sendEmail" class="save" value="Enviar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

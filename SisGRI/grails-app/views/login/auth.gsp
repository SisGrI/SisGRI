<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="pt-BR" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><g:message code="springSecurity.login.title"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="description"/>
        <meta content="" name="author"/>
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'uniform.default.css')}" type="text/css">

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-metronic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-responsive.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'plugins.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'default.css')}" type="text/css" id="style_color" >
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">

        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}">

	</head>

    <body class="login">
        <div class="logo">
            <a href="${createLink(uri: '/')}">
                <img src="${resource(dir: 'images', file: 'logo.png')}" alt=""/>
            </a>
        </div>

        <div class="content">
        	<form class="login-form" action="${postUrl}" method="POST" autocomplete='off'>
        		<h3 class="form-title">Entrar em sua conta</h3>
        		<g:if test="${flash.message}">
					<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					    Usuário e/ou senha inválidos!
					</div>
				</g:if>

				<div class="form-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">Usuário</label>
					<div class="input-icon">
						<i class="fa fa-user"></i>
						<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Usuário"  name='j_username'/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">Senha</label>
					<div class="input-icon">
						<i class="fa fa-lock"></i>
						<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Senha" name='j_password'/>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn blue pull-right">
						Entrar <i class="m-icon-swapright m-icon-white"></i>
					</button>
				</div>

				<div class="forget-password">
					<h4>Esqueceu a senha ?</h4>
					<p>
						 Clique
                        <g:link controller="login" action="recoveryProfile">aqui</g:link>
						 para recuparar sua senha.
					</p>
				</div>
        	</form>
        </div>

        <div class="copyright">
            2014 SisGrI - Todos os direitos reservados.
        </div>

        <g:javascript src="jquery-1.10.2.min.js" />
        <g:javascript src="jquery-migrate-1.2.1.min.js" />
        <g:javascript src="bootstrap.min.js" />
        <g:javascript src="bootstrap-hover-dropdown.min.js" />
        <g:javascript src="jquery.slimscroll.min.js" />
        <g:javascript src="jquery.blockui.min.js" />
        <g:javascript src="jquery.cokie.min.js" />
        <g:javascript src="jquery.uniform.min.js" />
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <g:javascript src="jquery.validate.min.js" />
        <g:javascript src="select2.min.js" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <g:javascript src="app.js" />
        <g:javascript src="login.js" />
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function() {     
              App.init();
              Login.init();
            });
        </script>
    </body>
</html>
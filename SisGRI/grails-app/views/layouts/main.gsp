<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="description"/>
        <meta content="" name="author"/>
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'uniform.default.css')}" type="text/css">

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-fileinput.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-switch.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.tagsinput.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-markdown.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'typeahead.css')}" type="text/css">

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'select2.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'select2-metronic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'DT_bootstrap.css')}" type="text/css">

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-metronic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-responsive.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'plugins.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'default.css')}" type="text/css" id="style_color" >
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'error.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">


		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

		<g:javascript library="jquery"/>

		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body class="page-header-fixed page-boxed">
		<div class="header navbar navbar-fixed-top">
			<div class="header-inner container">
				<a class="navbar-brand" href="${createLink(uri: '/')}">
					<img src="${resource(dir: 'images', file: 'logo.png')}" alt="logo" class="img-responsive"/>
				</a>
				<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<img src="${resource(dir: 'images', file: 'menu-toggler.png')}" alt=""/>
				</a>

				<ul class="nav navbar-nav pull-right">
					<li class="dropdown user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<img alt="" src="${resource(dir: 'images', file: 'avatar.png')}"/>
							<span class="username">
								 <sec:username/>
							</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li>
								<g:link controller="profile" action="showCurrentProfile">
									<i class="fa fa-user"></i> Meu Perfil
								</g:link>
							</li>
							<li class="divider">
							</li>
							<li>
								<g:link controller="logout">
									<i class="fa fa-sign-out"></i> Sair
								</g:link>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>

		<div class="clearfix">
		</div>

		<div class="container">
			<div class="page-container">
				<div class="page-sidebar-wrapper">
					<div class="page-sidebar navbar-collapse collapse">
						<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
							<li class="sidebar-toggler-wrapper">
								<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
								<div class="sidebar-toggler hidden-phone">
								</div>
								<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
							</li>
							<li class="start ">
								<a href="${createLink(uri: '/')}">
									<i class="fa fa-home"></i>
									<span class="title">
										Início
									</span>
								</a>
							</li>
							<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SECRETARY">
								<li>
									<a href="javascript:;">
										<i class="fa fa-building-o"></i>
										<span class="title">
											Igrejas
										</span>
										<span class="arrow ">
										</span>
									</a>
									<ul class="sub-menu">
										<li>
											<g:link controller="church">
												Igrejas
											</g:link>
										</li>
									</ul>
								</li>
							</sec:ifAnyGranted>
							<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SECRETARY">
								<li>
									<a href="javascript:;">
										<i class="fa fa-book"></i>
										<span class="title">
											Cultos
										</span>
										<span class="arrow ">
										</span>
									</a>
									<ul class="sub-menu">
										<li>
											<g:link controller="worship" action="search">
												<i class="fa fa-search"></i>
												Pesquisar Cultos
											</g:link>
										</li>
										<li>
											<g:link controller="worship" action="create">
												<i class="fa fa-plus"></i>
												Cadastrar Culto
											</g:link>
										</li>
									</ul>
								</li>
							</sec:ifAnyGranted>
							<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SECRETARY">
								<li>
									<a href="javascript:;">
										<i class="fa fa-users"></i>
										<span class="title">
											Pessoas
										</span>
										<span class="arrow ">
										</span>
									</a>
									<ul class="sub-menu">
										<sec:ifAnyGranted roles="ROLE_ADMIN">
											<li>
												<g:link controller="profile">
													<i class="fa fa-user"></i>
													Perfis
												</g:link>
											</li>
										</sec:ifAnyGranted>
										<li>
											<g:link controller="naturalPerson" action="search">
												<i class="fa fa-search"></i>
												Pesquisar Pessoas
											</g:link>
										</li>
										<li>
											<g:link controller="naturalPerson" action="create">
												<i class="fa fa-plus"></i>
												Cadastrar Pessoa
											</g:link>
										</li>
									</ul>
								</li>
							</sec:ifAnyGranted>
							<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_TREASURER">
								<li>
									<a href="javascript:;">
										<i class="fa fa-scissors"></i>
										<span class="title">
											Tesouraria
										</span>
										<span class="arrow ">
										</span>
									</a>
									<ul class="sub-menu">
										<li>
											<g:link controller="register" action="search">
												<i class="fa fa-search"></i>
												Pesquisar Registros
											</g:link>
										</li>
										<li>
											<g:link controller="register" action="create">
												<i class="fa fa-plus"></i>
												Registro Financeiro
											</g:link>
										</li>
									</ul>
								</li>
							</sec:ifAnyGranted>
							<li class="last">
		                        <g:link controller="logout">
		                            <i class="fa fa-sign-out"></i>
		                            <span class="title">
		                                 Sair
		                            </span>
		                        </g:link>
		                    </li>
						</ul>
					</div>
				</div>
				<div class="page-sidebar-wrapper">
					<div class="page-content">
						<g:layoutBody/>
					</div>
				</div>
			</div>

			<div class="footer">
				<div class="footer-inner">
					 2014 SisGrI - Todos os direitos reservados.
				</div>
				<div class="footer-tools">
					<span class="go-top">
						<i class="fa fa-angle-up"></i>
					</span>
				</div>
			</div>
		</div>
		
		<g:javascript src="jquery-1.10.2.min.js" />
        <g:javascript src="jquery-migrate-1.2.1.min.js" />
        <g:javascript src="bootstrap.min.js" />
        <g:javascript src="bootstrap2-typeahead.min.js" />
        <g:javascript src="bootstrap-hover-dropdown.min.js" />
        <g:javascript src="jquery.slimscroll.min.js" />
        <g:javascript src="jquery.blockui.min.js" />
        <g:javascript src="jquery.cokie.min.js" />
        <g:javascript src="jquery.uniform.min.js" />

		<g:javascript src="spinner.min.js" />
		<g:javascript src="bootstrap-fileinput.js" />
		<g:javascript src="jquery.inputmask.bundle.min.js" />
		<g:javascript src="jquery.input-ip-address-control-1.0.min.js" />
		<g:javascript src="jquery.maskMoney.min.js" />
		<g:javascript src="pwstrength.js" />
		<g:javascript src="bootstrap-switch.min.js" />
		<g:javascript src="jquery.tagsinput.min.js" />
		<g:javascript src="bootstrap-maxlength.min.js" />
		<g:javascript src="bootstrap.touchspin.js" />
		<g:javascript src="handlebars.min.js" />
		<g:javascript src="typeahead.min.js" />

        <g:javascript src="select2.min.js" />
        <g:javascript src="jquery.dataTables.js" />
        <g:javascript src="DT_bootstrap.js" />

        <g:javascript src="app.js" />
        <g:javascript src="components-form-tools.js" />
        <g:javascript src="table-managed.js" />

        <script>
			jQuery(document).ready(function() {    
			   App.init();
			   ComponentsFormTools.init();
			   TableManaged.init();
			});
		</script>

		<r:layoutResources />
	</body>
</html>

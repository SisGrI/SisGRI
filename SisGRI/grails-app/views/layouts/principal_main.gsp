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

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-metronic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-responsive.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'plugins.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'default.css')}" type="text/css" id="style_color" >
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'error.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'promo.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'animate.css')}" type="text/css">

		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body class="page-header-fixed page-boxed page-full-width">

		<div class="header navbar navbar-fixed-top mega-menu">
			<div class="header-inner container">
				<a class="navbar-brand" href="${createLink(uri: '/')}">
					<img src="${resource(dir: 'images', file: 'logo.png')}" alt="logo" class="img-responsive"/>
				</a>

				<div class="hor-menu hidden-sm hidden-xs">
					<ul class="nav navbar-nav">
						<li class="classic-menu-dropdown active">
							<a href="index.html">
								 Dashboard
								<span class="selected">
								</span>
							</a>
						</li>
						<li class="classic-menu-dropdown">
							<a data-toggle="dropdown" data-hover="dropdown" data-close-others="true" href="">
								 Classic <i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="#">
										 Section 1
									</a>
								</li>
								<li>
									<a href="#">
										 Section 2
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>

				<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<img src="${resource(dir: 'images', file: 'menu-toggler.png')}" alt=""/>
				</a>
			</div>
		</div>

		<div class="clearfix">
		</div>

		<div class="page-container">
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
		
		<g:javascript src="jquery-1.10.2.min.js" />
        <g:javascript src="jquery-migrate-1.2.1.min.js" />
        <g:javascript src="jquery-ui-1.10.3.custom.min.js" />
        <g:javascript src="bootstrap.min.js" />
        <g:javascript src="bootstrap-hover-dropdown.min.js" />
        <g:javascript src="jquery.slimscroll.min.js" />
        <g:javascript src="jquery.blockui.min.js" />
        <g:javascript src="jquery.cokie.min.js" />
        <g:javascript src="jquery.uniform.min.js" />

        <g:javascript src="app.js" />

        <script>
			jQuery(document).ready(function() {    
			   App.init();
			});
		</script>

		<r:layoutResources />
	</body>
</html>

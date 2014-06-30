
<%@ page import="org.sisgri.authentication.Profile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">Profile</h3>
	            <ul class="page-breadcrumb breadcrumb">
	                <li>
	                    <i class="fa fa-home"></i>
	                    <a href="${createLink(uri: '/')}">
							Página Inicial
						</a>
	                    <i class="fa fa-angle-right"></i>
	                </li>
	                <li>
	                	<g:link>
							Profiles
						</g:link>
						<i class="fa fa-angle-right"></i>
	                </li>
	                <li>
						Detalhar
	                </li>
	            </ul>
	        </div>
	    	<div class="col-md-12">
				<g:if test="${flash.message}">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					    ${flash.message}
					</div>
				</g:if>
			</div>
			<div class="col-md-12">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-reorder"></i>Detalhar Profile
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<g:form class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									
									<g:if test="${profileInstance?.username}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Username</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${profileInstance}" field="username"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${profileInstance?.password}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Password</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${profileInstance}" field="password"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${profileInstance?.person}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Person</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="person" action="show" id="${profileInstance?.person?.id}">${profileInstance?.person?.encodeAsHTML()}</g:link>
												</p>
											</div>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${profileInstance?.enabled}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Enabled</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:formatBoolean boolean="${profileInstance?.enabled}" />
												</p>
											</div>	
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${profileInstance?.accountExpired}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Account Expired</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:formatBoolean boolean="${profileInstance?.accountExpired}" />
												</p>
											</div>	
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${profileInstance?.accountLocked}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Account Locked</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:formatBoolean boolean="${profileInstance?.accountLocked}" />
												</p>
											</div>	
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${profileInstance?.passwordExpired}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Password Expired</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:formatBoolean boolean="${profileInstance?.passwordExpired}" />
												</p>
											</div>	
											
											</div>
										</div>
									</g:if>
									
									</div>
								</div>
							<div class="form-actions right">
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-offset-3 col-md-9">
											<g:hiddenField name="id" value="${profileInstance?.id}" />

											<g:link class="btn blue" action="edit" id="${profileInstance?.id}">
											<i class="fa fa-pencil"></i> Editar	</g:link>

											<g:actionSubmit class="btn red" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');">
											</g:actionSubmit>
										</div>
									</div>
								</div>
							</div>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

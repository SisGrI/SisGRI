
<%@ page import="org.sisgri.church.SubHeadquarter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subHeadquarter.label', default: 'SubHeadquarter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">SubHeadquarter</h3>
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
							SubHeadquarters
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
							<i class="fa fa-reorder"></i>Detalhar SubHeadquarter
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<g:form class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									
									<g:if test="${subHeadquarterInstance?.name}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Name</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${subHeadquarterInstance}" field="name"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${subHeadquarterInstance?.address}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Address</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="${subHeadquarterInstance}" field="address"/>
												</p>
											</div>
											
											</div>
										</div>
									</g:if>
									
									<g:if test="${subHeadquarterInstance?.worship}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Worship</label>
												
											<g:each status="i" in="${subHeadquarterInstance.worship}" var="w">
												<g:if test="${i}">
													<label class="control-label col-md-3"></label>
												</g:if>
												<div class="col-md-9">
													<p class="form-control-static">
														<g:link controller="worship" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link>
													</p>
												</div>
											</g:each>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${subHeadquarterInstance?.person}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Person</label>
												
											<g:each status="i" in="${subHeadquarterInstance.person}" var="p">
												<g:if test="${i}">
													<label class="control-label col-md-3"></label>
												</g:if>
												<div class="col-md-9">
													<p class="form-control-static">
														<g:link controller="person" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link>
													</p>
												</div>
											</g:each>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${subHeadquarterInstance?.registers}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Registers</label>
												
											<g:each status="i" in="${subHeadquarterInstance.registers}" var="r">
												<g:if test="${i}">
													<label class="control-label col-md-3"></label>
												</g:if>
												<div class="col-md-9">
													<p class="form-control-static">
														<g:link controller="register" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
													</p>
												</div>
											</g:each>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${subHeadquarterInstance?.congregations}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Congregations</label>
												
											<g:each status="i" in="${subHeadquarterInstance.congregations}" var="c">
												<g:if test="${i}">
													<label class="control-label col-md-3"></label>
												</g:if>
												<div class="col-md-9">
													<p class="form-control-static">
														<g:link controller="congregation" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link>
													</p>
												</div>
											</g:each>
										
											</div>
										</div>
									</g:if>
									
									<g:if test="${subHeadquarterInstance?.headquarter}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Headquarter</label>
												
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="headquarter" action="show" id="${subHeadquarterInstance?.headquarter?.id}">${subHeadquarterInstance?.headquarter?.encodeAsHTML()}</g:link>
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
											<g:hiddenField name="id" value="${subHeadquarterInstance?.id}" />

											<g:link class="btn blue" action="edit" id="${subHeadquarterInstance?.id}">
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

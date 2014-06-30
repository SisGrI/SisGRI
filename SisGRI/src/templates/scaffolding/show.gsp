<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
	        <div class="col-md-12">
	            <h3 class="page-title">${className}</h3>
	            <ul class="page-breadcrumb breadcrumb">
	                <li>
	                    <i class="fa fa-home"></i>
	                    <a href="\${createLink(uri: '/')}">
							Página Inicial
						</a>
	                    <i class="fa fa-angle-right"></i>
	                </li>
	                <li>
	                	<g:link>
							${className}s
						</g:link>
						<i class="fa fa-angle-right"></i>
	                </li>
	                <li>
						Detalhar
	                </li>
	            </ul>
	        </div>
	    	<div class="col-md-12">
				<g:if test="\${flash.message}">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					    \${flash.message}
					</div>
				</g:if>
			</div>
			<div class="col-md-12">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-reorder"></i>Detalhar ${className}
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<g:form class="form-horizontal" role="form">
							<div class="form-body">
								<h3 class="form-section">Dados</h3>
								<div class="row">
									<% excludedProps = Event.allEvents.toList() << 'id' << 'version'
									allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
									props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
									Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
									props.each { p -> %>
									<g:if test="\${${propertyName}?.${p.name}}">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">${p.naturalName}</label>
												<% if (p.isEnum()) { %>
												<div class="col-md-9">
													<p class="form-control-static">
														<g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
													</p>
												</div>
										<%  } else if (p.oneToMany || p.manyToMany) { %>
											<g:each status="i" in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
												<g:if test="\${i}">
													<label class="control-label col-md-3"></label>
												</g:if>
												<div class="col-md-9">
													<p class="form-control-static">
														<g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link>
													</p>
												</div>
											</g:each>
										<%  } else if (p.manyToOne || p.oneToOne) { %>
											<div class="col-md-9">
												<p class="form-control-static">
													<g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
												</p>
											</div>
										<%  } else if (p.type == Boolean || p.type == boolean) { %>
											<div class="col-md-9">
												<p class="form-control-static">
													<g:formatBoolean boolean="\${${propertyName}?.${p.name}}" />
												</p>
											</div>	
											<% } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
												<div class="col-md-9">
													<p class="form-control-static">
														<g:formatDate date="\${${propertyName}?.${p.name}}" />
													</p>
												</div>
											<% } else if ((p.type==([] as byte[]).class) || (p.type==([] as Byte[]).class)) { %>
												<span class="property-value" aria-labelledby="${p.name}-label">
													<g:link action="download${p.name}" id="\${${propertyName}.id}">
														<g:img dir="images" file="icon-file2.gif"/>
													</g:link>
												</span>
											<% } else if (!p.type.isArray()) { %>
											<div class="col-md-9">
												<p class="form-control-static">
													<g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
												</p>
											</div>
											<% } %>
											</div>
										</div>
									</g:if>
									<% } %>
									</div>
								</div>
							<div class="form-actions right">
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-offset-3 col-md-9">
											<g:hiddenField name="id" value="\${${propertyName}?.id}" />

											<g:link class="btn blue" action="edit" id="\${${propertyName}?.id}">
											<i class="fa fa-pencil"></i> Editar	</g:link>

											<g:actionSubmit class="btn red" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');">
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

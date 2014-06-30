<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
							<i class="fa fa-list"></i>${className}s
						</div>
						<div class="actions">
							<g:link class="btn green" action="create">
								<i class="fa fa-plus"></i> Novo
							</g:link>
							<a href="#" class="btn yellow">
								<i class="fa fa-print"></i> Imprimir
							</a>
						</div>
					</div>
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover" id="sample_2">
							<thead>
								<tr>
								<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
									allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
									props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
									Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
									props.eachWithIndex { p, i ->
										if (i < 6) {  %>
									<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
								<%  }   } %>
								</tr>
							</thead>
							<tbody>
								<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
									<tr class="odd gradeX">
									<%  props.eachWithIndex { p, i ->
											if (i == 0) { %>
										<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
									<%      } else if (i < 6) {
												if (p.type == Boolean || p.type == boolean) { %>
										<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
									<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
										<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
									<%          } else { %>
										<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
									<%  }   }   } %>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

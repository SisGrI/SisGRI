<div id="choosePerson">
	<g:if test="${people}">
		<h3>Selecionar Pessoa</h3>

		<div class="portlet-body">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>Nome</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${people}" status="i" var="personInstance">
						<tr class="odd gradeX">
						
							<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "name")}</g:link></td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</g:if>
</div>
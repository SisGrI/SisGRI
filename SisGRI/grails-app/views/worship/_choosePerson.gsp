<script type="text/javascript">
	function choosePerson(element) {
		var personInstanceId = element.id;
		var name = element.headers;
		var typeSearch = $('#typeSearch').val();

        if (typeSearch == 'searchRuling') {
        	$('#rulingID').val(personInstanceId);
        	$('#rulingName').val(name);
        	$("#rulingName").attr("readonly", true);
        }
        else {
        	$('#prelectorID').val(personInstanceId);
        	$('#prelectorName').val(name);
        	$('#prelectorName').attr("readonly", true);
        }

		$("#modalSearchPerson").modal('hide');
	}
</script>

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
						
							<td id="${personInstance.id}" headers="${personInstance.name}" onclick="choosePerson(this)">${fieldValue(bean: personInstance, field: "name")}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</g:if>
</div>
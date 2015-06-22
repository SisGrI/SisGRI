<script type="text/javascript">
	function setPerson() {
		var name = $('#nameField').val();

		$('#personName').val(name);
	}
</script>

<div class="form-group">
	<label class="control-label col-md-3" for="personName">
		Pesquisar
	</label>
	<div class="col-md-6">
		<g:textField class="form-control" id="personName" name="personName" oninput="${remoteFunction(action: 'choosePerson', update: 'choosePerson', params: '\'personName=\' + escape(this.value)')};"/>
	</div>
</div>

<g:render template="people" />

<script type="text/javascript">
	function setPerson() {
		var name = $('#nameField').val();

		$('#person').val(name);
	}
</script>

<div class="form-group">
	<label class="control-label col-md-3" for="person">
		Pesquisar
	</label>
	<div class="col-md-6">
		<g:textField class="form-control" id="person" name="person" oninput="${remoteFunction(action: 'choosePerson', update: 'choosePerson', params: '\'person=\' + escape(this.value)')};"/>
	</div>
</div>

<g:render template="people" />

<g:javascript>
	function setPerson() {
		var typeSearch = $('#typeSearch').val();
		
		if (typeSearch == 'searchRuling') {
			var name = $('#rulingName').val();
        }
        else {
        	var name = $('#prelectorName').val();
        }

		$('#person').val(name);
	}
</g:javascript>

<div class="form-group">
	<label class="control-label col-md-3" for="person">
		Pesquisar
	</label>
	<div class="col-md-6">
		<g:textField class="form-control" id="person" name="person" oninput="${remoteFunction(action: 'choosePerson', update: 'choosePerson', params: '\'person=\' + escape(this.value)')};"/>
	</div>
</div>

<g:render template="people" />

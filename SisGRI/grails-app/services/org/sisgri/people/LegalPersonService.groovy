package org.sisgri.people

import grails.transaction.Transactional

@Transactional
class LegalPersonService {

    def adjustingParams(LegalPerson person) {
    	if (person.address == null || person.address == "") {
    		person.address = "Não Informado"
    	}
    	if (person.city == null || person.city == "") {
    		person.city = "Não Informado"
    	}
    	if (person.zipCode == null || person.zipCode == "") {
    		person.zipCode = "Não Informado"
    	}
    }
}

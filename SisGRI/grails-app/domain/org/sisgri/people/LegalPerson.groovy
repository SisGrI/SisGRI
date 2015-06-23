package org.sisgri.people

class LegalPerson extends Person {

	String cnpj
	String field

    static constraints = {
    	cnpj blank: false, unique: true
    	field blank: false
    }
}

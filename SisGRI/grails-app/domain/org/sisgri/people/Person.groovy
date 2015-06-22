package org.sisgri.people

import org.sisgri.church.Church

class Person {
	String name
	String address
	String city
	String zipCode
	String telephone
	String email
	String observation

    static belongsTo = [church:Church]

    static constraints = {
        church blank:false
    	name blank:false
    	address blank:false
    	city blank:false
    	zipCode blank:false
    	telephone nullable:true
    	email nullable:true, email:true
    	observation nullable:true, widget:'textarea'
    }

    static mapping = {
        tablePerHierarchy false
    }

    String toString() { "$name" }
}

package org.sisgri.church

import org.sisgri.worship.Worship
import org.sisgri.people.NaturalPerson
import org.sisgri.register.Register

class Church {
	String name
	String address
	String type = "Sub-Sede"

	static hasMany = [worships: Worship, people: NaturalPerson, registers: Register]
	static belongsTo = [church: Church]
	
    static constraints = {
		name blank: false, unique:true
		address blank: false
		type blank: false
		worships nullable: true, display: false
		people nullable: true, display: false
		registers nullable: true
		church nullable: true
    }

    static mapping = {
    	tablePerHierarchy false
    }

    String toString(){
		return name
	}
}

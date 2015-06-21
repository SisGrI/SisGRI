package org.sisgri.church

import org.sisgri.worship.Worship
import org.sisgri.people.Person
import org.sisgri.register.Register

class Church {
	String name
	String address

	static hasMany = [worship:Worship, person:Person, registers:Register]
	
    static constraints = {
		name blank: false, unique:true
		address blank: false
		worship nullable: true, display: false
		person nullable: true, display: false
		registers nullable: true
    }

    String toString(){
		return name
	}
}

package org.sisgri.church

import org.sisgri.worship.Worship
import org.sisgri.people.Person

abstract class Church {
	String name
	String address

	static hasMany = [worship:Worship, person:Person]
	
    static constraints = {
		name blank: false, unique:true
		address blank: false
		worship nullable: true, display: false
		person nullable: true, display: false
    }
}

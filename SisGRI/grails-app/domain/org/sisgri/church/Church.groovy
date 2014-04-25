package org.sisgri.church

import org.sisgri.worship.Worship

abstract class Church {
	String name
	String address

	static hasMany = [worship:Worship]
	
    static constraints = {
		name blank: false, unique:true
		address blank: false
		worship nullable: true, display: false
    }
}

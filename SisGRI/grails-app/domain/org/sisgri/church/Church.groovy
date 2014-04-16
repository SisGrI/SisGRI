package org.sisgri.church

class Church {
	String name
	String address
	
    static constraints = {
	name nullable: false, blank: false
	address nullable: false, blank: false
    }
}

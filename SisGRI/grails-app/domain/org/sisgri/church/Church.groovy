package org.sisgri.church

class Church {
	String name
	String address
	
    static constraints = {
		name blank: false
		address blank: false
    }
}

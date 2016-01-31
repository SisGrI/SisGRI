package org.sisgri.church

class SubHeadquarter extends Church {

	static belongsTo = [church: Church]

    static constraints = {
    	church blank: false
    }
}

package org.sisgri.register

import org.sisgri.church.Church

abstract class Register {
	Date date = new Date()

	static belongsTo = [church: Church]

    static constraints = {
    	date blank:false, display: false
    	church nullable:false
    }
}

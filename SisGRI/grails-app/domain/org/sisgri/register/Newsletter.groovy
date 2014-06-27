package org.sisgri.register

class Newsletter extends Register{
	static hasMany = [registersEntry: Register, registersExit: Register]
    
    static constraints = {
    }
}

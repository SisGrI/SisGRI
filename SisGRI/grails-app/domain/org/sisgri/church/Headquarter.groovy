package org.sisgri.church

class Headquarter extends Church{

	static hasMany = [congregations: Congregation]

    static constraints = {
    }

    String toString(){
    	return name
    }
}

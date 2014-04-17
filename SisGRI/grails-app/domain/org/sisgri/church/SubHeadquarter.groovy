package org.sisgri.church

class SubHeadquarter extends Church{

	static hasMany = [congregations: Congregation]
	static belongsTo = [headquarter: Headquarter]

    static constraints = {
    }
    String toString(){
    	return name
    }
}

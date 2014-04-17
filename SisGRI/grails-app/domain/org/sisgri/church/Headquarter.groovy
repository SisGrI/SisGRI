package org.sisgri.church

class Headquarter extends Church{

	static hasMany = [subHeadquarters: SubHeadquarter]

    static constraints = {
    }

    String toString(){
    	return name
    }
}

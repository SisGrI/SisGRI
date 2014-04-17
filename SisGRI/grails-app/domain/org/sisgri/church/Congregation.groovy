package org.sisgri.church

class Congregation extends Church{

	static belongsTo = [subHeadquarter: SubHeadquarter]

    static constraints = {
    }
    String toString(){
    	return name
    }
}

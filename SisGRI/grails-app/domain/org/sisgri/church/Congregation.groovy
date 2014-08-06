package org.sisgri.church

class Congregation extends Church{

	static belongsTo = [headquarter: Headquarter]

    static constraints = {
    }
    String toString(){
    	return name
    }
}

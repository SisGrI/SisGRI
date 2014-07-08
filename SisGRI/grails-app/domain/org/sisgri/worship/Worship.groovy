package org.sisgri.worship

import org.sisgri.people.Person
import org.sisgri.church.Church

class Worship {
	String type
	Date date
	Person ruling
	Person prelector
	
	static belongsTo = [church:Church]

    static constraints = {
    	church blank:false
		type blank: false, inList:['Público', 'Ensino', 'Santa Ceia', 'Varões', 'Irmãs', 'Jovens', 'Crianças']
		date blank: false, attributes:[years:2013..2014]
		ruling blank: false
		prelector blank: false
    }

    String toString() {
    	"$date - "+"$type"
    }
}

package org.sisgri.worship

import org.sisgri.people.Person
import org.sisgri.church.Church
import java.text.SimpleDateFormat

class Worship {
	String type
	Date date
    String observation
    Person ruling
    Person prelector
	
	static belongsTo = [church:Church]

	static transients = ['stringDate']

    static constraints = {
    	church blank:false
		type blank: false, inList:['Público', 'Ensino', 'Santa Ceia', 'Escola Bíblica', 'Oração', 'Varões', 'Irmãs', 'Jovens', 'Crianças']
		date nullable:true, attributes:[years:2013..2014]
		ruling blank: false
		prelector blank: false
        observation nullable:true, widget:'textarea'
    }

    String toString() {
    	"$date - "+"$type"
    }

    public String getStringDate() {
        if(this.date != null)
            return new SimpleDateFormat("dd/MM/yyyy").format(this.date)
        else
            return ""
    }

    public void setStringDate(String stringDate) {
        if(stringDate != null && stringDate != "") {
            this.date = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate)
        }
    }
}

package org.sisgri.worship

import org.sisgri.people.NaturalPerson
import org.sisgri.church.Church
import java.text.SimpleDateFormat

class Worship {
	String type
	Date date = new Date()
    String observation
    NaturalPerson ruling
    NaturalPerson prelector
    String rulingName
    String prelectorName
	
	static belongsTo = [church:Church]

	static transients = ['stringDate']

    static constraints = {
    	church blank:false
		type blank: false, inList:['Público', 'Ensino', 'Santa Ceia', 'Escola Bíblica', 'Oração', 'Varões', 'Irmãs', 'Jovens', 'Crianças']
		date nullable:true, attributes:[years:2013..2014]
		rulingName blank: false
        ruling nullable: true
		prelectorName blank: false
        prelector nullable: true
        observation nullable:true, widget:'textarea'
    }

    String toString() {
    	"$date - "+"$type"
    }

    public String getStringDate() {
        return new SimpleDateFormat("dd/MM/yyyy").format(this.date)
    }

    public void setStringDate(String stringDate) {
        if(stringDate != null && stringDate != "") {
            this.date = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate)
        }
    }
}

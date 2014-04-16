package org.sisgri.worship

class Worship {
	String type
	Date date
	String ruling
	String prelector
	
    static constraints = {
	type nullable: false, blank: false
	ruling nullable: false, blank: false
	prelector nullable: false, blank: false
    }
}

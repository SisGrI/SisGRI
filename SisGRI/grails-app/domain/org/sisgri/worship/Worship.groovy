package org.sisgri.worship

class Worship {
	String type
	Date date
	String ruling
	String prelector
	
    static constraints = {
		type blank: false
		date blank: false, attributes:[years:2013..2014]
		ruling blank: false
		prelector blank: false
    }
}

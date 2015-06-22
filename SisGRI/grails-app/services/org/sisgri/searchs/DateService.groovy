package org.sisgri.searchs

import grails.transaction.Transactional

@Transactional
class DateService {

	def dateBefore = new Date()
	def dateAfter = new Date()

    void setDates(params) {
	    if(params.date_year != "" && params.date_month == "") {
	        this.dateBefore = this.dateBefore.parse('dd/MM/yyyy', '01/01/'+params.date_year)
	        this.dateAfter = this.dateAfter.parse('dd/MM/yyyy', '31/12/'+params.date_year)
	    }
	    else if(params.date_year != "" && params.date_month != "") {
	        this.dateBefore = this.dateBefore.parse('dd/MM/yyyy', '01/'+params.date_month+'/'+params.date_year)

	        Calendar calendar = Calendar.getInstance()
	        calendar.setTime(this.dateBefore)
	        def lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
	        this.dateAfter = this.dateAfter.parse('dd/MM/yyyy', lastDay+'/'+params.date_month+'/'+params.date_year)
	    }
	}
}

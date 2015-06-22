package org.sisgri

import grails.plugin.springsecurity.annotation.Secured
import org.sisgri.people.NaturalPerson

@Secured(['isAuthenticated()'])
class IndexController {

    def index() {
    	def date = new Date()

    	def criteria = NaturalPerson.createCriteria()
    	def people = criteria.list {
    		ne("name","Administrador")
    		sqlRestriction "extract( month from birth ) = "+(date.month+1)
    	}

    	people.sort {
    		Calendar calendar = Calendar.getInstance();
    		calendar.setTime(it.birth)
    		calendar.get(Calendar.DAY_OF_MONTH)
    	}

    	respond people
    }
}

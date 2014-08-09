package org.sisgri

import grails.plugin.springsecurity.annotation.Secured
import org.sisgri.people.Person

@Secured(['isAuthenticated()'])
class IndexController {

    def index() {
    	def date = new Date()

    	def criteria = Person.createCriteria()
    	def search = criteria.list {
    		gt("id",Person.findByName("Administrador").id)
    		sqlRestriction "extract( month from birth ) = "+(date.month+1)
    	}

    	respond search
    }
}

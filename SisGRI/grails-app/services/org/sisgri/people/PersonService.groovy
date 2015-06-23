package org.sisgri.people

import grails.transaction.Transactional

@Transactional
class PersonService {

    def searchNaturalPeople(String name) {
        def criteria = NaturalPerson.createCriteria()

        def people = criteria.list {
            ne("name","Administrador")
            eq('situation', true)
            
            if(!name?.isAllWhitespace())
                like("name", "%"+name+"%")

            order("name", "asc")
        }
    }

    def searchPeople(String name) {
        def criteria = Person.createCriteria()

        def people = criteria.list {
            ne("name","Administrador")
            
            if(!name?.isAllWhitespace())
                like("name", "%"+name+"%")

            order("name", "asc")
        }
    }
}

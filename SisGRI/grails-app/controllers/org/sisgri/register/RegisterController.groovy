package org.sisgri.register

import org.sisgri.people.Person
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class RegisterController {

    def springSecurityService
    def personService

    def dateBefore = new Date()
    def dateAfter = new Date()

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    protected void setDates(Date dateBefore, Date dateAfter) {
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

    def resultSearch() {
        setDates(this.dateBefore, this.dateAfter)
        
        def criteria = Register.createCriteria()
        
        def registers = criteria.list {
            church{
                if(params.church!=""){
                    like("name", "%"+params.church+"%")
                }
            }
            if(params.name!="")
                like("name", "%"+params.name+"%")
            if(params.type!="")
                eq("type", params.type)
            if(params.entryRegister!="")
                eq("entryRegister", params.entryRegister)
            if(params.exitRegister!="")
                eq("exitRegister", params.exitRegister)
            if(params.value!="") {
                Double value = params.value.replace(",",".").toDouble()
                eq("value", value)
            }
            
            if(params.date_year != "" || (params.date_year != "" && params.date_month != ""))
                between('date', this.dateBefore, this.dateAfter)
            else if(params.date_year == "" && params.date_month != "")
                sqlRestriction "extract( month from date ) = "+params.date_month


            order("date", "desc")
        }

        respond registers, model: [typeRegister: params.type]
    }

    def search() {
        respond new Register(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    def show(Register registerInstance) {
        respond registerInstance
    }

    def create() {
        respond new Register(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    def choosePerson() {
        String name = params.person
        
        render template: "people", model: [people: personService.searchPeople(name)]
    }

    protected def setPerson(Register registerInstance, def params) {
        registerInstance.person = Person.get(params.personID)

        if (!registerInstance.person)
            registerInstance.name = params.name
        else
            registerInstance.name = registerInstance.person.name
    }

    @Transactional
    def save(Register registerInstance) {
        if (registerInstance == null) {
            notFound()
            return
        }

        setPerson(registerInstance, params)

        if (registerInstance.hasErrors()) {
            respond registerInstance.errors, view:'create'
            return
        }

        registerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registerInstance.label', default: 'Register'), registerInstance.id])
                redirect registerInstance
            }
            '*' { respond registerInstance, [status: CREATED] }
        }
    }

    def edit(Register registerInstance) {
        respond registerInstance
    }

    @Transactional
    def update(Register registerInstance) {
        if (registerInstance == null) {
            notFound()
            return
        }

        if (registerInstance.hasErrors()) {
            respond registerInstance.errors, view:'edit'
            return
        }

        registerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Register.label', default: 'Register'), registerInstance.id])
                redirect registerInstance
            }
            '*'{ respond registerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Register registerInstance) {

        if (registerInstance == null) {
            notFound()
            return
        }

        registerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Register.label', default: 'Register'), registerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registerInstance.label', default: 'Register'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

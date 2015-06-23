package org.sisgri.register

import org.sisgri.people.NaturalPerson
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

@Secured(['ROLE_ADMIN', 'ROLE_TREASURER'])
@Transactional(readOnly = true)
class RegisterController {

    def springSecurityService
    def personService
    def jasperService
    def static registers = []
    def static parameters = []

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def resultSearch() {
        if (params.from != "" && params.to == "") {
            params.to = params.from
        }
        else if (params.to != "" && params.from == "") {
            params.from = params.to
        }

        setParameters(params)

        Date from = new Date()
        Date to = new Date()

        def criteria = Register.createCriteria()
        
        registers = criteria.list {
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
            if (params.from != "") {
                from = from.parse('dd/MM/yyyy', params.from)
                to = to.parse('dd/MM/yyyy', params.to)

                between('date', from, to)
            }

            order("date", "asc")
        }

        respond registers, model: [typeRegister: params.type]
    }

    def search() {
        respond new Register(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    protected def setParameters(params) {
        def category = "Lista Geral"
        
        if (params.entryRegister != "") {
            category = params.entryRegister
        }
        else if (params.exitRegister != "") {
            category = params.exitRegister
        }

        parameters = [churchName: springSecurityService.currentUser.person.church.name,
            category: category, from: params.from, to: params.to]
    }

    def print() {
        def reportDef = new JasperReportDef(name:'registerList.jrxml',
            fileFormat:JasperExportFormat.PDF_FORMAT, reportData: registers,
            parameters: parameters)

        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "filename=lista_cultos.pdf")
        response.outputStream << jasperService.generateReport(reportDef).toByteArray()
    }

    def show(Register registerInstance) {
        respond registerInstance
    }

    def create() {
        respond new Register(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    def choosePerson() {
        String name = params.personName
        
        render template: "people", model: [people: personService.searchPeople(name)]
    }

    protected def setPerson(Register registerInstance, def params) {
        registerInstance.person = NaturalPerson.get(params.personID)

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

        if (params.name != "") {
            setPerson(registerInstance, params)
        }

        if (registerInstance.hasErrors()) {
            respond registerInstance.errors, view:'create', model:[churchList:springSecurityService.currentUser.person.church]
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
        respond registerInstance, model:[churchList:springSecurityService.currentUser.person.church]
    }

    @Transactional
    def update(Register registerInstance) {
        if (registerInstance == null) {
            notFound()
            return
        }

        if (registerInstance.hasErrors()) {
            respond registerInstance.errors, view:'edit', model:[churchList:springSecurityService.currentUser.person.church]
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
                redirect action:"search", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registerInstance.label', default: 'Register'), params.id])
                redirect action: "search", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

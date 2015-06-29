package org.sisgri.register

import org.sisgri.people.Person
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
    def registerService
    def static registers = []

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def resultSearch() {
        registerService.setRestrictDates(params)

        Date from = new Date()
        Date to = new Date()
        def criteria = Register.createCriteria()
        
        registers = criteria.list {
            if (params.type == "Entrada") {
                ne("entryRegister", "Saldo Anterior")
            }
            else {
                ne("exitRegister", "2.01 - REPASSE P/ SEDE")
            }

            church{
                if(params.church!=""){
                    like("name", "%"+params.church+"%")
                }
            }

            from = from.parse('dd/MM/yyyy', params.from)
            to = to.parse('dd/MM/yyyy', params.to)

            between('date', from, to)

            if (params.search == "Ver registros") {
                
                eq("type", params.type)

                if(params.name!="")
                    like("name", "%"+params.name+"%")
                if(params.entryRegister!="")
                    eq("entryRegister", params.entryRegister)
                if(params.exitRegister!="")
                    eq("exitRegister", params.exitRegister)
                if(params.value!="") {
                    Double value = params.value.replace(",",".").toDouble()
                    eq("value", value)
                }
            }

            order("date", "asc")
        }

        registerService.setTotal(registers)
        registerService.setParameters(params)
        
        if (params.search == "Ver registros") {
            respond registers, model: [typeRegister: params.type]
        }
        else {
            redirect action: "cityArticle", params: params
        }
    }

    def search() {
        respond new Register(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    def cityArticle() {
        registerService.setCityArticle(params, registers)

        respond params
    }

    def print() {
        def reportDef = new JasperReportDef(name:'registerList.jrxml',
            fileFormat:JasperExportFormat.PDF_FORMAT, reportData: registers,
            parameters: registerService.parameters)

        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "filename=lista_registros.pdf")
        response.outputStream << jasperService.generateReport(reportDef).toByteArray()
    }

    def printCityArticle() {
        render params
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

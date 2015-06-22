package org.sisgri.people

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.sisgri.authentication.*
import org.sisgri.church.*
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
class NaturalPersonController {

    def springSecurityService
    def jasperService
    def dateService
    def static people = []

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def photoService

    def search(){
        respond new NaturalPerson(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    def resultSearch(){
        params.date_year = ""
        dateService.setDates(params)

        def criteria = NaturalPerson.createCriteria()
        people = criteria.list {
            ne("name","Administrador")
            church{
                if(params.church!=""){
                    like("name", "%"+params.church+"%")
                }
            }
            if(params.date_month != "")
                sqlRestriction "extract( month from birth ) = "+params.date_month
            if(params.type!="")
                like("type", "%"+params.type+"%")
            if(params.name!="")
                like("name", "%"+params.name+"%")
            if(params.situation!=null)
                eq('situation', params.situation.toBoolean())
            if(params.cpf!="")
                like("cpf", "%"+params.cpf+"%")
            if(params.department!="")
                like("department", "%"+params.department+"%")
            if(params.post=="Todos")
                isNotNull("post")
            else if(params.post!="")
                like("post", "%"+params.post+"%")

            order("name", "asc")
        }
        respond people
    }

    def print() {
        def parametros = [churchName: springSecurityService.currentUser.person.church.name]

        def reportDef = new JasperReportDef(name:'peopleList.jrxml',
            fileFormat:JasperExportFormat.PDF_FORMAT, reportData: people, parameters: parametros)

        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "filename=lista_pessoas.pdf")
        response.outputStream << jasperService.generateReport(reportDef).toByteArray()
    }

    def show(NaturalPerson naturalPersonInstance) {
        if(naturalPersonInstance.name == "Administrador")
            render "Essa pessoa não pode ser visualizada!"
        else
            respond naturalPersonInstance
    }

    def showPhoto = {
        long id = Long.parseLong(params.id)
        response.outputStream << photoService.getPhoto(id)
    }

    def create() {
        respond new NaturalPerson(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    @Transactional
    def save(NaturalPerson naturalPersonInstance) {
        if (naturalPersonInstance == null) {
            notFound()
            return
        }

        if (naturalPersonInstance.hasErrors()) {
            respond naturalPersonInstance.errors, view:'create'
            return
        }

        if(params.name == "Administrador") {
            flash.message = "Não é possível colocar o nome Administrador em uma pessoa"
            respond naturalPersonInstance, view:'create'
            return
        }

        naturalPersonInstance.save flush:true
        photoService.upload(naturalPersonInstance, params.photo)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'naturalPersonInstance.label', default: 'NaturalPerson'), naturalPersonInstance.id])
                redirect naturalPersonInstance
            }
            '*' { respond naturalPersonInstance, [status: CREATED] }
        }
    }

    def edit(NaturalPerson naturalPersonInstance) {
        if(naturalPersonInstance.name == "Administrador")
            render "Essa pessoa não pode ser editada!"
        else
            respond naturalPersonInstance, model:[churchList:springSecurityService.currentUser.person.church]
    }

    @Transactional
    def update(NaturalPerson naturalPersonInstance) {
        if (naturalPersonInstance == null || naturalPersonInstance.name == "Administrador") {
            notFound()
            return
        }

        if (naturalPersonInstance.hasErrors()) {
            respond naturalPersonInstance.errors, view:'edit'
            return
        }

        if(params.name == "Administrador") {
            flash.message = "Não é possível colocar o nome Administrador em uma pessoa"
            redirect action:"edit", id:params.id
            return
        }
        else {
            naturalPersonInstance.save flush:true
            photoService.upload(naturalPersonInstance, params.photo)
        
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'NaturalPerson.label', default: 'NaturalPerson'), naturalPersonInstance.id])
                    redirect naturalPersonInstance
                }
                '*'{ respond naturalPersonInstance, [status: OK] }
            }
        }
    }

    @Transactional
    def delete(NaturalPerson naturalPersonInstance) {
        if (naturalPersonInstance == null) {
            notFound()
            return
        }

        if(naturalPersonInstance == NaturalPerson.findByName("Administrador")) {
            flash.message = "O Administrador não pode ser excluído!"
            redirect action:"show", id:naturalPersonInstance.id
            return
        }

        if(naturalPersonInstance.profile != null) {
            def profileInstance = naturalPersonInstance.profile
            naturalPersonInstance.profile.discard()
            ProfileRole.removeAll(profileInstance)
        }
        photoService.delete(naturalPersonInstance.id)
        naturalPersonInstance.delete flush:true

        if(springSecurityService.currentUser == null) {
            redirect controller:"logout", method:"GET"
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NaturalPerson.label', default: 'NaturalPerson'), naturalPersonInstance.id])
                redirect action:"search", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'naturalPersonInstance.label', default: 'NaturalPerson'), params.id])
                redirect action: "search", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    @Transactional
    def removeProfile(NaturalPerson naturalPersonInstance) {
        if (!naturalPersonInstance) {
            notFound()
            return
        }
        if(naturalPersonInstance.id == 1) {
            flash.message = "O Perfil do Administrador não pode ser excluído!"
            redirect action:"show", id:naturalPersonInstance.id
            return
        }

        try {
            def profileInstance = naturalPersonInstance.profile

            if(profileInstance.deleteProfileCurrent(profileInstance)) {
                redirect controller:"logout", method:"GET"
                return
            }

            flash.message = "Perfil Removido"
            redirect(action: "show", id: naturalPersonInstance.id)
        }catch (Exception e) {
            flash.message = "Perfil não pôde ser removido"
            redirect(action: "show", id: naturalPersonInstance.id)            
        }
    }
}
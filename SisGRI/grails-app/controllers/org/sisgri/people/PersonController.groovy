package org.sisgri.people

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.sisgri.authentication.*
import java.text.SimpleDateFormat

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
class PersonController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def photoService

    def search(){
        respond new Person(params)
    }

    def resultSearch(){
        def dateBefore = new Date()
        def dateString ="01/01/2014"

        if(params.birth_year==""){
            params.birth_year = (dateBefore.year + 1900).toString()
        }
        if(params.birth_month!=""){
            dateString = "01"+"/"+params.birth_month+"/"+ params.birth_year
        }

        dateBefore = dateBefore.parse('dd/MM/yyyy', dateString)

        Calendar calendar = Calendar.getInstance()
        calendar.set(Calendar.MONTH, dateBefore.month) 

        def dateAfter = new Date()
        dateAfter.month = dateBefore.month
        dateAfter.year = dateBefore.year
        dateAfter.date = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
        
        def criteria = Person.createCriteria()
        def search = criteria.list {
            church{
                if(params.church!=""){
                    like("name", "%"+params.church+"%")
                }
            }
            if(params.birth_month!="")
                between('birth', dateBefore, dateAfter)
            if(params.type!="")
                like("type", "%"+params.type+"%")
            if(params.name!="")
                like("name", "%"+params.name+"%")
            if(params.situation!=null)
                eq('situation', params.situation.toBoolean())
            if(params.cpf!="")
                like("cpf", "%"+params.cpf+"%")
            if(params.post!="")
                like("post", "%"+params.post+"%")
        }
        respond search
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def showPhoto = {
        long id = Long.parseLong(params.id)
        response.outputStream << photoService.getPhoto(id)
    }

    def create() {
        respond new Person(params)
    }

    @Transactional
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }
        
        convertDates(personInstance)

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'create'
            return
        }

        personInstance.save flush:true
        photoService.upload(personInstance, params.photo)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personInstance.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        respond personInstance
    }

    @Transactional
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        convertDates(personInstance)

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'edit'
            return
        }

        personInstance.save flush:true
        photoService.upload(personInstance, params.photo)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*'{ respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if(personInstance.id == 1) {
            flash.message = "O Administrador não pode ser excluído!"
            redirect action:"show", id:personInstance.id
            return
        }

        if(personInstance.profile != null) {
            def profileInstance = personInstance.profile
            personInstance.profile.discard()
            ProfileRole.removeAll(profileInstance)
        }
        photoService.delete(personInstance.id)
        personInstance.delete flush:true

        if(springSecurityService.currentUser == null) {
            redirect controller:"logout", method:"GET"
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action:"search", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInstance.label', default: 'Person'), params.id])
                redirect action: "search", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    @Transactional
    def removeProfile(Person personInstance) {
        if (!personInstance) {
            notFound()
            return
        }
        if(personInstance.id == 1) {
            flash.message = "O Perfil do Administrador não pode ser excluído!"
            redirect action:"show", id:personInstance.id
            return
        }

        try {
            def profileInstance = personInstance.profile

            if(profileInstance.deleteProfileCurrent(profileInstance)) {
                redirect controller:"logout", method:"GET"
                return
            }

            flash.message = "Perfil Removido"
            redirect(action: "show", id: personInstance.id)
        }catch (Exception e) {
            flash.message = "Perfil não pôde ser removido"
            redirect(action: "show", id: personInstance.id)            
        }
    }

    protected void convertDates(Person personInstance) {
        if(params.date1 != null && params.date1 != "")
            personInstance.birth = new SimpleDateFormat("dd/MM/yyyy").parse(params.date1)
        if(params.date2 != null && params.date2 != "")
            personInstance.baptism = new SimpleDateFormat("dd/MM/yyyy").parse(params.date2)
        if(params.date3 != null && params.date3 != "")
            personInstance.memberSince = new SimpleDateFormat("dd/MM/yyyy").parse(params.date3)
        if(params.date4 != null && params.date4 != "")
            personInstance.conversion = new SimpleDateFormat("dd/MM/yyyy").parse(params.date4)
        if(params.date5 != null && params.date5 != "")
            personInstance.marriageDate = new SimpleDateFormat("dd/MM/yyyy").parse(params.date5)
    }
}
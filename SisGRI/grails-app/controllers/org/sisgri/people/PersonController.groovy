package org.sisgri.people

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.sisgri.authentication.*
import org.sisgri.church.*

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
class PersonController {

    def springSecurityService
    def dateBefore = new Date()
    def dateAfter = new Date()

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def photoService

    def search(){
        respond new Person(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    protected void setDates(Date dateBefore, Date dateAfter) {
        if(params.birth_year != "" && params.birth_month == "") {
            this.dateBefore = this.dateBefore.parse('dd/MM/yyyy', '01/01/'+params.birth_year)
            this.dateAfter = this.dateAfter.parse('dd/MM/yyyy', '31/12/'+params.birth_year)
        }
        else if(params.birth_year != "" && params.birth_month != "") {
            this.dateBefore = this.dateBefore.parse('dd/MM/yyyy', '01/'+params.birth_month+'/'+params.birth_year)

            Calendar calendar = Calendar.getInstance()
            calendar.setTime(this.dateBefore)
            def lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
            this.dateAfter = this.dateAfter.parse('dd/MM/yyyy', lastDay+'/'+params.birth_month+'/'+params.birth_year)
        }
    }

    def resultSearch(){
        setDates(this.dateBefore, this.dateAfter)

        def criteria = Person.createCriteria()
        def search = criteria.list {
            ne("name","Administrador")
            church{
                if(params.church!=""){
                    like("name", "%"+params.church+"%")
                }
            }
            if(params.birth_year != "" || (params.birth_year != "" && params.birth_month != ""))
                between('birth', this.dateBefore, this.dateAfter)
            else if(params.birth_year == "" && params.birth_month != "")
                sqlRestriction "extract( month from birth ) = "+params.birth_month
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
        respond new Person(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    @Transactional
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'create'
            return
        }

        if(params.name == "Administrador") {
            flash.message = "Não é possível colocar o nome Administrador em uma pessoa"
            respond personInstance, view:'create'
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
        respond personInstance, model:[churchList:springSecurityService.currentUser.person.church]
    }

    @Transactional
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'edit'
            return
        }

        if(params.name == "Administrador") {
            flash.message = "Não é possível colocar o nome Administrador em uma pessoa"
            redirect action:"edit", id:params.id
            return
        }
        else {
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
    }

    @Transactional
    def delete(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if(personInstance == Person.findByName("Administrador")) {
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
}
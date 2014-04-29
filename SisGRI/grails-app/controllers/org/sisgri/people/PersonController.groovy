package org.sisgri.people

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.sisgri.authentication.Profile

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
class PersonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def photoService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params), model:[personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
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
        photoService.delete(personInstance)

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def deletePhoto(Person personInstance) {
        photoService.delete(personInstance)
        flash.message = "Foto Excluida"
        redirect action:"edit", id:personInstance.id
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInstance.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
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
        try {
            def profileInstance = personInstance.profile
            personInstance.discard()
            profileInstance.delete(flush: true)

            flash.message = "Perfil Removido"
            redirect(action: "show", id: personInstance.id)
        }catch (Exception e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
            redirect(action: "show", id: personInstance.id)            
        }
    }
}
package org.sisgri.people



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_TREASURER'])
@Transactional(readOnly = true)
class LegalPersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LegalPerson.list(params), model:[legalPersonInstanceCount: LegalPerson.count()]
    }

    def show(LegalPerson legalPersonInstance) {
        respond legalPersonInstance
    }

    def create() {
        respond new LegalPerson(params)
    }

    @Transactional
    def save(LegalPerson legalPersonInstance) {
        if (legalPersonInstance == null) {
            notFound()
            return
        }

        if (legalPersonInstance.hasErrors()) {
            respond legalPersonInstance.errors, view:'create'
            return
        }

        legalPersonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'legalPersonInstance.label', default: 'LegalPerson'), legalPersonInstance.id])
                redirect legalPersonInstance
            }
            '*' { respond legalPersonInstance, [status: CREATED] }
        }
    }

    def edit(LegalPerson legalPersonInstance) {
        respond legalPersonInstance
    }

    @Transactional
    def update(LegalPerson legalPersonInstance) {
        if (legalPersonInstance == null) {
            notFound()
            return
        }

        if (legalPersonInstance.hasErrors()) {
            respond legalPersonInstance.errors, view:'edit'
            return
        }

        legalPersonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LegalPerson.label', default: 'LegalPerson'), legalPersonInstance.id])
                redirect legalPersonInstance
            }
            '*'{ respond legalPersonInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LegalPerson legalPersonInstance) {

        if (legalPersonInstance == null) {
            notFound()
            return
        }

        legalPersonInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LegalPerson.label', default: 'LegalPerson'), legalPersonInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'legalPersonInstance.label', default: 'LegalPerson'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

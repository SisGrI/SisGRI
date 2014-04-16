package org.sisgri.church



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ChurchController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Church.list(params), model:[churchInstanceCount: Church.count()]
    }

    def show(Church churchInstance) {
        respond churchInstance
    }

    def create() {
        respond new Church(params)
    }

    @Transactional
    def save(Church churchInstance) {
        if (churchInstance == null) {
            notFound()
            return
        }

        if (churchInstance.hasErrors()) {
            respond churchInstance.errors, view:'create'
            return
        }

        churchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'churchInstance.label', default: 'Church'), churchInstance.id])
                redirect churchInstance
            }
            '*' { respond churchInstance, [status: CREATED] }
        }
    }

    def edit(Church churchInstance) {
        respond churchInstance
    }

    @Transactional
    def update(Church churchInstance) {
        if (churchInstance == null) {
            notFound()
            return
        }

        if (churchInstance.hasErrors()) {
            respond churchInstance.errors, view:'edit'
            return
        }

        churchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Church.label', default: 'Church'), churchInstance.id])
                redirect churchInstance
            }
            '*'{ respond churchInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Church churchInstance) {

        if (churchInstance == null) {
            notFound()
            return
        }

        churchInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Church.label', default: 'Church'), churchInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'churchInstance.label', default: 'Church'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

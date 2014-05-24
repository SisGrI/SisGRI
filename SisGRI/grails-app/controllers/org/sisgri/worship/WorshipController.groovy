package org.sisgri.worship



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
@Transactional(readOnly = true)
class WorshipController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Worship.list(params), model:[worshipInstanceCount: Worship.count()]
    }

    def search() {
        respond new Worship(params)
    }

    def resultSearch() {
        render params
    }

    def show(Worship worshipInstance) {
        respond worshipInstance
    }

    def create() {
        respond new Worship(params)
    }

    @Transactional
    def save(Worship worshipInstance) {
        if (worshipInstance == null) {
            notFound()
            return
        }

        if (worshipInstance.hasErrors()) {
            respond worshipInstance.errors, view:'create'
            return
        }

        worshipInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'worshipInstance.label', default: 'Worship'), worshipInstance.id])
                redirect worshipInstance
            }
            '*' { respond worshipInstance, [status: CREATED] }
        }
    }

    def edit(Worship worshipInstance) {
        respond worshipInstance
    }

    @Transactional
    def update(Worship worshipInstance) {
        if (worshipInstance == null) {
            notFound()
            return
        }

        if (worshipInstance.hasErrors()) {
            respond worshipInstance.errors, view:'edit'
            return
        }

        worshipInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Worship.label', default: 'Worship'), worshipInstance.id])
                redirect worshipInstance
            }
            '*'{ respond worshipInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Worship worshipInstance) {

        if (worshipInstance == null) {
            notFound()
            return
        }

        worshipInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Worship.label', default: 'Worship'), worshipInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'worshipInstance.label', default: 'Worship'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package org.sisgri.church



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
@Transactional(readOnly = true)
class SubHeadquarterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SubHeadquarter.list(params), model:[subHeadquarterInstanceCount: SubHeadquarter.count()]
    }

    def show(SubHeadquarter subHeadquarterInstance) {
        respond subHeadquarterInstance
    }

    def create() {
        respond new SubHeadquarter(params)
    }

    @Transactional
    def save(SubHeadquarter subHeadquarterInstance) {
        if (subHeadquarterInstance == null) {
            notFound()
            return
        }

        if (subHeadquarterInstance.hasErrors()) {
            respond subHeadquarterInstance.errors, view:'create'
            return
        }

        subHeadquarterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subHeadquarterInstance.label', default: 'SubHeadquarter'), subHeadquarterInstance.id])
                redirect subHeadquarterInstance
            }
            '*' { respond subHeadquarterInstance, [status: CREATED] }
        }
    }

    def edit(SubHeadquarter subHeadquarterInstance) {
        respond subHeadquarterInstance
    }

    @Transactional
    def update(SubHeadquarter subHeadquarterInstance) {
        if (subHeadquarterInstance == null) {
            notFound()
            return
        }

        if (subHeadquarterInstance.hasErrors()) {
            respond subHeadquarterInstance.errors, view:'edit'
            return
        }

        subHeadquarterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SubHeadquarter.label', default: 'SubHeadquarter'), subHeadquarterInstance.id])
                redirect subHeadquarterInstance
            }
            '*'{ respond subHeadquarterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SubHeadquarter subHeadquarterInstance) {

        if (subHeadquarterInstance == null) {
            notFound()
            return
        }

        subHeadquarterInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SubHeadquarter.label', default: 'SubHeadquarter'), subHeadquarterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subHeadquarterInstance.label', default: 'SubHeadquarter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package org.sisgri.church



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
@Transactional(readOnly = true)
class HeadquarterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Headquarter.list(params), model:[headquarterInstanceCount: Headquarter.count()]
    }

    def show(Headquarter headquarterInstance) {
        respond headquarterInstance
    }

    def create() {
        if(Headquarter.count() == 0) {
            respond new Headquarter(params)
        }
        else {
            flash.message = "Já existe uma Igreja Sede cadastrada!"
            redirect action:"index"
        }
    }

    @Transactional
    def save(Headquarter headquarterInstance) {
        if (!validateRegister(headquarterInstance))
            return

        if (headquarterInstance == null) {
            notFound()
            return
        }   

        if (headquarterInstance.hasErrors()) {
            respond headquarterInstance.errors, view:'create'
            return
        }

        headquarterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'headquarterInstance.label', default: 'Headquarter'), headquarterInstance.id])
                redirect headquarterInstance
            }
            '*' { respond headquarterInstance, [status: CREATED] }
        }
    }

    def edit(Headquarter headquarterInstance) {
        respond headquarterInstance
    }

    @Transactional
    def update(Headquarter headquarterInstance) {
        if (headquarterInstance == null) {
            notFound()
            return
        }

        if (headquarterInstance.hasErrors()) {
            respond headquarterInstance.errors, view:'edit'
            return
        }

        headquarterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Headquarter.label', default: 'Headquarter'), headquarterInstance.id])
                redirect headquarterInstance
            }
            '*'{ respond headquarterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Headquarter headquarterInstance) {

        if (headquarterInstance == null) {
            notFound()
            return
        }

        headquarterInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Headquarter.label', default: 'Headquarter'), headquarterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'headquarterInstance.label', default: 'Headquarter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected boolean validateRegister(Headquarter headquarterInstance) {
        if(headquarterInstance.count()) {
            flash.message = "Não pode haver mais de uma Igreja Sede cadastrada!"
            redirect action:"index", method:"GET"
            return false
        }

        return true
    }
}

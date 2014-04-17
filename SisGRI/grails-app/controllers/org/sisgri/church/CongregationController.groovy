package org.sisgri.church



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
@Transactional(readOnly = true)
class CongregationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Congregation.list(params), model:[congregationInstanceCount: Congregation.count()]
    }

    def show(Congregation congregationInstance) {
        respond congregationInstance
    }

    def create() {
        respond new Congregation(params)
    }

    @Transactional
    def save(Congregation congregationInstance) {
        if (congregationInstance == null) {
            notFound()
            return
        }

        if (congregationInstance.hasErrors()) {
            respond congregationInstance.errors, view:'create'
            return
        }

        congregationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'congregationInstance.label', default: 'Congregation'), congregationInstance.id])
                redirect congregationInstance
            }
            '*' { respond congregationInstance, [status: CREATED] }
        }
    }

    def edit(Congregation congregationInstance) {
        respond congregationInstance
    }

    @Transactional
    def update(Congregation congregationInstance) {
        if (congregationInstance == null) {
            notFound()
            return
        }

        if (congregationInstance.hasErrors()) {
            respond congregationInstance.errors, view:'edit'
            return
        }

        congregationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Congregation.label', default: 'Congregation'), congregationInstance.id])
                redirect congregationInstance
            }
            '*'{ respond congregationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Congregation congregationInstance) {

        if (congregationInstance == null) {
            notFound()
            return
        }

        congregationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Congregation.label', default: 'Congregation'), congregationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'congregationInstance.label', default: 'Congregation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

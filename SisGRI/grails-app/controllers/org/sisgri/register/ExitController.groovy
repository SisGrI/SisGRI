package org.sisgri.register

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ExitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Exit.list(params), model:[exitInstanceCount: Exit.count()]
    }

    def show(Exit exitInstance) {
        respond exitInstance
    }

    def create() {
        respond new Exit(params)
    }

    @Transactional
    def save(Exit exitInstance) {
        if (exitInstance == null) {
            notFound()
            return
        }

        if (exitInstance.hasErrors()) {
            respond exitInstance.errors, view:'create'
            return
        }

        def dateBefore = new Date()

        dateBefore.year = exitInstance.date.year
        dateBefore.month = exitInstance.date.month
        dateBefore.date = 1
        dateBefore.hours = 00
        dateBefore.minutes = 00
        dateBefore.seconds = 00

        Calendar calendar = Calendar.getInstance();
        def dateAfter = new Date()
        dateAfter.year = dateBefore.year
        dateAfter.month = dateBefore.month
        dateAfter.date = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
        dateAfter.hours = 23
        dateAfter.minutes = 59
        dateAfter.seconds = 59

        def criteria = Newsletter.createCriteria()
        def newsletterSearch = criteria.list {
            between('date', dateBefore, dateAfter)
        }
        Newsletter newsletter = null

        for(Newsletter newsletterIterator : newsletterSearch){
            if(newsletterIterator.church.class == exitInstance.church.class){
                newsletter = newsletterIterator
                break
            }
        }
        if(newsletter==null){
            newsletter = new Newsletter(church:exitInstance.church)       
        }

        newsletter.date = dateBefore
        newsletter.addToRegistersExit(exitInstance)
        newsletter.save flush:true
        exitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'exitInstance.label', default: 'Exit'), exitInstance.id])
                redirect exitInstance
            }
            '*' { respond exitInstance, [status: CREATED] }
        }
    }

    def edit(Exit exitInstance) {
        respond exitInstance
    }

    @Transactional
    def update(Exit exitInstance) {
        if (exitInstance == null) {
            notFound()
            return
        }

        if (exitInstance.hasErrors()) {
            respond exitInstance.errors, view:'edit'
            return
        }

        exitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Exit.label', default: 'Exit'), exitInstance.id])
                redirect exitInstance
            }
            '*'{ respond exitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Exit exitInstance) {

        if (exitInstance == null) {
            notFound()
            return
        }

        exitInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Exit.label', default: 'Exit'), exitInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'exitInstance.label', default: 'Exit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

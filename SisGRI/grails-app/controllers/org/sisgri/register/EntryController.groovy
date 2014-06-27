package org.sisgri.register



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class EntryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Entry.list(params), model:[entryInstanceCount: Entry.count()]
    }

    def show(Entry entryInstance) {
        respond entryInstance
    }

    def create() {
        respond new Entry(params)
    }

    @Transactional
    def save(Entry entryInstance) {
        if (entryInstance == null) {
            notFound()
            return
        }

        if (entryInstance.hasErrors()) {
            respond entryInstance.errors, view:'create'
            return
        }
        
        def dateBefore = new Date()

        dateBefore.year = entryInstance.date.year
        dateBefore.month = entryInstance.date.month
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
            if(newsletterIterator.church.class == entryInstance.church.class){
                newsletter = newsletterIterator
                break
            }
        }
        if(newsletter==null){
            newsletter = new Newsletter(church:entryInstance.church)       
        }
    

        newsletter.date = dateBefore
        newsletter.addToRegistersEntry(entryInstance)
        newsletter.save flush:true
        entryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'entryInstance.label', default: 'Entry'), entryInstance.id])
                redirect entryInstance
            }
            '*' { respond entryInstance, [status: CREATED] }
        }
    }

    def edit(Entry entryInstance) {
        respond entryInstance
    }

    @Transactional
    def update(Entry entryInstance) {
        if (entryInstance == null) {
            notFound()
            return
        }

        if (entryInstance.hasErrors()) {
            respond entryInstance.errors, view:'edit'
            return
        }

        entryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Entry.label', default: 'Entry'), entryInstance.id])
                redirect entryInstance
            }
            '*'{ respond entryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Entry entryInstance) {

        if (entryInstance == null) {
            notFound()
            return
        }

        entryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Entry.label', default: 'Entry'), entryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'entryInstance.label', default: 'Entry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

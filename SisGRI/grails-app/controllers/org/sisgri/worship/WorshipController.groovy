package org.sisgri.worship



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
@Transactional(readOnly = true)
class WorshipController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def search() {
        respond new Worship(params)
    }

    def resultSearch() {
        def dateBefore = new Date()
        def dateString ="01/01/2014"

        if(params.date_year==""){
            params.date_year = (dateBefore.year + 1900).toString()
        }
        if(params.date_month!=""){
            dateString = "01"+"/"+params.date_month+"/"+ params.date_year
        }

        dateBefore = dateBefore.parse('dd/MM/yyyy', dateString)

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, dateBefore.month); 

        def dateAfter = new Date()
        dateAfter.month = dateBefore.month
        dateAfter.year = dateBefore.year
        dateAfter.date = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)

        def criteria = Worship.createCriteria()
        def search = criteria.list {
            church{
                if(params.church!=""){
                    like("name", "%"+params.church+"%")
                }
            }
            ruling{
                if(params.ruling!="")
                    like("name", "%"+params.ruling+"%")
            }
            prelector{
                if(params.prelector!="")
                    like("name", "%"+params.prelector+"%")
            }
            if(params.date_month!="")
                between('date', dateBefore, dateAfter)

            if(params.type!="")
                eq("type", params.type)
        }
        respond search, model:[worshipInstanceCount: Worship.count()]
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
                redirect action:"search", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'worshipInstance.label', default: 'Worship'), params.id])
                redirect action: "search", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

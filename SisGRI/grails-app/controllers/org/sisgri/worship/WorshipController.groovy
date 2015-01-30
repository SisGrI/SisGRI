package org.sisgri.worship


import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
@Transactional(readOnly = true)
class WorshipController {

    def springSecurityService
    def jasperService
    def dateBefore = new Date()
    def dateAfter = new Date()
    def static worships = []

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def search() {
        respond new Worship(params), model:[churchList:springSecurityService.currentUser.person.church]
    }

    protected void setDates(Date dateBefore, Date dateAfter) {
        if(params.date_year != "" && params.date_month == "") {
            this.dateBefore = this.dateBefore.parse('dd/MM/yyyy', '01/01/'+params.date_year)
            this.dateAfter = this.dateAfter.parse('dd/MM/yyyy', '31/12/'+params.date_year)
        }
        else if(params.date_year != "" && params.date_month != "") {
            this.dateBefore = this.dateBefore.parse('dd/MM/yyyy', '01/'+params.date_month+'/'+params.date_year)

            Calendar calendar = Calendar.getInstance()
            calendar.setTime(this.dateBefore)
            def lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
            this.dateAfter = this.dateAfter.parse('dd/MM/yyyy', lastDay+'/'+params.date_month+'/'+params.date_year)
        }
    }

    def resultSearch() {
        setDates(this.dateBefore, this.dateAfter)

        def criteria = Worship.createCriteria()
        worships = criteria.list {
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
            if(params.date_year != "" || (params.date_year != "" && params.date_month != ""))
                between('date', this.dateBefore, this.dateAfter)
            else if(params.date_year == "" && params.date_month != "")
                sqlRestriction "extract( month from date ) = "+params.date_month

            if(params.type!="")
                eq("type", params.type)
        }
        respond worships
    }

    def print() {
        def reportDef = new JasperReportDef(name:'worship_list.jrxml',
            fileFormat:JasperExportFormat.PDF_FORMAT, reportData: worships)

        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "filename=lista_cultos.pdf")
        response.outputStream << jasperService.generateReport(reportDef).toByteArray()
    }

    def show(Worship worshipInstance) {
        respond worshipInstance
    }

    def create() {
        respond new Worship(params), model:[churchList:springSecurityService.currentUser.person.church]
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
        respond worshipInstance, model:[churchList:springSecurityService.currentUser.person.church]
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

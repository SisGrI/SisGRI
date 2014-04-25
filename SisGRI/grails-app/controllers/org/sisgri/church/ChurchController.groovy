package org.sisgri.church


import org.sisgri.worship.Worship
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SECRETARY'])
@Transactional(readOnly = true)
class ChurchController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Church.list(params), model:[churchInstanceCount: Church.count()]
    }

    def show(Worship worshipInstance) {
        if(worshipInstance.church.instanceOf(Headquarter))
            showHeadquarter(worshipInstance.church)
        else if(worshipInstance.church.instanceOf(SubHeadquarter))
            showSubHeadquarter(worshipInstance.church)
        else
            showCongregation(worshipInstance.church)
    }

    def showHeadquarter(Headquarter headquarterInstance) {
        redirect controller:"headquarter", action:"show", id:headquarterInstance.id
    }

    def showSubHeadquarter(SubHeadquarter subHeadquarterInstance) {
        redirect controller:"subHeadquarter", action:"show", id:subHeadquarterInstance.id
    }

    def showCongregation(Congregation congregationInstance) {
        redirect controller:"congregation", action:"show", id:congregationInstance.id
    }
}

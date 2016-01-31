package org.sisgri.church

import grails.transaction.Transactional
import grails.plugin.springsecurity.SpringSecurityService

@Transactional
class ChurchService {

	SpringSecurityService springSecurityService

    def churchList() {
    	if (springSecurityService.currentUser.person.church.type == "Sede") {
    		return Church.list()
    	}
    	else {
    		return [springSecurityService.currentUser.person.church]
    	}
    }
}

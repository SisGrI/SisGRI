package org.sisgri.authentication


import org.sisgri.people.NaturalPerson
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ProfileController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def criteria = Profile.createCriteria()
        def list = criteria.list {
            ne("username","admin")
        }
        respond list, model:[profileInstanceCount: Profile.count()]
    }

    @Secured(['isAuthenticated()'])
    def showCurrentProfile() {
        redirect action:"show", id:springSecurityService.currentUser.id
    }

    @Secured(['isAuthenticated()'])
    def show(Profile profileInstance) {
        if (profileInstance != springSecurityService.currentUser && 
            SpringSecurityUtils.ifNotGranted('ROLE_ADMIN')) {
            render "Desculpe, você não possui autorização para acessar esta página."
        }
        else
            respond profileInstance
    }

    def create() {
        def profileInstance = new Profile(params)
        profileInstance.person = NaturalPerson.get(params.id)

        respond profileInstance
    }

    @Transactional
    def save(Profile profileInstance) {
        if (profileInstance == null) {
            notFound()
            return
        }

        if (profileInstance.hasErrors()) {
            respond profileInstance.errors, view:'create'
            return
        }

        if (profileInstance.person.email == null) {
            flash.message = "Não se pode criar um perfil para uma pessoa que não tenha um email válido!"
            redirect action:"create", id:profileInstance.person.id
            return
        }

        profileInstance.save(flush:true)

        connectRole(profileInstance, params.type)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'profileInstance.label', default: 'Profile'), profileInstance.id])
                redirect profileInstance
            }
            '*' { respond profileInstance, [status: CREATED] }
        }
    }

    @Secured(['isAuthenticated()'])
    def edit(Profile profileInstance) {
        if (profileInstance != springSecurityService.currentUser && 
            SpringSecurityUtils.ifNotGranted('ROLE_ADMIN')) {
            render "Desculpe, você não possui autorização para acessar esta página."
        }
        else if(profileInstance.username == "admin") {
            flash.message = "O Perfil do Administrador não pode ser editado!"
            redirect action:"show", id:profileInstance.id
            return
        }
        else
            respond profileInstance
    }

    @Secured(['isAuthenticated()'])
    @Transactional
    def update(Profile profileInstance) {
        if (profileInstance == null) {
            notFound()
            return
        }

        if (profileInstance.hasErrors()) {
            respond profileInstance.errors, view:'edit'
            return
        }

        if (profileInstance != springSecurityService.currentUser && 
            SpringSecurityUtils.ifNotGranted('ROLE_ADMIN')) {
            render "Desculpe, você não possui autorização para acessar esta página."
            return
        }

        updatePassword(profileInstance, params.newPassword)
        profileInstance.save flush:true

        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
            ProfileRole.removeAll(profileInstance)
            connectRole(profileInstance, params.type)
        }

        springSecurityService.reauthenticate springSecurityService.currentUser.username

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Profile.label', default: 'Profile'), profileInstance.id])
                redirect profileInstance
            }
            '*'{ respond profileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Profile profileInstance) {
        if (profileInstance == null) {
            notFound()
            return
        }
        if(profileInstance.username == "admin") {
            flash.message = "O Perfil do Administrador não pode ser excluído!"
            redirect action:"show", id:profileInstance.id
            return
        }

        if(profileInstance.deleteProfileCurrent(profileInstance)) {
            redirect controller:"logout", method:"GET"
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profile.label', default: 'Profile'), profileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profileInstance.label', default: 'Profile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected void connectRole(Profile profileInstance, String type) {
        def roleInstance;

        if(type.equals('Administrador')) {
            roleInstance = Role.findByAuthority("ROLE_ADMIN")
        }
        else if(type.equals('Secretário')) {
            roleInstance = Role.findByAuthority("ROLE_SECRETARY")
        }
        else if(type.equals('Tesoureiro')) {
            roleInstance = Role.findByAuthority("ROLE_TREASURER")
        }

        ProfileRole.create(profileInstance, roleInstance, true)
    }

    protected void updatePassword(Profile profileInstance, String newPassword) {
        if(params.newPassword != "")
            profileInstance.password = newPassword
    }
}

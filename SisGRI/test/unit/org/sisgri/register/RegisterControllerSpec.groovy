package org.sisgri.register



import grails.test.mixin.*
import spock.lang.*

@TestFor(RegisterController)
@Mock(Register)
class RegisterControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.registerInstanceList
            model.registerInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.registerInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def register = new Register()
            register.validate()
            controller.save(register)

        then:"The create view is rendered again with the correct model"
            model.registerInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            register = new Register(params)

            controller.save(register)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/register/show/1'
            controller.flash.message != null
            Register.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def register = new Register(params)
            controller.show(register)

        then:"A model is populated containing the domain instance"
            model.registerInstance == register
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def register = new Register(params)
            controller.edit(register)

        then:"A model is populated containing the domain instance"
            model.registerInstance == register
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/register/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def register = new Register()
            register.validate()
            controller.update(register)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.registerInstance == register

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            register = new Register(params).save(flush: true)
            controller.update(register)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/register/show/$register.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/register/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def register = new Register(params).save(flush: true)

        then:"It exists"
            Register.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(register)

        then:"The instance is deleted"
            Register.count() == 0
            response.redirectedUrl == '/register/index'
            flash.message != null
    }
}

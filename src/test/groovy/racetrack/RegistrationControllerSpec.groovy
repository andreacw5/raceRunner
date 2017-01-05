package racetrack

import grails.test.mixin.*
import spock.lang.*

@TestFor(RegistrationController)
@Mock(Registration)
class RegistrationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.registrationList
            model.registrationCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.registration!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def registration = new Registration()
            registration.validate()
            controller.save(registration)

        then:"The create view is rendered again with the correct model"
            model.registration!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            registration = new Registration(params)

            controller.save(registration)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/registration/show/1'
            controller.flash.message != null
            Registration.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def registration = new Registration(params)
            controller.show(registration)

        then:"A model is populated containing the domain instance"
            model.registration == registration
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def registration = new Registration(params)
            controller.edit(registration)

        then:"A model is populated containing the domain instance"
            model.registration == registration
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/registration/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def registration = new Registration()
            registration.validate()
            controller.update(registration)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.registration == registration

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            registration = new Registration(params).save(flush: true)
            controller.update(registration)

        then:"A redirect is issued to the show action"
            registration != null
            response.redirectedUrl == "/registration/show/$registration.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/registration/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def registration = new Registration(params).save(flush: true)

        then:"It exists"
            Registration.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(registration)

        then:"The instance is deleted"
            Registration.count() == 0
            response.redirectedUrl == '/registration/index'
            flash.message != null
    }
}

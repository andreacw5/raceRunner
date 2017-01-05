package racetrack

import org.springframework.validation.BindingResult

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegistrationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Registration.list(params), model: [registrationCount: Registration.count()]
    }

    def show(Registration registration) {
        respond registration
    }

    def register = {
        def registration = new Registration()
        registration.properties = params
        if (request.method == 'GET') {
            def race = Race.get(params.id)
            return ['registration': registration, 'race': race]
        } else {
            if (registration.save()) {
                redirect(controller:'race',action:'index')
            } else {
                def race = Race.get(params['race.id'])
                return
                ['registration': registration, 'race': race]
            }
        }


    }


    def create() {
        respond new Registration(params)
    }

    @Transactional
    def save(Registration registration) {
        if (registration == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (registration.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond registration.errors, view: 'create'
            return
        }

        registration.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registration.label', default: 'Registration'), registration.id])
                redirect registration
            }
            '*' { respond registration, [status: CREATED] }
        }
    }

    def edit(Registration registration) {
        respond registration
    }

    @Transactional
    def update(Registration registration) {
        if (registration == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (registration.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond registration.errors, view: 'edit'
            return
        }

        registration.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'registration.label', default: 'Registration'), registration.id])
                redirect registration
            }
            '*' { respond registration, [status: OK] }
        }
    }

    @Transactional
    def delete(Registration registration) {

        if (registration == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        registration.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), registration.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

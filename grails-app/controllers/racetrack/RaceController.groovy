package racetrack

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class RaceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 13, 100)
        respond Race.list(params), model: [raceCount: Race.count()]
    }

    def show(Race race) {
        respond race
    }

    def create() {
        respond new Race(params)
    }

    @Transactional
    def save(Race race) {
        if (race == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (race.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond race.errors, view: 'create'
            return
        }

        race.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'race.label', default: 'Race'), race.id])
                redirect race
            }
            '*' { respond race, [status: CREATED] }
        }
    }

    def edit(Race race) {
        respond race
    }

    @Transactional
    def update(Race race) {
        if (race == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (race.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond race.errors, view: 'edit'
            return
        }

        race.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'race.label', default: 'Race'), race.id])
                redirect race
            }
            '*' { respond race, [status: OK] }
        }
    }

    def search = {
        if (request.method == 'POST') {
            render view: 'index', model: [raceList: Race.findAllByRaceNameLikeAndCityLike(
                    '%' + params.raceName + '%', '%' + params.city + '%')]

        }
    }

    @Transactional
    def delete(Race race) {

        if (race == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        race.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'race.label', default: 'Race'), race.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

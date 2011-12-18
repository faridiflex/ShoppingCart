package com.reb.info

class PersonInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personInfoInstanceList: PersonInfo.list(params), personInfoInstanceTotal: PersonInfo.count()]
    }

    def create = {
        def personInfoInstance = new PersonInfo()
        personInfoInstance.properties = params
        return [personInfoInstance: personInfoInstance]
    }

    def save = {
        def personInfoInstance = new PersonInfo(params)
        if (personInfoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), personInfoInstance.id])}"
            redirect(action: "show", id: personInfoInstance.id)
        }
        else {
            render(view: "create", model: [personInfoInstance: personInfoInstance])
        }
    }

    def show = {
        def personInfoInstance = PersonInfo.get(params.id)
        if (!personInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personInfoInstance: personInfoInstance]
        }
    }

    def edit = {
        def personInfoInstance = PersonInfo.get(params.id)
        if (!personInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personInfoInstance: personInfoInstance]
        }
    }

    def update = {
        def personInfoInstance = PersonInfo.get(params.id)
        if (personInfoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personInfoInstance.version > version) {
                    
                    personInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'personInfo.label', default: 'PersonInfo')] as Object[], "Another user has updated this PersonInfo while you were editing")
                    render(view: "edit", model: [personInfoInstance: personInfoInstance])
                    return
                }
            }
            personInfoInstance.properties = params
            if (!personInfoInstance.hasErrors() && personInfoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), personInfoInstance.id])}"
                redirect(action: "show", id: personInfoInstance.id)
            }
            else {
                render(view: "edit", model: [personInfoInstance: personInfoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def personInfoInstance = PersonInfo.get(params.id)
        if (personInfoInstance) {
            try {
                personInfoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), params.id])}"
            redirect(action: "list")
        }
    }
}

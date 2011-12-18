package com.reb.info

class RegistrationInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [registrationInfoInstanceList: RegistrationInfo.list(params), registrationInfoInstanceTotal: RegistrationInfo.count()]
    }

    def create = {
        def registrationInfoInstance = new RegistrationInfo()
        registrationInfoInstance.properties = params
        return [registrationInfoInstance: registrationInfoInstance]
    }

    def save = {
        def registrationInfoInstance = new RegistrationInfo(params)
        if (registrationInfoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), registrationInfoInstance.id])}"
            redirect(action: "show", id: registrationInfoInstance.id)
        }
        else {
            render(view: "create", model: [registrationInfoInstance: registrationInfoInstance])
        }
    }

    def show = {
        def registrationInfoInstance = RegistrationInfo.get(params.id)
        if (!registrationInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [registrationInfoInstance: registrationInfoInstance]
        }
    }

    def edit = {
        def registrationInfoInstance = RegistrationInfo.get(params.id)
        if (!registrationInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [registrationInfoInstance: registrationInfoInstance]
        }
    }

    def update = {
        def registrationInfoInstance = RegistrationInfo.get(params.id)
        if (registrationInfoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (registrationInfoInstance.version > version) {
                    
                    registrationInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'registrationInfo.label', default: 'RegistrationInfo')] as Object[], "Another user has updated this RegistrationInfo while you were editing")
                    render(view: "edit", model: [registrationInfoInstance: registrationInfoInstance])
                    return
                }
            }
            registrationInfoInstance.properties = params
            if (!registrationInfoInstance.hasErrors() && registrationInfoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), registrationInfoInstance.id])}"
                redirect(action: "show", id: registrationInfoInstance.id)
            }
            else {
                render(view: "edit", model: [registrationInfoInstance: registrationInfoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def registrationInfoInstance = RegistrationInfo.get(params.id)
        if (registrationInfoInstance) {
            try {
                registrationInfoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
            redirect(action: "list")
        }
    }
}

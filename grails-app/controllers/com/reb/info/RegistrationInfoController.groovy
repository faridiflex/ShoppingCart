package com.reb.info

class RegistrationInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [registrationInfoList: RegistrationInfo.list(params), registrationInfoTotal: RegistrationInfo.count()]
    }

    def create = {
        def registrationInfo = new RegistrationInfo()
        registrationInfo.properties = params
        return [registrationInfo: registrationInfo]
    }

    def save = {
        def registrationInfo = new RegistrationInfo(params)
        if (registrationInfo.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), registrationInfo.id])}"
            redirect(action: "show", id: registrationInfo.id)
        }
        else {
            render(view: "create", model: [registrationInfo: registrationInfo])
        }
    }

    def show = {
        def registrationInfo = RegistrationInfo.get(params.id)
        if (!registrationInfo) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [registrationInfo: registrationInfo]
        }
    }

    def edit = {
        def registrationInfo = RegistrationInfo.get(params.id)
        if (!registrationInfo) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [registrationInfo: registrationInfo]
        }
    }

    def update = {
        def registrationInfo = RegistrationInfo.get(params.id)
        if (registrationInfo) {
            if (params.version) {
                def version = params.version.toLong()
                if (registrationInfo.version > version) {
                    
                    registrationInfo.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'registrationInfo.label', default: 'RegistrationInfo')] as Object[], "Another user has updated this RegistrationInfo while you were editing")
                    render(view: "edit", model: [registrationInfo: registrationInfo])
                    return
                }
            }
            registrationInfo.properties = params
            if (!registrationInfo.hasErrors() && registrationInfo.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), registrationInfo.id])}"
                redirect(action: "show", id: registrationInfo.id)
            }
            else {
                render(view: "edit", model: [registrationInfo: registrationInfo])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registrationInfo.label', default: 'RegistrationInfo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def registrationInfo = RegistrationInfo.get(params.id)
        if (registrationInfo) {
            try {
                registrationInfo.delete(flush: true)
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

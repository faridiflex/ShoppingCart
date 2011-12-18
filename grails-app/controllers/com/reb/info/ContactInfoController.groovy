package com.reb.info

class ContactInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactInfoList: ContactInfo.list(params), contactInfoTotal: ContactInfo.count()]
    }

    def create = {
        def contactInfo = new ContactInfo()
        contactInfo.properties = params
        return [contactInfo: contactInfo]
    }

    def save = {
        def contactInfo = new ContactInfo(params)
        if (contactInfo.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), contactInfo.id])}"
            redirect(action: "show", id: contactInfo.id)
        }
        else {
            render(view: "create", model: [contactInfo: contactInfo])
        }
    }

    def show = {
        def contactInfo = ContactInfo.get(params.id)
        if (!contactInfo) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactInfo: contactInfo]
        }
    }

    def edit = {
        def contactInfo = ContactInfo.get(params.id)
        if (!contactInfo) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactInfo: contactInfo]
        }
    }

    def update = {
        def contactInfo = ContactInfo.get(params.id)
        if (contactInfo) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactInfo.version > version) {
                    
                    contactInfo.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactInfo.label', default: 'ContactInfo')] as Object[], "Another user has updated this ContactInfo while you were editing")
                    render(view: "edit", model: [contactInfo: contactInfo])
                    return
                }
            }
            contactInfo.properties = params
            if (!contactInfo.hasErrors() && contactInfo.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), contactInfo.id])}"
                redirect(action: "show", id: contactInfo.id)
            }
            else {
                render(view: "edit", model: [contactInfo: contactInfo])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactInfo = ContactInfo.get(params.id)
        if (contactInfo) {
            try {
                contactInfo.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])}"
            redirect(action: "list")
        }
    }
}

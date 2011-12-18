package com.reb.profile

class BuyerProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buyerProfileInstanceList: BuyerProfile.list(params), buyerProfileInstanceTotal: BuyerProfile.count()]
    }

    def create = {
        def buyerProfileInstance = new BuyerProfile()
        buyerProfileInstance.properties = params
        return [buyerProfileInstance: buyerProfileInstance]
    }

    def save = {
        def buyerProfileInstance = new BuyerProfile(params)
        if (buyerProfileInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), buyerProfileInstance.id])}"
            redirect(action: "show", id: buyerProfileInstance.id)
        }
        else {
            render(view: "create", model: [buyerProfileInstance: buyerProfileInstance])
        }
    }

    def show = {
        def buyerProfileInstance = BuyerProfile.get(params.id)
        if (!buyerProfileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
        else {
            [buyerProfileInstance: buyerProfileInstance]
        }
    }

    def edit = {
        def buyerProfileInstance = BuyerProfile.get(params.id)
        if (!buyerProfileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [buyerProfileInstance: buyerProfileInstance]
        }
    }

    def update = {
        def buyerProfileInstance = BuyerProfile.get(params.id)
        if (buyerProfileInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (buyerProfileInstance.version > version) {
                    
                    buyerProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'buyerProfile.label', default: 'BuyerProfile')] as Object[], "Another user has updated this BuyerProfile while you were editing")
                    render(view: "edit", model: [buyerProfileInstance: buyerProfileInstance])
                    return
                }
            }
            buyerProfileInstance.properties = params
            if (!buyerProfileInstance.hasErrors() && buyerProfileInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), buyerProfileInstance.id])}"
                redirect(action: "show", id: buyerProfileInstance.id)
            }
            else {
                render(view: "edit", model: [buyerProfileInstance: buyerProfileInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def buyerProfileInstance = BuyerProfile.get(params.id)
        if (buyerProfileInstance) {
            try {
                buyerProfileInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
    }
}

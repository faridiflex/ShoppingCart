package com.reb

import com.reb.info.ContactInfo

class BuyerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buyerInstanceList: Buyer.list(params), buyerInstanceTotal: Buyer.count()]
    }

    def create = {
        def buyerInstance = new Buyer()
        buyerInstance.properties = params
        return [buyerInstance: buyerInstance]
    }

    def save = {
//        def contactInfo = new ContactInfo(params.contactInfo)
        def buyerInstance = new Buyer(params)
        if (buyerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyerInstance.id])}"
            redirect(action: "show", id: buyerInstance.id)
        }
        else {
            render(view: "create", model: [buyerInstance: buyerInstance])
        }
    }

    def show = {
        def buyerInstance = Buyer.get(params.id)
        if (!buyerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
            redirect(action: "list")
        }
        else {
            [buyerInstance: buyerInstance]
        }
    }

    def edit = {
        def buyerInstance = Buyer.get(params.id)
        if (!buyerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [buyerInstance: buyerInstance]
        }
    }

    def update = {
        def buyerInstance = Buyer.get(params.id)
        if (buyerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (buyerInstance.version > version) {
                    
                    buyerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'buyer.label', default: 'Buyer')] as Object[], "Another user has updated this Buyer while you were editing")
                    render(view: "edit", model: [buyerInstance: buyerInstance])
                    return
                }
            }
            buyerInstance.properties = params
            if (!buyerInstance.hasErrors() && buyerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyerInstance.id])}"
                redirect(action: "show", id: buyerInstance.id)
            }
            else {
                render(view: "edit", model: [buyerInstance: buyerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def buyerInstance = Buyer.get(params.id)
        if (buyerInstance) {
            try {
                buyerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
            redirect(action: "list")
        }
    }
}

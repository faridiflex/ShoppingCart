package com.reb

import org.springframework.dao.DataIntegrityViolationException

class BuyerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buyerInstanceList: Buyer.list(params), buyerInstanceTotal: Buyer.count()]
    }

    def create() {
        [buyerInstance: new Buyer(params)]
    }

    def save() {
        def buyerInstance = new Buyer(params)
        if (!buyerInstance.save(flush: true)) {
            render(view: "create", model: [buyerInstance: buyerInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyerInstance.id])
        redirect(action: "show", id: buyerInstance.id)
    }

    def show() {
        def buyerInstance = Buyer.get(params.id)
        if (!buyerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        [buyerInstance: buyerInstance]
    }

    def edit() {
        def buyerInstance = Buyer.get(params.id)
        if (!buyerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        [buyerInstance: buyerInstance]
    }

    def update() {
        def buyerInstance = Buyer.get(params.id)
        if (!buyerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (buyerInstance.version > version) {
                buyerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'buyer.label', default: 'Buyer')] as Object[],
                          "Another user has updated this Buyer while you were editing")
                render(view: "edit", model: [buyerInstance: buyerInstance])
                return
            }
        }

        buyerInstance.properties = params

        if (!buyerInstance.save(flush: true)) {
            render(view: "edit", model: [buyerInstance: buyerInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyerInstance.id])
        redirect(action: "show", id: buyerInstance.id)
    }

    def delete() {
        def buyerInstance = Buyer.get(params.id)
        if (!buyerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        try {
            buyerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

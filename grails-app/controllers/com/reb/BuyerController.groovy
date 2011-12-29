package com.reb

import org.springframework.dao.DataIntegrityViolationException

class BuyerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buyerList: Buyer.list(params), buyerTotal: Buyer.count()]
    }

    def create() {
        [buyer: new Buyer(params)]
    }

    def save() {
        def buyer = new Buyer(params)
        if (!buyer.save(flush: true)) {
            render(view: "create", model: [buyer: buyer])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyer.id])
        redirect(action: "show", id: buyer.id)
    }

    def show() {
        def buyer = Buyer.get(params.id)
        if (!buyer) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        [buyer: buyer]
    }

    def edit() {
        def buyer = Buyer.get(params.id)
        if (!buyer) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        [buyer: buyer]
    }

    def update() {
        def buyer = Buyer.get(params.id)
        if (!buyer) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (buyer.version > version) {
                buyer.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'buyer.label', default: 'Buyer')] as Object[],
                          "Another user has updated this Buyer while you were editing")
                render(view: "edit", model: [buyer: buyer])
                return
            }
        }

        buyer.properties = params

        if (!buyer.save(flush: true)) {
            render(view: "edit", model: [buyer: buyer])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyer.id])
        redirect(action: "show", id: buyer.id)
    }

    def delete() {
        def buyer = Buyer.get(params.id)
        if (!buyer) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
            return
        }

        try {
            buyer.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

package com.reb

class SellerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sellerInstanceList: Seller.list(params), sellerInstanceTotal: Seller.count()]
    }

    def create = {
        def sellerInstance = new Seller()
        sellerInstance.properties = params
        return [sellerInstance: sellerInstance]
    }

    def save = {
        def sellerInstance = new Seller(params)
        if (sellerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'seller.label', default: 'Seller'), sellerInstance.id])}"
            redirect(action: "show", id: sellerInstance.id)
        }
        else {
            render(view: "create", model: [sellerInstance: sellerInstance])
        }
    }

    def show = {
        def sellerInstance = Seller.get(params.id)
        if (!sellerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seller.label', default: 'Seller'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sellerInstance: sellerInstance]
        }
    }

    def edit = {
        def sellerInstance = Seller.get(params.id)
        if (!sellerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seller.label', default: 'Seller'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sellerInstance: sellerInstance]
        }
    }

    def update = {
        def sellerInstance = Seller.get(params.id)
        if (sellerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sellerInstance.version > version) {
                    
                    sellerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'seller.label', default: 'Seller')] as Object[], "Another user has updated this Seller while you were editing")
                    render(view: "edit", model: [sellerInstance: sellerInstance])
                    return
                }
            }
            sellerInstance.properties = params
            if (!sellerInstance.hasErrors() && sellerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'seller.label', default: 'Seller'), sellerInstance.id])}"
                redirect(action: "show", id: sellerInstance.id)
            }
            else {
                render(view: "edit", model: [sellerInstance: sellerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seller.label', default: 'Seller'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sellerInstance = Seller.get(params.id)
        if (sellerInstance) {
            try {
                sellerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'seller.label', default: 'Seller'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'seller.label', default: 'Seller'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seller.label', default: 'Seller'), params.id])}"
            redirect(action: "list")
        }
    }
}

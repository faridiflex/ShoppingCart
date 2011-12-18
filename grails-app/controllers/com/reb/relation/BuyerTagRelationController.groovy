package com.reb.relation

class BuyerTagRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buyerTagRelationInstanceList: BuyerTagRelation.list(params), buyerTagRelationInstanceTotal: BuyerTagRelation.count()]
    }

    def create = {
        def buyerTagRelationInstance = new BuyerTagRelation()
        buyerTagRelationInstance.properties = params
        return [buyerTagRelationInstance: buyerTagRelationInstance]
    }

    def save = {
        def buyerTagRelationInstance = new BuyerTagRelation(params)
        if (buyerTagRelationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), buyerTagRelationInstance.id])}"
            redirect(action: "show", id: buyerTagRelationInstance.id)
        }
        else {
            render(view: "create", model: [buyerTagRelationInstance: buyerTagRelationInstance])
        }
    }

    def show = {
        def buyerTagRelationInstance = BuyerTagRelation.get(params.id)
        if (!buyerTagRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [buyerTagRelationInstance: buyerTagRelationInstance]
        }
    }

    def edit = {
        def buyerTagRelationInstance = BuyerTagRelation.get(params.id)
        if (!buyerTagRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [buyerTagRelationInstance: buyerTagRelationInstance]
        }
    }

    def update = {
        def buyerTagRelationInstance = BuyerTagRelation.get(params.id)
        if (buyerTagRelationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (buyerTagRelationInstance.version > version) {
                    
                    buyerTagRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation')] as Object[], "Another user has updated this BuyerTagRelation while you were editing")
                    render(view: "edit", model: [buyerTagRelationInstance: buyerTagRelationInstance])
                    return
                }
            }
            buyerTagRelationInstance.properties = params
            if (!buyerTagRelationInstance.hasErrors() && buyerTagRelationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), buyerTagRelationInstance.id])}"
                redirect(action: "show", id: buyerTagRelationInstance.id)
            }
            else {
                render(view: "edit", model: [buyerTagRelationInstance: buyerTagRelationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def buyerTagRelationInstance = BuyerTagRelation.get(params.id)
        if (buyerTagRelationInstance) {
            try {
                buyerTagRelationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation'), params.id])}"
            redirect(action: "list")
        }
    }
}

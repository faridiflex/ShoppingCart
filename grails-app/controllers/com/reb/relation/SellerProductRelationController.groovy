package com.reb.relation

class SellerProductRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sellerProductRelationInstanceList: SellerProductRelation.list(params), sellerProductRelationInstanceTotal: SellerProductRelation.count()]
    }

    def create = {
        def sellerProductRelationInstance = new SellerProductRelation()
        sellerProductRelationInstance.properties = params
        return [sellerProductRelationInstance: sellerProductRelationInstance]
    }

    def save = {
        def sellerProductRelationInstance = new SellerProductRelation(params)
        if (sellerProductRelationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), sellerProductRelationInstance.id])}"
            redirect(action: "show", id: sellerProductRelationInstance.id)
        }
        else {
            render(view: "create", model: [sellerProductRelationInstance: sellerProductRelationInstance])
        }
    }

    def show = {
        def sellerProductRelationInstance = SellerProductRelation.get(params.id)
        if (!sellerProductRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sellerProductRelationInstance: sellerProductRelationInstance]
        }
    }

    def edit = {
        def sellerProductRelationInstance = SellerProductRelation.get(params.id)
        if (!sellerProductRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sellerProductRelationInstance: sellerProductRelationInstance]
        }
    }

    def update = {
        def sellerProductRelationInstance = SellerProductRelation.get(params.id)
        if (sellerProductRelationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sellerProductRelationInstance.version > version) {
                    
                    sellerProductRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation')] as Object[], "Another user has updated this SellerProductRelation while you were editing")
                    render(view: "edit", model: [sellerProductRelationInstance: sellerProductRelationInstance])
                    return
                }
            }
            sellerProductRelationInstance.properties = params
            if (!sellerProductRelationInstance.hasErrors() && sellerProductRelationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), sellerProductRelationInstance.id])}"
                redirect(action: "show", id: sellerProductRelationInstance.id)
            }
            else {
                render(view: "edit", model: [sellerProductRelationInstance: sellerProductRelationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sellerProductRelationInstance = SellerProductRelation.get(params.id)
        if (sellerProductRelationInstance) {
            try {
                sellerProductRelationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProductRelation.label', default: 'SellerProductRelation'), params.id])}"
            redirect(action: "list")
        }
    }
}

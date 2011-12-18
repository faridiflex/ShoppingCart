package com.reb.relation

class SellerTagRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sellerTagRelationInstanceList: SellerTagRelation.list(params), sellerTagRelationInstanceTotal: SellerTagRelation.count()]
    }

    def create = {
        def sellerTagRelationInstance = new SellerTagRelation()
        sellerTagRelationInstance.properties = params
        return [sellerTagRelationInstance: sellerTagRelationInstance]
    }

    def save = {
        def sellerTagRelationInstance = new SellerTagRelation(params)
        if (sellerTagRelationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), sellerTagRelationInstance.id])}"
            redirect(action: "show", id: sellerTagRelationInstance.id)
        }
        else {
            render(view: "create", model: [sellerTagRelationInstance: sellerTagRelationInstance])
        }
    }

    def show = {
        def sellerTagRelationInstance = SellerTagRelation.get(params.id)
        if (!sellerTagRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sellerTagRelationInstance: sellerTagRelationInstance]
        }
    }

    def edit = {
        def sellerTagRelationInstance = SellerTagRelation.get(params.id)
        if (!sellerTagRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sellerTagRelationInstance: sellerTagRelationInstance]
        }
    }

    def update = {
        def sellerTagRelationInstance = SellerTagRelation.get(params.id)
        if (sellerTagRelationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sellerTagRelationInstance.version > version) {
                    
                    sellerTagRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation')] as Object[], "Another user has updated this SellerTagRelation while you were editing")
                    render(view: "edit", model: [sellerTagRelationInstance: sellerTagRelationInstance])
                    return
                }
            }
            sellerTagRelationInstance.properties = params
            if (!sellerTagRelationInstance.hasErrors() && sellerTagRelationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), sellerTagRelationInstance.id])}"
                redirect(action: "show", id: sellerTagRelationInstance.id)
            }
            else {
                render(view: "edit", model: [sellerTagRelationInstance: sellerTagRelationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sellerTagRelationInstance = SellerTagRelation.get(params.id)
        if (sellerTagRelationInstance) {
            try {
                sellerTagRelationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerTagRelation.label', default: 'SellerTagRelation'), params.id])}"
            redirect(action: "list")
        }
    }
}

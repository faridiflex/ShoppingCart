package com.reb.relation

class ProductTagRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productTagRelationInstanceList: ProductTagRelation.list(params), productTagRelationInstanceTotal: ProductTagRelation.count()]
    }

    def create = {
        def productTagRelationInstance = new ProductTagRelation()
        productTagRelationInstance.properties = params
        return [productTagRelationInstance: productTagRelationInstance]
    }

    def save = {
        def productTagRelationInstance = new ProductTagRelation(params)
        if (productTagRelationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), productTagRelationInstance.id])}"
            redirect(action: "show", id: productTagRelationInstance.id)
        }
        else {
            render(view: "create", model: [productTagRelationInstance: productTagRelationInstance])
        }
    }

    def show = {
        def productTagRelationInstance = ProductTagRelation.get(params.id)
        if (!productTagRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productTagRelationInstance: productTagRelationInstance]
        }
    }

    def edit = {
        def productTagRelationInstance = ProductTagRelation.get(params.id)
        if (!productTagRelationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productTagRelationInstance: productTagRelationInstance]
        }
    }

    def update = {
        def productTagRelationInstance = ProductTagRelation.get(params.id)
        if (productTagRelationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productTagRelationInstance.version > version) {
                    
                    productTagRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productTagRelation.label', default: 'ProductTagRelation')] as Object[], "Another user has updated this ProductTagRelation while you were editing")
                    render(view: "edit", model: [productTagRelationInstance: productTagRelationInstance])
                    return
                }
            }
            productTagRelationInstance.properties = params
            if (!productTagRelationInstance.hasErrors() && productTagRelationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), productTagRelationInstance.id])}"
                redirect(action: "show", id: productTagRelationInstance.id)
            }
            else {
                render(view: "edit", model: [productTagRelationInstance: productTagRelationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productTagRelationInstance = ProductTagRelation.get(params.id)
        if (productTagRelationInstance) {
            try {
                productTagRelationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productTagRelation.label', default: 'ProductTagRelation'), params.id])}"
            redirect(action: "list")
        }
    }
}

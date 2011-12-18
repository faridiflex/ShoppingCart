package com.reb.info

class ProductInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productInfoInstanceList: ProductInfo.list(params), productInfoInstanceTotal: ProductInfo.count()]
    }

    def create = {
        def productInfoInstance = new ProductInfo()
        productInfoInstance.properties = params
        return [productInfoInstance: productInfoInstance]
    }

    def save = {
        def productInfoInstance = new ProductInfo(params)
        if (productInfoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), productInfoInstance.id])}"
            redirect(action: "show", id: productInfoInstance.id)
        }
        else {
            render(view: "create", model: [productInfoInstance: productInfoInstance])
        }
    }

    def show = {
        def productInfoInstance = ProductInfo.get(params.id)
        if (!productInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productInfoInstance: productInfoInstance]
        }
    }

    def edit = {
        def productInfoInstance = ProductInfo.get(params.id)
        if (!productInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productInfoInstance: productInfoInstance]
        }
    }

    def update = {
        def productInfoInstance = ProductInfo.get(params.id)
        if (productInfoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productInfoInstance.version > version) {
                    
                    productInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productInfo.label', default: 'ProductInfo')] as Object[], "Another user has updated this ProductInfo while you were editing")
                    render(view: "edit", model: [productInfoInstance: productInfoInstance])
                    return
                }
            }
            productInfoInstance.properties = params
            if (!productInfoInstance.hasErrors() && productInfoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), productInfoInstance.id])}"
                redirect(action: "show", id: productInfoInstance.id)
            }
            else {
                render(view: "edit", model: [productInfoInstance: productInfoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productInfoInstance = ProductInfo.get(params.id)
        if (productInfoInstance) {
            try {
                productInfoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productInfo.label', default: 'ProductInfo'), params.id])}"
            redirect(action: "list")
        }
    }
}

package com.reb

import org.springframework.dao.DataIntegrityViolationException

class ProductPriceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productPriceList: ProductPrice.list(params), productPriceTotal: ProductPrice.count()]
    }
    
    def expiringPrices(int days){
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def productPriceList = ProductPrice.findAll{
            validTill < new Date() + days
//            TODO take care of pagination here
//            and count
        }
        render view: 'list', model: [productPriceList: productPriceList, productPriceTotal: ProductPrice.count()]
    }

    def create() {
        [productPrice: new ProductPrice(params)]
    }

    def save() {
        def productPrice = new ProductPrice(params)
        if (!productPrice.save(flush: true)) {
            render(view: "create", model: [productPrice: productPrice])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), productPrice.id])
        redirect(action: "show", id: productPrice.id)
    }

    def show() {
        def productPrice = ProductPrice.get(params.id)
        if (!productPrice) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        [productPrice: productPrice]
    }

    def edit() {
        def productPrice = ProductPrice.get(params.id)
        if (!productPrice) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        [productPrice: productPrice]
    }

    def update() {
        def productPrice = ProductPrice.get(params.id)
        if (!productPrice) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productPrice.version > version) {
                productPrice.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productPrice.label', default: 'ProductPrice')] as Object[],
                          "Another user has updated this ProductPrice while you were editing")
                render(view: "edit", model: [productPrice: productPrice])
                return
            }
        }

        productPrice.properties = params

        if (!productPrice.save(flush: true)) {
            render(view: "edit", model: [productPrice: productPrice])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), productPrice.id])
        redirect(action: "show", id: productPrice.id)
    }

    def delete() {
        def productPrice = ProductPrice.get(params.id)
        if (!productPrice) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productPrice.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

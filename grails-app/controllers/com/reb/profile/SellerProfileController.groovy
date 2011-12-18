package com.reb.profile

class SellerProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sellerProfileInstanceList: SellerProfile.list(params), sellerProfileInstanceTotal: SellerProfile.count()]
    }

    def create = {
        def sellerProfileInstance = new SellerProfile()
        sellerProfileInstance.properties = params
        return [sellerProfileInstance: sellerProfileInstance]
    }

    def save = {
        def sellerProfileInstance = new SellerProfile(params)
        if (sellerProfileInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), sellerProfileInstance.id])}"
            redirect(action: "show", id: sellerProfileInstance.id)
        }
        else {
            render(view: "create", model: [sellerProfileInstance: sellerProfileInstance])
        }
    }

    def show = {
        def sellerProfileInstance = SellerProfile.get(params.id)
        if (!sellerProfileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sellerProfileInstance: sellerProfileInstance]
        }
    }

    def edit = {
        def sellerProfileInstance = SellerProfile.get(params.id)
        if (!sellerProfileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sellerProfileInstance: sellerProfileInstance]
        }
    }

    def update = {
        def sellerProfileInstance = SellerProfile.get(params.id)
        if (sellerProfileInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sellerProfileInstance.version > version) {
                    
                    sellerProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sellerProfile.label', default: 'SellerProfile')] as Object[], "Another user has updated this SellerProfile while you were editing")
                    render(view: "edit", model: [sellerProfileInstance: sellerProfileInstance])
                    return
                }
            }
            sellerProfileInstance.properties = params
            if (!sellerProfileInstance.hasErrors() && sellerProfileInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), sellerProfileInstance.id])}"
                redirect(action: "show", id: sellerProfileInstance.id)
            }
            else {
                render(view: "edit", model: [sellerProfileInstance: sellerProfileInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sellerProfileInstance = SellerProfile.get(params.id)
        if (sellerProfileInstance) {
            try {
                sellerProfileInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sellerProfile.label', default: 'SellerProfile'), params.id])}"
            redirect(action: "list")
        }
    }
}

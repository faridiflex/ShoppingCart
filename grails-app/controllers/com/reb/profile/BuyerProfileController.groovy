package com.reb.profile

class BuyerProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buyerProfileList: BuyerProfile.list(params), buyerProfileTotal: BuyerProfile.count()]
    }

    def create = {
        def buyerProfile = new BuyerProfile()
        buyerProfile.properties = params
        return [buyerProfile: buyerProfile]
    }

    def save = {
        def buyerProfile = new BuyerProfile(params)
        if (buyerProfile.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), buyerProfile.id])}"
            redirect(action: "show", id: buyerProfile.id)
        }
        else {
            render(view: "create", model: [buyerProfile: buyerProfile])
        }
    }

    def show = {
        def buyerProfile = BuyerProfile.get(params.id)
        if (!buyerProfile) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
        else {
            [buyerProfile: buyerProfile]
        }
    }

    def edit = {
        def buyerProfile = BuyerProfile.get(params.id)
        if (!buyerProfile) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [buyerProfile: buyerProfile]
        }
    }

    def update = {
        def buyerProfile = BuyerProfile.get(params.id)
        if (buyerProfile) {
            if (params.version) {
                def version = params.version.toLong()
                if (buyerProfile.version > version) {
                    
                    buyerProfile.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'buyerProfile.label', default: 'BuyerProfile')] as Object[], "Another user has updated this BuyerProfile while you were editing")
                    render(view: "edit", model: [buyerProfile: buyerProfile])
                    return
                }
            }
            buyerProfile.properties = params
            if (!buyerProfile.hasErrors() && buyerProfile.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), buyerProfile.id])}"
                redirect(action: "show", id: buyerProfile.id)
            }
            else {
                render(view: "edit", model: [buyerProfile: buyerProfile])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def buyerProfile = BuyerProfile.get(params.id)
        if (buyerProfile) {
            try {
                buyerProfile.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyerProfile.label', default: 'BuyerProfile'), params.id])}"
            redirect(action: "list")
        }
    }
}

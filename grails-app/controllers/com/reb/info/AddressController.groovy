package com.reb.info

class AddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [addressList: Address.list(params), addressTotal: Address.count()]
    }

    def create = {
        def address = new Address()
        address.properties = params
        return [address: address]
    }

    def save = {
        def address = new Address(params)
        if (address.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), address.id])}"
            redirect(action: "show", id: address.id)
        }
        else {
            render(view: "create", model: [address: address])
        }
    }

    def show = {
        def address = Address.get(params.id)
        if (!address) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
        else {
            [address: address]
        }
    }

    def edit = {
        def address = Address.get(params.id)
        if (!address) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [address: address]
        }
    }

    def update = {
        def address = Address.get(params.id)
        if (address) {
            if (params.version) {
                def version = params.version.toLong()
                if (address.version > version) {
                    
                    address.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'address.label', default: 'Address')] as Object[], "Another user has updated this Address while you were editing")
                    render(view: "edit", model: [address: address])
                    return
                }
            }
            address.properties = params
            if (!address.hasErrors() && address.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'address.label', default: 'Address'), address.id])}"
                redirect(action: "show", id: address.id)
            }
            else {
                render(view: "edit", model: [address: address])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def address = Address.get(params.id)
        if (address) {
            try {
                address.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
    }
}

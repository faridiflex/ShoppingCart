package com.reb.info

import org.springframework.dao.DataIntegrityViolationException

class TagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tagList: Tag.list(params), tagTotal: Tag.count()]
    }

    def create() {
        [tag: new Tag(params)]
    }

    def save() {
        def tag = new Tag(params)
        if (!tag.save(flush: true)) {
            render(view: "create", model: [tag: tag])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tag.label', default: 'Tag'), tag.id])
        redirect(action: "show", id: tag.id)
    }

    def show() {
        def tag = Tag.get(params.id)
        if (!tag) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
            redirect(action: "list")
            return
        }

        [tag: tag]
    }

    def edit() {
        def tag = Tag.get(params.id)
        if (!tag) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
            redirect(action: "list")
            return
        }

        [tag: tag]
    }

    def update() {
        def tag = Tag.get(params.id)
        if (!tag) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tag.version > version) {
                tag.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tag.label', default: 'Tag')] as Object[],
                          "Another user has updated this Tag while you were editing")
                render(view: "edit", model: [tag: tag])
                return
            }
        }

        tag.properties = params

        if (!tag.save(flush: true)) {
            render(view: "edit", model: [tag: tag])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tag.label', default: 'Tag'), tag.id])
        redirect(action: "show", id: tag.id)
    }

    def delete() {
        def tag = Tag.get(params.id)
        if (!tag) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tag.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

package joberty.dic

class IndustryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [industryInstanceList: Industry.list(params), industryInstanceTotal: Industry.count()]
    }

    def create = {
        def industryInstance = new Industry()
        industryInstance.properties = params
        return [industryInstance: industryInstance]
    }

    def save = {
        def industryInstance = new Industry(params)
        if (industryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'industry.label', default: 'Industry'), industryInstance.id])}"
            redirect(action: "show", id: industryInstance.id)
        }
        else {
            render(view: "create", model: [industryInstance: industryInstance])
        }
    }

    def show = {
        def industryInstance = Industry.get(params.id)
        if (!industryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])}"
            redirect(action: "list")
        }
        else {
            [industryInstance: industryInstance]
        }
    }

    def edit = {
        def industryInstance = Industry.get(params.id)
        if (!industryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [industryInstance: industryInstance]
        }
    }

    def update = {
        def industryInstance = Industry.get(params.id)
        if (industryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (industryInstance.version > version) {
                    
                    industryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'industry.label', default: 'Industry')] as Object[], "Another user has updated this Industry while you were editing")
                    render(view: "edit", model: [industryInstance: industryInstance])
                    return
                }
            }
            industryInstance.properties = params
            if (!industryInstance.hasErrors() && industryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'industry.label', default: 'Industry'), industryInstance.id])}"
                redirect(action: "show", id: industryInstance.id)
            }
            else {
                render(view: "edit", model: [industryInstance: industryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def industryInstance = Industry.get(params.id)
        if (industryInstance) {
            try {
                industryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])}"
            redirect(action: "list")
        }
    }
}

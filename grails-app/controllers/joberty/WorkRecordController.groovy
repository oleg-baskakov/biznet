package joberty

import joberty.dic.Company
import joberty.dic.JobPosition

class WorkRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def profileService	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [workRecordInstanceList: WorkRecord.list(params), workRecordInstanceTotal: WorkRecord.count()]
    }

    def create = {
        def workRecordInstance = new WorkRecord()
        workRecordInstance.properties = params
        return [workRecordInstance: workRecordInstance]
    }

    def save = {
        def workRecordInstance = new WorkRecord(params)
        if (workRecordInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), workRecordInstance.id])}"
            redirect(action: "show", id: workRecordInstance.id)
        }
        else {
            render(view: "create", model: [workRecordInstance: workRecordInstance])
        }
    }

    def show = {
        def workRecordInstance = WorkRecord.get(params.id)
        if (!workRecordInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), params.id])}"
            redirect(action: "list")
        }
        else {
            [workRecordInstance: workRecordInstance]
        }
    }

    def edit = {
        def workRecordInstance = WorkRecord.get(params.id)
		def profile=profileService.getCurrentProfile(session)
		
        if (!workRecordInstance||!profile||workRecordInstance.profile.id!=profile.id) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), params.id])}"
            redirect(controller:"profile", action: "myprofile")
        }
        else {
			def sYear=new Date()[Calendar.YEAR]
			def eYear=1940
			if(profile.birth){
				eYear=profile.birth[Calendar.YEAR]+10
			}
            return [workRecordInstance: workRecordInstance,sYear:sYear,eYear:eYear]
        }
    }

    def update = {
		if(!session.profile){
			redirect(controller:"profile",action:'myprofile')
			return
		}
		
        def workRecordInstance = WorkRecord.findByIdAndProfile(params.id,session.profile)
        if (workRecordInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (workRecordInstance.version > version) {
                    
                    workRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'workRecord.label', default: 'WorkRecord')] as Object[], "Another user has updated this WorkRecord while you were editing")
                    render(view: "edit", model: [workRecordInstance: workRecordInstance])
                    return
                }
            }
            workRecordInstance.properties = params
			if(params["company.id"]){
				def company=Company.get(params["company.id"])
				workRecordInstance.company=company
			}else if(params.companyName){
				String companyName=params["companyName"].trim().toLowerCase()
				def company=Company.findByName(companyName)
				if(!company){
					company=new Company(name:companyName).save(flush:true)
				}
				workRecordInstance.company=company
				
				//
				
			}
	
			if(params["position.id"]){
				def jobPosition=JobPosition.get(params["position.id"])
				workRecordInstance.position=jobPosition
			}else if(params.positionName){
				String positionName=params["positionName"].trim().toLowerCase()
				def jobPosition=JobPosition.findByName(positionName)
				if(!jobPosition)
					jobPosition=new JobPosition(name:positionName,type:1).save(flush:true)
					
				workRecordInstance.position=jobPosition
			}
			def keywords=profileService.generateWorkRecordKeywords(workRecordInstance)
			workRecordInstance.keywords=keywords
	
			workRecordInstance.profile=session.profile
            if (!workRecordInstance.hasErrors() && workRecordInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), workRecordInstance.id])}"
                redirect(controller:"profile", action: "myprofile")
            }
            else {
                render(view: "edit", model: [workRecordInstance: workRecordInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), params.id])}"
            redirect(action: "edit")
        }
    }

    def delete = {
		def profile=profileService.getCurrentProfile(session)
//        def workRecordInstance = WorkRecord.get(params.id)
		def workRecordInstance = WorkRecord.findByIdAndProfile(params.id,profile)
		
        if (workRecordInstance) {
            try {
                workRecordInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), params.id])}"
                redirect(controller:"profile", action: "myprofile")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), params.id])}"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), params.id])}"
            redirect(controller:"profile", action: "myprofile")
        }
    }
}

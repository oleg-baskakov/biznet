package joberty

import joberty.dic.JobPosition
import joberty.promo.JobPromo;
import joberty.alerts.JobAlertResponse;

class JobAlertController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def profileService
	def jobAlertService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		Profile profile=profileService.getCurrentProfile(session)
		def alerts=[]
		int alertsCount=0
		if(profile){
				alerts=JobAlert.findAllByCreatorAndStatus(profile,JobAlert.STATUS_CREATED)
				alertsCount=JobAlert.countByCreatorAndStatus(profile,JobAlert.STATUS_CREATED)
				
		}
		
		render(view:'list',model:[alerts: alerts, alertsTotal: alertsCount])

 //       [alerts: JobAlert.list(params), jobAlertInstanceTotal: JobAlert.count()]
    }

    def create = {
        def jobAlertInstance = new JobAlert()
        jobAlertInstance.properties = params
        return [jobAlertInstance: jobAlertInstance]
    }

    def save = {
		withForm{
				
	        def jobAlertInstance = new JobAlert(params)
			Profile profile=profileService.getCurrentProfile(session)
			jobAlertInstance.creator=profile
			jobAlertInstance=processJobAlert(jobAlertInstance, params)
			
	        if (jobAlertInstance.save(flush: true)) {
	            flash.message = "${message(code: 'default.created.message', args: [message(code: 'jobAlert.label', default: 'JobAlert'), jobAlertInstance.id])}"
	            redirect(action: "show", id: jobAlertInstance.id)
	        }
	        else {
	            render(view: "create", model: [jobAlertInstance: jobAlertInstance])
	        }
		}.invalidToken{
			log.info "invalid token at jobAlert.save  for user ${session.profileName}"
			redirect( action:"list")
		return

	}

    }

    def show = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
        def jobAlertInstance = JobAlert.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobAlertInstance||jobAlertInstance.creator!=profile){
			redirect(action:'list')
			return
		}
		
		def jobResponses=JobAlertResponse.findAllByAlert(jobAlertInstance,[sort:'dateCreated', order:'desc', max:params.max, offset:params.offset])
		def jobResponsesCount=JobAlertResponse.countByAlert(jobAlertInstance)
        if (!jobAlertInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobAlert.label', default: 'JobAlert'), params.id])}"
            redirect(action: "list")
        }
        else {
            [alert: jobAlertInstance, promos:jobResponses,promosCount:jobResponsesCount]
        }
    }

	
	def showPromo ={
		def jobResp = JobAlertResponse.get(params.id)
        if(!jobResp){
			redirect(action: "list")
			return
		}
		def jobAlertInstance = jobResp.alert //JobAlert.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobAlertInstance||jobAlertInstance!=profile){
			redirect(action:'list')
			return
		}
		jobResp.status=JobAlertResponse.STATUS_READ
		if(!jobResp.save(flush:true)){
			redirect(action:'list')
			return

		}
		params.id=jobResp.promo.id
		redirect(controller:"jobPromo", action:"show", model:params)
	}
	
    def edit = {
        def jobAlertInstance = JobAlert.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobAlertInstance||jobAlertInstance!=profile){
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobAlert.label', default: 'Job alert'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [jobAlertInstance: jobAlertInstance]
        }
    }

    def update = {
        def jobAlertInstance = JobAlert.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobAlertInstance||jobAlertInstance.creator!=profile){
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobAlert.label', default: 'Job alert'), params.id])}"
			redirect(action:'list')
			return
		}
          if (params.version) {
                def version = params.version.toLong()
                if (jobAlertInstance.version > version) {
                    
                    jobAlertInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'jobAlert.label', default: 'Job Alert')] as Object[], "Another user has updated this JobAlert while you were editing")
                    render(view: "edit", model: [jobAlertInstance: jobAlertInstance])
                    return
                }
            }
            jobAlertInstance.properties = params
			jobAlertInstance=processJobAlert(jobAlertInstance, params)
			
            if (!jobAlertInstance.hasErrors() && jobAlertInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'jobAlert.label', default: 'Job Alert'), jobAlertInstance.id])}"
                redirect(action: "show", id: jobAlertInstance.id)
            }
            else {
                render(view: "edit", model: [jobAlertInstance: jobAlertInstance])
            }
    }

    def delete = {
        def jobAlertInstance = JobAlert.get(params.id)
		def respMsg=''
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobAlertInstance||jobAlertInstance.creator.id!=profile.id){
			respMsg="<p style='color:red;'>Error at deleting process</p>"
			render respMsg
			return
        }
        try {
//            jobAlertInstance.delete(flush: true)
			jobAlertInstance.status=JobAlert.STATUS_DELETED
            if (!jobAlertInstance.hasErrors() && jobAlertInstance.save(flush: true)) {
				respMsg = "<p style='color:green;'>Promotion has been deleted</p>"
	
			}else{
				respMsg="<p style='color:red;'>Error at deleting process</p>"
//            flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'jobAlert.label', default: 'Job Alert'), params.id])}"
//            redirect(action: "list")
			}
        }
        catch (org.springframework.dao.DataIntegrityViolationException e) {
				respMsg="<p style='color:red;'>Error at deleting process</p>"
//            flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'jobAlert.label', default: 'Job Alert'), params.id])}"
//            redirect(action: "show", id: params.id)
        }
		render respMsg
		
    }

	
	def listAx = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		Profile profile=profileService.getCurrentProfile(session)
		def alerts=[]
		int alertsCount=0
		if(profile){
				alerts=JobAlert.findAllByCreatorAndStatus(profile,JobAlert.STATUS_CREATED)
				alertsCount=JobAlert.countByCreatorAndStatus(profile,JobAlert.STATUS_CREATED)
				
		}
		
		render(view:'listAx',model:[alerts: alerts, alertsTotal: alertsCount])

 //       [alerts: JobAlert.list(params), jobAlertInstanceTotal: JobAlert.count()]
	}

		
	
	private JobAlert processJobAlert(jobAlertInstance, params){
		
		def jobPosition=null
		if(params["position.id"]){
			jobPosition=JobPosition.get(params["position.id"])
		}else if(params.positionName){
			String positionName=params["positionName"].trim().toLowerCase()
			jobPosition=JobPosition.findByName(positionName)
			if(!jobPosition)
				jobPosition=new JobPosition(name:positionName,type:1).save(flush:true)
		}
		jobAlertInstance.position=jobPosition
		jobAlertInstance.query=params.query
		
		jobAlertInstance.keywords=jobAlertService.generateKeywords(jobAlertInstance)
		
		return jobAlertInstance
	}
}

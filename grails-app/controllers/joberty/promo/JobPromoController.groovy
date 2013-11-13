package joberty.promo

import grails.converters.JSON
import joberty.ProfileService;


import joberty.Profile
import joberty.dic.JobPosition

class JobPromoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def profileService
	def messageService
	def jobPromotionService
	def jobAlertService
	
    def index = {
		
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//		Profile profile=profileService.getCurrentProfile(session)
		def promos=[]
		int promosCount=0
		params.order='desc'
		params.sort='dateCreated'
		promos=JobPromo.findAllByStatus(JobPromo.STATUS_PUBLISHED,params)
		promosCount=JobPromo.countByStatus(JobPromo.STATUS_PUBLISHED)
        [promos: promos, promosTotal: promosCount]
    }

	def mylist = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		Profile profile=profileService.getCurrentProfile(session)
		def promos=[]
		int promosCount=0
		if(profile){
				promos=JobPromo.findAllByCreator(profile)
				promosCount=JobPromo.countByCreator(profile)
				
		}
		render(view:'list',model:[promos: promos, promosTotal: promosCount])
	}

    def create = {
        def jobPromoInstance = new JobPromo()
        jobPromoInstance.properties = params
//		def promoTypes=[{id:JobPromo.TYPE_BASIC; name:'Basic'},
//		{id:JobPromo.TYPE_ADVANCED; name:'Advanced'}]
        return [jobPromoInstance: jobPromoInstance]
    }

    def save = {
		withForm{
			
	        def jobPromoInstance = new JobPromo(params)
			Profile profile=profileService.getCurrentProfile(session)
			jobPromoInstance.creator=profile
			jobPromoInstance.status=JobPromo.STATUS_CREATED
			jobPromoInstance=processJobPromo(jobPromoInstance,params)
	
			if (jobPromoInstance.save(flush: true)) {
	            flash.message = "${message(code: 'default.created.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), jobPromoInstance.id])}"
	            redirect(action: "show", id: jobPromoInstance.id)
	        }
	        else {
	            render(view: "create", model: [jobPromoInstance: jobPromoInstance])
	        }
		}.invalidToken{
			log.info "invalid token at jobPromo.save  for user ${session.profileName}"
			redirect( action:"mylist")
			return

		}
    }

    def show = {
        def jobPromoInstance = JobPromo.get(params.id)
        if (!jobPromoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), params.id])}"
            redirect(action: "list")
        }
        else {
			Profile profile=profileService.getCurrentProfile(session)
			def stats=[]
			def viewersList=[]
			def total=[0,0]
		//	if(profile&&jobPromoInstance&&profile.id==jobPromoInstance.creator?.id){
				stats=jobPromotionService.getStatJobPromoViews( jobPromoInstance,jobPromotionService.STAT_TYPE_DAY)
				viewersList=jobPromotionService.getStatJobPromoViewsByUsers( jobPromoInstance,jobPromotionService.STAT_TYPE_DAY,10,0)
				total=jobPromotionService.getTotalJobPromoViews(jobPromoInstance)
			//}
			
            [promo: jobPromoInstance, stats:stats as JSON, viewers:viewersList,totalViews:total]
        }
    }

    def edit = {
        def jobPromoInstance = JobPromo.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			if(jobPromoInstance)
				redirect(action: "show",id:jobPromoInstance.id)
			else
				redirect(action: "list")
			
			return
		}
			
        if (!jobPromoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [jobPromoInstance: jobPromoInstance]
        }
    }

    def update = {
        def jobPromoInstance = JobPromo.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			if(jobPromoInstance)
				redirect(action: "show",id:jobPromoInstance.id)
			else
				redirect(action: "list")
			
			return
		}
	//!!	params.status=jobPromoInstance.status
		//params.type=jobPromoInstance.type
        if (jobPromoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (jobPromoInstance.version > version) {
                    
                    jobPromoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'jobPromo.label', default: 'JobPromo')] as Object[], "Another user has updated this JobPromo while you were editing")
                    render(view: "edit", model: [jobPromoInstance: jobPromoInstance])
                    return
                }
            }
            jobPromoInstance.properties = params
			jobPromoInstance=processJobPromo(jobPromoInstance,params)
            if (!jobPromoInstance.hasErrors() && jobPromoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), jobPromoInstance.id])}"
                redirect(action: "show", id: jobPromoInstance.id)
            }
            else {
                render(view: "edit", model: [jobPromoInstance: jobPromoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def jobPromoInstance = JobPromo.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			if(jobPromoInstance)
				redirect(action: "show",id:jobPromoInstance.id)
			else{
				flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), params.id])}"
				redirect(action: "list")
			}
			
			return
		}
        try {
				jobPromoInstance.status=JobPromo.STATUS_DELETED
                jobPromoInstance.save(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), params.id])}"
                redirect(action: "list")
            }
        catch (org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), params.id])}"
            redirect(action: "show", id: params.id)
        }
    }
	
	def purchase={
		
		def jobPromoInstance = JobPromo.get(params.id)
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			if(jobPromoInstance)
				redirect(action: "show",id:jobPromoInstance.id)
			else{
				flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobPromo.label', default: 'JobPromo'), params.id])}"
				redirect(action: "list")
			}
			
			return
		}
		def paid=jobPromotionService.purchasePromo(jobPromoInstance)
		if(!paid){
			flash.message = "${message(code: 'jobpromo.error.purchase', default:'Error at purchasing process')}"

		}else
			flash.message = "${message(code: 'jobpromo.message.purchase-ok', default:'Thank you for buying promotion')}"
		
		redirect(action: "show",id:jobPromoInstance.id)
		
	}
	
	def publishAx={
		def jobPromoInstance = JobPromo.get(params.id)
		def respMsg=''
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			respMsg="<p style='color:red;'>Error at publishing process</p>"
			render respMsg
			return
		}
		
		jobPromoInstance.status=JobPromo.STATUS_PUBLISHED
		if (!jobPromoInstance.hasErrors() && jobPromoInstance.save(flush: true)) {
			respMsg = "<p style='color:green;'>Promotion has been published</p>"
			jobAlertService.findAlertsForPromo(jobPromoInstance)
		}
		else {
			respMsg="<p style='color:red;'>Error at publishing process</p>"
		}
		render respMsg

	}
	
	def promoListDlgAx={
//		params.max = Math.min(params.max ? params.int('max') : 10, 100)
//		params.sort='dateUpdated'
//		params.order='desc'
		def userId=params.uid
		Profile profile=profileService.getCurrentProfile(session)
		def promos=[]
		int promosCount=0
		if(profile){
				promos=JobPromo.findAllByCreatorAndStatus(profile,JobPromo.STATUS_PUBLISHED,[sort:'lastUpdated',order:'desc'])
				//promosCount=JobPromo.countByCreatorAndStatus(profile,JobPromo.STATUS_PUBLISHED)
				
		}
		render(view:'sendPromoDlg',model:[promos: promos, uid:userId])

	}
	
	def sendPromoAx={
		
		def jobPromoInstance = JobPromo.get(params.promo)
		def respMsg=''
		Profile receiver=Profile.get(params.uid)
		Profile sender=profileService.getCurrentProfile(session)
		if(!sender||!jobPromoInstance||!receiver||sender.id!=jobPromoInstance.creator?.id){
			respMsg="<p style='color:red;'>Error at sending promo </p>"
			render respMsg
			return
		}

		String msg=""
		def msgParams=[:]
		String promoLink
		promoLink=link(controller:'jobPromo', action:"show", id:jobPromoInstance.id){
			" ${jobPromoInstance.title}"
			}
		msgParams.to=receiver
		msgParams['mtype']=joberty.Message.TYPE_PROMO_MSG
		
		msgParams.msg=message(code:"jobpromo.msg",args:[sender.fullName, jobPromoInstance.position?.name,promoLink],
			default:"{0} send to You job promotion of {1}.<br>  Please follow the link:{2}")
		msgParams.theme=message(code:"jobpromo.msg.theme",default:"Job promotion")
		def promoMsg=messageService.sendMessage( sender, msgParams)
		if(promoMsg){
			msg= "Promotion has been sent"
		}else{
			msg= "Promotion has not been sent"
		}
	
		render msg

	}
	
	def closeAx={
		def jobPromoInstance = JobPromo.get(params.id)
		def respMsg=''
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			respMsg="<p style='color:red;'>Error at promo closing process</p>"
			render respMsg
			return
		}
		
		jobPromoInstance.status=JobPromo.STATUS_CLOSED
		if (!jobPromoInstance.hasErrors() && jobPromoInstance.save(flush: true)) {
			respMsg = "<p style='color:green;'>Promotion has been closed</p>"
		}
		else {
			respMsg="<p style='color:red;'>Error at promo closing process</p>"
		}
		render respMsg

	}

	def getStatAx={
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def jobPromoInstance = JobPromo.get(params.id)
		def respMsg=''
		def stats=[]
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			flash.message="Error at promo statistics"
		}else{
			def type=params.int('stype')
			stats=jobPromotionService.getStatJobPromoViews( jobPromoInstance,type)
		}
		render(view:'getStatAx',model:[stats: stats, ])
	}

	def getUsersStatAx={
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def jobPromoInstance = JobPromo.get(params.id)
		def respMsg=''
		def stats=[]
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile||!jobPromoInstance||profile.id!=jobPromoInstance.creator?.id){
			flash.message="Error at promo statistics"
		}else{
			def type=params.int('stype')
			stats=jobPromotionService.getStatJobPromoViewsByUser( jobPromoInstance,type)
		}
		render(view:'getUsersStatAx',model:[stats: stats, ])
	}


	
	private JobPromo processJobPromo(jobPromoInstance, params){
		if(params["position.id"]){
			def jobPosition=JobPosition.get(params["position.id"])
			jobPromoInstance.position=jobPosition
		}else if(params.positionName){
			String positionName=params["positionName"].trim().toLowerCase()
			def jobPosition=JobPosition.findByName(positionName)
			if(!jobPosition)
				jobPosition=new JobPosition(name:positionName,type:1).save(flush:true)
				
			jobPromoInstance.position=jobPosition
		}
		
		if(params.salary){
			def amounts=params.salary.split('-')
			if(amounts.size()>1){
				jobPromoInstance.minSalary=amounts[0].toBigDecimal()
				jobPromoInstance.maxSalary=amounts[1].toBigDecimal()
			}else{
				jobPromoInstance.minSalary=amounts[0].toBigDecimal()
				jobPromoInstance.maxSalary=amounts[0].toBigDecimal()
			}
		}
		if(!params['currency.id']){
			def currency=Currency.findByForexname('GBP')
			if(!currency){
				currency=new Currency(name:'GB Pounds',forexname:'GBP',rate:1.6180,rateDate:new Date(2011,5,24,11,00)).save(flush:true)
			}
			jobPromoInstance.currency=currency
		}
		jobPromoInstance.keywords=jobPromotionService.generateKeywords(jobPromoInstance)
		
		return jobPromoInstance
	}
}

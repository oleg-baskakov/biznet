package joberty

import joberty.dic.JobPosition;



import grails.converters.JSON
import joberty.dic.City
import joberty.dic.Company
import joberty.dic.JobPosition
import joberty.dic.School
import joberty.promo.JobPromo

class ProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def profileService

    def index = {
        redirect(action: "show", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [profiles: Profile.list(params), profileInstanceTotal: Profile.count()]
    }

    def create = {
		
        def profileInstance = new Profile()
        profileInstance.properties = params
        return [profileInstance: profileInstance]
    }

    def save = {
        def profileInstance = new Profile(params)
		User user=User.get(session.user.id)
		if(!user){
			redirect(controller:"home", action:"login")
			return
		}
		user.name=params.name
		user.surname=params.surname
		boolean saveUser=user.save(flush:true)
		profileInstance.keywords=profileService.generateKeywords(profileInstance)	
		profileInstance.fullName=user?.name+" "+user?.surname
		profileInstance.user=user
        if (profileInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])}"
            redirect(action: "myprofile", id: profileInstance.id)
        }
        else {
            render(view: "create", model: [profileInstance: profileInstance])
        }
    }

    def show = {
		def profileInstance
		def hasPublishedJobPromo=false
		
		def profile=profileService.getCurrentProfile(session)
		if(profile){
			def promosCount=JobPromo.countByCreatorAndStatus(profile, JobPromo.STATUS_PUBLISHED)
			if(promosCount>0)hasPublishedJobPromo=true
		}

		if(params.id)
         	profileInstance = Profile.get(params.id)
        if (!profileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
        else {
            [profile: profileInstance,hasPromos:hasPublishedJobPromo]
        }
    }

	def myprofile = {
		def profileInstance 
		if(!session.user){
			redirect(controller:'home',action:'login')
			return
		}
		profileInstance=Profile.findByUser(session.user)
		if (!profileInstance) {
			redirect(action: "create")
			return
		}else {
			def workRecordInstance = new WorkRecord()
			def sYear=new Date()[java.util.Calendar.YEAR]
			def eYear=1940
			if(profileInstance.birth){
				eYear=profileInstance.birth[java.util.Calendar.YEAR]+10
			}
	
			[profile: profileInstance, workRecordInstance:workRecordInstance, sYear:sYear,eYear:eYear]
		}
	}
	def addWork = {
//		withForm{
		def profile=Profile.findByUser(session.user)
		if(!profile){
			redirect(action:'create')
			return
		}
		def workRecordInstance = new WorkRecord(params)
		//workRecordInstance.properties=params
		workRecordInstance.profile=profile
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

		if (workRecordInstance.save(flush: true)) {
			
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'workRecord.label', default: 'WorkRecord'), workRecordInstance.id])}"
		}
			render(view: "newWorkRecord", model:[record:workRecordInstance])
//		else {
//			render(view: "create", model: [workRecordInstance: workRecordInstance])
//		}
			
//		}.invalidToken{
//			log.info "invalid token at addWork for user ${user.name}"
//			render("error")
//		}
		
	}

	def addSchool = {
		def profile=Profile.findByUser(session.user)
		if(!profile){
			redirect(action:'create')
			return
		}
		def eduRecordInstance = new EduRecord(params)
		//workRecordInstance.properties=params
		eduRecordInstance.profile=profile
		
		if(params["school.id"]){
			def company=Company.get(params["school.id"])
			eduRecordInstance.school=school
		}else if(params.schoolName){
			String schoolName=params["schoolName"].trim().toLowerCase()
			def school=School.findByName(schoolName)
			if(!school){
				school=new School(name:schoolName).save(flush:true)
			}
			eduRecordInstance.school=school
		
		}
		def keywords=profileService.generateEduRecordKeywords(workRecordInstance)
		if (eduRecordInstance.save(flush: true)) {
			
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'workRecord.label', default: 'Education record'), eduRecordInstance.id])}"
		}
			render(view: "newEduRecord", model:[rec:eduRecordInstance])
//		else {
//			render(view: "create", model: [workRecordInstance: workRecordInstance])
//		}
	}

	
    def edit = {
		
        def profileInstance = Profile.findByUser(session.user)
        if (!profileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [profileInstance: profileInstance]
        }
    }

    def update = {
        def profileInstance = Profile.findByUser(session.user)
		User user=User.get(session.user.id)
        if (profileInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (profileInstance.version > version) {
                    
                    profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'profile.label', default: 'Profile')] as Object[], "Another user has updated this Profile while you were editing")
                    render(view: "edit", model: [profileInstance: profileInstance])
                    return
                }
            }
            profileInstance.properties = params
			user.name=params.name
			user.surname=params.surname
			profileInstance.fullName=user?.name+" "+user?.surname
			user.save(flush:true)
			profileInstance.keywords=profileService.generateKeywords(profileInstance)	
            if (!profileInstance.hasErrors() && profileInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])}"
                redirect(action: "myprofile", id: profileInstance.id)
            }
            else {
                render(view: "edit", model: [profileInstance: profileInstance])
            }
			//user.save(flush:true)
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def profileInstance = Profile.findByUser(session.user) //Profile.get(params.id)
        if (profileInstance) {
            try {
                profileInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def selectCityAjax={
		def countryId=params.long('country.id')
		def result=[:]
		if(countryId){
			def cities=City.findAll("from City c where c.country.id=:cId order by c.name",[cId:countryId])
			if(cities){
				cities.each {result[it.id]=it.name }
			}
		}
		render result as JSON
	}
	
	
	
	
}

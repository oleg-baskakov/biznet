package joberty

import joberty.dic.School

class EduRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def profileService
	
    def index = {
        redirect(action: "myprofile", params: params)
    }

    def edit = {
        def eduRecordInstance = EduRecord.get(params.id)
		def profile=profileService.getCurrentProfile(session)
		

        if (!eduRecordInstance||!profile||eduRecordInstance.profile.id!=profile.id) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eduRecord.label', default: 'EduRecord'), params.id])}"
            redirect(controller:"profile",action: "myprofile")
        }
        else {
			def dates=getDateRange(profile)
            return [eduRecordInstance: eduRecordInstance]+dates
        }
    }

    def update = {
		if(!session.profile){
			redirect(controller:"profile",action:'myprofile')
			return
		}
		
        def eduRecordInstance = EduRecord.findByIdAndProfile(params.id,session.profile)
//        def eduRecordInstance = EduRecord.get(params.id)
        if (eduRecordInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (eduRecordInstance.version > version) {
                    
                    eduRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'eduRecord.label', default: 'EduRecord')] as Object[], "Another user has updated this EduRecord while you were editing")
					def dates=getDateRange(session.profile)
                    render(view: "edit", model: [eduRecordInstance: eduRecordInstance]+dates)
                    return
                }
            }
            eduRecordInstance.properties = params
			if(params["schoolId"]){
				def school=School.get(params["schoolId"])
				eduRecordInstance.school=school
			}else if(params.schoolName){
				String schoolName=params["schoolName"].trim().toLowerCase()
				School school=School.findByName(schoolName)
				if(!school){
					
					school=new School(name:schoolName)
					school.save(flush:true)
				}
				eduRecordInstance.school=school
			
			}
			eduRecordInstance.profile=session.profile
			
	
            if (!eduRecordInstance.hasErrors() && eduRecordInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'eduRecord.label', default: 'EduRecord'), eduRecordInstance.id])}"
                redirect(controller:"profile", action: "myprofile")
            }
            else {
				def dates=getDateRange(session.profile)
                render(view: "edit", model: [eduRecordInstance: eduRecordInstance]+dates)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eduRecord.label', default: 'EduRecord'), params.id])}"
            redirect(controller:"profile",action: "myprofile")
        }
    }

    def delete = {

		def profile=profileService.getCurrentProfile(session)
        def eduRecordInstance = EduRecord.findByIdAndProfile(params.id,profile)
        if (eduRecordInstance) {
            try {
                eduRecordInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'eduRecord.label', default: 'EduRecord'), params.id])}"
                redirect(controller:"profile", action: "myprofile")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'eduRecord.label', default: 'EduRecord'), params.id])}"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eduRecord.label', default: 'EduRecord'), params.id])}"
            redirect(controller:"profile", action: "myprofile")
        }
    }
	
	Map getDateRange(Profile profile){
		def sYear=new Date()[Calendar.YEAR]+5
		def eYear=1940
		if(profile.birth){
			eYear=profile.birth[Calendar.YEAR]+6
		}
		return [sYear:sYear,eYear:eYear]
	}
}

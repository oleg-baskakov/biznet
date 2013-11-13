package joberty

import grails.converters.JSON
import joberty.calendar.CalendarEvent

class CalendarController {

	def profileService
	
    def index = { 
		
		Profile profile=profileService.getCurrentProfile(session)
		if(!profile){
			redirect(controller:'profile',action:'myprofile')
			return
		}
			
		Calendar calendar=Calendar.findByOwner(profile)
		def events=[]
		java.util.Calendar nowDate=java.util.Calendar.getInstance()
		nowDate.set(java.util.Calendar.DATE,1)
		def startMonth=nowDate.getTime()
		nowDate.set(java.util.Calendar.DATE,nowDate.getActualMaximum(java.util.Calendar.DATE))
		def endMonth=nowDate.getTime()
		
		if(!calendar){
			calendar=new Calendar(owner:profile)
			def res=calendar.save(flush:true)
			
		}else{
			try{
				events=CalendarEvent.findAll("from CalendarEvent e where e.calendar=:cal and (e.startDate>=:sm and e.endDate<=:em)",[cal:calendar, sm:startMonth, em:endMonth])
			}catch(Exception e){
				log.error(e)
				
			}

		}
		[calendar:calendar, profile:profile,events:events]
		
	}
	
	
	def createEventAx={
		def result=[code:'error',result:'']
		def parm=params
		if(!params.title||!params.start){
			result.code='error'
			result.result="Requested params didn't set"
			render result  as JSON
			return
		}
		
		Profile profile=profileService.getCurrentProfile(session)
		Calendar calendar=Calendar.findByOwner(profile)
		if(!profile||!calendar){
			result.result="User did't found"
			render result  as JSON
			return
		}
		CalendarEvent event=new CalendarEvent(title:params.title, description:params.description)
	//	String dateFormat="dd.mm.yyyy HH:mm:ss"
		//event.startDate=new Date().parse(dateFormat, params.start)
		event.startDate=new Date(params.long('start'))
		event.endDate=new Date(params.long('end'))
		event.calendar=calendar
		//event.endDate=new Date().parse(dateFormat, params.end)
		if(params.boolean('allDay'))
			event.allDay=true
		if(params.url){
			event.url=params.url
		}
		if(event.save(flush:true)){
			result.code='ok'
			calendar.addToEvents(event).save(flush:true)
		}else{
			result.code='error'
			result.result="Internal server error"

		}
			render result  as JSON
			
	}
}

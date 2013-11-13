package joberty

class StatsService {

    static transactional = true
	def  profileService
	
    def register(request,session,String controller,String action,params) {
		def profile=profileService.getCurrentProfile(session)
		String ip=request.getRemoteAddr()
		StatRecord rec=new StatRecord(controller:controller, action:action, user:profile, userIP:ip)
		if(params.id){
			def idval=Long.parseLong(params.id)
			rec.objectId=idval
		}
		if(!rec.save(flush:true)){
			log.error("error create stat resord for $controller $action ip=$ip, profile=$profile?.fullName \n message:${rec.errors}")
			println("error create stat resord for $controller $action ip=$ip, profile=$profile?.fullName \n message:${rec.errors}")
			
		}
    }

	def registerAction(Profile profile,long objectId,String controller,String action) {

		StatRecord rec=new StatRecord(controller:controller, action:action, user:profile, userIP:"",objectId:objectId)
//		rec.objectId=objectId
			
		if(!rec.save(flush:true)){
			log.error("error create stat resord for $controller $action ip=$ip, profile=$profile?.fullName \n message:${rec.errors}")
			println("error create stat resord for $controller $action ip=$ip, profile=$profile?.fullName \n message:${rec.errors}")
			
		}
	}

}

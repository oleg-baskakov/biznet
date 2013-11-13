package joberty

class MessageService {

    static transactional = true
	def profileService
	
    def getMessages() {

    }
	
	int getNewMessages(session){
		int msgsTotalNew=0
			Profile profile=profileService.getCurrentProfile(session)


			msgsTotalNew=Message.countByToAndIsNew(profile,true)
		return msgsTotalNew
		
	}
	Message sendMessage(Profile profile,params){
		//def result=false
		
		Message msg= new Message(params)
		//workRecordInstance.properties=params
		msg.from=profile
		
		if(params.mtype){
			msg.type=params.mtype
		}else
			msg.type=Message.TYPE_USER_MSG
		msg.status=Message.STATUS_SEND
		msg.sendDate=new Date()
		if (msg.save(flush: true)) {
			Inbox inbox=getInbox(msg.to)
			if(!inbox)return null
			
			inbox.addToInbx(msg)
			inbox.save(flush:true)
			
//			Message origMsg=new Message(params)
//			origMsg.from=profile
//			origMsg.type=msg.type
//			origMsg.status=msg.status
//			origMsg.sendDate=msg.sendDate
//			if(origMsg.save(flush:true)){
			
			Inbox senderInbox=getInbox(profile)
			senderInbox.addToSent(msg).save(flush:true)
//			}else{
//				return false
//			}
			
		}
		return msg
		


	}
	
	
	Inbox getInbox(profile){
		if(!profile)
			return null
			
		Inbox inbox=Inbox.findWhere(user:profile)
		if(!inbox){
			inbox=new Inbox(user:profile)
			inbox.save(flush:true)
		}
		return inbox
	}
}

package joberty

class InboxController {
	def profileService
	def messageService
	
    def index = {
		
		params.max = Math.min(params.max ? params.int('max') : 3, 100)
		params.sort="sendDate"
		params.order="desc"
		def profile=profileService.getCurrentProfile(session)
		int folder=Inbox.BOXTYPE_INBOX
		if(params.id){
			folder=params.int("id")
			params.remove("id")
		}
//		Inbox inbox=Inbox.findByProfile(profile)
//		if(!inbox){
//			redirect(controller:"main")
//		}
		def msgsTotal=0
		def msgsTotalNew=Message.countByToAndStatus(profile,1)
		def msgs=[]
		String title
		String hql,hqlCount
		
		if(folder==Inbox.BOXTYPE_SENT){
			hql="select m from Message m, joberty.Inbox inbx where m in elements(inbx.sent) and inbx.user.id=:profileId order by m.sendDate desc"
			msgs=Message.executeQuery(hql,[profileId:profile.id],params)
			hqlCount="select count(elements(inbx.sent)) from joberty.Inbox inbx where inbx.user.id=:profileId "
			msgsTotal=Message.executeQuery(hqlCount,[profileId:profile.id])[0]
			title="${message(code: 'inbox.sent.title', default:'Sent')}"
			
		}else if(folder==Inbox.BOXTYPE_TRASH){
			hql="select m from Message m, joberty.Inbox inbx where m in elements(inbx.trash) and inbx.user.id=:profileId order by m.sendDate desc"
			msgs=Message.executeQuery(hql,[profileId:profile.id],params)
			hqlCount="select count(elements(inbx.trash)) from joberty.Inbox inbx where inbx.user.id=:profileId "
			msgsTotal=Message.executeQuery(hqlCount,[profileId:profile.id])[0]

//			msgs=Message.findAllByToAndStatus(profile,Message.STATUS_DELETED)
//			msgsTotal=Message.countByToAndStatusGreaterThan(profile,Message.STATUS_DELETED)

			title="${message(code: 'inbox.trash.title', default:'Trash')}"
			
		}else{
			hql="select m from Message m, joberty.Inbox inbx where m in elements(inbx.inbx) and inbx.user.id=:profileId order by m.sendDate desc"
			msgs=Message.executeQuery(hql,[profileId:profile.id],params)
			hqlCount="select count(elements(inbx.inbx)) from joberty.Inbox inbx where inbx.user.id=:profileId "
			msgsTotal=Message.executeQuery(hqlCount,[profileId:profile.id])[0]

//			msgs=Message.findAllByToAndStatusGreaterThanEquals(profile,Message.STATUS_SEND,params)
//			msgsTotal=Message.countByToAndStatusGreaterThanEquals(profile,Message.STATUS_SEND)

			if(msgsTotalNew){
				title="${message(code: 'inbox.title', default:'Inbox')}(${msgsTotalNew})"
			}else
				title="${message(code: 'inbox.title', default:'Inbox')}"
		}

		[msgs: msgs, msgsTotal:msgsTotal, msgsTotalNew:msgsTotalNew, title:title, folder:folder ]
 
		 }

	def show = {
		def msg
		def profile=profileService.getCurrentProfile(session)
		
		if(params.id)
			 msg = Message.findByToAndId(profile,params.id)
		if (!msg) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
			redirect(action: "index")
		}
		else {
			msg.status=Message.STATUS_READED
			msg.isNew=false
			msg.save(flush:true)
			[msg: msg,folder:params.folder]
		}
	}
	
	def delete = {
		
		Message msg=null
		def profile=profileService.getCurrentProfile(session)
		if(!params.id||!params.folder){
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])}"
			redirect(action: "index")

		}
		int id=params.int("id")
		int folder=params.int("folder")
		Inbox inbox=messageService.getInbox(profile)
		def result=false
		if(folder==Inbox.BOXTYPE_INBOX){
			msg = inbox.inbx.find{ 
				if(it.id==id)return it}
			if(msg){
				result=inbox.removeFromInbx(msg).addToTrash(msg).save(flush:true)
				
			}
		}else if(folder==Inbox.BOXTYPE_SENT){
			msg = inbox.sent.find{if(it.id==id)return it}
			if(msg){
				result=inbox.removeFromSent(msg).addToTrash(msg).save(flush:true)
			}
		}else {
			msg = inbox.trash.find{if(it.id==id)return it}
			if(msg){
				result=inbox.removeFromTrash(msg).addToTrash(msg).save(flush:true)
			}

		}
		if (result) {
				
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'message.label', default: 'Message'), params.id])}"
				redirect(action: "index",id:folder )
		}
		else {
			flash.error = "${message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])}"
			redirect(action: "index")
		}
	}
	
	def reply={
		
		Message parentMsg
		def profile=profileService.getCurrentProfile(session)
		if(params.id)
			parentMsg = Message.findByToAndId(profile,params.id)

		Message msg=new Message()
		if (parentMsg) {
			msg.parent=parentMsg
			
			msg.status=Message.STATUS_DRAFT
			msg.type=Message.TYPE_USER_MSG
			msg.theme="RE:${parentMsg.theme}"
			msg.msg="\n</br>----\n</br>${parentMsg.msg}"
			msg.to=parentMsg.from
			
			
//			if(!msg.save(flush:true)){
//				log.error("Can't save reply message for msg=${msg}")
//			}
			
		}
		[msg:msg]
	}

	def send={
		def profile=profileService.getCurrentProfile(session)
		if(!profile){
			redirect(action:'index')
			return
		}
		if(!params.msg){
			flash.error="${message(code: 'message.error.blank-message',default:'Blank message field error')}"
			render(view: "reply", model:[msg:new Message(params)])
			return
		}
		def msg=messageService.sendMessage(profile,params)
		
		if (msg) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'inbox.message.label', default: 'New Message'), msg.id])}"
			redirect(action:'index')
		}else
			render(view: "reply", model:[msg:msg])
//		else {
//			render(view: "create", model: [workRecordInstance: workRecordInstance])
//		}

	}
	
	def sendAjax = {
		def profile=profileService.getCurrentProfile(session)
		if(!profile){
			flash.error="${message(code: 'message.error.send',default:'Sending message error')}"
			render(view: "newMsgRecord", model:[msg:null])
			return
		}
		
		if(!params.msg){
			flash.error="${message(code: 'message.error.blank-message',default:'Blank message field error')}"
			render(view: "newMsgRecord", model:[msg:new Message(params)])
			return
		}
		def msg=messageService.sendMessage(profile,params)
		
		if (msg) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'inbox.message.label', default: 'New Message'), msg.id])}"
		}
			render(view: "newMsgRecord", model:[msg:msg])

	}

}

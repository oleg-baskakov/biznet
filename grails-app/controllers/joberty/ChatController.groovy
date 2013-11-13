package joberty

class ChatController {
	
	def profileService
	def messageService
	def chatService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
		
		Profile myprofile=profileService.getCurrentProfile(session)
		Profile profile=Profile.get(params.id)
		if(!myprofile||!profile){
			redirect(action: "index",controller:"home")
			return
		}
		def chat=chatService.getChat(profile,Profile.get(myprofile.id))
		if(!chat){
			log.error("ChatController.index","Error saving new chat")
			redirect(action: "index",controller:"home")
			return
		}
		[chat:chat,myprofile:myprofile, profile:profile, inv:params.inv?:""]
		//Chat chat=
        //redirect(action: "list", params: params)
    }
	
	def sendInviteAx={
		
		//!!add  validation check for invites of other users
		Profile receiver=Profile.get(params.id)
		Profile sender=profileService.getCurrentProfile(session)
		String msg=""
		if(!sender||!receiver){
			msg="error of sending invitation"
		}else{
			def msgParams=[:]
			String chatLink;
			def chat=chatService.getChat(receiver,sender)
			if(!chat){
				msg="error of sending invitation"
				
			}else{
				chatLink=link(action:"index",id:sender.id, params:[inv:"1"]){"Chat with ${sender.fullName}"}
				msgParams.to=receiver
				msgParams['mtype']=joberty.Message.TYPE_CHAT_INVITE
				msgParams.msg=message(code:"chat.invite.msg",args:[sender.fullName, chatLink],
					default:"{0} invite You to video chat.<br>  Please follow the link:${chatLink}")
				msgParams.theme=message(code:"chat.invite.theme",default:"Chat invitation")
				def invitation=messageService.sendMessage( sender, msgParams)
				if(invitation){
					msg= "Invitation has been sent"
				}else{
					msg= "Invitation has not been sent"
				}
			}
		}
			render msg
	}
	
	def exit = {
		def chatInstance = new Chat(params)
		chatInstance.status=Chat.STATUS_CLOSED;
		if (chatInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'chat.label', default: 'Chat'), chatInstance.id])}"
		}
		else {
				log.error("Error saving  chat")
		}
		redirect(action: "myprofile", controller:"profile")
		
	}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [chatInstanceList: Chat.list(params), chatInstanceTotal: Chat.count()]
    }

    def create = {
        def chatInstance = new Chat()
        chatInstance.properties = params
        return [chatInstance: chatInstance]
    }

    def save = {
        def chatInstance = new Chat(params)
        if (chatInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'chat.label', default: 'Chat'), chatInstance.id])}"
            redirect(action: "show", id: chatInstance.id)
        }
        else {
            render(view: "create", model: [chatInstance: chatInstance])
        }
    }

    def show = {
        def chatInstance = Chat.get(params.id)
        if (!chatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chat.label', default: 'Chat'), params.id])}"
            redirect(action: "list")
        }
        else {
            [chatInstance: chatInstance]
        }
    }

    def edit = {
        def chatInstance = Chat.get(params.id)
        if (!chatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chat.label', default: 'Chat'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [chatInstance: chatInstance]
        }
    }

    def update = {
        def chatInstance = Chat.get(params.id)
        if (chatInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (chatInstance.version > version) {
                    
                    chatInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'chat.label', default: 'Chat')] as Object[], "Another user has updated this Chat while you were editing")
                    render(view: "edit", model: [chatInstance: chatInstance])
                    return
                }
            }
            chatInstance.properties = params
            if (!chatInstance.hasErrors() && chatInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'chat.label', default: 'Chat'), chatInstance.id])}"
                redirect(action: "show", id: chatInstance.id)
            }
            else {
                render(view: "edit", model: [chatInstance: chatInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chat.label', default: 'Chat'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def chatInstance = Chat.get(params.id)
        if (chatInstance) {
            try {
                chatInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'chat.label', default: 'Chat'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'chat.label', default: 'Chat'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chat.label', default: 'Chat'), params.id])}"
            redirect(action: "list")
        }
    }
}

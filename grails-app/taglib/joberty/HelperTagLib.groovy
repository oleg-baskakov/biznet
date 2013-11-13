package joberty

class HelperTagLib {
	
	static namespace="joberty"
	def messageService
	
	def inboxtitle={
		
		def newMsgs=messageService.getNewMessages(session)
		def data=newMsgs>0?'Inbox('+newMsgs+')':'Inbox' 
		out<< data
	}

}

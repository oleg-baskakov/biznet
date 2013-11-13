package joberty

class ChatService {

    static transactional = true
	def profileService
	
    def getChat(Profile user1, Profile user2) {
		def hql="from Chat c where :p1 in elements(c.members) and  :p2 in elements(c.members) and c.status=0"
		def chat=Chat.find(hql,[p1:user1,p2:user2],[max:1])
		if(!chat){
			String roomId=user2.id+user1.id+System.currentTimeMillis()
			roomId=roomId.encodeAsMD5()
			Chat newchat=new Chat(roomId:roomId)
			if(!newchat.save(flush:true)){
				return null
			}
			newchat.addToMembers(user1)
			newchat.save(flush:true)
			newchat.addToMembers(user2)
			newchat.save(flush:true)
			chat=newchat
		}
		return chat

    }
}

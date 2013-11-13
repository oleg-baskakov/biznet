package joberty.chat

import joberty.Profile
import joberty.Chat

class ChatMessage {

	String message 
	Date dateCreated
	Profile from
	
	static belongsTo={chat:Chat}  
	
    static constraints = {
    }
}

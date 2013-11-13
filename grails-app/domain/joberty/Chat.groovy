package joberty

import java.util.Date;
import joberty.chat.ChatMessage

class Chat {
	public static final int STATUS_NEW=0
	public static final int STATUS_CLOSED=5
	
	String roomId
	int status=0//0-new,1-closed,2-deleted
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany=[members:Profile, messages:ChatMessage]
	
    static constraints = {
    }
}

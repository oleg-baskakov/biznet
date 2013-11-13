package joberty

import java.util.Date;

class Message {
	
	static final int TYPE_USER_MSG=0
	static final int TYPE_PROMO_MSG=1
	static final int TYPE_CHAT_INVITE=2
	
	static final int STATUS_DELETED=-1
	static final int STATUS_DRAFT=0
	static final int STATUS_SEND=5
	static final int STATUS_READED=10
	
	Profile from
	Profile to
	String msg
	int type=0 //
	int status
	boolean isNew=true
	String theme
	Date sendDate
//	@Solr(field="dateCreated_tdt")
	Date dateCreated
	
//	@Solr(field="dateUpdated_tdt")
	Date lastUpdated
	Message parent
	
    static constraints = {
		theme(nullable:true, maxLength:386)
		parent(nullable:true)
		sendDate(nullable:true)
		msg(maxLength:8128)
    }
	
	static mapping={
		msg type:"text"
	}
	
}

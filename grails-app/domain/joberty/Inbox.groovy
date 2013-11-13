package joberty

class Inbox {
	
	static final int BOXTYPE_INBOX=0
	static final int BOXTYPE_SENT=1
	static final int BOXTYPE_TRASH=2
	
	Profile user
	
	
	static hasMany=[inbx:Message,sent:Message,trash:Message]
	

    static constraints = {
    }
}

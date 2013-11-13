package joberty

import java.util.Date;

class StatRecord {
	
	public static final int TYPE_JOBPROMO=0
	public static final int TYPE_PROFILE=1
	public static final int TYPE_COMPANY=2
	public static final int TYPE_CHAT=3
	
//	public static final int ACTION_OPEN=0
//	public static final int ACTION_=
//	public static final int ACTION_=
	
	Profile user
	//int objectType
	String controller
	String action
	long objectId=-1
	//int action
	String info
	String userIP
	Date dateCreated
	Date lastUpdated

    static constraints = {
		info(nullable:true)
		userIP(nullable:true)
		user(nullable:true)
		action(nullable:true)
		
    }
}

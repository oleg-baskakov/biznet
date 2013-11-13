package joberty
import joberty.calendar.CalendarEvent
class Calendar {

	Profile owner
	
	static hasMany=[events:CalendarEvent]
    static constraints = {
    }
	static mapping={
		events sort:"startDate", order:"desc"
		
		}

}

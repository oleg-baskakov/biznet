package joberty.calendar

import joberty.Calendar

class CalendarEvent {

	
	String title
	boolean allDay=false
	Date startDate
	Date endDate
	String url
	String description
	
	Calendar calendar
	
    static constraints = {
		url(nullable:true)
		description(nullable:true)
		endDate(nullable:true)
		
		
    }
}

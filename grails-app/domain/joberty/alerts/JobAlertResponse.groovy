package joberty.alerts

import java.util.Date;

import joberty.JobAlert
import joberty.promo.JobPromo

class JobAlertResponse {
	
	public final static int STATUS_NEW=10
	public final static int STATUS_READ=20
	public final static int STATUS_DELETED=30

	JobAlert alert
	JobPromo promo
	int status=STATUS_NEW
	Date dateCreated
	Date lastUpdated

    static constraints = {
    }
}

package joberty.dic

class Salary {

	public final static int TYPE_HOURLY=10
	public final static int TYPE_DAILY=20
	public final static int TYPE_MONTHLY=30
	public final static int TYPE_ANNUAL=40
	public final static int TYPE_CONTRACT=50
	
	
	long amount
	double baseRate //recount of user's amout to salary per hour
	int type
	Currency currency
	
    static constraints = {
    }
}

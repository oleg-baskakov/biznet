package joberty.dic

class Currency {

		String name
		String forexname
		char symbol
		float rate
		Date rateDate
		
    static constraints = {
		symbol(nullable:true)
    }
}

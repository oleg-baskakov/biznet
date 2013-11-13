package joberty.dic

import java.util.Date;

class School {
	static enableSolrSearch = true
	static solrAutoIndex = true

	String name
	int creationType=0 //0-user added, 1- imported, 
	String type
	City city
	Date dateCreated
	Date lastUpdated

    static constraints = {
		type(nullable:true)
		city(nullable:true)
    }
}

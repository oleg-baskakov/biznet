package joberty.dic

import java.util.Date;
import joberty.Profile
import joberty.User
import org.grails.solr.Solr

class Company {

	static enableSolrSearch = true
	static solrAutoIndex = true
	
	String name
	String website

	@Solr(ignore=true)
	Date dateCreated
	@Solr(ignore=true)
	Date lastUpdated

	City city
	Industry industry
	String size
	String highlights
	int type=0//0-user created,1-imported,2-owner created
	User owner
	
    static constraints = {
		website(nullable:true)
		industry(nullable:true)
		city(nullable:true)
		owner(nullable:true)
		highlights(nullable:true, maxLength:2048)
		size(inList:["small","medium","large"],nullable:true)
    }
}

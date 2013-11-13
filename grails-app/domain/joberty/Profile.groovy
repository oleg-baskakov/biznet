	package joberty

import java.util.Date;
import joberty.dic.City
import joberty.dic.Country
import joberty.dic.Industry
import org.grails.solr.Solr

class Profile {
	
	static enableSolrSearch = true
	static solrAutoIndex = true

	@Solr(ignore=true)
	User user
	@Solr(field="prf_profession_s")
	String profession
	@Solr(field="prf_city_s")
	City city	
	Country country
	@Solr(field="prf_industry")
	Industry industry
	@Solr(field="prf_fullName_s")
	String fullName
	@Solr(field="prf_sex_i")
	int sex=2 // 0-male, 1-female, 2-unknown
	@Solr(field="prf_info_t")
	String info
	@Solr(field="prf_birth_tdt")
	Date birth
	@Solr(field="prf_experienceLevel_s")
	String experienceLevel
	@Solr(field="prf_status_t")
	String status
	@Solr(field="dateCreated_tdt")
	Date dateCreated
	@Solr(field="dateUpdated_tdt")
	Date lastUpdated
	@Solr(field="prf_keywords_t")
	String keywords

	
	static hasMany=[workRecords:WorkRecord, eduRecords:EduRecord]
	static mapping={ 
		workRecords sort:"startDate", order:"desc"
		eduRecords sort:"startDate", order:"desc"
		}
	
	static constraints = {
		
		user(nullable:false)
		profession(nullable:true)
		city(nullable:true, blank:true)
		country(nullable:true)
		industry(nullable:true, blank:true)
		fullName(nullable:true)
		info(nullable:true)
		birth(nullable:true)
		experienceLevel(nullable:true)
		status(nullable:true)
		birth(nullable:true)
		experienceLevel(inList:["Student/Intern","Entry Level","Professional/Experienced","Manager/Supervisor","Executive"])
		keywords(nullable:true)
    }
}

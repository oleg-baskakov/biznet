package joberty

import java.util.Date;
import joberty.dic.School
import org.grails.solr.Solr

class EduRecord {

	
	static enableSolrSearch = true
	static solrAutoIndex = true

	@Solr(field="er_degree_s")
	String degree
	@Solr(field="er_studyField_t")
	String studyFields
	@Solr(field="er_startDate_tdt")
	Date startDate
	@Solr(field="er_endDate_tdt")
	Date endDate
	@Solr(field="er_desc_t")
	String description
	@Solr(field="er_awards_t")
	String awards
	@Solr(field="er_school")
	School school
	Date dateCreated
	Date lastUpdated
	@Solr(field="er_keywords_t")
	String keywords

	static belongsTo=[profile:Profile]
	
    static constraints = {
		degree(nullable:true)
		studyFields(nullable:true)
		startDate(nullable:true)
		startDate(nullable:true)
		endDate(nullable:true)
		description(nullable:true)
		description(nullable:true)
    }
}

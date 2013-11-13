package joberty

import java.util.Date;
import joberty.dic.Company
import joberty.dic.JobPosition;
import org.grails.solr.Solr

class WorkRecord {
	
	static enableSolrSearch = true
	static solrAutoIndex = true

	@Solr(field="wr_company")
	Company company
	@Solr(field="wr_position")
	JobPosition position
	@Solr(field="wr_jobType_s")
	String jobType
	@Solr(field="wr_startDate_tdt")
	Date startDate
	@Solr(field="wr_endDate_tdt")
	Date endDate
	@Solr(field="wr_desc_t")
	String description
	@Solr(ignore=true)	
	boolean currentJob=false
	@Solr(field="wr_keywords_t")
	String keywords
	
	Date dateCreated
	Date lastUpdated

	static belongsTo=[profile:Profile]
    static constraints = {
		description(maxLength:1024, blank:true)
		keywords(nullable:true)
		
		jobType(inList:["Full time employee","Part time employee","Intern",
			"Freelancer","Owner","Partner","Board member","Volunteer"])
    }
	
}

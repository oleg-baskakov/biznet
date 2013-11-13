package joberty

import java.util.Date;

import joberty.dic.City;
import joberty.dic.Industry;
import joberty.dic.JobPosition;
import org.grails.solr.Solr

class Group {
	
	static enableSolrSearch = true
	static solrAutoIndex = true

	public final static int STATUS_CREATED=10
	public final static int STATUS_DELETED=20

	public final static int TYPE_OPEN=0
	public final static int TYPE_PRIVATE=1
	
	Profile creator
	@Solr(field="g_title_t")
	String title
	@Solr(field="g_info_t")
	String info 
	@Solr(field="g_industry")
	Industry industry
	int status=STATUS_CREATED
	int type=TYPE_OPEN
	
	@Solr(field="g_dateCreated_tdt")
	Date dateCreated
	@Solr(field="g_dateUpdated_tdt")
	Date lastUpdated
	@Solr(field="g_keywords_t")
	String keywords

	static hasMany=[]
	
	static mapping={
		table name:'usergroup'
	}
	static constraints = {
		industry(nullable:true)
		keywords(nullable:true)
		title(maxLength:512)
		info(nullable:true, maxLength:2048)
		
	}
}

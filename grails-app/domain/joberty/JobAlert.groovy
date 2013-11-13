package joberty

import java.util.Date;

import joberty.dic.City
import joberty.dic.Industry
import joberty.dic.JobPosition
import joberty.promo.JobPromo
import org.grails.solr.Solr

class JobAlert {
	
	static enableSolrSearch = true
	static solrAutoIndex = true

	public final static int STATUS_CREATED=10
	public final static int STATUS_DELETED=20

	Profile creator
	@Solr(field="ja_title_t")
	String title
	@Solr(field="ja_query_t")
	String query
	@Solr(field="ja_city")
	City city
	@Solr(field="ja_country")
	City country
	int status=STATUS_CREATED
	@Solr(field="ja_industry")
	Industry industry
	@Solr(field="ja_position")
	JobPosition position
	@Solr(field="ja_dateCreated_tdt")
	Date dateCreated
	@Solr(field="ja_dateUpdated_tdt")
	Date lastUpdated
	@Solr(field="ja_keywords_t")
	String keywords

	static constraints = {
		city(nullable:true)
		industry(nullable:true)
		position(nullable:true)
		keywords(nullable:true)
		title(nullable:true)
		query(nullable:true)
	}

	
}

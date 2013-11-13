package joberty.promo

import java.util.Date;

import joberty.Profile
import joberty.dic.City
import joberty.dic.Currency
import joberty.dic.Company
import joberty.dic.Salary
import joberty.dic.Skill
import joberty.dic.Country
import joberty.dic.JobPosition
import org.grails.solr.Solr

class JobPromo {
	static enableSolrSearch = true
	static solrAutoIndex = true
	
	public final static int TYPE_BASIC=10
	public final static int TYPE_ADVANCED=20
	public final static int TYPE_PREMIUM=30

	public final static int TYPE_FEATURED=40
	
	public final static String STATUS_CREATED='created'
	public final static String STATUS_PAID='paid'
	public final static String STATUS_PUBLISHED='published'
	public final static String STATUS_CLOSED='closed'
	public final static String STATUS_DELETED='deeted'
	
	Profile creator
	@Solr(field="jp_title_t")
	String title
	@Solr(field="jp_body_t")
	String body
	@Solr(field="jp_city")
	City city
	@Solr(field="jp_country")
	Country country
	@Solr(field="jp_position")
	JobPosition position
	String companyDesc
	@Solr(field="jp_company")
	Company company
	@Solr(field="jp_type_i")
	int type=TYPE_BASIC
	boolean isPaid=false
	@Solr(field="jp_startdate_tdt")
	Date startDate
	@Solr(field="jp_position_s")
	String positionType
	@Solr(field="jp_jobduration_s")
	String jobDuration
	@Solr(field="jp_minsalary_d")//
	double minSalary
	@Solr(field="jp_maxsalary_d")//
	double maxSalary
	@Solr(field="jp_currency")//
	Currency currency
	@Solr(field="jp_status_s")//
	String status=STATUS_CREATED
	@Solr(field="jp_dateCreated_tdt")
	Date dateCreated
	@Solr(field="jp_dateUpdated_tdt")
	Date lastUpdated
	@Solr(field="jp_keywords_t")
	String keywords

	static hasMany=[skills:Skill]
    static constraints = {
		title(maxLength:768)
		city(nullable:true)
		companyDesc(nullable:true)
		company(nullable:true)
		startDate(nullable:true)
		jobDuration(nullable:true)
		positionType(inList:[JobPosition.TYPE_CONTRACT,JobPosition.TYPE_PERMANENT,JobPosition.TYPE_FREELANCE])
		
    }
}

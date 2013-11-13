package joberty

import joberty.alerts.JobAlertResponse
import joberty.promo.JobPromo
import org.apache.solr.client.solrj.SolrQuery
import org.apache.solr.client.solrj.response.QueryResponse
import org.grails.solr.SearchResults

class JobAlertService {

    static transactional = true

	def searchService
	def solrService
	def statsService
	
    def generateKeywords(JobAlert alert) {
		def keywords=''
		if(!alert)return ''
		
		if(alert.city){
			keywords+=alert.city.name+','+alert.city.country?.name+','
		}
		else if(alert.country){
			keywords+=alert.country?.name+','
		}
		
		if(alert.position){
			keywords+=alert.position.name+','
		}
		
		if(alert.industry){
			keywords+=alert.industry.name+','
		}
		return keywords
    }

	
	def keywords2query(String keywords){
		
		def result=""
		def splitted=keywords.split(",")
		int i=1;
		for(entry in splitted){
			
			//result+="\"${entry}\""//
			result+=searchService.prepareQuery(entry)			
			if(i++<splitted.size()){
				result+=" OR "
			}
		}
		return result
	}

		
	def findAlertsForPromo(JobPromo promo){
		
		List fq = []
		//def queryStr="desc_s:${params.q}  fullName_s:${params.q} info_s:${params.q}"
		if(!promo)return false
		
		
		//def queryStr=searchService.prepareQuery(promo.keywords)
		def withFields=""
		if(promo.city)
			withFields+="ja_city:\"${promo.city}\" ja_country:\"${promo.country}\" "
		else if(promo.country)
			withFields+=" ja_country:\"${promo.country}\"  "
		
		if(promo.position)
			withFields+=" ja_position:\"${promo.position}\"  "
		
		def queryStr=keywords2query(promo.keywords)
		if(queryStr){
			withFields+="ja_keywords_t:(${queryStr})"
		}
		if(promo.title){
			//queryStr=searchService.prepareQuery(promo.title)
		//	withFields+="ja_query_t:${queryStr} ja_title_t:${queryStr}"
			withFields+="ja_query_t:(${promo.title}) ja_title_t:(${promo.title})"
		}
		//_fullName_s:${queryStr} prf_info_t:(${params.q}) prf_keywords_t:(${params.q}) wr_keywords_t:(${params.q}) wr_desc_t:(${params.q})  er_keywords_t:(${params.q}) er_desc_t:(${params.q}) er_awards_t:(${params.q})  "
		def query = new SolrQuery(withFields)
//		if(params.offset)
//		  query.setStart(params.offset as int)
//		if(params.max)
//		  query.setRows(params.max as int)
  
		SearchResults  res=solrService.search(query)
		def resultList=res.getResultList()
//		QueryResponse qr=res.getQueryResponse()

//		def searchResults=[:]
		int total=res.getTotal()
		String key=""
		SearchResult searchResult
		resultList.each {
			
			if(it.doctype=="joberty.JobAlert"){
				JobAlert alert=JobAlert.get(it.id)
				JobAlertResponse resp=new JobAlertResponse(alert:alert,promo:promo)
				def result=resp.save(flush:true)
				if(!result){
					log.error("can't save JobAlertResponse a:p=${resp.alert}:${resp.promo} error:${resp.errors}")
				}else{
					statsService.registerAction(alert.creator,promo.id,"jobPromo","alertResponse")
				
				}
			}
			
		}

	}
}

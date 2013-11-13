package joberty

import org.apache.solr.client.solrj.SolrQuery
import org.apache.solr.client.solrj.response.QueryResponse
import org.grails.solr.SearchResults
import joberty.dic.*

class SearchService {

    static transactional = true
	def solrService
	
	
    String prepareQuery(String query) {

		def queryStr=query.replaceAll("[\\W^@]+", " ").trim()
		if(queryStr.indexOf(" ")>0){
			String[] split=queryStr.split(" ")
			StringBuffer result=new StringBuffer("(")
			split.each {
					 result.append("*${it}* ")
				}
			queryStr=result.append(")").toString()
			
		}else if(queryStr.indexOf("\"")>=0)
			queryStr="${queryStr}"
		else
			queryStr="*${queryStr}*"
		return queryStr
    }
	
	def searchProfile(params){
		List fq = []
		//def queryStr="desc_s:${params.q}  fullName_s:${params.q} info_s:${params.q}"
		if(!params.q)return
		
		def queryStr=prepareQuery(params.q)
		def withFields="prf_fullName_s:${queryStr} prf_info_t:(${params.q}) prf_keywords_t:(${params.q}) wr_keywords_t:(${params.q}) wr_desc_t:(${params.q})  er_keywords_t:(${params.q}) er_desc_t:(${params.q}) er_awards_t:(${params.q})  "
		def query = new SolrQuery(withFields)
		if(params.fq) {
		  query.addFilterQuery(params.fq)
		  if(params.fq instanceof String)
			fq << params.fq
		  else
			fq = params.fq
		}
		if(params.offset)
		  query.setStart(params.offset as int)
		if(params.max)
		  query.setRows(params.max as int)
  
		query.facet = true
		query.setFacetMinCount(1)
		query.setFacetLimit(10)
		query.setHighlight(true)
//		query.addHighlightField("prf_fullName_s")
//		query.addHighlightField("prf_profession_s")
		query.addHighlightField("prf_info_t")
		query.addHighlightField("er_desc_t")
		query.addHighlightField("wr_desc_t")
		
		def facetsNames=["prf_city_s":"City", "prf_industry":"Industry", "prf_sex_i":"Gender", "prf_experienceLevel_s":"Experience",
			 "wr_company":"Company","wr_position":"Job position","wr_job_type":"Job type","er_degree_s":"Study degree"]
		facetsNames.each { query.addFacetField(it.key) }
		//def res=solrService.search(query)
		SearchResults  res=solrService.search(query)
		def resultList=res.getResultList()
		QueryResponse qr=res.getQueryResponse()
		def hl=qr.getHighlighting()

		def searchResults=[:]
		int total=res.getTotal()
		String key=""
		SearchResult searchResult
		resultList.each { 
			
			if(it.doctype=="joberty.Profile"){
				if(searchResults.containsKey(it.id))
					return
				key=it.id
				Profile profile=Profile.get(it.id)
				if(!profile)return
				
				searchResult=new SearchResult(title:it.prf_fullName)
				searchResult.url.controller="profile"
				searchResult.url.id=it.id
				searchResult.info="${profile.profession}${profile.industry?'/'+profile.industry.name:''}${profile.city?', '+profile.city.name+', '+profile.country?.name:''}"
				if(hl['joberty.Profile-'+it.id]){
					
					searchResult.snippet=(hl['joberty.Profile-'+it.id].values()).join(". ")
					
				}else if(profile.info)
					searchResult.snippet=profile.info.substring(0,Math.min(512,profile.info.size()))
				
			}else if(it.doctype=="joberty.WorkRecord"){
				WorkRecord work=WorkRecord.get(it.id)
				Profile profile=work.profile
				if(searchResults.containsKey(profile.id))
					return
				key=profile.id
				searchResult=new SearchResult(title:profile.fullName)
				searchResult.url.controller="profile"
				searchResult.url.id=profile.id
				searchResult.info="${profile.profession}${profile.industry?'/'+profile.industry.name:''}${profile.city?', '+profile.city.name+', '+profile.country.name:''}"
				if(hl['joberty.WorkRecord-'+it.id]){
					searchResult.snippet=(hl['joberty.WorkRecord-'+it.id].values()).join(". ")
					
				}else if(profile.info)
					
					searchResult.snippet=profile.info.substring(0,Math.min(512,profile.info.size()))
				
			}else if(it.doctype=="joberty.EduRecord"){
				EduRecord rec=EduRecord.get(it.id)
				Profile profile=rec.profile
				if(searchResults.containsKey(profile.id))
					return
				key=profile.id
				searchResult=new SearchResult(title:profile.fullName)
				searchResult.url.controller="profile"
				searchResult.url.id=profile.id
				searchResult.info="${profile.profession}${profile.industry?'/'+profile.industry.name:''}${profile.city?', '+profile.city.name+', '+profile.country.name:''}"
				if(hl['joberty.EduRecord-'+it.id]){
					searchResult.snippet=(String)(hl['joberty.EduRecord-'+it.id].values()).join(". ")
					
				}else if(profile.info)
					searchResult.snippet=profile.info.substring(0,Math.min(512,profile.info.size()))
				
			}
			if(searchResult)
				searchResults[key]=searchResult
			key=""
			searchResult=null;
			
		}
		qr.getFacetFields().each {println("${it.name}- ${it}") }
		def facets=prepareFacets(facetsNames,params.q, fq, qr)
		[result:searchResults, total:total, q:params.q, fq: fq, solrQueryUrl: query.toString(),facets:facets]
	}
	
	
	
	def prepareFacets(facetsNames,q, def fq, QueryResponse qr){
		def result=[:]
		facetsNames.each { 
				def facet=[:]
				def filter=[]
				def field=qr.getFacetField(it.key)
				def currentFacetSelection
				fq.each { fqVal ->
					if(fqVal.contains(field.name)) {
					  // TODO: replace hardcoded style
					  currentFacetSelection = [q:q, fq: (fq - [fqVal] )]
					}
				  }
			
				
				if(field.values){
					field.values.each{
						facet=[:]
						if(field.name=="prf_city_s"){
							def entity=City.get(it.name.split("-")[1])
							if(!entity)
								return
							facet["name"]="${entity.name}, ${entity.country.name} (${it.count})"
						}
						else if(field.name=="prf_industry"){
							def entity=Industry.get(it.name.split("-")[1])
							if(!entity)
								return
							facet["name"]="${entity.name}(${it.count})"
						}
						else if(field.name=="wr_company"){
							def entity=Company.get(it.name.split("-")[1])
							if(!entity)
								return
							facet["name"]="${entity.name}(${it.count})"
						}
						else if(field.name=="wr_position"){
							def entity=JobPosition.get(it.name.split("-")[1])
							if(!entity)
								return
							facet["name"]="${entity.name}(${it.count})"
						}
						else if(field.name=="prf_sex_i"){
							String code="facet.sex.${it.name}"
							facet["name"]=code
							facet["msg"]=true
							facet["args"]=[it.count]
						}
						else{
							facet["name"]="${it.name}(${it.count})"
						}
						def linkParams = [:]
						linkParams.q = q
						linkParams.fq = fq.size() ? ([it.asFilterQuery] + fq) : [it.asFilterQuery]
			  
						facet["urlParams"]=linkParams
						if(currentFacetSelection)
							facet["selected"]=currentFacetSelection
							
						filter.add(facet)

					}
					result[it.value]=filter
				}
			}
		return result
		
	}

}

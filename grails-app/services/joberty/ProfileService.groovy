package joberty

import org.apache.solr.client.solrj.SolrQuery

class ProfileService {

    static transactional = true
	def solrService
    def getCurrentProfile(session) {
		
		if(!session.user)return null
				
		if(!session.profile){
				def profile=Profile.findByUser(session.user)
				if(!profile){
					profile=new Profile(user:session.user).save(flush:true)
				}
				session.profile=profile.id
		}
		return Profile.get(session.profile)
    }
	
	def generateKeywords(Profile profile){
		
		if(!profile)return ""
		
		String keywords=""
		if(profile.city)
			keywords+=",${profile.city.name},${profile.country?.name}"
		if(profile.industry)
			keywords+=",${profile.industry.name}"
		if(profile.profession)
			keywords+=",${profile.profession}"
		return keywords
		
	//		profile.keywords=keywords
	//		if (profile.save(flush: true)) {
	//			
	//		}
	//		else {
	//		}
	}

	def generateWorkRecordKeywords(WorkRecord work){
		
		if(!work)return ""
		
		String keywords=""
		if(work.company){
			keywords+=",${work.company.name}"
			if(work.company.industry)
				keywords+=",${work.company.industry.name}"
		}
		if(work.position)
			keywords+=",${work.position.name}"
		if(work.jobType)
			keywords+=",${work.jobType}"
		
		return keywords
	}

	def generateEduRecordKeywords(EduRecord rec){
		
		if(!rec)return ""
		
		String keywords=""
		if(rec.school){
			keywords+=",${rec.school.name}"
			if(rec.school.city)
				keywords+=",${rec.school.city.name},${rec.school.city.country?.name}"
		}
		if(rec.degree)
			keywords+=",${rec.degree}"
		if(rec.studyFields)
			keywords+=",${rec.studyFields}"
		
		return keywords
	}
}

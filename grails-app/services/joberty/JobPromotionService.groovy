package joberty

import joberty.promo.JobPromo

class JobPromotionService {

    static transactional = true
	public static final int STAT_TYPE_MONTH=1
	public static final int STAT_TYPE_WEEK=2
	public static final int STAT_TYPE_DAY=3
	
    def generateKeywords(JobPromo promo) {
		def keywords=''
		if(!promo)return ''
		
		if(promo.city){
			keywords+=promo.city.name+','+promo.city.country?.name+','
		}
		else if(promo.country){
			keywords+=promo.country?.name+','
		}
		
		if(promo.position){
			keywords+=promo.position.name+','
		}
		
		if(promo.companyDesc){
			keywords+=promo.companyDesc+','
		}

		if(promo.company){
			keywords+=promo.company.name+','
		}
		if(promo.positionType){
			keywords+=promo.positionType+','
		}
		if(promo.jobDuration){
			keywords+=promo.jobDuration+','
		}

//		if(promo.maxSalary&&promo.minSalary!=promo.maxSalary){
//			keywords+=promo.minSalary+promo.currency.forexname+'-'+promo.maxSalary+promo.currency.forexname+','
//		}else if(promo.minSalary){
//			keywords+=promo.minSalary+','
//		}
	
		return keywords
    }
	
	def purchasePromo(JobPromo jobPromo){
		jobPromo.status=JobPromo.STATUS_PAID
		jobPromo.isPaid=true
		if(!jobPromo.save(flush:true))
			return false
		
		return true
		
	}
	
	def getStatJobPromoViews(JobPromo promo, int type){
		
		def stats=[]
		if(type==STAT_TYPE_MONTH){
			stats=StatRecord.executeQuery("select count(*), month(dateCreated) as dt from StatRecord where controller=:controller and action=:action and objectId=:promoId group by month(dateCreated) order by month(dateCreated) desc",
				[controller:'jobPromo',action:'show', promoId:promo.id])
		}else if(type==STAT_TYPE_WEEK){
			stats=StatRecord.executeQuery("select count(*), week(dateCreated) as dt from StatRecord "+ 
			"where controller=:controller and action=:action and objectId=:promoId  group by week(dateCreated) order by week(dateCreated) desc",
				[controller:'jobPromo',action:'show', promoId:promo.id])
		}else if(type==STAT_TYPE_DAY){
			stats=StatRecord.executeQuery("select  UNIX_TIMESTAMP(DATE(dateCreated))*1000 as dt,count(*) from StatRecord "+ 
			"where controller=:controller and action=:action and objectId=:promoId  group by date(dateCreated) order by date(dateCreated) desc",
				[controller:'jobPromo',action:'show', promoId:promo.id])
		}
		stats=stats.reverse()
		return stats
	}

	def getStatJobPromoViewsByUsers(JobPromo promo, int type, int max, int offset){
		
		def stats=[]
//		if(type==STAT_TYPE_MONTH){
			stats=StatRecord.executeQuery("select  rec.user, max(rec.dateCreated),count(rec.user) from StatRecord rec where rec.controller=:controller and rec.action=:action and rec.objectId=:promoId  group by rec.user order by rec.dateCreated desc",
				[controller:'jobPromo',action:'show', promoId:promo.id],[max:max, offset:offset])
	//	}
		return stats
	}
	
	def getTotalJobPromoViews(JobPromo promo){
		
		def stats=[]
//		if(type==STAT_TYPE_MONTH){
			stats=StatRecord.executeQuery("select  count(distinct rec.user), count(rec.user) from StatRecord rec where rec.controller='jobPromo' and rec.action='show' and rec.objectId=:promoId ",[promoId:promo.id])
	//	}
		return stats[0]
	}

}

import joberty.*
import joberty.dic.*
import joberty.promo.JobPromo;
//import org.codehaus.groovy.grails.commons.GrailsApplication
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
//import org.codehaus.groovy.grails.commons.ApplicationHolder

//def book = ApplicationHolder.application.getClassForName("joberty.dic.Industry")
//	println('start')
//		["Financial","Technology","Utilities","Healthcare","Services","Consumer Goods"].each {
//			def ind=new Industry(name:it).save(flush:true)
//			println(ind)
//		}
class DBFiller{
	
	def ctx = AH.application.mainContext

def profileService=ctx.profileService

def indexProfiles(){
	
	def profiles=Profile.list()
	profiles.each{
		it.deleteSolr()
		it.keywords=profileService.generateKeywords(it)
		it.save(flush:true)
		it.indexSolr()
		println(""+it +":"+ it.keywords)
	}
}

def indexProfileRecs(){
	def res=EduRecord.list()
	res.each{
		it.deleteSolr()
		it.keywords=profileService.generateEduRecordKeywords(it)
		it.save(flush:true)
		it.indexSolr()
		println(""+it +":"+ it.keywords)
	}
	res=WorkRecord.list()
	res.each{
		it.deleteSolr()
		it.keywords=profileService.generateWorkRecordKeywords(it)
		it.save(flush:true)
		it.indexSolr()
		println(""+it +":"+ it.keywords)
	}
}
def indexJobs(){
		def res=JobPromo.list()
		res.each{
			it.indexSolr()
			println it
		}
		def alerts=JobAlert.list()
		alerts.each{
			it.indexSolr()
			println it
		}
}

def indexDics(){
//	def res=City.list()
//	res.each{
//		it.indexSolr()
//		println it
//	}
//	res=Company.list()
//	res.each{
//		it.indexSolr()
//		println it
//	}
	def res=Country.list()
	res.each{
		it.indexSolr()
		println it
	}
	def ind=Industry.list()
	ind.each{
		it.indexSolr()
		println it
	}
	def pos=JobPosition.list()
	pos.each{
		it.indexSolr()
		println it
	}
	def sch=School.list()
	sch.each{
		it.indexSolr()
		println it
	}
}

def currencyInit(){
	def currency=new Currency(name:'US Dollar',forexname:'USD',rate:1,rateDate:new Date(), symbol:'$')
	if(currency.save(flush:true))		println('currency ${currency.name} saved')
	currency=new Currency(name:'Euro',forexname:'EUR',rate:0.7366,rateDate:new Date(), symbol:'e')
	if(currency.save(flush:true))		println('currency ${currency.name} saved')
	currency=new Currency(name:'British Pound',forexname:'GBP',rate:0.61,rateDate:new Date(), symbol:'f')
	if(currency.save(flush:true))		println('currency ${currency.name} saved')
}

def calculateScore(){
	def credits=[7,7,7,7,15,15,10,10,10,8,8,8,8]
	def score=[73,63,60,66,73,72,78,64,61,56,68,66,67]
	
	float unit=credits.sum()
	println(unit)
	def weights=[]
	credits.eachWithIndex  { it,i->
			weights[i]=it/unit
	}
	
	println(weights)
	float result=0
	for(i in 0..credits.size()-1){
		result+=weights[i]*score[i]
//		println('..'+result+'--'+weights[i])
	}
	println(result)
}

def sampleQuery(){
	def stats=StatRecord.executeQuery("select count(*), month(dateCreated) as dt from StatRecord  group by month(dateCreated) order by month(dateCreated)")
	println(stats)
}

 def main(args){
	// indexProfiles()
	 //indexProfileRecs()
	 //indexDics()
	// currencyInit()
	 //calculateScore()
	 //indexJobs()
	 sampleQuery()
	 this.sleep 10000
	 
 }
}
import joberty.dic.Industry
//import org.codehaus.groovy.grails.commons.ApplicationHolder

//def book = ApplicationHolder.application.getClassForName("joberty.dic.Industry")
	println('start')
		["Financial","Technology","Utilities","Healthcare","Services","Consumer Goods"].each {
			def ind=new Industry(name:it);
			ind.save(flush:true)
			println(ind)
		}


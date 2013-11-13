package joberty

import com.grailsrocks.authentication.SignupForm

class HomeController {
	def geoIpService
	def searchService
	
    def index = { 
			def location = geoIpService.getLocation(request.getRemoteAddr())
			if(location){
				session.country=location.countryName
				session.city=location.city
				
			}
		
				render(view:"/index")
	}
	
	def login={
		
		render(view:"/login")
	}
	def register={
		render(view:"/register")
	}
	
	

	def search={
		def res=searchService.searchProfile(params)
		res
	}
}

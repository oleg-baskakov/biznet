package joberty

class StatFilters {
	def dependsOn=[AuthFilters]
	
    def filters = {
        all(controller:'*', action:'*') {
            before = {
				applicationContext.statsService.register(request,session, controllerName,actionName,params)
				return true

            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}

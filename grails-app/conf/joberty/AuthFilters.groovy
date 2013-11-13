package joberty

class AuthFilters {

	
	
    def filters = {
		
//		checkUserData(controller:'*', action:'*'){
//			after={model ->
//				model.newMsgs=messageService.getNewMessages(session)
//				
//			}
//		}
		
        createForAuth(controller:'(inbox|chat|calendar|jobAlert)', action:'.*',regex:true) {
            before = {
				return applicationContext.authenticationService.filterRequest(
					request, response,
					"${request.contextPath}/login.gsp" )

            }
        }
        updateForAuth(controller:'.*', action:'(update|edit|create)',regex:true) {
            before = {
				return applicationContext.authenticationService.filterRequest(
					request, response,
					"${request.contextPath}/login.gsp" )

            }
        }

		myprofileForAuth(controller:'profile', action:'myprofile' ) {
			before = {
				return applicationContext.authenticationService.filterRequest(
					request, response,
					"${request.contextPath}/login.gsp" )

			}
		}

		
		addForAuth(action:'add', find:true) {
            before = {
				return applicationContext.authenticationService.filterRequest(
					request, response,
					"${request.contextPath}/login.gsp" )

            }
        }

    }
}


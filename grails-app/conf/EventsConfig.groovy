import com.grailsrocks.authentication.AuthenticatedUser
import com.grailsrocks.authentication.AuthenticationService
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import org.springframework.web.context.request.RequestContextHolder
import org.springframework.web.context.request.RequestAttributes
//import com.grailsrocks.emailconfirmation.EmailConfirmationService

class EventsConfig {

	def ctx = AH.application.mainContext
	
	//def emailConfirmationService=ctx.emailConfirmationService
	
	public static authenticationEvents  = [
	// Called to validate the user's chosen login name, i.e. is it too short or in use? Return true if valid
	onValidateLogin:{ loginID -> true },
	// Called to validate the user's password, i.e. is it long enough/strong enough. Return true if valid
	onValidatePassword: { password -> true },
	// Called to encode the user's password prior to saving it, i.e. return digested/XOR'd password
	// Defaults to SHA1 hash, i.e. clear text in the database
	onEncodePassword: { password -> password?.encodeAsSHA1() },
	// Called to load the user object by login id, must retun the user object or null if not found
	onFindByLogin:{ loginID -> AuthenticationService.userDomainClass.findByLogin(loginID) },
	onFindByEmail:{ email -> AuthenticationService.userDomainClass.findByEmail(email) },
	// Called when a new user object is required, object returned must have login, password, email and status properties
	onNewUserObject: { loginID -> def obj = AuthenticationService.userDomainClass.newInstance(); obj.login = loginID; return obj },
	// Called when a user object has been changed and needs to be saved
	// This impl assumes its a GORM object
	onSaveUser: { user -> user.save() },
	// Called when a user has logged in
	onLoggedIn: { AuthenticatedUser login ->
		def user=AuthenticationService.userDomainClass.get(login.userObjectId)
		def ses=RequestContextHolder.requestAttributes.request.session
		ses.userId=user.id;
		ses["userId"]=user.id
//			def profile=Profile.findByUser(user)
//		if(profile){
	//		ses["profile"]=profile.id
		//}
	},
	// Called when a user has logged out
	onLoggedOut: { AuthenticatedUser login ->
		RequestContextHolder.requestAttributes.request.session?.invalidate()
		},
	// Called on successful signup, although email may not be confirmed yet - params are the request (form) params
	onSignup: {  
		params -> 
		//AH.application.mainContext.emailConfirmationService.sendConfirmation(params.user.email,
  //"Please confirm", [from:"email@mm.com"])
		},
	// Called when an account has to be deleted, passing in the user object supplied by onNewUserObject
	onDelete: { user -> user.delete() },
	// Called to see if email confirmation is required, return true if user cannot log in yet until confirmed
	onConfirmAccount: { user -> false
	//	 user.isConfirmed?false:true
		 },
	// Called by requireAuthorization to see if a logged in user can access the requested resource
	// params has properties: requirement (the authorization object required), request, user, controllerName, actionName
	onHasAuthorization: { params -> true },
	// Called to see if a logged in user can access the requested resource
	// params has properties: request, user, controllerName, actionName
	onCheckAuthorized: { params -> true },        // Called after a denied access
	// params has properties: request, response
	onUnauthorizedAccess: { params -> params.response.sendError(403) }
]
}

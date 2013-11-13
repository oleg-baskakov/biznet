
	<h2>New User Registration</h2>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
			
			<g:if test="${flash.authenticationFailure}">
			<div class='message'> 
				Registration failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
			</div>
			</g:if>
			
			<p>	
<auth:form authAction="signup" success="[controller:'profile', action:'myprofile']" error="[controller:'home', action:'register']">
<!-- <div class="field">
    <p class="name">User:</p> <g:textField name="login" value="${flash.signupForm?.login?.encodeAsHTML()}"/><br/>
	<g:hasErrors bean="${flash.signupFormErrors}" field="login"><g:renderErrors class="error" bean="${flash.signupFormErrors}" as="list" field="login"/></g:hasErrors>
	</div>
     -->    
     <div class="field">
	
	<p class="name">Name: </p> <g:textField name="name"  value="${flash.signupForm?.name?.encodeAsHTML()}"/><br/>
			<g:hasErrors bean="${flash.signupFormErrors}" field="name"><g:renderErrors bean="${flash.signupFormErrors}" as="list" class="error"  field="name"/></g:hasErrors> 
	</div>
     <div class="field">
	
	<p class="name">Surname: </p> <g:textField name="surname"  value="${flash.signupForm?.surname?.encodeAsHTML()}"/><br/>
			<g:hasErrors bean="${flash.signupFormErrors}" field="surname"><g:renderErrors bean="${flash.signupFormErrors}" as="list" class="error"  field="surname"/></g:hasErrors> 
	</div>

     <div class="field">
	
	<p class="name">Email: </p> <g:textField name="login"  value="${flash.signupForm?.login?.encodeAsHTML()}"/><br/>
			<g:hasErrors bean="${flash.signupFormErrors}" field="login"><g:renderErrors bean="${flash.signupFormErrors}" as="list" class="error"  field="login"/></g:hasErrors> 
	</div>

    <div class="field">
    <p class="name">Password:</p> </label><input type="password" name="password"/><br/>
    <g:hasErrors bean="${flash.signupFormErrors }"  field="password"><g:renderErrors bean="${flash.signupFormErrors}" as="list" field="password"/></g:hasErrors>
	</div>
    <div class="field">
    Confirm Password: <input type="password" name="passwordConfirm"/><br/>
    <g:hasErrors bean="${flash.signupFormErrors }"  field="passwordConfirm"><g:renderErrors bean="${flash.signupFormErrors}" as="list" field="passwordConfirm"/></g:hasErrors>
	</div>
<g:actionSubmit value="Sign up"/>
</auth:form>

				</p>
			

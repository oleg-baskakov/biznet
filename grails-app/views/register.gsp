<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
<meta name="layout" content="base" />
</head>

<body>
	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">
			<div class="simple">
			
		<h2>User Registration</h2>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
			
			<g:if test="${flash.authenticationFailure}">
			<div class='message'> 
				Registration failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
			</div>
			</g:if>
			
			<p>	
<auth:form  authAction="signup" success="[controller:'profile', action:'myprofile']" error="[controller:'home', action:'register']">
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
			
			
		
		</div>
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
				<g:render template='/templates/mainSidebar' />
			
		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
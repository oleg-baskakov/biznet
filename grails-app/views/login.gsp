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
			
		<h2>User Login</h2>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
	<g:if test="${flash.authenticationFailure}">
		<p class="error">Sorry but your login/signup failed - reason: <g:message code="authentication.failure.${flash.authenticationFailure.result}"/><br/></p>
	</g:if>
						
			<g:if test="${flash.authenticationFailure}">
			<div class='message'> 
				Login failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
			</div>
			</g:if>
			
			<p>	
				
			<auth:form authAction="login" success="[controller:'profile', action:'myprofile']" error="[controller:'home', action:'login']">
			    User ID: <g:textField name="login" value="${flash.loginForm?.login?.encodeAsHTML()}"/><br/>
				<g:hasErrors bean="${flash.loginFormErrors}" field="login"><g:renderErrors bean="${flash.loginFormErrors}" as="list" field="login"/></g:hasErrors>
			    Password: <input name="password" value="" type="password"/><br/>
				<g:hasErrors bean="${flash.loginFormErrors}" field="password"><g:renderErrors bean="${flash.loginFormErrors}" as="list" field="password"/></g:hasErrors>
		    <g:actionSubmit class="button" value="Log in"/> 
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
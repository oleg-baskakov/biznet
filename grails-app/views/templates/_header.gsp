
<h1 id="logo">
	<a  href="${createLink(controller:'home')}"> ShowbizNetwork</a>
</h1>


		<div class="right-part">
			<div id="loginForm">
			<p>${request.getRemoteAddr() } ${session.city } ${session.country }</p>
			<div id="errors"></div>		
			<div>
				<auth:ifNotLoggedIn>
					<p>
					<g:link controller="home"  action="login">SignIn</g:link>
					</p>
					
					<p>
					<g:link controller="home"  action="register">Register</g:link>
					</p>
				</auth:ifNotLoggedIn>
				<auth:ifLoggedIn>
				<auth:user property="login" />
				<auth:logoutLink >
				    	<strong>Logout</strong>
			    </auth:logoutLink>
				
				</auth:ifLoggedIn>
			</div>
			</div>
			<g:form name="searchF" url="[action:'search', controller:'home']" method="post" class="search" >
				<div class="fld">
					<g:textField class="field blink" id="sHF" name="q" value="${q?:'search' }"/>
				</div>
				<div class="btnp"><g:submitButton name="searchB" value="${message(code:'main.button.search',default:'search') }" /></div>
			</g:form>
		</div>
		
		<script type="text/javascript">

	$("#sHF").one("focus",function(){
		$(this).val("");
		});
</script>
		
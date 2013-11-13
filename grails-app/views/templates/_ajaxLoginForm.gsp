			<g:javascript library="yui"/>
			<g:if test='${flash.message}'>
				<div class='message'>${flash.message}</div>
			</g:if>
				<p>		
					<g:formRemote name="ajaxLoginForm" action="${request.contextPath}/j_spring_security_check" url="[url:'/TestOrSteron/j_spring_security_check']"  update="[success:'loginForm',failure:'errors']">
						<input type="text" name="j_username" id="j_username"/>
						<input type="hidden" name="spring-security-redirect" id="spring-security-redirect" value="/login/ajaxSuccess"/>
						<input type="password" name="j_password" id='j_password' />
						<input type="submit" name="loginBtn" value="sign in" />
					</g:formRemote>
				<a  href="${createLink(controller:'register') }">create account</a>
				</p>

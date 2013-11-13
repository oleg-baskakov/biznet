<g:if test="${alerts}">
					<ul class="blue">
						<g:each in="${alerts}" var="alert">
					    	<li><g:link controller="jobAlert" action="show" id="${alert.id}">${alert.title}</g:link> </li>
					    </g:each>
					</ul>
</g:if>
<g:else>
	You have no job alerts
</g:else>
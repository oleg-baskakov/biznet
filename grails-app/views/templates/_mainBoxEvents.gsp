			<div class="simple">
			<g:isLoggedIn>
				<g:link class="right" action="create"><g:message code="default.create" default="Create new" /></g:link>
			</g:isLoggedIn>
				<h2> ${box.info }		</h2>
				
				
				<g:each in="${box.events}" status="i" var="event">
				<g:if test="${i%2==0}">
					<div class="cl">&nbsp;<\br></div>
				</g:if>
				<g:link controller="event" action="show" class="image" id="${event?.id}">
				 	<g:if test="${event?.avatar}">
				 		<img  height="120" width="90" src="${createLinkTo(dir:grailsApplication.config.event.photo.dir, file:event?.avatar) }" alt="${event?.name}" />
				 	</g:if>
				 	<g:else>
				 		<img height="120" width="90" src="${createLinkTo(dir:grailsApplication.config.photo.dir, file:'plcnofoto.jpg') }" alt="${event?.name}" />
				 	</g:else>
				</g:link>
				<div class="description">
				
					<h4><g:link controller="event" action="show" id="${event?.id}">
						${event?.name}
						</g:link>
					</h4>
					<p>${event?.shortInfo}</p>
					<p>${event?.startDate }</p>
					<p>${event?.place?.name}</p>
					<g:link controller="event" action="show"  id="${event?.id}">${message(code:'box.event.readmore',default:'Read more ->') }</g:link>
				</div>
				
				</g:each>
			</div>

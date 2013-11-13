			<div class="simple">
				<h2><a href="#" class="rss">&nbsp;</a> ${box.info }</h2>
				<div class="cl">&nbsp;</div>
				
				<g:each in="${box.groups}" status="i" var="group">
				<g:link controller="group" action="show" class="image" id="${group.id}">
				 	<g:if test="${group}">
				 		<img height="120" width="90" src="${createLinkTo(dir:grailsApplication.config.groups.photo.dir, file:'plcnofoto.jpg') }" alt="${group?.name}" />
				 	</g:if>
				 	<g:else>
				 		<img height="120" width="90" src="${createLinkTo(dir:grailsApplication.config.groups.photo.dir, file:'plcnofoto.jpg') }" alt="${group?.name}" />
				 	</g:else>
				</g:link>
				<div class="description">
				
					<h4><g:link controller="group" action="show" id="${group?.id}">
						${group?.name}
						</g:link>
					</h4>
					<p>${group?.info }</p>
					<g:link controller="group" action="show"  id="${group?.id}">${message(code:'box.group.readmore',default:'Read more ->') }</g:link>
				</div>
				<g:if test="${i%2==0 && i>0 }">
					<div class="cl">&nbsp;</div>
				</g:if>
				
				</g:each>
			</div>

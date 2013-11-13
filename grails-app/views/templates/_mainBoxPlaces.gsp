			<div class="simple">
				<h2><a href="#" class="rss">&nbsp;</a> ${box.info }</h2>
				<div class="cl">&nbsp;</div>
				
				<g:each in="${box.places}" status="i" var="place">
				<g:link controller="place" action="show" class="image" id="${place?.id}">
				 	<g:if test="${place?.avatar}">
				 		<img  height="120" width="90" src="${createLinkTo(dir:grailsApplication.config.photo.dir, file:place?.avatar) }" alt="${place?.name}" />
				 	</g:if>
				 	<g:else>
				 		<img height="120" width="90" src="${createLinkTo(dir:grailsApplication.config.photo.dir, file:'plcnofoto.jpg') }" alt="${place?.name}" />
				 	</g:else>
				</g:link>
				<div class="description">
				
					<h4><g:link controller="place" action="show" id="${place?.id}">
						${place?.name}
						</g:link>
					</h4>
					<p>${place?.summary }</p>
					<g:link controller="place" action="show"  id="${place?.id}">${message(code:'box.place.readmore',default:'Read more ->') }</g:link>
				</div>
				<g:if test="${i%2==0 && i>0 }">
					<div class="cl">&nbsp;</div>
				</g:if>
				
				</g:each>
			</div>

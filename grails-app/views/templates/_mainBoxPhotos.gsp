			<div class="simple">
				<h2><a href="#" class="rss">&nbsp;</a> ${box.info }</h2>
				<div class="cl">&nbsp;</div>
				<div class="frame">
				<g:each in="${box.photos}" status="i" var="photo">
				<div class="holder">
				<g:link controller="eventPhoto" action="show" class="space image" id="${photo?.id}">
				 	<g:if test="${photo?.uri}">
				 		<img  height="120" width="90" src="${createLink(controller:'eventPhoto',action:'photo',id:photo?.id)}" alt="${photo?.name}" />
				 	</g:if>
				 	<g:else>
				 		<img height="120" width="90" src="${createLinkTo(dir:grailsApplication.config.photo.dir, file:'plcnofoto.jpg') }" alt="${photo?.name}" />
				 	</g:else>
				</g:link>
			
				<div class="cl">&nbsp;</div>
				<g:link controller="eventPhoto" action="show" class="blue" id="${photo?.id}">
						${photo?.name}
				</g:link>
				
				</div>
				<g:if test="${i%2==0 && i>0 }">
					<div class="cl">&nbsp;</div>
				</g:if>
				
				</g:each>
				</div>	
			</div>

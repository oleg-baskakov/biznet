			<div class="simple">
			<!-- 
				<h2 class="no-border">daily beauty <span>reporter</span>!</h2>
			 -->
			 	<h2 class="no-border">${event?.info}</h2>
			 	<g:link class="image" controller="event" action="info" id="${event?.id }">
			 		<img src="${createLinkTo(dir:photoDir, file:event?.avatar) }" alt="${event?.name}" />
			 	</g:link>
				<div class="info">
					<h3><g:link class="image" controller="event" action="info" id="${event?.id }">${event?.name}</g:link>
					</h3>
					<span><g:formatDate format="dd-MM-yyyy" date="${event?.startDate}"/></span>
					<p>
					${event?.shortInfo}
					</p>
				</div>
				<div class="cl">&nbsp;</div>
				<a href="#" class="small">Previous news</a>
				<a href="#" class="small">All news</a>
				<a href="#" class="small">Next news</a>
				<div class="cl">&nbsp;</div>
			</div>

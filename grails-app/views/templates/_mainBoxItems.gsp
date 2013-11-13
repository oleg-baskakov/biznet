			<div class="simple">
				<h2><a href="${box.link}" class="rss">&nbsp;</a> ${box.linkInfo }</h2>
				<div class="cl">&nbsp;</div>
				<g:each in="${box.list}" status="i" var="it">
				
					<a href="${it.link}" class="image"><img src="${it.imageLink }" alt="${it.imageAlt }" /></a>
					<div class="description">
						<h4><a href="${it.link}">${it.linkName}</a></h4>
						<p>${it.summary }</p>
						<a href="${it.link}">read full story</a>
					</div>
				<g:if test="${i%2==0}">
					<div class="cl">&nbsp;</div>
				</g:if>
				
				</g:each>
			</div>

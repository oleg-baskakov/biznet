			<div class="simple">
				<h2><a href="#" class="rss">&nbsp;</a> celebreties</h2>
				<div class="cl">&nbsp;</div>
				<div class="frame">
					<g:each in="${boxList}"  >
						<div class="holder">
							<a class="space image" href="${it.url }"><img src="${it.imgUrl }" alt="${it.imgAlt }" /></a>
							<div class="cl">&nbsp;</div>
							<a href="${it.url}" class="blue">${it.urlInfo}</a>
						</div>	
						<div class="cl">&nbsp;</div>
					</g:each>
				</div>	
				<div class="cl">&nbsp;</div>
			</div>

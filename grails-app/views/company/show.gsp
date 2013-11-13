<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Company')}" />
        <title><g:message code="profile.header" args="[company.name ]" /></title>
        
        
	<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
	</script>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
				<h2 class="no-border">
				
				<span>${company.name }</span>
				</h2>
			 	<div class="image">
			 	<g:if test="${false}">
			 		<img height="120" width="90" src="" alt="${company.name }" />
			 	</g:if>
			 	<g:else>
			 		<img height="120" width="90" src="${createLinkTo(dir:"images", file:'plcnofoto.jpg') }" alt="${company.name }" />
			 	</g:else>
			 	<div class="underPhoto">
						<p>	
						<g:message code="profile.rating" default="Rating:">
						</g:message>
						</p>
				</div>
			 	</div>
				<div class="info">
<!-- 					<h3>${company.name }
					</h3>
 -->					<p>
						<g:if test="${company.industry}">
						<b>${company.industry?.name} Sector</b> 
						</g:if> 
						<br/> ${company["size"]}<br/>
						<g:if test="${company.city}">
							${company.city?.name}, ${company.city?.country?.name}
						</g:if> 
					</p>
					<p>
						<g:if test="${ company.website}">
							<g:link url="${company.website }">Company website</g:link>
						</g:if>
					
					</p>
					<p>
						${company.highlights}
					</p>
					
				</div>
				<!-- 
				<div class="cl">&nbsp;</div>
				<a href="#" class="small">Previous news</a>
				<a href="#" class="small">All news</a>
				<a href="#" class="small">Next news</a>
				 -->
				<div class="cl">&nbsp;</div>
			</div>
			
	
			<!-- End Box  -->
			
			<div class="simple">
				<div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-no">
					<ul>
					    <li><a href="#tab-1" class="active">People</a></li>
					    <li><a href="#tab-2">news</a></li>
					    <li><a href="#tab-3">vacancies</a></li>
					</ul>
				<div id="tab-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
				<a href="#" class="image"><img src="css/images/pic7.jpg" alt="" /></a>
				<div class="description">
					<h4><a href="#">Lorem ipsum dolor sitamet</a></h4>
					<p>Donec luctus mauris a velit aliquam in volutpat diam viverra.Nulla ipsum magna, pellentesque et imperdiet eget, interdum sed neque.</p>
					<a href="#">read full story</a>
				</div>
				</div>
				<div id="tab-2">
				<a href="#" class="image"><img src="css/images/pic8.jpg" alt="" /></a>
				<div class="description">
					<h4><a href="#">uisque elementumpurus vitae urn</a></h4>
					<p>Donec luctus mauris a velit aliquam in volutpat diam viverra.Nulla ipsum magna.</p>
					<a href="#">read full story</a>
				</div>
				</div>
				<div id="tab-3">
				<a href="#" class="image"><img src="css/images/pic8.jpg" alt="" /></a>
				<div class="description">
					<h4><a href="#">uisque elementumpurus vitae urn</a></h4>
					<p>Donec luctus mauris a velit aliquam in volutpat diam viverra.Nulla ipsum magna.</p>
					<a href="#">read full story</a>
				</div>
				</div>
				<div class="cl">&nbsp;</div>
				</div>
			</div>
		
						
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			 	<g:render template='/templates/mainSidebar' />

		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
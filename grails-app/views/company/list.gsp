<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title><g:message code="company.list.header" default="Companies" /></title>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
			    <auth:ifLoggedIn>			    	<g:link  action="create"  class="right" >
				${message(code:'company.add',default:'Add')}</g:link>
			    </auth:ifLoggedIn>
			    
				<h2 class="">
				
				<span>List of Companies</span>
				</h2>

				<g:each in="${companies}" var="company" >
			 	<div class="image">
			 	<g:if test="${false}">
					<g:link action="show" id="${company.id }">
			 			<img height="64" width="50" src="" alt="${company.name }" />
			 		</g:link>
			 	</g:if>
			 	<g:else>
			 		<g:link action="show" id="${company.id }">
			 			<img height="64" width="50" src="${createLinkTo(dir:"images", file:'plcnofoto.jpg') }" alt="${company.name }" />
			 		</g:link>
			 	</g:else>
			 	<div class="underPhoto">
						<p>	
						<g:message code="profile.rating" default="Rating:">0</g:message>
						</p>
				</div>
			 	</div>
				<div class="info">
					<h3> <g:link action="show" id="${company.id }">${company.name }</g:link>
					</h3>
					<p>
						<b>${company.industry?.name}</b> <br/>
						${company.city?.name}, ${company.city?.country?.name} 
					</p>
					<p>
						${company["size"]}
					</p>
					
				</div>
				<!-- 
				<div class="cl">&nbsp;</div>
				<a href="#" class="small">Previous news</a>
				<a href="#" class="small">All news</a>
				<a href="#" class="small">Next news</a>
				 -->
				<div class="cline"></div>
				</g:each>
	            <div class="paginateButtons">
	                <g:paginate total="${companiesTotal}" />
	            </div>
			</div>
			
	
			<!-- End Box  -->
			
					
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
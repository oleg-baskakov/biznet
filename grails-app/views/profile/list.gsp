<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title><g:message code="profile.list.header" default="Users profiles" /></title>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
				<h2 class="">
				
				<span>List of Users</span>
				</h2>

				<g:each in="${profiles}" var="profile" >
			 	<div class="image">
			 	<g:if test="${false}">
					<g:link action="show" id="${profile.id }">
			 			<img height="64" width="50" src="" alt="${profile.fullName }" />
			 		</g:link>
			 	</g:if>
			 	<g:else>
			 		<g:link action="show" id="${profile.id }">
			 			<img height="64" width="50" src="${createLinkTo(dir:"images", file:'plcnofoto.jpg') }" alt="${profile.fullName }" />
			 		</g:link>
			 	</g:else>
			 	<div class="underPhoto">
						<p>	
						<g:message code="profile.rating" default="Rating:">0</g:message>
						</p>
				</div>
			 	</div>
				<div class="info">
					<h3> <g:link action="show" id="${profile.id }">${profile.fullName }</g:link>
					</h3>
					<p>
						<b>${profile.profession}</b> 
						${profile.industry?.name}<br/> 
						${profile.city?.name}, ${profile.country?.name} 
					</p>
					<p>
						${profile.status}
					</p>
					<p>
						${profile.info}
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
						<div class="paging">
		        <g:paginate  total="${profileInstanceTotal}"  />
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
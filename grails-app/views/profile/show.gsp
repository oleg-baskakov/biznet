<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="profile.header" args="[profile.fullName ]" /></title>
        
        
        <script type="text/javascript">
        	function openDialog(){
            	
        		$('<div>').load('${createLink(controller:'jobPromo',action:'promoListDlgAx', params:[uid:profile.id])}').dialog();
            	}
        </script>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
				<h2 class="no-border">
				
				<span>${profile.fullName }</span>
				</h2>
			 	<div class="image">
			 	<g:if test="${false}">
			 		<img height="120" width="90" src="" alt="${profile.fullName }" />
			 	</g:if>
			 	<g:else>
			 		<img height="120" width="90" src="${createLinkTo(dir:"images", file:'plcnofoto.jpg') }" alt="${profile.fullName }" />
			 	</g:else>
			 	<div class="underPhoto">
						<p>	
						<g:message code="profile.rating" default="Rating:">
						</g:message>
						</p>
				</div>
			 	</div>
				<div class="info">
					<h3>${profile.fullName }
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
				<div class="cline"></div>
				<auth:ifLoggedIn>
					<g:link controller="chat" action="index" id="${profile.id}" class="small">chat</g:link>
					<g:if test="${hasPromos }">
						<g:link url="#" onclick="openDialog();" class="small">send job promotion</g:link>
					
					</g:if>
				</auth:ifLoggedIn>
				
				<div class="cl">&nbsp;</div>			
			</div>
			
	
			<!-- End Box  -->
			
		
			
			<div class="simple">
			
				<h2> Work experience</h2>
				<div class="cl">&nbsp;</div>
				<div id="addDiv"></div>
				<div id="recs">
				<g:each in="${profile.workRecords}"  var="rec">
				<div class="holder">
				<b>
					<g:formatDate format="MMM.yyyy" date="${rec.startDate }" /> - 
					<g:formatDate format="MMM.yyyy" date="${rec.endDate}" />
				</b>
				</div>
				<div class="description">
						<h4>${rec.position.name}</h4>
						<p><b>${rec.company.name } </b><br/>
							${rec.company.city?.name } ${rec.company.city?.country?.name }
							${rec.company.industry?.name } | Size:${rec.company.size}
						</p>
						<p>
							${rec.description }
						</p>
					</div>
					
					<div class="cl">&nbsp;</div>
				
				</g:each>
				</div>
			</div>
				
						<div class="simple">
			
				<h2> Education</h2>
				<div class="cl">&nbsp;</div>
				<div id="addEduDiv"></div>
				<div id="recsEdu">
				<g:each in="${profile.eduRecords}"  var="rec">
				<div class="holder">
				<b>
					<g:formatDate format="MMM.yyyy" date="${rec.startDate }" /> - 
					<g:formatDate format="MMM.yyyy" date="${rec.endDate}" />
				</b>
				</div>
				<div class="description">
						<p><b>${rec.school.name } </b><br/>
							
							${rec.school.city?.name } ${rec.school.city?.country?.name }
						<div>
						</p>
						<p>
							${rec.studyFields }<br/>
							${rec.description }
						</p>
						<p>
							${rec.awards }
						</p>
					</div>
					</div>
					<div class="cl">&nbsp;</div>
				
				</g:each>
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
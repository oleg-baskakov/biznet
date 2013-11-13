<%@ page import="joberty.promo.JobPromo;" %>
<%@ page import="joberty.JobAlert;" %>
<%@ page import="joberty.alerts.JobAlertResponse;" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Job Alert')}" />
        <title><g:message code="jobalert.header" args="[alert?.title]" /></title>
        
        
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
				<g:if test="${alert.creator?.id==session.profile }">
			    	<g:link action="edit" id="${alert.id}" class="right"  >
				${message(code:'jobalert.edit',default:'Edit')}</g:link>
			    
			    </g:if>
				<h2 class="no-border">
			
				<span>${alert.title}</span>
				</h2>
				<div class="info">
				 	<g:render template='/templates/errorsandmsgs' />
					<p>
						<g:if test="${alert.position}">
							Job Position:<b>${alert.position?.name} </b> ${alert.industry?" in "+alert.industry.name:"" }
						</g:if> 
						<br/> 
						<g:if test="${alert.city}">
							Location:<b>${alert.city.name}, ${alert.city.country?.name}</b> 
						</g:if> 
					</p>
					<p>
						<g:if test="${ alert.query}">
							Job alert query:<b> ${alert.query }</b>
						</g:if>
					</p>
					
				</div>
				<div class="cline"></div>
					<g:if test="${alert.creator.id==session.profile }">
						<g:if test="${alert.status==JobAlert.STATUS_CREATED}">
							<g:remoteLink   update="respMsg" url="[action:'deleteAx', params:[id:alert.id] ]"   class="small">delete alert</g:remoteLink>
						</g:if>
						
					</g:if>
					<div id=respMsg> </div>
				<div class="cl">&nbsp;</div>
			</div>
			
	
			<!-- End Box  -->
<auth:ifLoggedIn>

					<g:if test="${alert.creator.id==session.profile }">

			<div class="simple">
				<h2>
				<span>Related job promotions</span>
				</h2>
				<div class="info">
					<g:each in="${promos}" var="promoresp">
					<g:set var="promo" value="${promoresp.promo }" />  
					<div class="info">
					<h3> <g:link action="showPromo" id="${promoresp.id }">${promo.title }</g:link>
					</h3>
					<p>
						<b>${promo.position?.name}</b> <br/>
						${promo.company?promo.company.name+', ':''} ${promo.city?.name} ${promo.city?.country?.name}
						</br>
					</p>
										
				</div>
						
					</g:each>
				<div class="paging">
	                <g:paginate total="${promosCount}" />
	            </div>
				
				</div>
					<div class="cl">&nbsp;</div>
			</div>
						<div class="cl">&nbsp;</div>
					</g:if>

</auth:ifLoggedIn>			
		
						
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
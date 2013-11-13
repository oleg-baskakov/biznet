<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title><g:message code="jobalerts.list.header" default="Job alerts" /></title>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
			    <auth:ifLoggedIn>	
			    	<g:link  action="create"  class="right" >${message(code:'jobalerts.add',default:'Add')}</g:link>
			    </auth:ifLoggedIn>
			    
				<h2 class="">
				
				<span>List of Job Alerts</span>
				</h2>

				<g:each in="${alerts}" var="alert" >
				<div class="info">
					<h3> <g:link action="show" id="${alert.id }">${alert.title }</g:link>
					</h3>
					<p>
						<b>${alert.position?.name}</b> <br/>
						 ${alert.city?.name} ${alert.city?.country?.name}
						</br>
						<g:formatDate date="${alert.dateCreated }" type="date" style="SHORT" />
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
	
	            <div class="paginate">
	                <g:paginate total="${alertsTotal}" />
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
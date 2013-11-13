<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title><g:message code="jobpromo.list.header" default="Job promotions" /></title>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
			    <auth:ifLoggedIn>	
			    	<g:link  action="mylist"  class="right" >${message(code:'jobpromo.mypromo',default:'My promotions')}</g:link>
			    	<g:link  action="create"  class="right" >${message(code:'jobpromo.add',default:'Add')}</g:link>
			    </auth:ifLoggedIn>
			    
				<h2 class="">
				
				<span>List of Job Promotions</span>
				</h2>

				<g:each in="${promos}" var="promo" >
				<div class="info">
					<h3> <g:link action="show" id="${promo.id }">${promo.title }</g:link>
					</h3>
					<p>
						<b>${promo.position?.name}</b> <br/>
						${promo.company?promo.company.name+', ':''} ${promo.city?.name} ${promo.city?.country?.name}
						</br>
						Status:${promo.status } 
					</p>
					<p>
						${promo.dateCreated}
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
	                <g:paginate total="${promosTotal}" />
	            </div>
			</div>
			
			
					
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			 	<g:render template='/templates/promosSidebar' />

		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
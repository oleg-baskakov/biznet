<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
</head>

<body>
	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			<div class="simple">
			<!-- 
				<h2 class="no-border">daily beauty <span>reporter</span>!</h2>
			 -->
			 	<h2 class="no-border">Showbiz Network - business interactive</h2>
			 	<g:link class="image" url="#">
			 		<img src="${createLinkTo(dir:'images', file:'biznet.jpg') }" alt="Showbiz network" />
			 	</g:link>
<!-- 				<div class="info">
					<h3><g:link class="image" controller="event" action="info" id="${event?.id }">${event?.name}</g:link>
					</h3>
					<span><g:formatDate format="dd-MM-yyyy" date="${event?.startDate}"/></span>
					<p>
					${event?.shortInfo}
					</p>
				</div>
 -->
 				<div class="cl">&nbsp;</div>
				<a href="#" class="small">Previous news</a>
				<a href="#" class="small">All news</a>
				<a href="#" class="small">Next news</a>
				<div class="cl">&nbsp;</div>
			</div>

			<!-- End Box  -->
			
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			<!-- 	<g:render template='/templates/mainSidebar' />
			 -->
				<div class="top">
			<auth:ifNotLoggedIn>
				<g:render template='/templates/registrationSidebar' />
			</auth:ifNotLoggedIn>			
							<div class="ad">
					<small>advertising</small>
					<a href="#"><img src="css/images/ad.jpg" alt="" /></a>
				</div>
				<h2>most readed</h2>
				<ul class="blue">
				    <li><a href="#">Lorem ipsum dolor sit amet, consectetur <br />adipiscing elit. </a></li>
				    <li><a href="#">Summer uni 2009!</a></li>
				    <li><a href="#">The singular suit project</a></li>
				    <li><a href="#">Eva models</a></li>
				    <li><a href="#">Try me by faah damji</a></li>
				    <li><a href="#">Purus vitae urna molesti </a></li>
				    <li><a href="#">Quisque elementum purus vita</a></li>
				    <li><a href="#">Ipsum dolor sit consectetur</a></li>
				    <li><a href="#">Ac diam pulvinar porttitor</a></li>
				</ul>
				<h2>blog roll</h2>
				<ul class="blue">
				    <li>
				    	<small>21.05.09 | posted by <a href="#">admin</a></small>
				    	<a href="#">Lorem ipsum dolor sit amet, consectetur <br />adipiscing elit. </a>
				    </li>
				    <li>
				    	<small>21.05.09 | posted by <a href="#">admin</a></small>
				    	<a href="#">Nulla ipsum magna pellentesque et imperdiet<br /> eget, intercedm sed neque </a>
				    </li>
				    <li>
				    	<small>21.05.09 | posted by <a href="#">admin</a></small>
				    	<a href="#">Consecettur adipsicing elit pellentesque turpis<br /> unra tempus.</a>
				    </li>
				    <li>
				    	<small>21.05.09 | posted by <a href="#">admin</a></small>
				    	<a href="#">Curabitu eleifend , diam ac pulvinar portititor, <br />massa elit lobortis ligula a blandit</a>
				    </li>
				    <li>
				    	<small>21.05.09 | posted by <a href="#">admin</a></small>
				    	<a href="#">Lorem ipsum dolor sit amet, consectetur <br />adipiscing elit. </a>
				    </li>
				    <li>
				    	<small>21.05.09 | posted by <a href="#">admin</a></small>
				    	<a href="#">Lorem ipsum dolor sit amet, consectetur <br />adipiscing elit. </a>
				    </li>
				</ul>
			</div>
			
			
		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
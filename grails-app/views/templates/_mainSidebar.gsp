			<div class="top">
				<h2>categories</h2>
				<ul class="pink">
				    <li><g:link  controller="inbox" >Inbox</g:link> </li>
				    <li><g:link controller="profile" action="list">People</g:link></li>
				    <li><g:link controller="jobPromo" action="list">Jobs</a></g:link>
				    <li><g:link  controller="company" action="list">Companies</g:link></li>
				    <li><a href="#">Groups</a></li>
				</ul>
				<div class="ad">
					<small>advertising</small>
					<a href="#"><img src="css/images/ad.jpg" alt="" /></a>
				</div>
					    <g:link controller="jobAlert" action="list"  class="right">${message(code:'default.list',default:'List all')}</g:link>

					<g:link  action="create" controller="jobAlert" class="right" >
						${message(code:'default.add',default:'Add')}
					</g:link>
					
					<h2>Job Alerts</h2>
				<auth:ifLoggedIn>
					<div id="listAlertsDiv"></div>
					<script>
					$(document).ready(function() {
					    $("#listAlertsDiv").bind("ajaxSend", 
					    		function(e, jqxhr, settings) {
					    			  if (settings.url == '${createLink(controller:'jobAlert', action:'listAx')}') {
									        $(this).html('<img src="${createLinkTo(dir:"images", file:"ajax-loader.gif") }" alt="loading.." />');
					    			  }
				    			}).bind("ajaxStop", function() {
					    	//$(this).html('');
						      //  $(this).fadeOut();
					    });
						$("#listAlertsDiv").load("${createLink(controller:'jobAlert', action:'listAx')}");
					});
					</script>
				</auth:ifLoggedIn>
				<div class="cl">&nbsp;</div>
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

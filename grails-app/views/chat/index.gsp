<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title><g:message code="chat.header" default="Chat [0]" args="[profile.fullName ]" /></title>
        
        <script type="text/javascript">

        	function  resp(data){
            	
				alert(data);
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
						</p>
				</div>
			 	</div>
				<div class="info">
					
					<p>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="550" height="400" id="${createLinkTo(dir:'swf', file:'Subscriber.swf') }" align="middle">
	    <param name="movie" value="${createLinkTo(dir:'swf', file:'Subscriber.swf') }" />
		 <param name="flashVars" value="sid=${profile.id}.${chat.roomId}">
		 <param name="quality" value="high">
		 <param name="bgcolor" value="#ffffff">
    <!--[if !IE]>-->
    <object type="application/x-shockwave-flash" data="${createLinkTo(dir:'swf', file:'Subscriber.swf') }" width="550" height="400">
        <param name="movie" value="${createLinkTo(dir:'swf', file:'Subscriber.swf') }" />
		<param name="flashVars" value="sid=${profile.id}.${chat.roomId}">
		<param name="quality" value="high">
		<param name="bgcolor" value="#ffffff">
    <!--<![endif]-->
        <a href="http://www.adobe.com/go/getflash">
            <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
        </a>
    <!--[if !IE]>-->
    </object>
    <!--<![endif]-->
</object>
</p>

<!--  
			<p>
			 <object type="application/x-shockwave-flash" data="${createLinkTo(dir:'swf', file:'Subscriber.swf') }" width="500" height="400">
			 <param name="flashVars" value="sid=${profile.id}.${chat.roomId}">
			 <param name="quality" value="high">
			 <param name="bgcolor" value="#ffffff">
			 <embed src="${createLinkTo(dir:'swf', file:'Subscriber.swf') }" width="500"  height="400" flashVars="sid=${profile.id}.${chat.roomId}" type="application/x-shockwave-flash" play="true" 
			 loop="true" menu="true"></embed>
			 </object>
		    </p>
		-->			
				</div>
				<div class="cline"></div>
				<g:link action="exit" id="${chat.id}" class="small">exit</g:link>
				<g:if test="${!inv}">
					<g:remoteLink action="sendInviteAx" onSuccess="resp(data)" update="resDiv" url="[action:'sendInviteAx', params:[id:profile.id] ]"   class="small">Invite to video chat</g:remoteLink>
				</g:if>
				<div id="resDiv"></div>
				<div class="cl">&nbsp;</div>
			</div>
			
	
		
						
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			 	<g:render template='/templates/chatSidebar' />

		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
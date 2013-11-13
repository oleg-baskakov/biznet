<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title>Message from ${msg?.from?.fullName }</title>
        
        
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
				<h2 class="no-border">
				
				<span>${msg.from?.fullName }</span>
				</h2>
				<div class="info">
						<g:if test="${msg.theme}">
							Theme: <b>${msg.theme} </b> 
				<div class="cline"></div>
						</g:if> 
						<br/>  
					
					<p>
						${msg.msg}
					</p>
				<div class="cline"></div>
				<g:link action="reply" id="${msg.id}" class="small">reply</g:link>
				<g:link action="delete" id="${msg.id}" params="[folder:folder]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" class="small">delete</g:link>
				<g:link action="index"  class="small">close</g:link>
					
				</div>
				
				<div class="cl">&nbsp;</div>
				
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
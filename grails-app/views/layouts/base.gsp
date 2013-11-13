<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title><g:layoutTitle default="Test"></g:layoutTitle> </title>
	<link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" type="text/css" media="all" />
    <g:javascript library="jquery" />	
<link type="text/css" href="${resource(dir:'css/smoothness',file:'jquery-ui-1.8.11.custom.css')}" rel="Stylesheet" />	
<script type="text/javascript" src="${resource(dir:'js',file:'jquery-ui-1.8.11.custom.min.js')}"></script>    
    <!-- 
    link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
     -->
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<!--[if IE 6]>
		<style type="text/css" media="screen">
			#main .box .holder a.play{background-image: none;filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='css/images/play.png', sizingMethod='image');}	
			#main .box .holder .stripe{background-image: none;filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='css/images/dot.png', sizingMethod='scale');}	
		</style>
	
	<![endif]-->
	<g:layoutHead/>
	
</head>

<body>
<!-- Shell -->
<div class="shell">
	
	<!-- Header -->
	<div id="header">
		<g:render template='/templates/header'/>
	</div>
	<!-- End Header -->
	
	<!-- Navigation -->
	<div id="nav">
		<div class="inner">
			<ul>
			<auth:ifLoggedIn>
			    <li class="${controllerName=='home'?'active':''  }"><g:link  controller="home" action="index" class="first">home</g:link></li>
				    <li class="${controllerName=='profile'?'active':''  }"><g:link  controller="profile" action="myprofile">Profile</g:link></li>
				    <li class="${controllerName=='inbox'?'active':''  }"><g:link  controller="inbox" > <joberty:inboxtitle/> </g:link> </li>
				    <li class="${controllerName=='calendar'?'active':''  }"><g:link  controller="calendar" > Calendar</g:link> </li>
				    <li class="${controllerName=='profile'&&actionName=='list'?'active':''  }"><g:link  controller="profile" action='list' > People</g:link> </li>
				    <li> <a href="#" style="color:black;">Groups</a></li>
				    <li class="${controllerName=='company'?'active':''  }"><g:link  controller="company" action="list">Companies</g:link></li>
			 	    <li class="${controllerName=='jobPromo'?'active':''  }"><g:link  controller="jobPromo" action="list">Job Promotions</g:link></li>
			 
			</auth:ifLoggedIn>
			<auth:ifNotLoggedIn>
				    <li><g:link url="#">Tour</g:link></li>
				    <li><g:link url="#">About</g:link></li>
				    <li class="${controllerName=='profile'&&actionName=='list'?'active':''  }"><g:link  controller="profile" action='list' > People</g:link> </li>
			</auth:ifNotLoggedIn>
			</ul>
		</div>
	</div>
	<!-- End Navigation -->
	
	<!-- Content -->
	
	<g:layoutBody/>
	
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
	<!-- Footer -->
	<div id="footer">
		<a href="#" class="sm-logo">${siteName}</a>
		<div class="right-area">
			<p>&copy; ShowbizNetwork | Design by <a href="http://chocotemplates.com">ChocoTemplates.com</a></p>
		</div>
		<div class="cl">&nbsp;</div>
	</div>
	<!-- End Footer -->
</div>
<!-- End Shell -->
</body>
</html>
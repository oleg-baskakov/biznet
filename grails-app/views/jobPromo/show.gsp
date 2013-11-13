<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="joberty.promo.JobPromo" %>
<head>
<meta name="layout" content="base" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Job Promotion')}" />
        <title><g:message code="profile.header" args="[promo.title]" /></title>
 <script type="text/javascript" src="${resource(dir:'js/flot',file:'jquery.flot.js')}"></script>    
        
        
	<script>
	$(function() {
		$( "#tabs" ).tabs();
		var data={
			    label: "Job Promo stat (Views per date)",
			    data: ${stats},
	            lines: { show: true } ,
	            points: { show: true }
	            
		};
		for (var i = 0; i < data.data.length; ++i)
		      data.data[i][0] += 60 * 60 * 1000;
		 
		var options = {
	            legend: {
	                show: true,
	                position:  "nw", 
	                margin: 2
	              },
			    series: {
			//      lines: { show: true },
			//      points: { show: true }
			    },
	    		xaxis:{
		    		mode:"time",
		    		show:true,
		    		autoscaleMargin:0.01,
		    		 minTickSize: [1, "day"],
//		    		 min: (new Date()).setDate(.getDate()-3).getTime(),
		    		// max: (new Date()).getTime(),
		    		 timeformat: "%m/%d" 
		    		
		    		//min:1,
		    		//max:26,
		    		//tickSize:1
		    	},
		    	yaxis:{
		    		tickDecimals:0
			    }
			  };
		 // alert((new Date(2011,06,06)).getTime());
	//	  alert(new Date().getTime()+'-'+data.data[0][0]);
		  
			  $.plot($("#statsPlotDiv"), [data],options);
	});
	</script>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
				<g:if test="${promo.creator?.id==session.profile }">
			    	<g:link action="edit" id="${promo.id}" class="right"  >
				${message(code:'jobpromo.edit',default:'Edit')}</g:link>
			    
			    </g:if>
				<h2 class="no-border">
			
				<span>${promo.title}</span>
				</h2>
				<div class="info">
				 	<g:render template='/templates/errorsandmsgs' />
					<p>
						<g:if test="${promo.position}">
							Job Position:<b>${promo.position?.name} </b> ${promo.positionType?','+promo.positionType:'' }
						</g:if> 
						<br/> 
						<g:if test="${promo.city}">
							Location:<b>${promo.city.name}, ${promo.city.country?.name}</b> 
						</g:if> 
					</p>
					<p>
						<g:if test="${ promo.companyDesc}">
							Company information:<b> ${promo.companyDesc }</b>
						</g:if>
						<g:elseif test="${promo.company}">
							Company information:<g:link controller="company" action="show" id="${promo.company.id}">${promo.company.name }</g:link> 
						</g:elseif>
					
					</p>
					<p>
						<g:if test="${ promo.jobDuration}">
							Job position period:${promo.jobDuration}
						</g:if>
					
					</p>
					<p>
						<g:if test="${ promo.minSalary!=promo.maxSalary}">
							Salary range:${promo.minSalary}-${promo.maxSalary} ${promo.currency.forexname }
						</g:if>
						<g:else >
							Salary:${promo.minSalary} ${promo.currency.forexname }
						</g:else>
					
					</p>
					<p>
					<g:if test="${promo.creator.id==session.profile }">
							promotion status:<b>${promo.status} </b>
					</g:if>
					
					</p>
					<p>
						${promo.body}
					</p>
					
				</div>
				<div class="cline"></div>
					<g:if test="${promo.creator.id==session.profile }">
						<g:if test="${promo.status==JobPromo.STATUS_CREATED}">
							<g:link  action="purchase" id="${promo.id}" onclick="return confirm('${message(code: 'jobpromo.button.purchase.confirm.message', default: 'Temporarily there is dummy function of purchase process. ')}');">
							pay for promotion</g:link> 
						</g:if>
						<g:elseif  test="${promo.status==JobPromo.STATUS_PAID}">
							<g:remoteLink   update="respMsg" url="[action:'publishAx', params:[id:promo.id] ]"   class="small">publish promotion</g:remoteLink>
						</g:elseif>
						<g:elseif  test="${promo.status==JobPromo.STATUS_PUBLISHED}">
							<g:remoteLink   update="respMsg" url="[action:'closeAx', params:[id:promo.id] ]"   class="small">close promotion</g:remoteLink>
						</g:elseif>
					</g:if>
						<div class="right">Total/ unique views:${totalViews[1] }/${totalViews[0]}</div>
					<div id=respMsg> </div>
				<div class="cl">&nbsp;</div>
			</div>
			
	
			<!-- End Box  -->
<auth:ifLoggedIn>
				 	<g:if test="promo.creator.id==session.profile ">
 
			<div class="simple">
				<div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-no">
					<ul>
					    <li><a href="#tab-1" class="active">Responses</a></li>
					    <li><a href="#tab-2">Statistics</a></li>
					</ul>
					<div id="tab-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
						<div class="description">
							<p>Here will be placed all users' responses for this promo.</p>
							<a href="#">read full story</a>
						</div>
					</div>
					<div id="tab-2">
						
						<div class="description">
							<h2> Promotion views statistics:</h2>
							<div id="statsPlotDiv" style="width:480px;height:200px; margin:29px;"></div>
							<div class="cl">&nbsp;</div>
							<div class="cline"></div>
							
							<h2> Last viewers:</h2>
							
				<g:each in="${viewers}" var="viewer" >
				<g:set var="profile" value="${viewer[0]}"></g:set>
				<div class="item">
			 	<div class="image">
				 	<g:if test="${false}">
						<g:link action="show" id="${profile.id }">
				 			<img height="64" width="50" src="" alt="${profile.fullName }" />
				 		</g:link>
				 	</g:if>
				 	<g:else>
				 		<g:link action="show" id="${profile.id }">
				 			<img height="32" width="32" src="${createLinkTo(dir:"images", file:'plcnofoto.jpg') }" alt="${profile.fullName }" />
				 		</g:link>
				 	</g:else>
				 	<div class="underPhoto">
				 	</br>
					</div>
				 	</div>
				<div class="">
					<h3> <g:link action="show" id="${profile.id }">${profile.fullName }</g:link>
					</h3>
					last view: <g:formatDate date="${viewer[1]}" type="datetime" style="SHORT" />. Total views: <b>${viewer[2] }</b>
						<br/>
						<b>${profile.profession}</b> in ${profile.industry?.name} industry<br/> 
						<g:if test="${profile.city }">
							From ${profile.city?.name}, ${profile.city.country?.name}
						</g:if> 
						<g:elseif test="${profile.country}">
							From ${profile.country}
						</g:elseif>
					
				</div>
				<!-- 
				<div class="cl">&nbsp;</div>
				<a href="#" class="small">Previous news</a>
				<a href="#" class="small">All news</a>
				<a href="#" class="small">Next news</a>
				 -->
				<div class="cline"></div>
				</div>
				</g:each>
		        
		        
						</div>
					</div>
	<div class="cl">&nbsp;</div>
				</div>
	<div class="cl">&nbsp;</div>
			</div>
	 				</g:if>
 
</auth:ifLoggedIn>			
		
						
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
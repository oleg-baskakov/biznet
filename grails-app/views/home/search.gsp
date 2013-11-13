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
			
		<h2><g:message code="search.result" default="Search result for ${q}" args="[q]"/> </h2>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		
			<div id="results">
			<g:if test="${result }">
		    <g:each in="${result.values()}" var="item">
		        <p class="result">
		        <g:link controller="${item.url?.controller}" id="${item.url?.id}" action="show">${item.title }</g:link><br/>
		         		<g:if test="${item.info}"><b>${item.info} </b><br/> </g:if>
		         		<g:if test="${item.snippet}">${item.snippet}<br/></g:if>

		        </p>
		    </g:each>
		    <br/>
		    <span class="paging">
		        <g:paginate total="${total}" max="15" params="[q:q, fq:fq]"/>
		    </span>
		    <g:if test="${total == 0}">
		    No Results found
		    </g:if>
		    </g:if>
			</div>

		</div>
	</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
				<g:render template='/templates/searchSidebar' />
			
</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
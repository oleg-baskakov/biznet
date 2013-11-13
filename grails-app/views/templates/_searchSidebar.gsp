			<div class="top">
			
				<h2>Search</h2>
				<ul class="pink">
				    <li><g:link controller="home" action="search" >in People</g:link></li>
				    <li>in Jobs</li>
				    <li>in Companies </li>
				    <li>in Groups</li>
				</ul>
			<h2>Filters</h2>
				<g:each in="${facets}" var="facet">
				<ul class="blue">
					<h3>Filter by ${facet?.key}</h3>
					<g:each in="${facet.value}" var="field">
						<li>
						<g:if test="${field.selected }">
							<g:link action="search" params="${field.selected }"><span style='color:red; font-size:14px'>X</span></g:link>
						</g:if>
							<g:link action="search" params="${field.urlParams }">
							<g:if test="${field.msg}"><g:message code="${field.name }" args="${field.args}"/> </g:if>
							<g:else>${field.name } </g:else> 
							</g:link>
						</li>
					</g:each>				
				</ul>
				</g:each>
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

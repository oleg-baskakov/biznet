	 
	      <g:hasErrors bean="${rec}">
            <div id="addErrorsDiv" >
            <div class="errors">
                <g:renderErrors bean="${rec}" as="list" />
                </div>
            </div>
           </g:hasErrors>
<g:if test="${!rec?.hasErrors()}">
	<div id="addResultDiv">

				<div class="holder">
				<b>
					<g:formatDate format="MMM.yyyy" date="${rec.startDate }" /> - 
					<g:formatDate format="MMM.yyyy" date="${rec.endDate}" />
				</b>
				</div>
				<div class="description">
						<p><b>${rec.school.name } </b><br/>
							
							${rec.school.city?.name } ${rec.school.city?.country?.name }
						</p>
						<p>
							${rec.studyFields }<br/>
							${rec.desc }
						</p>
						<p>
							${rec.awards }
						</p>
					</div>
					
					<div class="cl">&nbsp;</div>
				
	</div>
</g:if>
	 
	      <g:hasErrors bean="${record}">
            <div id="addErrorsDiv" >
            <div class="errors">
                <g:renderErrors bean="${record}" as="list" />
                </div>
            </div>
           </g:hasErrors>
<g:if test="${!record?.hasErrors()}">
	<div id="addResultDiv">

				<div class="holder">
				<b>
					<g:formatDate format="MMM.yyyy" date="${record.startDate }" /> - 
					<g:formatDate format="MMM.yyyy" date="${record.endDate}" />
				</b>
				</div>
				<div class="description">
						<h4>${record.position.name}</h4>
						<p><b>${record.company?.name } </b><br/>
							${record.company.city?.name } ${record.company.city?.country?.name }
							${record.company.industry?.name } | Size:${record.company.size}
						</p>
						<p>
							${record.description }
						</p>
					</div>
					
					<div class="cl">&nbsp;</div>
	
	</div>
</g:if>
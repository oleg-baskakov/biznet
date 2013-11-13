  <g:hasErrors bean="${msg}">
       <div id="addErrorsDiv" >
       <div class="errors">
       		<g:if test="${flash.error }">${flash.error }</g:if>
           <g:renderErrors bean="${msg}" as="list" />
           </div>
       </div>
      </g:hasErrors>
      <div id="resultDiv" ><p style="color:green" >Message had been send</p></div>

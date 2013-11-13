<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="profile.header" args="[profile.fullName ]" /></title>
        
        <script>
        var trgr=true;
		$(function(){
			$("#addFrm").hide();
			$("#addEduFrm").hide();
			$("#addBtn").button({
				text: false,
				icons: {
					primary: "ui-icon-circle-plus"
				}
			}).click(function(){
				var options;
					if(trgr){
						$("#addFrm").clone().appendTo("#addDiv").show('slow');
						options = {
								label: "Remove",
								icons: {
									primary: "ui-icon-circle-minus"
								}
							};
						trgr=false;
						
					}else{
						$("#addDiv").empty();
						options = {
								label: "Add",
								icons: {
									primary: "ui-icon-circle-plus"
								}
							};
						trgr=true;
						
					}
					$(this).button("option",options);
					
			});
			$("#cancelBtn").button().click(function(){
					trgr=true;
					//alert('D');
					$("#addDiv").empty();
			});
			
			$("#addEduBtn").button({
				text: false,
				icons: {
					primary: "ui-icon-circle-plus"
				}
			}).click(function(){
				var options;
					if(trgr){
						$("#addEduFrm").clone().appendTo("#addEduDiv").show('slow');
						options = {
								label: "Remove",
								icons: {
									primary: "ui-icon-circle-minus"
								}
							};
						trgr=false;
						
					}else{
						$("#addEduDiv").empty();
						options = {
								label: "Add",
								icons: {
									primary: "ui-icon-circle-plus"
								}
							};
						trgr=true;
						
					}
					$(this).button("option",options);
					
			});
		});

		var submitWork=true;

		
		function addOk(data,type){
			//alert(data);
			//submitWork=true;
			$("#submitBtn1").removeAttr("disabled");
			
			//$("#submitBtn1").attr("disabled", "false");
			//$("input[name=submitWork]").attr("disabled", false);
			var errors=$(data).filter("#addErrorsDiv").html();//$("#addErrorsDiv",data);
		//	alert(errors);
			if(errors){
			//	alert(errors);
				if(type==1)
					$("#addMsgs").append(errors);
				else
					$("#addEduMsgs").append(errors);
			}else{
				var result=$(data).first("#addResultDiv");
				//alert(result);
				if(result){
					if(type==1){
						$("#addFrm").empty()
						$("#recs").append(result);
						$("#addBtn").click();
					}else{
						$("#addEduFrm").empty()
						$("#recsEdu").append(result);
						$("#addEduBtn").click();

					}
					
				}
			}
		}
		function beforeAdd(type){
			//if(!submitWork)return false;
			if(type==1){
				$("#addMsgs").empty();
				$("#submitBtn1").attr("disabled", "disabled");
				
			}else{
				$("#addEduMsgs").empty();
			}
			//submitWork=false;
		}
	</script>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
			
				<g:link controller="profile" action="edit" id="${profile.id}" class="right"  >
				${message(code:'profile.edit',default:'Edit')}</g:link>
			
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
						<g:message code="profile.rating" default="Rating:">
						</g:message>
						</p>
				</div>
			 	</div>
				<div class="info">
					<h3>${profile.fullName }
					</h3>
					<p>
						<b>${profile.profession}</b> 
						${profile.industry?.name}<br/> 
						${profile.city?.name}, ${profile.country?.name} 
					</p>
					<p>
						${profile.status}
					</p>
					<p>
						${profile.info}
					</p>
					
				</div>
				<!-- 
				<div class="cl">&nbsp;</div>
				<a href="#" class="small">Previous news</a>
				<a href="#" class="small">All news</a>
				<a href="#" class="small">Next news</a>
				 -->
				<div class="cl">&nbsp;</div>
			</div>
			
	
			<!-- End Box  -->
			
			
			<div class="simple">
				<button id="addBtn" class="right-btn">Add</button>
			
				<h2> Work experience</h2>
				<div class="cl">&nbsp;</div>
				<div id="addDiv"></div>
				<div id="recs">
				<g:each in="${profile.workRecords}"  var="rec">
				<div class="holder">
				<b>
					<g:formatDate format="MMM.yyyy" date="${rec.startDate }" /> - 
					<g:formatDate format="MMM.yyyy" date="${rec.endDate}" />
				</b>
				</div>
				<div class="description">
						<g:link controller="workRecord" action="edit" id="${rec.id}" class="right"  >
				${message(code:'edit',default:'Edit')}</g:link>
						<h4>${rec.position.name}</h4>
	
	
						<p><b>${rec.company.name } </b><br/>
							${rec.company.city?.name } ${rec.company.city?.country?.name }
							${rec.company.industry?.name } | Size:${rec.company.size}
						</p>
						<p>
							${rec.description }
						</p>
					</div>
					
					<div class="cl">&nbsp;</div>
				
				</g:each>
				</div>
			</div>
			
			
			<div class="simple">
				<button id="addEduBtn" class="right-btn">Add</button>
			
				<h2> Education</h2>
				<div class="cl">&nbsp;</div>
				<div id="addEduDiv"></div>
				<div id="recsEdu">
				<g:each in="${profile.eduRecords}"  var="rec">
				<div class="holder">
				<b>
					<g:formatDate format="MMM.yyyy" date="${rec.startDate }" /> - 
					<g:formatDate format="MMM.yyyy" date="${rec.endDate}" />
				</b>
				</div>
				<div class="description">
						<g:link controller="eduRecord" action="edit" id="${rec.id}" class="right"  >
				${message(code:'edit',default:'Edit')}</g:link>
						<p><b>${rec.school.name } </b><br/>
							
							${rec.school.city?.name } ${rec.school.city?.country?.name }
						<div>
						</p>
						<p>
							${rec.studyFields }<br/>
							${rec.description }
						</p>
						<p>
							${rec.awards }
						</p>
					</div>
					</div>
					<div class="cl">&nbsp;</div>
				
				</g:each>
				</div>
			</div>
			
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			 	<g:render template='/templates/mainSidebar' />

		</div>
		<!-- End Sidebar -->
		
	</div>
	<!--   End Content -->
	
	<div class="cl">&nbsp;</div>
	
	<div id="addFrm">
		<div id="addMsgs"></div>
		     <g:form name="createFrm" action="addWork" useToken="true">
		     
                <div class="dialog">
                     <table>
                        <tbody>
                        <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="companyName"><g:message code="workRecord.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'company', 'errors')}">
                                    <g:textField name="companyName" value="" />
  									 <g:hiddenField name="company.id" value="" />
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="workRecord.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="month" value="" years="${sYear..eYear}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="workRecord.endDate.label" default="End Date" /></label>
                                </td>
                                
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="month" value="" years="${sYear..eYear}" />
                                </td>
                            </tr>
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="currentJob"><g:message code="workRecord.currentJob.label" default="I currently work here" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'currentJob', 'errors')}">
                                    <g:checkBox name="currentJob" value="${false }" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="position"><g:message code="workRecord.position.label" default="Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'position', 'errors')}">
                                    <g:textField name="positionName" value="" />
  									 <g:hiddenField name="position.id" value="" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jobType"><g:message code="workRecord.jobType.label" default="Job Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'jobType', 'errors')}">
                                    <g:select name="jobType" from="${workRecordInstance.constraints.jobType.inList}" value="" valueMessagePrefix="workRecord.jobType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="workRecord.description.label" default="Desc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'description', 'errors')}">
                                    <g:textArea rows="4" name="description" value="" />
                                </td>
                            </tr>
                        
                        
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button">
                    <g:submitToRemote name="submitWork" id="submitBtn1" class="save" before="beforeAdd(1)" url="[action:'addWork', onsuccess:'addOk(data,1)']" onSuccess="addOk(data,1)"  value="${message(code: 'default.button.create.label', default: 'Add record')}"  />
                    </span>
<!--                    
 <span class="button">
                    <button id="cancelBtn"  class="cancel">Cancel</button>
                    </span>
      -->
                 </div>
            </g:form>
	<div class="cl">&nbsp;</div>
	</div>


	<div id="addEduFrm">
		<div id="addEduMsgs"></div>
		     <g:form name="createEduFrm" action="addEdu" >
		     
                <div class="dialog">
                     <table>
                        <tbody>
                        <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="schoolName"><g:message code="school.label" default="School" /></label>
                                </td>
                                <td valign="top" class="value ">
                                    <g:textField name="schoolName" value="" />
  									 <g:hiddenField name="school.id" value="" />
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="eduRecord.startDate.label" default="Start education date" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:datePicker name="startDate" precision="month" value="" years="${sYear..eYear}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="eduRecord.endDate.label" default="End education date" /></label>
                                </td>
                                
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="month" value="" years="${sYear..eYear}" />
                                </td>
                            </tr>
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="degree"><g:message code="eduRecord.degree.label" default="Degree" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="degree" value="" />
                                </td>
                            </tr>


							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="studyFields"><g:message code="eduRecord.studyFields.label" default="Study fields" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="studyFields" value="" />
                                </td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="eduRecord.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textArea rows="4" columns="20" name="description" value="" />
                                </td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="awards"><g:message code="eduRecord.awards.label" default="Awards" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="awards" value="" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button">
                    <g:submitToRemote class="save" before="beforeAdd(2);" url="[action:'addSchool', onsuccess:'addOk(data,2)']" onSuccess="addOk(data,2)"  value="${message(code: 'default.button.create.label', default: 'Add record')}"  />
                    </span>
<!--                     <span class="button">
                    <button id="cancelBtn"  class="cancel">Cancel</button>
                    </span>
      -->
                 </div>
            </g:form>
	<div class="cl">&nbsp;</div>
	</div>



</body>
</html>
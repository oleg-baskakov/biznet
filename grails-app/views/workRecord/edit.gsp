<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="layout" content="base" />
	<script type="text/javascript" src="${resource(dir:'js',file:'jquery.relatedselects.min.js')}"></script>    

        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Work Record')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        
    <script type="text/javascript">
		$(function(){  
			$("#editFrm").relatedSelects({
				onChangeLoad: '${createLink(controller:"profile", action:"selectCityAjax")}',
				loadingMessage: 'Please wait',
				selects: [ 'country.id', 'city.id']
			}); 
		});
	</script>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			<div class="simple">
           <h1><g:message code="default.edit.label" args="['Work Record']" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${workRecordInstance}">
            <div class="errors">
                <g:renderErrors bean="${workRecordInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${workRecordInstance?.id}" />
                <g:hiddenField name="version" value="${workRecordInstance?.version}" />
                <div class="dialog">
                     <table>
                        <tbody>
                        <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="companyName"><g:message code="workRecord.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'company', 'errors')}">
                                    <g:textField name="companyName" value="${workRecordInstance?.company?.name }" />
  									<!-- <g:hiddenField name="company.id" value="${workRecordInstance?.company?.id }" />  --> 
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="workRecord.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="month" value="${workRecordInstance?.startDate }" years="${sYear..eYear}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="workRecord.endDate.label" default="End Date" /></label>
                                </td>
                                
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="month" value="${workRecordInstance?.endDate }" years="${sYear..eYear}" />
                                </td>
                            </tr>
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="currentJob"><g:message code="workRecord.currentJob.label" default="I currently work here" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'currentJob', 'errors')}">
                                    <g:checkBox name="currentJob" value="${workRecordInstance?.currentJob }" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="position"><g:message code="workRecord.position.label" default="Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'position', 'errors')}">
                                    <g:textField name="positionName" value="${workRecordInstance?.position?.name }" />
  									 <!-- <g:hiddenField name="position.id" value="${workRecordInstance?.position?.id }" /> -->
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jobType"><g:message code="workRecord.jobType.label" default="Job Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'jobType', 'errors')}">
                                    <g:select name="jobType" from="${workRecordInstance.constraints.jobType.inList}" value="${workRecordInstance?.jobType }" valueMessagePrefix="workRecord.jobType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="workRecord.description.label" default="description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'description', 'errors')}">
                                    <g:textArea rows="4" name="description" value="${workRecordInstance?.description }" />
                                </td>
                            </tr>
                        
                        
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
	
			 	
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
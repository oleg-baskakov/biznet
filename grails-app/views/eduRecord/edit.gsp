<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="layout" content="base" />
	<script type="text/javascript" src="${resource(dir:'js',file:'jquery.relatedselects.min.js')}"></script>    

        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Education Record')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        
  
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			<div class="simple">
           <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eduRecordInstance}">
            <div class="errors">
                <g:renderErrors bean="${eduRecordInstance}" as="list" />
            </div>
            </g:hasErrors>
		     <g:form  action="edit" >
                <g:hiddenField name="id" value="${eduRecordInstance?.id}" />
                <g:hiddenField name="version" value="${eduRecordInstance?.version}" />
		     
                <div class="dialog">
                     <table>
                        <tbody>
                        <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="schoolName"><g:message code="school.label" default="School" /></label>
                                </td>
                                <td valign="top" class="value ">
                                    <g:textField name="schoolName" value="${eduRecordInstance.school?.name }" />
  									 <g:hiddenField name="schoolId" value="" />
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="eduRecord.startDate.label" default="Start education date" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:datePicker name="startDate" precision="month" value="${eduRecordInstance.startDate }" years="${sYear..eYear}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="eduRecord.endDate.label" default="End education date" /></label>
                                </td>
                                
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="month" value="${eduRecordInstance.endDate }" years="${sYear..eYear}" />
                                </td>
                            </tr>
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="degree"><g:message code="eduRecord.degree.label" default="Degree" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="degree" value="${eduRecordInstance.degree }" />
                                </td>
                            </tr>


							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="studyFields"><g:message code="eduRecord.studyFields.label" default="Study fields" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="studyFields" value="${eduRecordInstance.studyFields }" />
                                </td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="desc"><g:message code="eduRecord.desc.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textArea rows="4" columns="20" name="description" value="${eduRecordInstance.description }" />
                                </td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="awards"><g:message code="eduRecord.awards.label" default="Awards" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="awards" value="${eduRecordInstance.awards }" />
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
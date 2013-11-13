

<%@ page import="joberty.WorkRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'workRecord.label', default: 'WorkRecord')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
                                  <label for="desc"><g:message code="workRecord.desc.label" default="Desc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'desc', 'errors')}">
                                    <g:textField name="desc" value="${workRecordInstance?.desc}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobType"><g:message code="workRecord.jobType.label" default="Job Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'jobType', 'errors')}">
                                    <g:select name="jobType" from="${workRecordInstance.constraints.jobType.inList}" value="${workRecordInstance?.jobType}" valueMessagePrefix="workRecord.jobType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="company"><g:message code="workRecord.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'company', 'errors')}">
                                    <g:select name="company.id" from="${joberty.dic.Company.list()}" optionKey="id" value="${workRecordInstance?.company?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="currentJob"><g:message code="workRecord.currentJob.label" default="Current Job" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'currentJob', 'errors')}">
                                    <g:checkBox name="currentJob" value="${workRecordInstance?.currentJob}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endDate"><g:message code="workRecord.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${workRecordInstance?.endDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="position"><g:message code="workRecord.position.label" default="Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'position', 'errors')}">
                                    <g:select name="position.id" from="${joberty.dic.JobPosition.list()}" optionKey="id" value="${workRecordInstance?.position?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="profile"><g:message code="workRecord.profile.label" default="Profile" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'profile', 'errors')}">
                                    <g:select name="profile.id" from="${joberty.Profile.list()}" optionKey="id" value="${workRecordInstance?.profile?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="startDate"><g:message code="workRecord.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workRecordInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${workRecordInstance?.startDate}"  />
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
        </div>
    </body>
</html>

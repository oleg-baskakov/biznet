
<%@ page import="joberty.WorkRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'workRecord.label', default: 'WorkRecord')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: workRecordInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.description.label" default="description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: workRecordInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.jobType.label" default="Job Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: workRecordInstance, field: "jobType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${workRecordInstance?.company?.id}">${workRecordInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.currentJob.label" default="Current Job" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${workRecordInstance?.currentJob}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${workRecordInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${workRecordInstance?.endDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${workRecordInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.position.label" default="Position" /></td>
                            
                            <td valign="top" class="value"><g:link controller="jobPosition" action="show" id="${workRecordInstance?.position?.id}">${workRecordInstance?.position?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.profile.label" default="Profile" /></td>
                            
                            <td valign="top" class="value"><g:link controller="profile" action="show" id="${workRecordInstance?.profile?.id}">${workRecordInstance?.profile?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="workRecord.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${workRecordInstance?.startDate}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${workRecordInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

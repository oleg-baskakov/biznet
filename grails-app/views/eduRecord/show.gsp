
<%@ page import="joberty.EduRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eduRecord.label', default: 'EduRecord')}" />
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
                            <td valign="top" class="name"><g:message code="eduRecord.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eduRecordInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.degree.label" default="Degree" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eduRecordInstance, field: "degree")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.studyFields.label" default="Study Fields" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eduRecordInstance, field: "studyFields")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${eduRecordInstance?.startDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${eduRecordInstance?.endDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.description.label" default="description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eduRecordInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.awards.label" default="Awards" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eduRecordInstance, field: "awards")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${eduRecordInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${eduRecordInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.profile.label" default="Profile" /></td>
                            
                            <td valign="top" class="value"><g:link controller="profile" action="show" id="${eduRecordInstance?.profile?.id}">${eduRecordInstance?.profile?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="eduRecord.school.label" default="School" /></td>
                            
                            <td valign="top" class="value"><g:link controller="school" action="show" id="${eduRecordInstance?.school?.id}">${eduRecordInstance?.school?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${eduRecordInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

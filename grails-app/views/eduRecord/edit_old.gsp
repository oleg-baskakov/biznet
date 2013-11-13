

<%@ page import="joberty.EduRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eduRecord.label', default: 'EduRecord')}" />
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
            <g:hasErrors bean="${eduRecordInstance}">
            <div class="errors">
                <g:renderErrors bean="${eduRecordInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${eduRecordInstance?.id}" />
                <g:hiddenField name="version" value="${eduRecordInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="degree"><g:message code="eduRecord.degree.label" default="Degree" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'degree', 'errors')}">
                                    <g:textField name="degree" value="${eduRecordInstance?.degree}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="studyFields"><g:message code="eduRecord.studyFields.label" default="Study Fields" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'studyFields', 'errors')}">
                                    <g:textField name="studyFields" value="${eduRecordInstance?.studyFields}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="startDate"><g:message code="eduRecord.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${eduRecordInstance?.startDate}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endDate"><g:message code="eduRecord.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${eduRecordInstance?.endDate}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="desc"><g:message code="eduRecord.desc.label" default="Desc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'desc', 'errors')}">
                                    <g:textField name="desc" value="${eduRecordInstance?.desc}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="awards"><g:message code="eduRecord.awards.label" default="Awards" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'awards', 'errors')}">
                                    <g:textField name="awards" value="${eduRecordInstance?.awards}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="profile"><g:message code="eduRecord.profile.label" default="Profile" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'profile', 'errors')}">
                                    <g:select name="profile.id" from="${joberty.Profile.list()}" optionKey="id" value="${eduRecordInstance?.profile?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="school"><g:message code="eduRecord.school.label" default="School" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eduRecordInstance, field: 'school', 'errors')}">
                                    <g:select name="school.id" from="${joberty.dic.School.list()}" optionKey="id" value="${eduRecordInstance?.school?.id}"  />
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

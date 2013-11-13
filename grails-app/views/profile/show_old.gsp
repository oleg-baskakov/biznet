
<%@ page import="joberty.Profile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
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
                            <td valign="top" class="name"><g:message code="profile.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.middleName.label" default="Middle Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "middleName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${profileInstance?.user?.id}">${profileInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.profession.label" default="Profession" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "profession")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.birth.label" default="Birth" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${profileInstance?.birth}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.city.label" default="City" /></td>
                            
                            <td valign="top" class="value"><g:link controller="city" action="show" id="${profileInstance?.city?.id}">${profileInstance?.city?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.country.label" default="Country" /></td>
                            
                            <td valign="top" class="value"><g:link controller="country" action="show" id="${profileInstance?.country?.id}">${profileInstance?.country?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${profileInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.industry.label" default="Industry" /></td>
                            
                            <td valign="top" class="value"><g:link controller="industry" action="show" id="${profileInstance?.industry?.id}">${profileInstance?.industry?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.info.label" default="Info" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "info")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${profileInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.sex.label" default="Sex" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "sex")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.workRecord.label" default="Work Record" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${profileInstance.workRecord}" var="w">
                                    <li><g:link controller="workRecord" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${profileInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>


<%@ page import="joberty.promo.JobPromo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobPromo.label', default: 'JobPromo')}" />
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
                            <td valign="top" class="name"><g:message code="jobPromo.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.city.label" default="City" /></td>
                            
                            <td valign="top" class="value"><g:link controller="city" action="show" id="${jobPromoInstance?.city?.id}">${jobPromoInstance?.city?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.companyDesc.label" default="Company Desc" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "companyDesc")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "startDate")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.jobDuration.label" default="Job Duration" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "jobDuration")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.positionType.label" default="Position Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "positionType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.body.label" default="Body" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "body")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.country.label" default="Country" /></td>
                            
                            <td valign="top" class="value"><g:link controller="country" action="show" id="${jobPromoInstance?.country?.id}">${jobPromoInstance?.country?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.creator.label" default="Creator" /></td>
                            
                            <td valign="top" class="value"><g:link controller="profile" action="show" id="${jobPromoInstance?.creator?.id}">${jobPromoInstance?.creator?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${jobPromoInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.isPaid.label" default="Is Paid" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${jobPromoInstance?.isPaid}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.keywords.label" default="Keywords" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "keywords")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${jobPromoInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.position.label" default="Position" /></td>
                            
                            <td valign="top" class="value"><g:link controller="jobPosition" action="show" id="${jobPromoInstance?.position?.id}">${jobPromoInstance?.position?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobPromo.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobPromoInstance, field: "type")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${jobPromoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>



<%@ page import="joberty.promo.JobPromo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobPromo.label', default: 'JobPromo')}" />
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
            <g:hasErrors bean="${jobPromoInstance}">
            <div class="errors">
                <g:renderErrors bean="${jobPromoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${jobPromoInstance?.id}" />
                <g:hiddenField name="version" value="${jobPromoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="jobPromo.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${jobPromoInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="jobPromo.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'city', 'errors')}">
                                    <g:select name="city.id" from="${joberty.dic.City.list()}" optionKey="id" value="${jobPromoInstance?.city?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="companyDesc"><g:message code="jobPromo.companyDesc.label" default="Company Desc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'companyDesc', 'errors')}">
                                    <g:textField name="companyDesc" value="${jobPromoInstance?.companyDesc}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="startDate"><g:message code="jobPromo.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'startDate', 'errors')}">
                                    <g:textField name="startDate" value="${jobPromoInstance?.startDate}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobDuration"><g:message code="jobPromo.jobDuration.label" default="Job Duration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'jobDuration', 'errors')}">
                                    <g:textField name="jobDuration" value="${jobPromoInstance?.jobDuration}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="positionType"><g:message code="jobPromo.positionType.label" default="Position Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'positionType', 'errors')}">
                                    <g:select name="positionType" from="${jobPromoInstance.constraints.positionType.inList}" value="${jobPromoInstance?.positionType}" valueMessagePrefix="jobPromo.positionType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="body"><g:message code="jobPromo.body.label" default="Body" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'body', 'errors')}">
                                    <g:textField name="body" value="${jobPromoInstance?.body}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="country"><g:message code="jobPromo.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'country', 'errors')}">
                                    <g:select name="country.id" from="${joberty.dic.Country.list()}" optionKey="id" value="${jobPromoInstance?.country?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="creator"><g:message code="jobPromo.creator.label" default="Creator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'creator', 'errors')}">
                                    <g:select name="creator.id" from="${joberty.Profile.list()}" optionKey="id" value="${jobPromoInstance?.creator?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isPaid"><g:message code="jobPromo.isPaid.label" default="Is Paid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'isPaid', 'errors')}">
                                    <g:checkBox name="isPaid" value="${jobPromoInstance?.isPaid}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="keywords"><g:message code="jobPromo.keywords.label" default="Keywords" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'keywords', 'errors')}">
                                    <g:textField name="keywords" value="${jobPromoInstance?.keywords}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="position"><g:message code="jobPromo.position.label" default="Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'position', 'errors')}">
                                    <g:select name="position.id" from="${joberty.dic.JobPosition.list()}" optionKey="id" value="${jobPromoInstance?.position?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="jobPromo.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'type', 'errors')}">
                                    <g:textField name="type" value="${fieldValue(bean: jobPromoInstance, field: 'type')}" />
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

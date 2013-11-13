

<%@ page import="joberty.JobAlert" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobAlert.label', default: 'JobAlert')}" />
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
            <g:hasErrors bean="${jobAlertInstance}">
            <div class="errors">
                <g:renderErrors bean="${jobAlertInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${jobAlertInstance?.id}" />
                <g:hiddenField name="version" value="${jobAlertInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="jobAlert.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'city', 'errors')}">
                                    <g:select name="city.id" from="${joberty.dic.City.list()}" optionKey="id" value="${jobAlertInstance?.city?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="industry"><g:message code="jobAlert.industry.label" default="Industry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'industry', 'errors')}">
                                    <g:select name="industry.id" from="${joberty.dic.Industry.list()}" optionKey="id" value="${jobAlertInstance?.industry?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="position"><g:message code="jobAlert.position.label" default="Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'position', 'errors')}">
                                    <g:select name="position.id" from="${joberty.dic.JobPosition.list()}" optionKey="id" value="${jobAlertInstance?.position?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="creator"><g:message code="jobAlert.creator.label" default="Creator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'creator', 'errors')}">
                                    <g:select name="creator.id" from="${joberty.Profile.list()}" optionKey="id" value="${jobAlertInstance?.creator?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="query"><g:message code="jobAlert.query.label" default="Query" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'query', 'errors')}">
                                    <g:textField name="query" value="${jobAlertInstance?.query}" />
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

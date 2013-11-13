

<%@ page import="joberty.dic.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
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
            <g:hasErrors bean="${companyInstance}">
            <div class="errors">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${companyInstance?.id}" />
                <g:hiddenField name="version" value="${companyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="website"><g:message code="company.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${companyInstance?.website}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="industry"><g:message code="company.industry.label" default="Industry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'industry', 'errors')}">
                                    <g:select name="industry.id" from="${joberty.dic.Industry.list()}" optionKey="id" value="${companyInstance?.industry?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="company.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'city', 'errors')}">
                                    <g:select name="city.id" from="${joberty.dic.City.list()}" optionKey="id" value="${companyInstance?.city?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="company.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${joberty.Profile.list()}" optionKey="id" value="${companyInstance?.owner?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="highlights"><g:message code="company.highlights.label" default="Highlights" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'highlights', 'errors')}">
                                    <g:textField name="highlights" value="${companyInstance?.highlights}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="size"><g:message code="company.size.label" default="Size" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'size', 'errors')}">
                                    <g:select name="size" from="${companyInstance.constraints.size.inList}" value="${companyInstance?.size}" valueMessagePrefix="company.size" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="company.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${companyInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="company.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'type', 'errors')}">
                                    <g:textField name="type" value="${fieldValue(bean: companyInstance, field: 'type')}" />
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

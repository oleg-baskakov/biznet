

<%@ page import="joberty.Profile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${profileInstance}">
            <div class="errors">
                <g:renderErrors bean="${profileInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="middleName"><g:message code="profile.middleName.label" default="Middle Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'middleName', 'errors')}">
                                    <g:textField name="middleName" value="${profileInstance?.middleName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="profile.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${joberty.User.list()}" optionKey="id" value="${profileInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="profession"><g:message code="profile.profession.label" default="Profession" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'profession', 'errors')}">
                                    <g:textField name="profession" value="${profileInstance?.profession}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="birth"><g:message code="profile.birth.label" default="Birth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'birth', 'errors')}">
                                    <g:datePicker name="birth" precision="day" value="${profileInstance?.birth}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="profile.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'city', 'errors')}">
                                    <g:select name="city.id" from="${joberty.dic.City.list()}" optionKey="id" value="${profileInstance?.city?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="profile.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'country', 'errors')}">
                                    <g:select name="country.id" from="${joberty.dic.Country.list()}" optionKey="id" value="${profileInstance?.country?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="industry"><g:message code="profile.industry.label" default="Industry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'industry', 'errors')}">
                                    <g:select name="industry.id" from="${joberty.dic.Industry.list()}" optionKey="id" value="${profileInstance?.industry?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="info"><g:message code="profile.info.label" default="Info" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'info', 'errors')}">
                                    <g:textField name="info" value="${profileInstance?.info}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sex"><g:message code="profile.sex.label" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'sex', 'errors')}">
                                    <g:textField name="sex" value="${fieldValue(bean: profileInstance, field: 'sex')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>


<%@ page import="joberty.JobAlert" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobAlert.label', default: 'JobAlert')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'jobAlert.id.label', default: 'Id')}" />
                        
                            <th><g:message code="jobAlert.city.label" default="City" /></th>
                        
                            <th><g:message code="jobAlert.industry.label" default="Industry" /></th>
                        
                            <th><g:message code="jobAlert.position.label" default="Position" /></th>
                        
                            <th><g:message code="jobAlert.creator.label" default="Creator" /></th>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'jobAlert.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jobAlertInstanceList}" status="i" var="jobAlertInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${jobAlertInstance.id}">${fieldValue(bean: jobAlertInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: jobAlertInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: jobAlertInstance, field: "industry")}</td>
                        
                            <td>${fieldValue(bean: jobAlertInstance, field: "position")}</td>
                        
                            <td>${fieldValue(bean: jobAlertInstance, field: "creator")}</td>
                        
                            <td><g:formatDate date="${jobAlertInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jobAlertInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

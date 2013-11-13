
<%@ page import="joberty.WorkRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'workRecord.label', default: 'WorkRecord')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'workRecord.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'workRecord.description.label', default: 'description')}" />
                        
                            <g:sortableColumn property="jobType" title="${message(code: 'workRecord.jobType.label', default: 'Job Type')}" />
                        
                            <th><g:message code="workRecord.company.label" default="Company" /></th>
                        
                            <g:sortableColumn property="currentJob" title="${message(code: 'workRecord.currentJob.label', default: 'Current Job')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'workRecord.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${workRecordInstanceList}" status="i" var="workRecordInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${workRecordInstance.id}">${fieldValue(bean: workRecordInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: workRecordInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: workRecordInstance, field: "jobType")}</td>
                        
                            <td>${fieldValue(bean: workRecordInstance, field: "company")}</td>
                        
                            <td><g:formatBoolean boolean="${workRecordInstance.currentJob}" /></td>
                        
                            <td><g:formatDate date="${workRecordInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${workRecordInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

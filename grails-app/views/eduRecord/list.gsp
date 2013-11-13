
<%@ page import="joberty.EduRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eduRecord.label', default: 'EduRecord')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'eduRecord.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="degree" title="${message(code: 'eduRecord.degree.label', default: 'Degree')}" />
                        
                            <g:sortableColumn property="studyFields" title="${message(code: 'eduRecord.studyFields.label', default: 'Study Fields')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'eduRecord.startDate.label', default: 'Start Date')}" />
                        
                            <g:sortableColumn property="endDate" title="${message(code: 'eduRecord.endDate.label', default: 'End Date')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'eduRecord.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eduRecordInstanceList}" status="i" var="eduRecordInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eduRecordInstance.id}">${fieldValue(bean: eduRecordInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: eduRecordInstance, field: "degree")}</td>
                        
                            <td>${fieldValue(bean: eduRecordInstance, field: "studyFields")}</td>
                        
                            <td><g:formatDate date="${eduRecordInstance.startDate}" /></td>
                        
                            <td><g:formatDate date="${eduRecordInstance.endDate}" /></td>
                        
                            <td>${fieldValue(bean: eduRecordInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eduRecordInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

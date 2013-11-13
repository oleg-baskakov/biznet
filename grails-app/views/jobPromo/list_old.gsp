
<%@ page import="joberty.promo.JobPromo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobPromo.label', default: 'JobPromo')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'jobPromo.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'jobPromo.title.label', default: 'Title')}" />
                        
                            <th><g:message code="jobPromo.city.label" default="City" /></th>
                        
                            <g:sortableColumn property="companyDesc" title="${message(code: 'jobPromo.companyDesc.label', default: 'Company Desc')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'jobPromo.startDate.label', default: 'Start Date')}" />
                        
                            <g:sortableColumn property="jobDuration" title="${message(code: 'jobPromo.jobDuration.label', default: 'Job Duration')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jobPromoInstanceList}" status="i" var="jobPromoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${jobPromoInstance.id}">${fieldValue(bean: jobPromoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: jobPromoInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: jobPromoInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: jobPromoInstance, field: "companyDesc")}</td>
                        
                            <td>${fieldValue(bean: jobPromoInstance, field: "startDate")}</td>
                        
                            <td>${fieldValue(bean: jobPromoInstance, field: "jobDuration")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jobPromoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

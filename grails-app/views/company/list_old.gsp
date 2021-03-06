
<%@ page import="joberty.dic.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'company.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="website" title="${message(code: 'company.website.label', default: 'Website')}" />
                        
                            <th><g:message code="company.industry.label" default="Industry" /></th>
                        
                            <th><g:message code="company.city.label" default="City" /></th>
                        
                            <th><g:message code="company.owner.label" default="Owner" /></th>
                        
                            <g:sortableColumn property="highlights" title="${message(code: 'company.highlights.label', default: 'Highlights')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${companyInstanceList}" status="i" var="companyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "website")}</td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "industry")}</td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "owner")}</td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "highlights")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${companyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

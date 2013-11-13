

<%@ page import="joberty.Chat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'chat.label', default: 'Chat')}" />
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
            <g:hasErrors bean="${chatInstance}">
            <div class="errors">
                <g:renderErrors bean="${chatInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${chatInstance?.id}" />
                <g:hiddenField name="version" value="${chatInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="members"><g:message code="chat.members.label" default="Members" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chatInstance, field: 'members', 'errors')}">
                                    <g:select name="members" from="${joberty.Profile.list()}" multiple="yes" optionKey="id" size="5" value="${chatInstance?.members*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="messages"><g:message code="chat.messages.label" default="Messages" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chatInstance, field: 'messages', 'errors')}">
                                    <g:select name="messages" from="${joberty.chat.Message.list()}" multiple="yes" optionKey="id" size="5" value="${chatInstance?.messages*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="roomId"><g:message code="chat.roomId.label" default="Room Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chatInstance, field: 'roomId', 'errors')}">
                                    <g:textField name="roomId" value="${chatInstance?.roomId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="chat.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chatInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${fieldValue(bean: chatInstance, field: 'status')}" />
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

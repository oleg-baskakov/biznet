<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="joberty.promo.JobPromo;"%>

<head>
	<meta name="layout" content="base" />
	<script type="text/javascript" src="${resource(dir:'js',file:'jquery.relatedselects.min.js')}"></script>    

        <g:set var="entityName" value="${message(code: 'jobalert.label', default: 'Job alert')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        
    <script type="text/javascript">
		$(function(){  
			$("#createFrm").relatedSelects({
				onChangeLoad: '${createLink(controller:"profile", action:"selectCityAjax")}',
				loadingMessage: 'Please wait',
				selects: [ 'country.id', 'city.id']
				
			}); 
		});
	</script>
</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			<div class="simple">
			 	<h2 class="no-border"><g:message code="default.create.label" args="[entityName]" /> </h2>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
             <g:hasErrors bean="${jobAlertInstance}">
            <div class="errors">
                <g:renderErrors bean="${jobAlertInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" name="createFrm" useToken="true">
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="jobAlert.query.label" default="Title of job alert" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${jobAlertInstance?.title}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="query"><g:message code="jobAlert.query.label" default="Job query or keywords" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'query', 'errors')}">
                                    <g:textField name="query" value="${jobAlertInstance?.query}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="positionName"><g:message code="jobAlert.position.label" default="Job Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'position', 'errors')}">
                                    <g:textField name="positionName" value="${jobAlertInstance?.position?.name}" />
                                </td>
                            </tr>

                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'country', 'errors')}">
                                <g:if test="jobAlertInstance?.city!=null">
                                    <g:select id="country.id" name="country.id" noSelection="['':'Please select country']" from="${joberty.dic.Country.list()}" optionKey="id"  optionValue="name" value=""  />
                                </g:if>
                                <g:else>
                                    <g:select id="country.id" name="country.id"  from="['-']" value=""  />
                                </g:else>
                                </td>
                            </tr>
           
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="jobAlert.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'city', 'errors')}">
                                <g:if test="jobAlertInstance?.city!=null">
                                    <g:select id="city.id" name="city.id"   value="${jobAlertInstance?.city?.id}"  />
                                </g:if>
                                <g:else>
                                    <g:select id="city.id" name="city.id"  from="['-']" value=""  />
                                </g:else>
                                </td>
                            </tr>
                         
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="industry"><g:message code="jobAlert.industry.label" default="Industry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobAlertInstance, field: 'industry', 'errors')}">
                                    <g:select name="industry.id" from="${joberty.dic.Industry.list()}" optionKey="id" optionValue="name" value="${jobAlertInstance?.industry?.id}" noSelection="[null: '-']" />
                                </td>
                            </tr>
                        
                        
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
 	 	
			<div class="cl">&nbsp;</div>
		</div>

			<!-- End Box  -->
			
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			 	<g:render template='/templates/mainSidebar' />
		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
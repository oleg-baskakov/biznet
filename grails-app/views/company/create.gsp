<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="layout" content="base" />
	<script type="text/javascript" src="${resource(dir:'js',file:'jquery.relatedselects.min.js')}"></script>    

        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
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
            <g:hasErrors bean="${companyInstance}">
            <div class="errors">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form name="createFrm" action="save" useToken="true">
                <div class="dialog">
                    <table>
                        <tbody>
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
                                    <label for="highlights"><g:message code="company.highlights.label" default="Highlights" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'highlights', 'errors')}">
                                    <g:textArea rows="5" name="highlights" value="${companyInstance?.highlights}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="industry"><g:message code="company.industry.label" default="Industry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'industry', 'errors')}">
                                    <g:select name="industry.id" from="${joberty.dic.Industry.list()}" optionKey="id" optionValue="name" value="${companyInstance?.industry?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                            
                                                   
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'country', 'errors')}">
                                    <g:select id="country.id" name="country.id" noSelection="['':'Please select country']" from="${joberty.dic.Country.list()}" optionKey="id"  optionValue="name" value=""  />
                                </td>
                            </tr>
           
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'city', 'errors')}">
                                <g:if test="companyInstance?.city!=null">
                                    <g:select id="city.id" name="city.id"   value="${companyInstance?.city?.id}"  />
                                </g:if>
                                <g:else>
                                    <g:select id="city.id" name="city.id"  from="['-']" value=""  />
                                </g:else>
                                </td>
                            </tr>
                        
 
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
                                    <label for="size"><g:message code="company.size.label" default="Size" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'size', 'errors')}">
                                    <g:select name="size" from="${companyInstance.constraints.size.inList}" value="${companyInstance?.size}" valueMessagePrefix="company.size" noSelection="['': '']" />
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
			 
    <div class="field">
    <p class="name">Password:</p> </label><input type="password" name="password"/><br/>
	</div>

		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
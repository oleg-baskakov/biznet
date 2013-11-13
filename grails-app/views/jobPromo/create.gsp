<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="joberty.promo.JobPromo;"%>

<head>
	<meta name="layout" content="base" />
	<script type="text/javascript" src="${resource(dir:'js',file:'jquery.relatedselects.min.js')}"></script>    

        <g:set var="entityName" value="${message(code: 'jobpromo.label', default: 'Job promotion')}" />
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
            <g:hasErrors bean="${jobPromoInstance}">
            <div class="errors">
                <g:renderErrors bean="${jobPromoInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${jobPromoInstance?.title}" />
                                </td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="body"><g:message code="jobpromo.body.label" default="Text of promo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'body', 'errors')}">
                                    <g:textArea rows="5" name="body" value="${jobPromoInstance?.body}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="jobpromo.type.label" default="Promotion type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'type', 'errors')}">
                                    <g:select id="type" name="type" noSelection="['':'Please select type of promotion']" 
                                    from="[[id:JobPromo.TYPE_BASIC, name:'Basic'],
                                           [id:JobPromo.TYPE_ADVANCED, name:'Advanced']]" 
                                    optionKey="id"  optionValue="name" value=""  />
                                </td>
                            </tr>
                            
                                                   
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'country', 'errors')}">
                                    <g:select id="country.id" name="country.id" noSelection="['':'Please select country']" from="${joberty.dic.Country.list()}" optionKey="id"  optionValue="name" value=""  />
                                </td>
                            </tr>
           
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'city', 'errors')}">
                                <g:if test="jobPromoInstance?.city!=null">
                                    <g:select id="city.id" name="city.id"   value="${jobPromoInstance?.city?.id}"  />
                                </g:if>
                                <g:else>
                                    <g:select id="city.id" name="city.id"  from="['-']" value=""  />
                                </g:else>
                                </td>
                            </tr>
                        
 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="positionName"><g:message code="jobpromo.position.label" default="Job position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'position', 'errors')}">
                                    <g:textField name="positionName" value="${jobPromoInstance?.position?.name}" />
                                    
                                </td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="size"><g:message code="jobpromo.companyDesc.label" default="Company description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'companyDesc', 'errors')}">
                                    <g:textField name="companyDesc" value="${jobPromoInstance?.companyDesc}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="size"><g:message code="jobpromo.jobStartDate.label" default="Job start date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" value="${jobPromoInstance?.startDate}" precision="month"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="positionType"><g:message code="jobPromo.positionType.label" default="Position Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'positionType', 'errors')}">
                                    <g:select name="positionType" from="${jobPromoInstance.constraints.positionType.inList}" value="${jobPromoInstance?.positionType}" valueMessagePrefix="jobPromo.positionType"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="size"><g:message code="jobpromo.jobDuration.label" default="Job duration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'jobDuration', 'errors')}">
                                    <g:textField name="jobDuration" value="${jobPromoInstance?.jobDuration}" />
                                </td>
                            </tr>
                                  <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="salary"><g:message code="jobpromo.salary.label" default="Salary" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'salary', 'errors')}">
                                    <g:textField name="salary" value="${jobPromoInstance?.maxSalary>0?jobPromoInstance?.minSalary.intValue()+'-'+jobPromoInstance?.maxSalary.intValue():'0-3000'}" />
                                </td>
                                <td valign="top" class="name">
                                    <label for="currency"><g:message code="currency.label" default="Currency" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobPromoInstance, field: 'country', 'errors')}">
                                    <g:select id="currency.id" name="currency.id" from="${joberty.dic.Currency.list()}" optionKey="id"  optionValue="name" value=""  />
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
			 	<g:render template='/templates/promosSidebar' />
		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
</body>
</html>
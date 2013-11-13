<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="layout" content="base" />
	<script type="text/javascript" src="${resource(dir:'js',file:'jquery.relatedselects.min.js')}"></script>    

        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        
    <script type="text/javascript">
		$(function(){  
			$("#editFrm").relatedSelects({
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
	           <g:hasErrors bean="${profileInstance}">
            <div class="errors">
                <g:renderErrors bean="${profileInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form  name="editFrm" method="post" action="update" >
                <g:hiddenField name="id" value="${profileInstance?.id}" />
                <g:hiddenField name="version" value="${profileInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="user.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: session.user, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${session.user?.name}" />
                                </td>
                            </tr>
                        
                          <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surname"><g:message code="user.surname.label" default="Second Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: session.user, field: 'surname', 'errors')}">
                                    <g:textField name="surname" value="${session.user?.surname}" />
                                </td>
                            </tr>
                          
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="middleName"><g:message code="user.middleName.label" default="Middle Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: session.user, field: 'middleName', 'errors')}">
                                    <g:textField name="middleName" value="${session.user?.middleName}" />
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
                                    <label for="country"><g:message code="profile.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'country', 'errors')}">
                                    <g:select id="country.id" name="country.id" noSelection="['':'Please select country']" from="${joberty.dic.Country.list()}" optionKey="id"  optionValue="name" value="${profileInstance?.country?.id}"  />
                                </td>
                            </tr>
           
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="profile.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'city', 'errors')}">
                                <g:if test="profileInstance?.city!=null">
                                    <g:select id="city.id" name="city.id"   value="${profileInstance?.city?.id}"  />
                                </g:if>
                                <g:else>
                                    <g:select id="city.id" name="city.id"  from="['-']" value=""  />
                                </g:else>
                                </td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="industry"><g:message code="profile.industry.label" default="Industry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'industry', 'errors')}">
                                    <g:select name="industry.id" from="${joberty.dic.Industry.list()}" optionKey="id" optionValue="name" value="${profileInstance?.industry?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="info"><g:message code="profile.info.label" default="Info" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'info', 'errors')}">
                                    <g:textArea name="info" rows=4 value="${profileInstance?.info}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sex"><g:message code="profile.sex.label" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'sex', 'errors')}">
                                    <g:select valueMessagePrefix="profile.sex" name="sex" 	 from="['0','1','2']" value="" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="update" action="update" class="save" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
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
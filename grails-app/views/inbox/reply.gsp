<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title>${msg?.theme }</title>
        <link type="text/css" href="${resource(dir:'css',file:'jquery.wysiwyg.css')}" rel="Stylesheet" />	
        
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.image.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.link.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.table.js')}"></script>


    <script type="text/javascript">
    $(function() {
        $('#msg').wysiwyg({
			initialContent:'',
			rmUnusedControls: true,
            controls: {
                bold: { visible : true },
                italic: { visible : true },
                strikeThrough: { visible : true },
                underline: { visible : true },
                justifyLeft: { visible : true },
                justifyCenter: { visible : true },
                justifyRight: { visible : true },
                justifyFull: { visible : true },
                indent: { visible : true },
                outdent: { visible : true },
                undo: { visible : true },
                redo: { visible : true },
                insertOrderedList: { visible : true },
                insertUnorderedList: { visible : true },
                insertHorizontalRule: { visible : true },
                createLink: { visible : true },
                insertImage: { visible : true }

            } 
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
			    
				<h2 class="">
				
				<span>Reply to ${msg?.to?.fullName }</span>
				</h2>

		     <g:form name="createMsgFrm" action="send" >
		     <g:hiddenField name="to.id" value="${msg?.to?.id }" />
		     <g:hiddenField name="parent.id" value="${msg?.parent?.id }" />
                <div class="dialog">
                     <table width="100%">
                        <tbody>
                        <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="to"><g:message code="inbox.message.to" default="To" /></label>
                                </td>
                                <td valign="top" class="value ">
                                ${msg.to.fullName }
                                </td>
                            </tr>
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="theme"><g:message code="inbox.message.theme" default="Theme" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField  name="theme" value="${msg?.theme }" />
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="msg"><g:message code="inbox.message.msg" default="Message" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textArea rows="5" cols="43" name="msg" value="${msg?.msg }" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button">
                    <g:submitButton class="save" name="reply" id="submitBtn"  action='send'  value="${message(code: 'inbox.message.send', default: 'Send')}"  />
                    </span>
                     <span class="button">
                    <button id="cancelBtn"  class="cancel">Cancel</button>
                    </span>

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
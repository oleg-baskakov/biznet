<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title>${title }</title>
        <link type="text/css" href="${resource(dir:'css',file:'jquery.wysiwyg.css')}" rel="Stylesheet" />	
        
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.image.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.link.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.wysiwyg.table.js')}"></script>
    
<script>
        
        var trgr=true;
		$(function(){
			$("#newMsgFrm").hide();
			$("#newMsgBtn").button({
				text: false,
				icons: {
					primary: "ui-icon-document"
				}
			}).click(function(){
				var options;
					if(trgr){
						$("#msgsDiv").empty();
						
						$("#newMsgFrm").clone().appendTo("#newMsgDiv").show('slow');
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

					            } 
					        });
						options = {
								label: "Cancel",
								icons: {
									primary: "ui-icon-close"
								}
							};
						trgr=false;
						
					}else{
						$("#newMsgDiv").empty();
						options = {
								label: "New Message",
								icons: {
									primary: "ui-icon-document"
								}
							};
						trgr=true;
						
					}
					$(this).button("option",options);
					
			});

			
			
		});

		var submitWork=true;

		
		function addOk(data,type){
			//alert(data);
			//submitWork=true;
			
			//$("#submitBtn1").attr("disabled", "false");
			//$("input[name=submitWork]").attr("disabled", false);
			try{
			var errors=$(data).filter("#addErrorsDiv").html();//$("#addErrorsDiv",data);
		//	alert(errors);
			if(errors){
			//	alert(errors);
					$("#newMsgMsgs").append(errors);
			}else{
				var result=$(data).first("#resultDiv");
				//alert(result);
				//if(result){

						$("#newMsgFrm").empty()
						$("#msgsDiv").append(result);
						$("#newMsgBtn").click();
					
		//		}
			}
			$("#submitBtn").removeAttr("disabled");
			}catch(exc){ }
		}
		function beforeAdd(type){
			//if(!submitWork)return false;
				$("#newMsgMsgs").empty();
				$("#submitBtn").attr("disabled", "disabled");
				
			//submitWork=false;
		}
	</script>

</head>

<body>

	<!-- Content -->
	<div id="content">
		
		<!-- Main -->
		<div id="main">

			    <div class="simple">
			    <auth:ifLoggedIn>		
			    	<button id="newMsgBtn" class="right-btn">
				${message(code:'inbox.new-message',default:'Create message')}</button>
			    </auth:ifLoggedIn>
				<div id="msgsDiv" class="right"></div>
			    
				<h2 class="">
				
				<span>${title }</span>
				</h2>
				<div id="newMsgDiv"></div>
			<g:if test="${flash.error }">	
				       <div class="errors">
       						${flash.error }
           </div>
       		</g:if>
       
				
				
				<g:each in="${msgs}" var="msg" >
			 	<div class="image">
			 	<g:if test="${false}">
					<g:link action="show" controller="profile" id="${msg.from.id }">
			 			<img height="64" width="50" src="${msg.from.avatar }" alt="${msg.from.fullName }" />
			 		</g:link>
			 	</g:if>
			 	<g:else>
			 			<g:link action="show" controller="profile" id="${msg.from.id }">
			 			<img height="64" width="50" src="${createLinkTo(dir:"images", file:'plcnofoto.jpg') }" alt="${msg.from.fullName }" />
			 		</g:link>
			 	</g:else>
			 	<div class="underPhoto">
						<p>	
						<g:message code="profile.rating" default="Rating:">-</g:message>
						</p>
				</div>
			 	</div>
				<div class="info">
				<g:if test="${msg.isNew&&folder!=2 }">
					<h3> 
					<g:link action="show" controller="inbox" params="[folder:folder]" id="${msg.id }">${msg.theme?:'No theme' }</g:link>
					
					</h3>
				</g:if>
				<g:else>
					<b>
					<g:link action="show" controller="inbox" params="[folder:folder]" id="${msg.id }">${msg.theme?:'No theme' }</g:link>
					</b>
				</g:else>
				
				<g:if test="${folder==1 }">
				
					<p>
					To: <g:link action="show" controller="profile" id="${msg.to.id }">${msg.to.fullName }</g:link>
						<br/>
					</p>
				</g:if>	
				<g:else>
					<p>
					From: <g:link action="show" controller="profile" id="${msg.from.id }">${msg.from.fullName }</g:link>
						<br/>
					</p>
				</g:else>
				</div>
				<div class="">
					<g:link action="reply" id="${msg.id}" class="small">reply</g:link>
					<g:link action="delete" id="${msg.id}" params="[folder:folder]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" class="small">delete</g:link>
					<div class="cline"></div>
				</div>
			</g:each>
			<div class="paging">
		        <g:paginate total="${msgsTotal}"  id="${folder}"/>
		    </div>
			<div class="cl">&nbsp;</div>
			
		</div>
			
	
			<!-- End Box  -->
			
					
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			 	<g:render template='/templates/inboxSidebar' />

		</div>
		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
		<div id="newMsgFrm">
		<div id="newMsgMsgs"></div>
		     <g:form name="createMsgFrm" action="sendAjax" >
		     
                <div class="dialog">
                     <table>
                        <tbody>
                        <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="to"><g:message code="inbox.message.to" default="To" /></label>
                                </td>
                                <td valign="top" class="value ">
                                     <g:select id="to.id" name="to.id" noSelection="['':'Please select recipient']" from="${joberty.Profile.list(sort:'fullName')}" optionKey="id"  optionValue="fullName" value=""  />
                                    
                                </td>
                            </tr>
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="theme"><g:message code="inbox.message.theme" default="Theme" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="theme"  value="" />
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="msg"><g:message code="inbox.message.msg" default="Message" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textArea  cols="43" name="msg" value="" />
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div class="buttons">
                    <span class="button">
                    <g:submitToRemote class="save" id="submitBtn" before="beforeAdd(1)" url="[action:'sendAjax', onsuccess:'addOk(data,2)']" onSuccess="addOk(data,2)"  value="${message(code: 'inbox.message.send', default: 'Send')}"  />
                    </span>
<!--                     <span class="button">
                    <button id="cancelBtn"  class="cancel">Cancel</button>
                    </span>
      -->
                 </div>
            </g:form>
	<div class="cline"></div>
	</div>
	
</body>
</html>
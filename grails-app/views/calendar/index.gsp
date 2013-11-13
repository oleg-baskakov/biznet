<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="base" />
        <title><g:message code="calendar.header" default="Calendar  {0}" args="[profile.fullName ]" /></title>
        
    <link rel='stylesheet' type='text/css' href="${resource(dir:'css',file:'fullcalendar.css')}" />
	<link rel='stylesheet' media="print"  type='text/css' href="${resource(dir:'css',file:'fullcalendar.print.css')}" />
	<script type='text/javascript' src="${resource(dir:'js',file:'fullcalendar.min.js')}"></script>
   
   <script type='text/javascript'>

	$(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		$('#startDate').datepicker();
		
		var calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			selectable: true,
			selectHelper: true,
			 dayClick: function(date, allDay, jsEvent, view) {

			        if (allDay) {
			            alert('Clicked on the entire day: ' + date);
			        }else{
			            alert('Clicked on the slot: ' + date);
			        }

			     

			    },
			select: function(start, end, allDay) {
/*				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');*/
			},
			editable: true,
			events: [
				<g:each in="${events}">
					{
						id:${it.id},
						title:'${it.title}',
						start:'${it.startDate}',
						end:'${it.endDate}',
						allDay:${it.allDay}
					}		,		
				</g:each>
			]
		});




$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		var name = $( "#title" ),
			startDate = $( "#startDate" ),
			startTime = $( "#startTime" ),
			endTime = $( "#endTime" ),
			desc = $("#desc"),
			allFields = $( [] ).add( name ).add( startDate ).add( startTime ).add( endTime ).add( desc ),
			tips = $( ".validateTips" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}
		
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				"Create an event": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					bValid = bValid && checkLength( name, "title", 3, 16 );
					var sDate=new Date(startDate.val());
					var eDate=new Date(startDate.val());
					var stime=startTime.val().split(':');
					var etime=endTime.val().split(':');
					if(stime.length<2&&etime.length<2){bValid=false;}
					else{
						sDate.setHours(stime[0]);
						eDate.setHours(etime[0]);
					}
					var axParams={
							title: name.val(),
							start: sDate.getTime(),
							end: eDate.getTime(),
							description:desc.val(),
							allDay: false
						};
					
					if ( bValid ) {
						$.getJSON("${createLink(action:'createEventAx')}",
								axParams,
								 function(data) {
									 if(data.code=='error'){
										alert('Error of creating a new event. Code:'+data.result);
										
									 }
								
						});
						calendar.fullCalendar('renderEvent',
								{
									title: name.val(),
									start: sDate,
									end: eDate,
									description:desc.val(),
									allDay: false
								},
								true // make the event "stick"
							);
						$( this ).dialog( "close" );
					}
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});

		$( "#create-event" )
			.button()
			.click(function() {
				$( "#dialog-form" ).dialog( "open" );
			});
		
	});

</script>
<style type='text/css'>

	#calendar {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		width: 900px;
		margin: 0 auto;
		}

		#dialog-form label, input { display:block; }
		#dialog-form input.text { margin-bottom:12px; width:95%; padding: .4em; }
		#dialog-form fieldset { padding:0; border:0; margin-top:25px; }
		#dialog-form h1 { font-size: 1.2em; margin: .6em 0; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>
</style>
        
</head>

<body>

	<!-- Content -->
	<div id="content" >
		
		<!-- Main -->
		<div id="main" style="width:920px">

			    <div class="simple" style="width:920px">
				<h2 class="no-border">
				
				<span>${profile.fullName }</span>
				</h2>
				<div class="info">
					<button id="create-event">Create new event</button>
					<div id="calendar"></div>					
				</div>
				<div class="cline"></div>
				<g:link action="exit"  class="small">exit</g:link>
				<div class="cl">&nbsp;</div>
			</div>
			
	
		
						
		</div>
		<!-- End Main -->
		
		<!-- Sidebar -->

		<!-- End Sidebar -->
		
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	
<div id="dialog-form" title="Create new event">
	<p class="validateTips">All form fields are required.</p>

	<form>
	<fieldset>
		<label for="name">Title</label>
		<input type="text" name="title" id="title" class="text ui-widget-content ui-corner-all" />
		<label for="startDate">Date</label>
		<input type="text" name="startDate" id="startDate" value="" class="text ui-widget-content ui-corner-all" />
		<label for="startTime">start time</label>
		<g:select id="startTime" name="start time" from="['6:00','7:00','8:00','9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00']"></g:select>
		<label for="startTime">end time</label>
		<g:select id="endTime"  from="['6:00','7:00','8:00','9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00']"></g:select>
		<label for="desc">Description</label>
		<input type="text" name="desc" id="desc" value="" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
</div>
	
</body>
</html>
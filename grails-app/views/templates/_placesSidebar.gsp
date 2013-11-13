<script type="text/javascript">
function onAddPlace(){
	isCreatePlace=!isCreatePlace;
	//alert('Please click on the map to  choose location of new Place');
//	$('addPlaceNfoDiv').toggle();
	//$('addPlaceDiv').hide();
	
	if($('createP').innerHTML=="Cancel"){
		clearForm();
	}else{
		$('addPlaceNfoDiv').toggle();
		$('createP').innerHTML="Cancel";
	}
}
function formOk(data){
	isCreatePlace=false;
	clearForm();
	setNewPlace(data)
 		
}

function clearForm(){
	$('createP').innerHTML="ADD";
	$('addPlaceNfoDiv').hide();
	$('addPlaceDiv').hide();
	$('pName').value='';
	$('pValue').value='';
}
</script>

			<div class="top">
			
							<h2>${group?.name }</h2>
				<ul class="pink">
				    <li><g:link controller="group" action="places" >Places</g:link></li>
				    <li><g:link controller="event" action="list">Events</g:link></li>
				    <li><a href="#">Updates</a></li>
				    <li><a href="#">Members</a></li>
				    <li><a href="#">Photos</a></li>
				</ul>
			
			
				    <div style="display:inline">
				    				<h2>Places ${placesTotal?placesTotal:""}</h2>
				    				<a href="#"  onclick="onAddPlace()" id="createP" >ADD</a>
				    </div>
			<div id="addPlaceNfoDiv" style="display:none;">Please click on the map to  choose location of new Place </div>
			<div id="addPlaceDiv" style="display:none;">
				<g:form action="saveRemote">
				<g:hiddenField name="lon"  id="hfLon" value="" />
				<g:hiddenField name="groupId"  id="groupId" value="${group?.id }" />
				<g:hiddenField name="lat"  id="hfLat" value="" />
				Name<g:textField name="name" id="pName" value="" /></br>
				Info<g:textArea rows="5" id="pInfo" name="info" value=""  /></br>
				<g:submitToRemote url="[action:'addPlaceRemote', onsuccess:'formOk()']" onSuccess="formOk()" update="updateFld" value="Create"  />
				
				</g:form>
				<div id="updateFld"></div>
			</div>
				<g:if test="${placesList }">
				<ul class="blue">
				<g:set var="markers" value=""></g:set>
				<g:each in="${placesList }">
				    <li>
				    	<a href="#" onclick="showOnMap('${it.id}')">${it.name }</a>
				    	<br /> events: | fotos: <small> likes:| posted by <a href="#">${it.creator.login  }</a></small>
				    </li>
				    </g:each>
				</ul>
				    </g:if>
			</div>


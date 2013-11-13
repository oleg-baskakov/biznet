<g:formRemote name="sendPromo" update="resultDiv" url="[action:'sendPromoAx',params:[uid:uid]]" >
<g:select name="promo" from="${promos }" optionKey="id" optionValue="title">Please select promotion</g:select>
<input  value="Send" type="submit"/>
</g:formRemote>
<div id='resultDiv'></div> 
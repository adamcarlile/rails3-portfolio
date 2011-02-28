function googleMapHeader(elementId){
  var myOptions = {
    zoom: 12,
    center: mapLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById(elementId), myOptions);

  var marker = new google.maps.Marker({
      position: mapLatlng, 
      map: map,
      title: mapMarkerTitle
  });
}

function toggleMapState(bind, target, speed){
	$(bind).click(function(e){
		e.preventDefault()
		if ($(bind).hasClass('on')) {
			$(target).animate({
				right: '10px'
			}, speed, removeOnState($(bind)))
		} else {
			$(target).animate({
				right: '220px'
			}, speed, addOnState($(bind)))
		}
	})
}

function addOnState(element){
	element.addClass('on')
}

function removeOnState(element){
	element.removeClass('on')
}

$(document).ready(function(){
	$('.lightbox a').fancybox({
	})	
})
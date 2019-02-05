var autorefreshForLogut=0;
/*setInterval(function() {
	autorefreshForLogut=parseInt(autorefreshForLogut)+1;
	  if(autorefreshForLogut==58){
		  window.location.href = "logout.htm"; 
	  }
	  
	 }, 60000);  */ 

/*$(document).click(function() {

	autorefreshForLogut=0;

	});*/

$(document).bind("mousedown",function(e){
	autorefreshForLogut=0;
});

$(document).bind("keypress",function(e){
	autorefreshForLogut=0;
});
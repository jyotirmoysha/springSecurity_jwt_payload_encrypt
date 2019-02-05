<script type="text/javascript">

function getSessionToken(){		
	var sessionTk="<%=(String)request.getSession().getAttribute("tokenInSession") %>";
//	alert("sessionTk : "+sessionTk);
	var tokenArray = document.getElementsByName("requestToken");
	for (i = 0; i < tokenArray.length; i++) {
		tokenArray[i].value = sessionTk ;
	}
//	alert(sessionTk);
return sessionTk;
}
</script>

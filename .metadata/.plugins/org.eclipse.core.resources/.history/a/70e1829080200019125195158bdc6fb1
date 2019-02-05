<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/css/uic/images/favicon.ico"  type="image/x-icon"/>
<title>Title Goes Here</title>
<script type="text/javascript">
function showForm(){
	
	$.post('getFormData.htm',{
		requestToken : $('#requestToken').val(),
		formId : $("#formId").val(),
		errorMap : $('#errorMap').val(),
		action : $("#action").val(),
		dataMap : $('#dataMap').val()
	}, function(data){
		$('#mainContent').html(data);
	});	
}
</script>
</head>
<body>
<div id="mainContent"></div>
<form action="#" method="post">
<input type="text" value="Hi" id="formId" name="formId">
<input type="text" value='Hi' id="errorMap" name="errorMap">
</form>
<script>
</script>
</body>
</html>
<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<%@ include file="/WEB-INF/uic/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/css/uic/images/favicon.ico"  type="image/x-icon"/>
<title>Title Goes Here</title>
<script type="text/javascript">
function showForm(){
	
	$('#mainContent').html("");
	$.post('getFormData.htm',{
		requestToken : $('#requestToken').val(),
		formId : $("#formId").val(),
		action : $("#action").val(),
	}, function(data){
		$('#mainContent').html(data);
	});	
}
</script>
</head>
<body>
<script>
	window.onload = function () { showForm(); };
</script>
<div id="mainContent"></div>
<input type="hidden" value="${formId}" id="formId">
<input type="hidden" value="${action}" id="action" name="action">
</body>
</html>
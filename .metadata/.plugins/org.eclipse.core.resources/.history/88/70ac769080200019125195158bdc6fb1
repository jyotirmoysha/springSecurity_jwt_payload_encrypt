<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<%@ include file="/WEB-INF/uic/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Back Population Process</title>
<script type="text/javascript">
$(document).ready(function(){
	var context = "${pageContext.request.contextPath}"
	var status = "${status}";
//	alert(status);
	if(status!="Completed"){
		window.location.href=context+"/processBackPopForColumnName.htm";
	}
});
</script>
</head>
<body>
 
<div class="uic_whitebg col-lg-12" id="wrapper" style="font-size: 30px; text-align: center; width: 100%; padding-top: 50px;" >
${msgStr}
</div>
</body>
</html>
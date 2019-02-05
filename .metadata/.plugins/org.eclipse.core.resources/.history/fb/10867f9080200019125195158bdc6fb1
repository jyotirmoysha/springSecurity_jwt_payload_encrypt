<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<%-- <%@ include file="/WEB-INF/uic/jsp/include.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Screen Layout Component</title>
<script type="text/javascript">
var screenLayoutId;
$(document).ready(function() {
	screenLayoutId = "${slId}";
	showLayout();
});
function showLayout(){
	$.post('showScreenLayout.htm',{
		//requestToken : $('#requestToken').val(),
		slId : screenLayoutId/* ,
		exp : "${exp}",
		bool : "${bool}",
		upiId : "${upiId}" */
	}, function(data){
		$('#tabContent').html(data);
	});	
}
</script>
</head>
<body >
<div class="container">		
<c:set var="context" value="${pageContext.request.contextPath}" />
	
	<div id="tabContent"></div>
	
</div>
</body>
</html>
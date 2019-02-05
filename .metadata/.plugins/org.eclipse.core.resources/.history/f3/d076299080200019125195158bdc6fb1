<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty errorList}">
	<ul class="error">
		<c:forEach items="${errorList}" var="error">
		<li><c:out value='${error}'/></li>
		</c:forEach>
	</ul>
</c:if>
<c:if test="${empty errorList}">
<script type="text/javascript">
$(function(){
	actionUrl='upload_success.htm';
	processData='&customerId='+encodeURIComponent('${customerId}')+'&files='+encodeURIComponent('${fileList}');
	successData= function(data){
		$("#file-upload-content").html(data).show();};
		errorData= function(data){
			$("#file-upload-content").html(data).show();};	
  	callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
	
});
</script>
</c:if>

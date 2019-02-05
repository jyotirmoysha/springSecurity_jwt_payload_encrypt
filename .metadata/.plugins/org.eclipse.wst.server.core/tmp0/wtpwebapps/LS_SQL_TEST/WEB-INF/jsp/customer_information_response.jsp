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
viewFileUpload('<c:out value='${customerId}'/>','<c:out value='${customerName}'/>','<c:out value='${businessName}'/>','<c:out value='${accountNo}'/>');
</script>
</c:if>

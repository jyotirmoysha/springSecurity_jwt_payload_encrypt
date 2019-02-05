<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty fileList}">
				<c:forEach items="${fileList}" var="file">
				
				<a href="javascript:void(0)" target="_blank" onclick="showOrgionalFile('<c:out value='${file}'/>','<c:out value='${encryptedcustomerId}'/>')"><c:out value='${file}'/></a> |
				</c:forEach>
 </c:if>
 <c:if test="${not empty fileList}">
 Not found.
 </c:if>
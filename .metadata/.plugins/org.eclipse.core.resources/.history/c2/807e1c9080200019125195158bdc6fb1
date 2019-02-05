<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Restrict Upload Document means ROLE_USER_SEC_CP user group-->

 <c:if test="${not empty fileList}">

	  <c:forEach items="${fileList}" var="file">
	   <a href="javascript:void(0)" target="_blank" onclick="showConvertedFilesInTab('<c:out value='${file}'/>','<c:out value='${encryptedcustomerId}'/>','<c:out value='${encryptedWqId}'/>','2')"><c:out value='${file}'/></a> |
	  </c:forEach>
	  
 </c:if>
 <c:if test="${empty fileList}">
 Not found. | 
 </c:if>
 
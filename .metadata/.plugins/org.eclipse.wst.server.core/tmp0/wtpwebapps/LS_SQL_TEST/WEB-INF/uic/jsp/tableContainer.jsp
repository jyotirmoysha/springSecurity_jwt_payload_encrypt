<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<c:set var="tblId" value="${param.tableId}" />
<c:set var="table" value="${tables[tblId]}" />
<c:set var="context" value="${pageContext.request.contextPath}" />
  <input type="hidden" id="uic_context" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${table.isSubTable}">
		<c:set var="isSearchable" value="false" />
	</c:when>
	<c:otherwise>
		<c:set var="isSearchable" value="${table.isSearchable}" />
	</c:otherwise>
</c:choose>
  <c:choose>
    <c:when test="${not empty param.tableId }">
      <c:set var="tableId" value="${param.tableId}" />
    </c:when>
    <c:otherwise>
      <c:set var="tableId" value="${tableId}" />
    </c:otherwise>
  </c:choose>
<div id="resuableTblComponentContainer_${tableId}" class="wqc_component row-fluid extraspace cal-lg-6">
	<c:if test="${isSearchable}">
		<div id="${tableId}SearchElementsContainer">
			<jsp:include page="searchFilter.jsp">
				<jsp:param value="${tableId}" name="tableId" />
			</jsp:include>
		</div>
	</c:if>
	<div id="uic_Loading" class="UicLoading"></div>
	<input type="hidden" id="ContainerId_${tableId}" value="${table.containerId}">	
	<div id="${table.containerId}Container" class="row">
		<jsp:include page="table.jsp">
			<jsp:param value="${tableId}" name="tableId" />
		</jsp:include>
	</div>
	
	<div class="clearfix">&nbsp;</div>
	
	 
	
</div>

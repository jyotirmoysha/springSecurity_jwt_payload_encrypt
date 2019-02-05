<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
  <c:choose>
    <c:when test="${not empty param.tableId }">
      <c:set var="tableId" value="${param.tableId}" />
    </c:when>
    <c:otherwise>
      <c:set var="tableId" value="${tableId}" />
    </c:otherwise>
  </c:choose>
  <c:set var="context" value="${pageContext.request.contextPath}" />
  <c:set var="table" value="${tables[tableId]}" />
  <c:set var="page" value="${ pages[tableId] }" />
  <c:set var="sortableURL" value="" />
  <c:set var="isScroll" value="${ table.isScrollData }" />
  <c:url value="/pageSearch.htm?totalRecords=${page.totalRecords}&tableIds=${tableId}" var="sortableURL" />
	<input type="hidden" name="tableIds" value="${ tableId }" id="tableId" />
	<input type="hidden" name="page" id="page" value="${ page.pageNo }" />
	<input type="hidden" name="pageSize${ tableId }" id="pageSize${ tableId }" value="${ page.pageSize }" />
	<input type="hidden" name="totalRecords"  id="totalRecords${ tableId }" value="${ page.totalRecords }" />
		<div id='UicScrollDiv${tableId}'>
		<table id="scrollTableId${tableId}" class="table table-bordered uic_dynamictable clear dynamicTbl ${table.tableCss}" cellspacing="0">  
			<tbody id="uicTableBody_${tableId}">
				<jsp:include page="tableBody.jsp">
                   	<jsp:param value="${tableId}" name="tableId"/>
					<jsp:param value="${sortableURL}" name="sortableURL" />
                </jsp:include>
          </tbody>
   		</table> 
   </div>

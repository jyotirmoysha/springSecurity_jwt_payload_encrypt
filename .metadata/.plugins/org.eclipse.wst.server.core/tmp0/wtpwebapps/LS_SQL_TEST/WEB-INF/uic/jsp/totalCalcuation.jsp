<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<c:set var="table" value="${tables[param.tableId]}"/>
<tr style="${table.totalInLineStyle}" id="uicTotalRow_${tableId}">
  <c:if test="${ not empty table.subTableUrl }">
   <c:set var="style" value=""/>
   <c:if test="${table.expDspFlag eq false}">
    <c:set var="style" value="display:none;"/>
   </c:if>
    <td style='${style}' class="showhideExpand_${param.tableId}">&nbsp;</td>
  </c:if>
  <c:forEach items="${table.totalColumnsList}" begin="0" var="cell" varStatus="cellLoop">
    <c:if test="${ cell.columnSpecifics.isIdentifier eq false }">
     	<c:set var="style" value="${cell.columnSpecifics.inlineStyle}"/>
        <c:if test="${cell.columnSpecifics.displayFlag eq false}">
         <c:set var="style" value="display:none; ${cell.columnSpecifics.inlineStyle}"/>
        </c:if>
      	<td style='${style}' class="${cell.columnSpecifics.cssName} hideCol_${tableId}_${cell.columnSpecifics.superElmId}">
	        <c:choose>
	          <c:when test="${ fn:containsIgnoreCase(cell.cellContent, 'Total') }">
	            <spring:message code="${ cell.cellContent }" />
	          </c:when>
	          <c:otherwise>
	            <span ${cell.eventStr}><c:out value="${ cell.cellContent }" /></span>
	          </c:otherwise>
	        </c:choose>
       </td>
    </c:if>
  </c:forEach>
  <c:if test="${not empty table.deleteUrl}"><td>&nbsp;</td></c:if>
</tr>
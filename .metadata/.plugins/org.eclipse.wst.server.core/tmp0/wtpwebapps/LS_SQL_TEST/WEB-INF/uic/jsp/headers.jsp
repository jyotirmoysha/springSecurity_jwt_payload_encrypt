<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<c:set var="sortableURL" value="${param.sortableURL}" />
<c:set var="table" value="${tables[param.tableId]}" />
<c:set var="deleteFlag" value="true" />
<c:set var="expandFlag" value="true" />
<c:set var="hdrLoop" value="-1" />
<c:set var="itr" value="${table.headerLevels}" />
<h6 style="display: none; visibility: hidden;">
  <input type='hidden' id="hdrLevels_${tableId}" value="${table.headerLevels}" />
</h6>
<c:forEach items="${table.headersMap}" var="entry" varStatus="loop">
  <c:if test="${not empty entry.value}">
    <tr>
      <c:if test="${ expandFlag and not empty table.subTableUrl }">
        <th colspan="1" rowspan="${itr}" class="uicTblHdr showhideExpand_${tableId}" style='<c:if test="${table.expDspFlag eq false}">display:none;</c:if>'>
         <span><spring:message code="label.expand"/></span>
        </th>
        <c:set var="expandFlag" value="false" />
      </c:if>
      <c:forEach items="${entry.value}" var="hdr" varStatus="inrLoop">
        <c:set var="hdrLoop" value="${loop.index}" />
        <c:set var="colspan" value="${hdr.headersCount}" />
        <c:set var="rowSpan" value="${hdr.subHeaderLevels}" />
         <c:set var="headerStyle" value="${hdr.headerInlineStyle}"/>
        <c:if test="${ hdr.displayFlag eq false }">
          <c:set var="headerStyle" value="display:none;${hdr.headerInlineStyle}"/>
        </c:if>
		<c:set var="headerText" value="${hdr.headerText}" />
     	<c:if test="${hdr.isIdentifier eq false}">
             <c:set var="url" value="${ sortableURL }&order=${ hdr.sortOrder}&column=${hdr.columnName}"/>
              <th colspan="${colspan}" rowspan="${rowSpan}" style='${headerStyle}' class="${hdr.headerCss} uicTblHdr hideCol_${tableId}_${hdr.superElmId}">
                <c:if test="${ hdr.isSortable and hdr.htmlElement ne 'checkbox' and ((entry.key eq 'superHeaders' or entry.key eq 'HEADERS') and colspan eq 1)}">
                  <a onclick='ajaxCallOfUIC("${table.containerId}","${url}");' href="javascript:void(0);" class="${hdr.headerSortClass}">
                </c:if>
                	<c:choose>
	                	<c:when test="${headerText ne 'Select all' }">
	                   		<span id="uicColHdrSpan_${hdr.uniqueElmId}" class="uicHeaderSpan uicColHdr_${hdr.uniqueElmId}"><c:out value="${headerText}"/></span>
	                   	</c:when>
	                   	<c:otherwise>
	                   		<span id="uicColHdrSpan_${hdr.uniqueElmId}" class="uicHeaderSpan uicColHdr_${hdr.uniqueElmId}">
	                   			<input type="checkbox" class='checkAllWq' onclick="uicSelectAll(this);"> 
	                   		</span>
	                   </c:otherwise>
                   </c:choose>
                <c:if test="${ hdr.isSortable }">
                 </a>
                </c:if>
               	<c:if test="${ hdr.editableHeaderFlag }">
                  <span class="uicEditHdr glyphicon glyphicon-edit uicColHdr_${hdr.uniqueElmId}" ondblclick="uicEditColumnHeader('${hdr.uniqueElmId}');">&nbsp;</span>
                  <input type="text" class="uicText uicColHdr_${hdr.uniqueElmId}" style="display: none;" value='<c:out value="${headerText}"/>' 
                   onchange="uicUpdateColumnHdr(this,'<c:out value="${hdr.originalText}"/>','${hdr.uniqueElmId}');" onblur="uicEditColumnHeader('${hdr.uniqueElmId}');"/>
                </c:if>
                
               
                
               </th>
   		</c:if>
      </c:forEach>
      <c:if test="${ not empty table.deleteUrl and deleteFlag and (loop.index eq hdrLoop)}">
        <th style="${hdr.headrInlineStyle}" colspan="1" rowspan="${table.headerLevels}" class="uicTblHdr delete"><div><span><spring:message code="label.delete"/></span></div></th>
        <c:set var="deleteFlag" value="false" />
      </c:if>
    </tr>
  </c:if>
</c:forEach>

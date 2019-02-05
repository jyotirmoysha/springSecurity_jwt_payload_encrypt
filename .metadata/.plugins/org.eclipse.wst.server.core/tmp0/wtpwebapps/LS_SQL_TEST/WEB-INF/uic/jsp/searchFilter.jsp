<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
 <c:choose>
    <c:when test="${not empty param.tableId }">
      <c:set var="tableId" value="${param.tableId}" />
    </c:when>
    <c:otherwise>
      <c:set var="tableId" value="${tableId}" />
    </c:otherwise>
  </c:choose>
 <div class="row UicTblCaptionH2">
	<div id="uicAccordianDiv_${tableId}" class="col-lg-1" style="width: initial; float: right;">
		<span class="expandOrCollapse" style="float: right">
		<a id="uiIconChangeIdSearch_${tableId}" class="glyphicon glyphicon-chevron-up" href="javascript:void(0);" onClick="searchCollapseExpands('${tableId}');"></a></span>
	</div>
</div>
<div class="jumbotron uiSearchLayout padding15" id="uic_search_${tableId}">
<div class="row">
  <c:set var="context" value="${pageContext.request.contextPath}" />
  <form action="${context}/dynamicSearch.htm" id="dynamicSearch${tableId}" method="post" class="dynamicSearch" autocomplete="off">
    <c:set var="table" value="${tables[tableId]}" />
    <c:set var="custParamForTable" value="${table.paramMap}" />
    <c:set var="isSearch" value="-1" />
   <%--  <div> ${custParamForTable} --- ${searchElementKey}</div> --%>
    <c:forEach items="${ table.searchableColumns }" var="searchElement" varStatus="loop">
      <c:set var="srchElementName" value="${fn:replace(searchElement.name, 'search_Element:dropdown:', '')}" />
      <c:set var="srchElementName" value="${fn:replace(searchElement.name, 'search_Element:', '')}" />
      <c:set var="startIndex" value='${fn:indexOf(srchElementName, ".")}' />
      <c:set var="endIndex" value='${fn:length(srchElementName)}' />
      <c:set var="searchElementKey" value="${fn:substring(srchElementName, startIndex+1, endIndex)}" />
      <c:set var="defValue" value=""/>
     <%-- <div> -- ${searchElementKey}</div> --%>
      <c:choose>
        <c:when test="${ searchElement.elementType eq 'dropdown' }">
          <div class="col-lg-4 align-form UicSearchElementDiv" id="uic_SearchElementDiv_${tableId}_${loop.index}" >
            <label><c:out value="${searchElement.label}" /></label>
            <select name="${ searchElement.name }" id="uic_SearchElement_${tableId}_${loop.index}" class="form-control dynamicSearchElement">
              <option value=""><spring:message code="label.select" /></option>
              <c:set var="tempCellValue"  value="${fn:toLowerCase(custParamForTable[searchElementKey])}" />
              <c:forEach items="${ searchElement.values }" var="dropdown">
              <c:set var="tempDDValue"  value="${fn:toLowerCase(dropdown.value)}" />
                <c:choose>
                  <c:when test="${not empty custParamForTable and (tempDDValue eq tempCellValue)}">
                    <option defSelectVal="${ dropdown.value }" value="${ dropdown.value }" selected="selected">
                      <c:out value="${ dropdown.label }" />
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${ dropdown.value }">${ dropdown.label }</option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>
          </div>
        </c:when>
        <c:when test="${ searchElement.elementType eq 'multidropdown' }">
          <div class="col-lg-4 align-form UicSearchElementDiv" id="uic_SearchElementDiv_${tableId}_${loop.index}" >
            <label><c:out value="${searchElement.label}" /></label>
            <select name="${ searchElement.name }" id="uic_SearchElement_${tableId}_${loop.index}" class="form-control dynamicSearchElement" multiple="multiple">
              <option value=""><spring:message code="label.select" /></option>
              <c:set var="tempCellValue"  value="${fn:toLowerCase(custParamForTable[searchElementKey])}" />
              <c:forEach items="${ searchElement.values }" var="dropdown">
              <c:set var="tempDDValue"  value="${fn:toLowerCase(dropdown.value)}" />
                <c:choose>
                  <c:when test="${not empty custParamForTable and (tempDDValue eq tempCellValue)}">
                    <option defSelectVal="${ dropdown.value }" value="${ dropdown.value }" selected="selected">
                      <c:out value="${ dropdown.label }" />
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${ dropdown.value }">${ dropdown.label }</option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>
          </div>
        </c:when>
        <c:when test="${ (searchElement.elementType eq 'date' or searchElement.elementType eq 'datetime') and searchElement.isRangeSearchEle}">
            <c:choose>
	        	<c:when test="${searchElement.elementType eq 'datetime' }">	        		
	        		<c:set var="startDateTimeVar" value="startDateTime"/>
	        		<c:set var="endDateTimeVar" value="endDateTime"/>
	        		<c:set var="dateTimePickerType" value="uicDateTimePicker" />
	        	</c:when>
	        	<c:otherwise>	        		
	        		<c:set var="startDateTimeVar" value="startDate"/>
	        		<c:set var="endDateTimeVar" value="endDate"/>
	        		<c:set var="dateTimePickerType" value="uicDatePicker" />
	        	</c:otherwise>
        	</c:choose>
            <div class="col-lg-4 align-form UicSearchElementDiv" id="uic_SearchElementDiv_${tableId}_${loop.index}" >
              <label><c:out value="Start ${searchElement.label}"/></label>
              <input type="text" readonly="readonly" id="${startDateTimeVar}_${tableId}_${loop.index }" name="${startDateTimeVar}:${searchElement.name}" class="form-control dynamicSearchElement rangeSearchElement  ${dateTimePickerType}"/>
            </div>
            
            <div class="col-lg-4 align-form UicSearchElementDiv" id="uic_SearchElementDiv_${tableId}_${loop.index}" >
              <label><c:out value="End ${searchElement.label}"/></label>
              <input type="text" readonly="readonly" id="${endDateTimeVar}_${tableId}_${loop.index }" name="${endDateTimeVar}:${searchElement.name}" class="form-control dynamicSearchElement rangeSearchElement  ${dateTimePickerType}"/>
            </div>
        </c:when>
        <c:when test="${ searchElement.isRangeSearchEle }">
            <div class="col-lg-4 align-form UicSearchElementDiv" id="uic_SearchElementDiv_Start_${tableId}_${loop.index}" >
              <label><c:out value="Start ${searchElement.label}" /></label>
              <input type="text" name="startNumber:${ searchElement.name }" id="uic_SearchElement_Start_${tableId}_${loop.index}" class="form-control dynamicSearchElement rangeSearchElement"/>
            </div>
            <div class="col-lg-4 align-form UicSearchElementDiv" id="uic_SearchElementDiv_End_${tableId}_${loop.index}" >
              <label><c:out value="End ${searchElement.label}" /></label>
              <input type="text" name="endNumber:${searchElement.name}" id="uic_SearchElement_End_${tableId}_${loop.index}" class="form-control dynamicSearchElement rangeSearchElement"/>
            </div>
        </c:when>
        <c:otherwise>
            <div class="col-lg-4 align-form UicSearchElementDiv" id="uic_SearchElementDiv_${tableId}_${loop.index}" >
              <label><c:out value="${searchElement.label}" /></label>
              
              <c:if test="${not empty custParamForTable and not empty custParamForTable[searchElementKey]}">
                 <c:set var="defValue" value="${custParamForTable[searchElementKey]}"/>
               </c:if>
              <c:url value="/autoComplete.htm?tableIds=${tableId}&field=${searchElement.name}" var="autoCompleteUrl"/>
              <input type="text" id="uic_SearchElement_${tableId}_${loop.index}" onkeyup="callSearchAutoComplete(this,'${autoCompleteUrl}');" name="${searchElement.name}" class="form-control dynamicSearchElement" defSelectVal="${defValue}" value="${defValue}" />
            </div>
        </c:otherwise>
      </c:choose>
     <c:set var="isSearch" value="${ loop.index }" />
    </c:forEach>
    <c:if test="${ isSearch gt -1 }">
      <div class="col-lg-12 bottom10" style="text-align: center;" id="uic_SearchRefreshDiv_${tableId}">
        <br/>
        <input type="hidden" name="tableIds" value="${tableId}" />
        <button type="button" id="uic_DynamicSearchButton_${tableId}" class="btn btn-primary UicBtnRightMargin" onclick="searchData('<c:out value="${tableId}"/>');">
          <spring:message code="label.search" />
        </button>
        <button type="button" id="uic_DynamicResetButton_${tableId}" class="btn btn-info" onclick="resetData('<c:out value="${tableId}"/>','${context}/getTablePage.htm');">
          <spring:message code="label.reset" />
        </button>
      </div>
    </c:if>
  </form>
  </div>
</div>
<script type="text/javascript">
	initializeDateTimePickerForSearch("dynamicSearch${tableId}");
</script>

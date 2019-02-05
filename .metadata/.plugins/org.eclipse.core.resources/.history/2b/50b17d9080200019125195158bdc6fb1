<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<c:if test="${searchComp ne null}">
<c:set value="${searchComp.componentCaption}" var="componentCaption"/>
<c:if test="${not empty componentCaption.caption or componentCaption.accordianFlag}">
 <div class="uicComponentHdrPanel uicComponentHdrPanel_${componentId}">
	<div class="UicTblCaptionH2 ${componentCaption.captionCssClass}">
		<span class="uicToggelHdrText_${componentId} uicComponentHdrSpan_${componentId}">
			 <c:out value="${componentCaption.caption}"/>
		</span>
		<c:if test="${componentCaption.isEditableCaption eq 'Y'}">
		    <span class="componentHdrText uicToggelHdrText_${componentId}" style="display:none;">
				<input id="uicComponentHdrText_${componentId}" type="text" value="<c:out value='${componentCaption.caption}'/>">
			</span>
			<span class="glyphicon glyphicon-pencil uicToggelHdrText_${componentId}" ondblclick="toggleComponentCaption('<c:out value="${componentId}"/>');"></span>
			<span class="glyphicon glyphicon-repeat uicToggelHdrText_${componentId}" style="display:none;" onclick="resetComponentCaption('<c:out value="${componentId}"/>');"></span>
			<span class="glyphicon glyphicon-floppy-disk uicToggelHdrText_${componentId}" style="display:none;" 
				onclick="updateComponentCaption('<c:out value="${componentCaption.captionKey}"/>', '<c:out value="${componentId}"/>');"></span>
		</c:if>
		<c:if test="${componentCaption.accordianFlag}">
			<span>
				<a id="uicComponentAccordian_${componentId}" class="pull-right glyphicon glyphicon-chevron-up" onclick="expandOrCollapseComponent(this, '<c:out value="${componentId}"/>');"></a>
			</span>
		</c:if>
	</div>
 </div>
</c:if>
<div class="col-lg-12 ${searchComp.searchCompCss} uicComponentMainDataDiv_${componentId}" id="uic_search_${componentId}">
<c:set var="context" value="${pageContext.request.contextPath}" />
<form action="${context}/doSearch.htm" id="dynamicSearch${componentId}" method="post" class="search" autocomplete="off">
	<input type="hidden" id="searchScreenId" name="searchScreenId" />
	<h6 style="display: none; visibility: hidden; float: left; font-size: 0px; line-height: 0px;">
		<c:if test="${ not empty customParamsOfSearch}">
			<c:forEach items="${customParamsOfSearch}" var="entry">
				<input type="hidden" value="${entry.value}" name="${entry.key}" class="uic_SearchComponent_CustomParams_${componentId}"/>
			</c:forEach> 
		</c:if>
	 </h6>
    <div id="uicSearchCompMainDiv_${componentId}" >
	<c:set var="table" value="${componentId}" />
    <c:set var="rowId" value="-1" />
	    <c:forEach items="${searchComp.elementMap }" var="searchRow" varStatus="rowLoop">
	    <c:set var="rowId" value="${searchRow.key}" />
	    <div id="${componentId}_${rowId}">
	    	<c:forEach items="${searchRow.value }" var="searchElement" varStatus="colLoop">
	    		<c:set var="colId" value="${colLoop.index}" />
	    		<div id="uic_SearchElementColumnContainer_${searchElement.uniqueSaId}" >
	    			<c:choose>
	    			<c:when test="${searchElement.isRangeSearchEle}">
	    				<!-- Process Range search options. Currently supports number,text and date -->
	    				<c:if test="${searchElement.elementType eq 'text'}">
	    					<div id="uic_SearchColumnStartDiv_${searchElement.uniqueSaId}">
		    					<label><c:out value="Start " /><c:out value="${searchElement.label}"/></label>
		    					<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
		    					<c:choose>
		    					<c:when test="${searchElement.isAutoComplete}">
	    							<c:url value="/searchAutoComplete.htm?tableIds=${componentId}&field=${searchElement.name}" var="autoCompleteUrl"/>
	    							<input type="text" name="start:${searchElement.elementType}:${searchElement.name}" onclick="callSearchAutoComplete(this,'${autoCompleteUrl}');" 
	    							id="uic_SearchElement_${searchElement.uniqueSaId}" class="form-control dynamicSearchElement rangeSearchElement start_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" 
	    							placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
			    				</c:when>
			    				<c:otherwise>
			    					<input type="text" name="start:${searchElement.elementType}:${searchElement.name}" 
			    					id="uic_SearchElement_${searchElement.uniqueSaId}" 
			    					class="form-control dynamicSearchElement rangeSearchElement start_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" 
			    					placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
			    				</c:otherwise>
			    				</c:choose>	
		    				</div>
		    				<div class="UicErrorMsg" id='errorMessage_start_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="MIN_start_${searchElement.name}" name="MIN_start_${searchElement.name}" value="${searchElement.minLength}"/>
							<input type="hidden" id="MAX_start_${searchElement.name}" name="MAX_start_${searchElement.name}" value="${searchElement.maxLength}"/>
							<input type="hidden" id="REGEX_start_${searchElement.name}" name="REGEX_start_${searchElement.name}" value="${searchElement.validationRegex}"/>
		    				<div id="uic_SearchColumnEndDiv_${searchElement.uniqueSaId}">
	    						<label><c:out value="End " /><c:out value="${searchElement.label}"/></label>
	    						<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
	    						<c:choose>
		    					<c:when test="${searchElement.isAutoComplete}">
		    						<c:url value="/searchAutoComplete.htm?tableIds=${componentId}&field=${searchElement.name}" var="autoCompleteUrl"/>
	    							<input type="text" name="end:${searchElement.elementType}:${searchElement.name}" onclick="callSearchAutoComplete(this,'${autoCompleteUrl}');" 
	    							id="uic_SearchElement_${searchElement.uniqueSaId}" 
	    							class="form-control dynamicSearchElement rangeSearchElement end_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" 
	    							placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
		    					</c:when>
	    						<c:otherwise>
	    							<input type="text" name="end:${searchElement.elementType}:${searchElement.name}" 
	    							id="uic_SearchElement_${searchElement.uniqueSaId}" 
	    							class="form-control dynamicSearchElement rangeSearchElement end_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}"
	    							value="${searchElement.defValue}"/>
	    						</c:otherwise>
	    						</c:choose>	
		    				</div>
		    				<div class="UicErrorMsg" id='errorMessage_end_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="MIN_end_${searchElement.name}" name="MIN_end_${searchElement.name}" value="${searchElement.minLength}"/>
							<input type="hidden" id="MAX_end_${searchElement.name}" name="MAX_end_${searchElement.name}" value="${searchElement.maxLength}"/>
							<input type="hidden" id="REGEX_end_${searchElement.name}" name="REGEX_end_${searchElement.name}" value="${searchElement.validationRegex}"/>
	    				</c:if>
	    				<c:if test="${searchElement.elementType eq 'number'}">
	    					<div id="uic_SearchColumnStartDiv_${searchElement.uniqueSaId}" >
    							<label><c:out value="Start " /><c:out value="${searchElement.label}"/></label>
    							<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
		    					<c:choose>
		    					<c:when test="${searchElement.isAutoComplete}">
	    							<c:url value="/searchAutoComplete.htm?tableIds=${componentId}&field=${searchElement.name}" var="autoCompleteUrl"/>
	    							<input type="text" name="start:${searchElement.elementType}:${searchElement.name}" onclick="callSearchAutoComplete(this,'${autoCompleteUrl}');" 
	    							id="uic_SearchElement_${searchElement.uniqueSaId}" class="form-control dynamicSearchElement rangeSearchElement numeric start_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" 
	    							placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
			    				</c:when>
			    				<c:otherwise>
			    					<input type="text" name="start:${searchElement.elementType}:${searchElement.name}" 
			    					id="uic_SearchElement_${searchElement.uniqueSaId}" 
			    					class="form-control dynamicSearchElement rangeSearchElement numeric start_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}"
			    					value="${searchElement.defValue}"/>
			    				</c:otherwise>
			    				</c:choose>	
	    					</div>
	    					<div class="UicErrorMsg" id='errorMessage_start_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="MIN_start_${searchElement.name}" name="MIN_start_${searchElement.name}" value="${searchElement.minLength}"/>
							<input type="hidden" id="MAX_start_${searchElement.name}" name="MAX_start_${searchElement.name}" value="${searchElement.maxLength}"/>
							<input type="hidden" id="REGEX_start_${searchElement.name}" name="REGEX_start_${searchElement.name}" value="${searchElement.validationRegex}"/>
	    					<div id="uic_SearchColumnEndDiv_${searchElement.uniqueSaId}" >
    							<label><c:out value="End " /><c:out value="${searchElement.label}"/></label>
    							<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
		    					<c:choose>
		    					<c:when test="${searchElement.isAutoComplete}">
	    							<c:url value="/searchAutoComplete.htm?tableIds=${componentId}&field=${searchElement.name}" var="autoCompleteUrl"/>
	    							<input type="text" name="end:${searchElement.elementType}:${searchElement.name}" onclick="callSearchAutoComplete(this,'${autoCompleteUrl}');" 
	    							id="uic_SearchElement_${searchElement.uniqueSaId}" class="form-control dynamicSearchElement rangeSearchElement numeric end_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" 
	    							placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
			    				</c:when>
			    				<c:otherwise>
			    					<input type="text" name="end:${searchElement.elementType}:${searchElement.name}" 
			    					id="uic_SearchElement_${searchElement.uniqueSaId}" 
			    					class="form-control dynamicSearchElement rangeSearchElement numeric end_${searchElement.name} x ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" 
			    					value="${searchElement.defValue}"/>
			    				</c:otherwise>
			    				</c:choose>
	    					</div>
	    					<div class="UicErrorMsg" id='errorMessage_end_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="MIN_end_${searchElement.name}" name="MIN_end_${searchElement.name}" value="${searchElement.minLength}"/>
							<input type="hidden" id="MAX_end_${searchElement.name}" name="MAX_end_${searchElement.name}" value="${searchElement.maxLength}"/>
							<input type="hidden" id="REGEX_end_${searchElement.name}" name="REGEX_end_${searchElement.name}" value="${searchElement.validationRegex}"/>
	    				</c:if>
	    				<c:if test="${searchElement.elementType eq 'date' or searchElement.elementType eq 'datetime'}">
	    				<c:choose>
							<c:when test="${searchElement.elementType eq 'datetime' }">
								<c:set var="dateTimePickerType" value="uicDateTimePicker" />
							</c:when>
							<c:otherwise>
								<c:set var="dateTimePickerType" value="uicDatePicker" />
							</c:otherwise>
						</c:choose>
	    					<div id="uic_SearchColumnStartDiv_${searchElement.uniqueSaId}" >
	    						<label><c:out value="Start " /><c:out value="${searchElement.label}"/></label>
	    						<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
	    						 <input type="text" readonly="readonly" 
	    						 id="uic_SearchElement_${searchElement.uniqueSaId}" name="start:${searchElement.elementType}:${searchElement.name}" 
	    						 class="${dateTimePickerType} form-control dynamicSearchElement rangeSearchElement dateElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
	    					</div>	
	    					<div class="UicErrorMsg" id='errorMessage_startDate_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="REGEX_startDate_${searchElement.name}" name="REGEX_startDate_${searchElement.name}" value="${searchElement.validationRegex}"/>	
	    					<div id="uic_SearchColumnEndDiv_${searchElement.uniqueSaId}">
	    						<label><c:out value="End " /><c:out value="${searchElement.label}"/></label>
	    						<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
	    						 <input type="text" readonly="readonly" 
	    						 id="uic_SearchElement_${searchElement.uniqueSaId}" name="end:${searchElement.elementType}:${searchElement.name}" 
	    						 class="${dateTimePickerType} form-control dynamicSearchElement rangeSearchElement dateElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
	    					</div>
	    					<div class="UicErrorMsg" id='errorMessage_endDate_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="REGEX_endDate_${searchElement.name}" name="REGEX_endDate_${searchElement.name}" value="${searchElement.validationRegex}"/>		
	    				</c:if>
	    			</c:when>
	    			<c:otherwise>
	    				<!-- Process other elements (text/number/date/dropdown/checkbox/radio) -->
	    				<c:choose>
	    				<c:when test="${searchElement.elementType eq 'text'}">
	    					<div id="uic_SearchColumnDiv_${searchElement.uniqueSaId}" >
	    						<label><c:out value="${searchElement.label}"/></label>
	    						<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
	    						<c:choose>
	    							<c:when test="${searchElement.isAutoComplete}">
	    								<c:url value="/searchAutoComplete.htm?tableIds=${componentId}&field=${searchElement.name}" var="autoCompleteUrl"/>
	    								<input type="text" name="${searchElement.elementType}:${searchElement.name}" onclick="callSearchAutoComplete(this,'${autoCompleteUrl}');" 
	    								id="uic_SearchElement_${searchElement.uniqueSaId}" class="form-control dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" 
	    								value="${searchElement.defValue}" required="required"/>
	    							</c:when>
	    							<c:otherwise>
	    								<input type="text" ${searchElement.eventStr} name="${searchElement.elementType}:${searchElement.name}" 
	    								id="uic_SearchElement_${searchElement.uniqueSaId}"
	    								class="form-control dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
	    							</c:otherwise>
	    						</c:choose>
	    					</div>
	    					<div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="MIN_${searchElement.name}" name="MIN_${searchElement.name}" value="${searchElement.minLength}"/>
							<input type="hidden" id="MAX_${searchElement.name}" name="MAX_${searchElement.name}" value="${searchElement.maxLength}"/>
							<input type="hidden" id="REGEX_${searchElement.name}" name="REGEX_${searchElement.name}" value="${searchElement.validationRegex}"/>
	    				</c:when>
	    				<c:when test="${searchElement.elementType eq 'number'}">
	    					<div id="uic_SearchColumnDiv_${searchElement.uniqueSaId}">
	    						<label><c:out value="${searchElement.label}"/></label>
	    						<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
	    						<c:choose>
	    							<c:when test="${searchElement.isAutoComplete}">
	    								<c:url value="/searchAutoComplete.htm?tableIds=${componentId}&field=${searchElement.name}" var="autoCompleteUrl"/>
	    								<input type="text" name="${searchElement.elementType}:${searchElement.name}" onclick="callSearchAutoComplete(this,'${autoCompleteUrl}');" 
	    								id="uic_SearchElement_${searchElement.uniqueSaId}" class="form-control dynamicSearchElement numeric ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" 
	    								value="${searchElement.defValue}"/>
	    							</c:when>
	    							<c:otherwise>
	    								<input type="text" ${searchElement.eventStr} name="${searchElement.elementType}:${searchElement.name}" 
	    								id="uic_SearchElement_${searchElement.uniqueSaId}" 
	    								class="form-control dynamicSearchElement numeric ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
	    							</c:otherwise>
	    						</c:choose>
	    					</div>
	    					<div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="MIN_${searchElement.name}" name="MIN_${searchElement.name}" value="${searchElement.minLength}"/>
							<input type="hidden" id="MAX_${searchElement.name}" name="MAX_${searchElement.name}" value="${searchElement.maxLength}"/>
							<input type="hidden" id="REGEX_${searchElement.name}" name="REGEX_${searchElement.name}" value="${searchElement.validationRegex}"/>
	    				</c:when>
	    				<c:when test="${searchElement.elementType eq 'date' or searchElement.elementType eq 'datetime'}">
	    					<c:choose>
								<c:when test="${searchElement.elementType eq 'datetime' }">
									<c:set var="dateTimePickerType" value="uicDateTimePicker" />
								</c:when>
								<c:otherwise>
									<c:set var="dateTimePickerType" value="uicDatePicker" />
								</c:otherwise>
							</c:choose>	
	    					<div  id="uic_SearchColumnDiv_${searchElement.uniqueSaId}">
	    						<label><c:out value="${searchElement.label}"/></label>
	    						<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if> 
	    						 <input type="text" ${searchElement.eventStr} readonly="readonly" 
	    						 id="uic_SearchElement_${searchElement.uniqueSaId}" name="${searchElement.elementType}:${searchElement.name}" 
	    						 class="${dateTimePickerType} form-control dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
	    					</div>	
	    					<div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="REGEX_${searchElement.name}" name="REGEX_${searchElement.name}" value="${searchElement.validationRegex}"/>
	    				</c:when>
	    				<c:when test="${searchElement.elementType eq 'dropdown'}">
	    				 <div id="uic_SearchColumnDiv_${searchElement.uniqueSaId}">
				            <label><c:out value="${searchElement.label}"/></label>
				            <c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
								<sup style="color:red; padding-left: 5px;">(*)</sup>
							</c:if> 
				            <select ${searchElement.eventStr} name="${searchElement.elementType}:${ searchElement.name}" 
				            id="uic_SearchElement_${searchElement.uniqueSaId}"
				             class="form-control dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}">
				              <option value="">Select</option>
				              <c:forEach items="${searchElement.values}" var="dropdown">
				              	<c:choose>
				              		<c:when test="${not empty searchElement.defValue and searchElement.defValue eq dropdown.value}">
				              			<option value="${ dropdown.value }" selected="selected">${ dropdown.label }</option>
				              		</c:when>
				              		<c:otherwise>
				              			 <option value="${ dropdown.value }">${ dropdown.label }</option>
				              		</c:otherwise>
				              	</c:choose>
				              </c:forEach>
				            </select>
				          </div>
				          <div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
	    				</c:when>
	    				<c:when test="${searchElement.elementType eq 'multidropdown'}">
	    					<div id="uic_SearchColumnDiv_${searchElement.uniqueSaId}">
					            <label><c:out value="${searchElement.label}"/></label>
					            <c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if>
					            <select ${searchElement.eventStr} name="${searchElement.elementType}:${ searchElement.name }" 
					            id="uic_SearchElement_${searchElement.uniqueSaId}"
					            class="form-control dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" style="min-height: 50px !important;" multiple="multiple">
					              <c:choose>
					              	<c:when test="${not empty searchElement.defValue}">
					              		<option value="">Select</option>
					              	</c:when>
					              	<c:otherwise>
					              		<option selected="selected" value="">Select</option>
					              	</c:otherwise>
					              </c:choose>
					              <c:forEach items="${ searchElement.values }" var="dropdown" varStatus="ddLoop">
					               <c:choose>
					              		<c:when test="${not empty searchElement.defValue and fn:containsIgnoreCase(searchElement.defValue,dropdown.value)}">
					              			<option value="${ dropdown.value }" selected="selected" >${ dropdown.label }</option>
					              		</c:when>
					              		<c:otherwise>
					              			 <option value="${ dropdown.value }" >${ dropdown.label }</option>
					              		</c:otherwise>
					              	</c:choose>
					              </c:forEach>
					            </select>
					          </div>
					          <div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
	    				</c:when>
	    				<c:when test="${searchElement.elementType eq 'checkbox'}">
	    					<div class="form-group col-lg-6" style="float: left;" id="uic_SearchColumnDiv_${searchElement.uniqueSaId}">
					            <label><c:out value="${searchElement.label}: "/></label>
					            <c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if>
					            <c:forEach items="${ searchElement.values }" var="dropdown" varStatus="ddLoop">
					            	<c:choose>
					              		<c:when test="${not empty searchElement.defValue and searchElement.defValue eq dropdown.value}">
					              			<input ${searchElement.eventStr} type="checkbox" checked name="${searchElement.elementType}:${searchElement.name}_${ddLoop.index}"
					              			id="uic_SearchElement_${searchElement.uniqueSaId}" 
					              			class="dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" value="${ dropdown.value}" />${ dropdown.label }
					              		</c:when>
					              		<c:otherwise>
					              			 <input ${searchElement.eventStr} type="checkbox" name="${searchElement.elementType}:${searchElement.name}_${ddLoop.index}"
					              			 id="uic_SearchElement_${searchElement.uniqueSaId}" 
					              			 class="dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" value="${ dropdown.value}" />${ dropdown.label }
					              		</c:otherwise>
					              	</c:choose>
					            </c:forEach>
					    	</div>  
					    	<div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
	    				</c:when>
	    				<c:when test="${searchElement.elementType eq 'radio'}">
	    					<div id="uic_SearchColumnDiv_${searchElement.uniqueSaId}" >
					            <label><c:out value="${searchElement.label}: "/></label>
					            <c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if>
					            <c:forEach items="${ searchElement.values }" var="dropdown">
					            	<c:choose>
					              		<c:when test="${not empty searchElement.defValue and searchElement.defValue eq dropdown.value}">
					              			<input ${searchElement.eventStr} type="radio" checked name="${searchElement.elementType}:${searchElement.name}" class="dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}"
					              			id="uic_SearchElement_${searchElement.uniqueSaId}"
					              			 value="${ dropdown.value}" />${ dropdown.label }
					              		</c:when>
					              		<c:otherwise>
					              			 <input ${searchElement.eventStr} type="radio" name="${searchElement.elementType}:${searchElement.name}" class="dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}"
					              			 id="uic_SearchElement_${searchElement.uniqueSaId}" 
					              			 value="${ dropdown.value}" />${ dropdown.label }
					              		</c:otherwise>
					              	</c:choose>
					            </c:forEach>
					    	</div>
					    	<div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
	    				</c:when>
	    				<c:otherwise>
	    					<div  id="uic_SearchColumnDiv_${searchElement.uniqueSaId}" >
				              	<label>defaultOption_<c:out value="${searchElement.label}"/> </label>
				              	<c:if test="${ fn:containsIgnoreCase(searchElement.validationTypeCss, 'required')}">
									<sup style="color:red; padding-left: 5px;">(*)</sup>
								</c:if>
	    						<input type="text" ${searchElement.eventStr} name="${searchElement.elementType}:${searchElement.name}" 
	    						id="uic_SearchElement_${searchElement.uniqueSaId}" 
	    						class="form-control dynamicSearchElement ${componentId}_${searchElement.name} x ${searchElement.validationTypeCss} x ${searchElement.searchAttribCss}" placeholder="${searchElement.placeHolderTxt}" value="${searchElement.defValue}"/>
				            </div>
				             <div class="UicErrorMsg" id='errorMessage_${searchElement.name}'><!-- Empty --></div>
							<input type="hidden" id="MIN_${searchElement.name}" name="MIN_${searchElement.name}" value="${searchElement.minLength}"/>
							<input type="hidden" id="MAX_${searchElement.name}" name="MAX_${searchElement.name}" value="${searchElement.maxLength}"/>
							<input type="hidden" id="REGEX_${searchElement.name}" name="REGEX##${searchElement.name}" value="${searchElement.validationRegex}"/>
	    				</c:otherwise>
	    				</c:choose>
	    			</c:otherwise>
	    			</c:choose>
	    		</div >
	    	</c:forEach>
	    </div>
	    </c:forEach>
	    <c:if test="${ rowId gt -1 }">
	    	<div>
		      <div style="text-align: center;" id="uic_SearchRefreshDiv_${componentId}">
		       <input type="hidden" name="searchCompId" id="searchCompId" value="${componentId}" />
		         <c:if test="${not empty  searchComp.searchButtonLabel}">
		        	<button type="button" class="btn btn-primary UicBtnRightMargin ${searchComp.searchButtonCss}" id="search${componentId}" onclick="doSearchData('<c:out value="${componentId}"/>');" >
			        	<c:out value="${searchComp.searchButtonLabel}"/>
			        </button>
			    </c:if>
			    <c:if test="${not empty  searchComp.resetButtonLabel}">    
			        <button type="button" id="reset${componentId}" class="btn btn-primary UicBtnRightMargin ${searchComp.resetButtonCss}" onclick="doSearchReset('<c:out value="${componentId}"/>','${context}/doReset.htm');">
			       		 <c:out value="${searchComp.resetButtonLabel}"/>
			        </button>
			    </c:if>   
			     <c:if test="${ searchComp.buttonLst ne null}">
			        <c:forEach items="${searchComp.buttonLst }" var="button" varStatus="buttonLoop">
			        	<c:choose>
				        	<c:when test="${button.displayFlag eq false }">
								<c:set var="buttonStyle" value="display:none;" />
							</c:when>
							<c:otherwise>
								<c:set var="buttonStyle" value="" />
							</c:otherwise> 
						</c:choose>
				         <button type="${button.buttonType}" class="btn btn-primary UicBtnRightMargin ${button.buttonCSS}" id="uicButton_${button.uniqueButtonId}" 
				         style="${buttonStyle}" ${button.eventDataStr}>
				        	<c:out value="${button.buttonLabel}"/>
				        </button>
			        </c:forEach>
		        </c:if> 	
		      </div>
	      </div>
	    </c:if>
    </div>
</form>    
</div>
</c:if>
<c:if test="${error ne null }">
	<div class="col-lg-12" style="text-align: center;" id="errorDiv_${componentId}">
		<c:out value="${error}"/>
	</div>
</c:if>
<script type="text/javascript">
initializeDateTimePickerForSearch("dynamicSearch${componentId}");
</script>

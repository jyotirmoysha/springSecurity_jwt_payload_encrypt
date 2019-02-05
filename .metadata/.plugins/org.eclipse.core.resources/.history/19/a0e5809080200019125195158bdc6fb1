<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<c:set var="sortableURL" value="${param.sortableURL}" />
<c:set var="table" value="${tables[param.tableId]}" />
<c:set var="page" value="${ pages[tableId] }" />
<c:set var="isScroll" value="${ table.isScrollData }" />
<c:choose>
   <c:when test="${empty table.content[0]}">
	<tr class="uicNoDataFoundTR">
        <td id="noDataFoundTd_${tableId}" colspan="${table.totalCol}">
         <span class="uicNoDataFoundSpan"><spring:message code="label.noData"/></span>
		</td>
	</tr>
   </c:when>
   <c:otherwise>
	<c:if test="${ fn:containsIgnoreCase(table.totalPosition, 'top') }">
		<jsp:include page="totalCalcuation.jsp">
			<jsp:param value="${tableId}" name="tableId"/>
		</jsp:include>
	</c:if>
	<c:set var="isDirtyValue" value="N"/>
	<c:if test="${isNewRecord eq true}">
		<c:set var="isDirtyValue" value="I"/>
	</c:if>
	<c:set var="checkBoxColumns" value=""/>
	<c:forEach items="${table.content}" begin="0" var="row" varStatus="rowLoop">
		<c:set var="rowLoopIndex" value="${((page.pageNo-1)*page.pageSize)+rowLoop.index}"/>
		<c:set var="setDirty" value="true"/>
		<c:set var="rowAccesskey" value="read"/>
        <c:if test="${isNewRecord eq true}">
        	<c:set var="rowAccesskey" value="in"/>
        </c:if>  
        <tr id="row_${tableId}_${rowLoopIndex}" accesskey="${rowAccesskey}" tabindex="${rowLoopIndex}" 
        	class="<c:if test="${ (rowLoopIndex % 2) eq 0 }">even</c:if><c:if test="${ (rowLoopIndex % 2) ne 0 }">odd</c:if> x ${row[0].rowSpecifics.style}"
     		<c:if test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick') and isDirtyValue eq 'N'}">ondblclick="changeToEditableRow(this);"</c:if>>
				<c:forEach items="${row}" var="cell" varStatus="colLoop">
                    <c:if test="${rowLoop.index eq 0 and cell.columnSpecifics.isIdentifier eq false}">
                    	<c:if test="${ cell.columnSpecifics.htmlElement eq 'text'}">
	                    	<input type="hidden" id="MIN_${colLoop.index}" name="MIN##${colLoop.index}" value="${cell.columnSpecifics.minLength}"/>
							<input type="hidden" id="MAX_${colLoop.index}" name="MAX##${colLoop.index}" value="${cell.columnSpecifics.maxLength}"/>
							<input type="hidden" id="REGEX_${colLoop.index}" name="REGEX##${colLoop.index}" value="${cell.columnSpecifics.validationRegex}"/>
                    	</c:if>
                    	<c:if test="${ cell.columnSpecifics.htmlElement eq 'date'}">
                    		<input type="hidden" id="REGEX_${colLoop.index}" name="REGEX##${colLoop.index}" value="${cell.columnSpecifics.validationRegex}"/>
                    	</c:if>
                    	<c:if test="${cell.columnSpecifics.htmlElement eq 'date' or cell.columnSpecifics.htmlElement eq 'datetime'}">
                    		<input type="hidden" id="dateFormat_${colLoop.index}" value="${cell.columnSpecifics.dateFormat}"/>
                    	</c:if>
                    </c:if>
                     <c:if test="${colLoop.index eq 0 and (not empty table.subTableUrl or not empty table.deleteUrl)}">
                      <c:set var="identifierParams" value="" />
                      <c:forEach items="${cell.rowSpecifics.idsNameAndVal}" var="entry">
                        <c:set var="identifierParams" value="${identifierParams}&${entry.key}=${entry.value}" />
                      </c:forEach>
                     </c:if>
					<c:if test="${ colLoop.index eq 0 and not empty table.subTableUrl }">
						<td style="<c:if test="${table.expDspFlag eq false}">display:none;</c:if>" class="uic_ExpandTD showhideExpand_${tableId}">
							<c:if test="${(table.hasCondExpand and fn:containsIgnoreCase(row[0].rowSpecifics.style,'Expand')) or (table.hasCondExpand eq false) and isDirtyValue eq 'N'}">
	                          <c:set var="subTableUrl" value="${table.subTableUrl}${identifierParams}"/>
	                          <span id="expandOrCollapse${rowLoopIndex}${tableId}">
	                           <a class="UicExpandTable" href="javascript:void(0);"
	                             onclick="javascript:expandRow(this,'<c:out value="${tableId}"/>','<c:out value="${rowLoopIndex}"/>','<c:out value="${subTableUrl}"/>');">
	                           </a>
	                         </span>
	                         </c:if>
                        </td>
					</c:if>
					 <c:if test="${not fn:containsIgnoreCase(checkBoxColumns, colLoop.index) and cell.columnSpecifics.htmlElement eq 'checkbox'}">
                       <h6 style="display: none; visibility: hidden; float: left; font-size: 0px; line-height: 0px;">
                        <c:forEach items="${ cell.columnSpecifics.dropdownItems }" var="dd" varStatus="drloop">
                            <c:choose>
                           	  <c:when test="${drloop.index eq 0}">
                                 <input type="hidden" id="checkedValue_${tableId}_${colLoop.index}" value="${dd.value}"/>
                              </c:when>
                              <c:otherwise>
                                 <input type="hidden" id="unchecKedValue_${tableId}_${colLoop.index}" value="${dd.value}"/>
                              </c:otherwise>
                            </c:choose>
                        </c:forEach>
                       </h6>
                       <c:set var="checkBoxColumns" value="${checkBoxColumns}~${colLoop.index}"/>
                      </c:if>
                      <c:choose>
                       <c:when test="${cell.columnSpecifics.isIdentifier}">
                       <c:if test="${table.isUpdatable}">
                           <td style="display: none; visibility: hidden; float: left; font-size: 0px; line-height: 0px;" class="identifierTD">
                             <c:if test="${cell.columnSpecifics.isIdentifier}">
                             	<input type="hidden" value="${cell.cellContent}" name="identifier.${cell.columnSpecifics.columNoQrySeq}" class="identifier identifier_${tableId}_${colLoop.index}" id="identifier_${tableId}_${colLoop.index}_${rowLoopIndex}"/>
                             </c:if>
                             <c:if test="${setDirty}">
                             	<input type="hidden" value="${isDirtyValue}" class="isDirty_${tableId}" name="isDirty" id="isDirty_${tableId}_${rowLoopIndex}" />
                             	<input type="hidden" value="N" id="isModified_${tableId}_${rowLoopIndex}" />
                             	<c:set var="setDirty" value="false"/>
                             </c:if>
                           </td>
                        </c:if>
                       </c:when>
                       <c:when test="${cell.columnSpecifics.superElmId ne 0}">
                       <c:set var="style" value="${cell.columnSpecifics.inlineStyle}"/>
                       <c:if test="${cell.columnSpecifics.displayFlag eq false}">
                        <c:set var="style" value="display:none; ${cell.columnSpecifics.inlineStyle}"/>
                       </c:if>
                       <td style="${style}" class="${cell.columnSpecifics.cssName} hideCol_${tableId}_${cell.columnSpecifics.superElmId}">
                          <c:set var="checked" value=""/>
	                      <c:if test="${fn:containsIgnoreCase(cell.columnSpecifics.cssName, 'checked')}">
	                    	<c:set var="checked" value="checked"/>
	                      </c:if>
                          <c:choose>
                             <c:when test="${ not empty cell.columnSpecifics.url and cell.columnSpecifics.url ne '#'}">
                                <c:set var="url" value="${ cell.columnSpecifics.url }" />
                                
                                <c:forEach items="${cell.rowSpecifics.idsNameAndVal}" var="entry">
                        			<c:set var="variable" value="##${entry.key}" />
                        			<c:set var="value" value="${entry.value}" />
	                                  <c:if test="${fn:containsIgnoreCase(url, variable)}">
                                 		<c:set var="url" value="${fn:replace(url, variable, value)}" />
                                 	  </c:if>
                      			</c:forEach>
                                <c:if test="${ not fn:containsIgnoreCase(url, 'javascript:') }">
                                   <c:set var="url" value="javascript:openHref('${url}');" />
                                </c:if>
                                <c:choose>
                                  <c:when test="${ cell.columnSpecifics.htmlElement eq 'checkbox'}">
                                    <c:forEach items="${ cell.columnSpecifics.dropdownItems }" var="dd" varStatus="drloop">
                                      	<c:set var="tempDDValue" value="${fn:toLowerCase(dd.value)}" />
                                        <c:set var="tempCellValue" value="${fn:toLowerCase(cell.cellContent)}" />
                                       	<c:if test="${ drloop.index eq 0 and not empty tempCellValue and (tempDDValue eq tempCellValue) }">
                                           	<c:set var="checked" value="checked"/>
                                       	</c:if> 
                                     </c:forEach>
                                    <input ${checked} ${cell.eventStr} type="checkbox" value="${cell.cellContent}" id="uicChkBox_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                    	class="uicChkBox ${cell.columnSpecifics.typeOfValidation} x ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicChkBox_${tableId}_${colLoop.index}" 
                                        tabindex="${tableId}_${colLoop.index}" onclick="${url}" onchange="checkOrUnCheck(this);">
                                    <input type="hidden" value="${cell.cellContent}" name="${cell.columnSpecifics.columNoQrySeq}" id="uicChkHidden_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                    	class="uicChkHidden_${tableId}_${colLoop.index}"/>
                                  </c:when>
                                  <c:when test="${ cell.columnSpecifics.htmlElement eq 'radio'}">
                                    <input type="radio" ${cell.eventStr} onclick="${url}" name="radio.${cell.columnSpecifics.columNoQrySeq}" id="uicRadio_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                    class="uicRadio ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicRadio_${tableId}_${colLoop.index}"/>
                                  </c:when>
                                  <c:when test="${ cell.columnSpecifics.htmlElement eq 'button'}">
                                     <input type="button" ${cell.eventStr} id="uicButton_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                     class="uicButton ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicButton_${tableId}_${colLoop.index}" value="${cell.cellContent}" onclick="${url}"/>
                                  </c:when>
                                  <c:otherwise>
	                                <c:if test="${ cell.columnSpecifics.htmlElement eq 'text' and fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
	                                    <div accesskey="in" class="in_${tableId}_${rowLoopIndex}" style="display: none">
	                                      <input type="text" ${cell.eventStr} name="${cell.columnSpecifics.columNoQrySeq}" value="${cell.cellContent}" id="uicTxtBox_${tableId}_${colLoop.index}_${rowLoopIndex}"
	                                      	class="uicTxtBox form-control ${cell.columnSpecifics.typeOfValidation} uicTxtBox_${tableId}_${colLoop.index}" >
	                                    </div>
	                                </c:if>
	                                <c:if test="${ cell.columnSpecifics.htmlElement eq 'dropdown' and fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                      <div accesskey="in" class="sn_${tableId}_${rowLoopIndex}" style="display: none">
                                         <select ${cell.eventStr} name="${cell.columnSpecifics.columNoQrySeq}" id="uicDropDown_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                         	class="uicDropDown form-control ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicDropDown_${tableId}_${colLoop.index}">
                                           <option value="" selected="selected"></option>
                                           <c:forEach items="${ cell.columnSpecifics.dropdownItems }" var="dd">
                                          <c:set var="tempDDValue"  value="${fn:toLowerCase(dd.value)}" />
                                          <c:set var="tempCellValue"  value="${fn:toLowerCase(cell.cellContent)}" />
                                             <c:choose>
                                               <c:when test="${ not empty tempCellValue and (tempDDValue eq tempCellValue) }">
                                                 <option value="${ dd.value }" selected="selected">
                                                   <c:out value="${ dd.label }" />
                                                 </option>
                                               </c:when>
                                               <c:otherwise>
                                                 <option value="${ dd.value }">
                                                   <c:out value="${ dd.label }"/>
                                                 </option>
                                               </c:otherwise>
                                             </c:choose>
                                           </c:forEach>
                                         </select>
                                      </div>
                                     </c:if>
                                    <c:if test="${ not fn:containsIgnoreCase(url, 'javascript:') }">
                                      <c:set var="url" value="javascript:openHref('${url}');" />
                                    </c:if>
                                    <div accesskey="read" class="in_${tableId}_${rowLoopIndex}">
	                                    <a id="column_href_${tableId}_${colLoop.index}_${rowLoopIndex}" class="column_href_${tableId}_${colLoop.index}" href="javascript:void(0);" onclick="${url}">
	                                      <c:choose>
	                                        <c:when test="${ cell.columnSpecifics.htmlElement eq 'fulldata' }">
                                         		<span ${cell.eventStr} class="uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}"><c:out value="${cell.cellContent}"/></span>
                                      		</c:when>
	                                        <c:when test="${fn:length(cell.cellContent) gt cell.columnSpecifics.charLength}">
	                                          <span ${cell.eventStr} data-toggle="tooltip" class="uicToolTip" title="${cell.cellContent}"><c:out value="${ fn:substring(cell.cellContent, 0, cell.columnSpecifics.charLength) }..." /></span>
	                                        </c:when>
	                                        <c:otherwise>
	                                          <span ${cell.eventStr} class="${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex}"><c:out value="${cell.cellContent}"/></span>
	                                        </c:otherwise>
	                                      </c:choose>
	                                    </a>
                                    </div>
                                  </c:otherwise>
                                </c:choose>
                              </c:when>
                              <c:otherwise>
                                <c:choose>
                                  <c:when test="${ not empty cell.columnSpecifics.htmlElement }">
                                    <c:choose>
                                      <c:when test="${ cell.columnSpecifics.htmlElement eq 'label'}">
                                        <c:choose>
                                          <c:when test="${fn:length(cell.cellContent ) gt cell.columnSpecifics.charLength}">
                                            <span ${cell.eventStr} title="${cell.cellContent}" data-toggle="tooltip" class="uicTooltip uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}">
                                            	<c:out value="${ fn:substring(cell.cellContent , 0, cell.columnSpecifics.charLength) }..." />
                                            </span>
                                          </c:when>
                                          <c:otherwise>
                                            <span ${cell.eventStr} class="uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}"><c:out value="${cell.cellContent}" /></span>
                                          </c:otherwise>
                                        </c:choose>
                                      </c:when>
                                       <c:when test="${cell.columnSpecifics.htmlElement eq 'text'}">
                                      <c:choose>
                                       <c:when test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                         <div accesskey="in" class="in_${tableId}_${rowLoopIndex}" style="display: none">
                                            <input type="text" ${cell.eventStr} class="uicTxtBox form-control ${cell.columnSpecifics.typeOfValidation} uicTxtBox_${tableId}_${colLoop.index}" name="${cell.columnSpecifics.columNoQrySeq}" value="${cell.cellContent}" id="uicTxtBox_${tableId}_${colLoop.index}_${rowLoopIndex}">
                                         </div>
                                         <div accesskey="read" class="in_${tableId}_${rowLoopIndex}">
                                         <c:choose>
	                                          <c:when test="${fn:length(cell.cellContent ) gt 25}">
	                                          	 <span ${cell.eventStr} data-toggle="tooltip" class="uicTooltip uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}" title="${cell.cellContent}"><c:out value="${ fn:substring(cell.cellContent , 0, 20) }..." /></span>
	                                          </c:when>
	                                          <c:otherwise>
	                                             <span ${cell.eventStr} class="uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}"><c:out value="${cell.cellContent}"/></span>
	                                          </c:otherwise>
                                          </c:choose>
                                         </div>
                                       </c:when>
                                       <c:otherwise>
                                           <input type="text" ${cell.eventStr} class="uicTxtBox form-control ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicTxtBox_${tableId}_${colLoop.index}" name="${cell.columnSpecifics.columNoQrySeq}" value="${cell.cellContent}" id="uicTxtBox_${tableId}_${colLoop.index}_${rowLoopIndex}">
                                       </c:otherwise>
                                       </c:choose>
                                      </c:when>
                                     <c:when test="${cell.columnSpecifics.htmlElement eq 'checkbox'}">
                                      <c:set var="checked" value=""/>
                                      <c:forEach items="${ cell.columnSpecifics.dropdownItems }" var="dd" varStatus="drloop">
                                      	<c:set var="tempDDValue" value="${fn:toLowerCase(dd.value)}" />
                                        <c:set var="tempCellValue" value="${fn:toLowerCase(cell.cellContent)}" />
                                       	<c:if test="${ drloop.index eq 0 and not empty tempCellValue and (tempDDValue eq tempCellValue) }">
                                           	<c:set var="checked" value="checked"/>
                                       	</c:if> 
                                       </c:forEach>
                                        <input ${checked} ${cell.eventStr} type="checkbox" value="${cell.cellContent}" id="uicChkBox_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                        	class="uicChkBox ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicChkBox_${tableId}_${colLoop.index}" 
                                        	tabindex="${tableId}_${colLoop.index}" onchange="checkOrUnCheck(this);">
                                    	<input type="hidden" value="${cell.cellContent}" name="${cell.columnSpecifics.columNoQrySeq}" class="uicChkHidden_${tableId}_${colLoop.index}" id="uicChkHidden_${tableId}_${colLoop.index}_${rowLoopIndex}"/>
                                      </c:when>

                                      <c:when test="${ cell.columnSpecifics.htmlElement eq 'radio'}">
                                        <input type="radio" ${cell.eventStr} value="${cell.cellContent}" name="radio.${cell.columnSpecifics.columNoQrySeq}" id="uicRadio_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                        	class="uicRadio ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicRadio_${tableId}_${colLoop.index}"/>
                                      </c:when>
                                     <c:when test="${cell.columnSpecifics.htmlElement eq 'date' or cell.columnSpecifics.htmlElement eq 'datetime'}">
                                     	<c:choose>
								        	<c:when test="${cell.columnSpecifics.htmlElement eq 'datetime' }">
								        		<c:set var="dateTimePickerType" value="uicDateTimePicker" />
								        	</c:when>
								        	<c:otherwise>
								        		<c:set var="dateTimePickerType" value="uicDatePicker" />
								        	</c:otherwise>
							        	</c:choose>
                                      <c:choose>
                                       <c:when test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                          <div accesskey="in" class="in_${tableId}_${rowLoopIndex}" style="display: none">
                                            <input type="text" ${cell.eventStr} readonly="readonly" name="${cell.columnSpecifics.columNoQrySeq}" id="uicDate_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                            class="${dateTimePickerType} uicDate form-control ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicDate_${tableId}_${colLoop.index}" value="${cell.cellContent}" />
                                          </div>
                                          <div accesskey="read" class="in_${tableId}_${rowLoopIndex}">
	                                          <span ${cell.eventStr} class="uicSpan uicSpan_${tableId}_${colLoop.index}">
	                                          	<c:out value="${cell.cellContent}"/>
	                                       	  </span>
                                       	  </div>
                                       </c:when>
                                       <c:otherwise>
                                         <input type="text" ${cell.eventStr} readonly="readonly" name="${cell.columnSpecifics.columNoQrySeq}" id="uicDate_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                          class="${dateTimePickerType} uicDate form-control ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicDate_${tableId}_${colLoop.index}" value="${cell.cellContent}" />
                                       </c:otherwise>
                                       </c:choose>
                                      </c:when>
                                      <c:when test="${ cell.columnSpecifics.htmlElement eq 'dropdown'}">
                                       <c:if test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                        <script>
	                                         function displayVals() {
	                                           var singleValues = $("#uicDropDown_${tableId}_${colLoop.index}_${rowLoopIndex} option:selected").text();
	                                           	$("#sngl${tableId}_${colLoop.index}_${rowLoopIndex}").html(singleValues);
	                                          }
	                                         displayVals();
                                        </script>
                                        <div accesskey="read" id="sngl${tableId}_${colLoop.index}_${rowLoopIndex}" class="sn_${tableId}_${rowLoopIndex}"><!-- Empty --></div>
                                        <div accesskey="in" class="sn_${tableId}_${rowLoopIndex}" style="display: none;">
                                        </c:if>
                                          <select ${cell.eventStr} name="${cell.columnSpecifics.columNoQrySeq}" id="uicDropDown_${tableId}_${colLoop.index}_${rowLoopIndex}" 
                                          		class="uicDropDown form-control ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicDropDown_${tableId}_${colLoop.index}">
                                            <option value="" selected="selected"></option>
                                            <c:forEach items="${ cell.columnSpecifics.dropdownItems }" var="dd">
	                                          <c:set var="tempDDValue"  value="${fn:toLowerCase(dd.value)}" />
	                                          <c:set var="tempCellValue"  value="${fn:toLowerCase(cell.cellContent)}" />
                                              <c:choose>
                                                <c:when test="${ not empty tempCellValue and (tempDDValue eq tempCellValue) }">
                                                  <option value="${ dd.value }" selected="selected">
                                                    <c:out value="${ dd.label }" />
                                                  </option>
                                                </c:when>
                                                <c:otherwise>
                                                  <option value="${ dd.value }">
                                                    <c:out value="${ dd.label }"/>
                                                  </option>
                                                </c:otherwise>
                                              </c:choose>
                                            </c:forEach>
                                          </select>
                                        <c:if test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                         </div>
                                        </c:if>
                                      </c:when>
									<c:when test="${ cell.columnSpecifics.htmlElement eq 'multidropdown' or cell.columnSpecifics.htmlElement eq 'multiselect'}">
                                       <c:if test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                        <script>
	                                         function displayVals() {
	                                           var singleValues = $("#uicDropDown_${tableId}_${colLoop.index}_${rowLoopIndex} option:selected").text();
	                                           	$("#sngl${tableId}_${colLoop.index}_${rowLoopIndex}").html(singleValues);
	                                          }
	                                        // $("#uicDropDown_${tableId}_${colLoop.index}_${rowLoopIndex}").change(displayVals);
	                                         displayVals();
                                        </script>
                                        <div accesskey="read" id="sngl${tableId}_${colLoop.index}_${rowLoopIndex}" class="sn_${tableId}_${rowLoopIndex}"></div>
                                        <div accesskey="in" class="sn_${tableId}_${rowLoopIndex}" style="display: none;">
                                        </c:if>
                                          <select ${cell.eventStr} name="${cell.columnSpecifics.columNoQrySeq}" id="uicDropDown_${tableId}_${colLoop.index}_${rowLoopIndex}" multiple="multiple" 
                                          		class="uicMultiDropDown form-control ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicDropDown_${tableId}_${colLoop.index}">
                                          <c:choose>
							              	<c:when test="${not empty cell.cellContent}">
							              		<option value="">Select</option>
							              	</c:when>
							              	<c:otherwise>
							              		<option selected="selected" value="">Select</option>
							              	</c:otherwise>
							              </c:choose>
                                            <c:forEach items="${ cell.columnSpecifics.dropdownItems }" var="dd">
	                                          <c:set var="tempDDValue"  value="${fn:toLowerCase(dd.value)}" />
	                                          <c:set var="tempCellValue"  value="${fn:toLowerCase(cell.cellContent)}" />
	                                          <c:if test="${ not empty tempDDValue and not fn:containsIgnoreCase(tempDDValue,',')}">
	                                              <c:choose>
	                                                <c:when test="${ not empty tempCellValue and fn:containsIgnoreCase(tempCellValue,tempDDValue)}">
	                                                  <option value="${ dd.value }" selected="selected">
	                                                    <c:out value="${ dd.label }" />
	                                                  </option>
	                                                </c:when>
	                                                <c:otherwise>
	                                                  <option value="${ dd.value }">
	                                                    <c:out value="${ dd.label }"/>
	                                                  </option>
	                                                </c:otherwise>
	                                              </c:choose>
                                             </c:if> 
                                            </c:forEach>
                                          </select>
                                        <c:if test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                         </div>
                                        </c:if>
                                      </c:when>
                                      <c:when test="${cell.columnSpecifics.htmlElement eq 'color'}">
                                      <c:choose>
                                       <c:when test="${fn:containsIgnoreCase(table.editableDataFlag,'OnDoubleClick')}">
                                         <div accesskey="in" class="colorDiv in_${tableId}_${rowLoopIndex}" style="display: none">
                                         <section id="typeahead">
                                           <div class="input-group UicColorPicker colorpicker-component">
											    <input ${cell.eventStr} type="text" class="uicTxtBox form-control ${cell.columnSpecifics.typeOfValidation} uicTxtBox_${tableId}_${colLoop.index}"
											    id="uicTxtBox_${tableId}_${colLoop.index}_${rowLoopIndex}" name="${cell.columnSpecifics.columNoQrySeq}"
												value="${cell.cellContent}"/>
											    <span class="input-group-addon"><i></i></span>
											</div>
										</section>
                                         </div>
                                         <div accesskey="read" class="in_${tableId}_${rowLoopIndex}">
                                         <c:choose>
	                                          <c:when test="${fn:length(cell.cellContent ) gt 25}">
	                                          	 <span ${cell.eventStr} data-toggle="tooltip" class="uicTooltip uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}" title="${cell.cellContent}"><c:out value="${ fn:substring(cell.cellContent , 0, 20) }..." /></span>
	                                          </c:when>
	                                          <c:otherwise>
	                                             <span ${cell.eventStr} class="uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}"><c:out value="${cell.cellContent}"/></span>
	                                          </c:otherwise>
                                          </c:choose>
                                         </div>
                                       </c:when>
                                       <c:otherwise>
                                           <input type="text" ${cell.eventStr} class="uicTxtBox form-control ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} x ${cell.columnSpecifics.typeOfValidation} uicTxtBox_${tableId}_${colLoop.index}" name="${cell.columnSpecifics.columNoQrySeq}" value="${cell.cellContent}" id="uicTxtBox_${tableId}_${colLoop.index}_${rowLoopIndex}">
                                       </c:otherwise>
                                       </c:choose>
                                      </c:when>
									 <c:when test="${ cell.columnSpecifics.htmlElement eq 'fulldata' }">
                                         <span ${cell.eventStr} class="uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}"><c:out value="${cell.cellContent}"/></span>
                                      </c:when>
                                      <c:otherwise>
                                        <c:choose>
                                          <c:when test="${fn:length(cell.cellContent ) gt cell.columnSpecifics.charLength}">
                                            <span title="${cell.cellContent}" ${cell.eventStr} data-toggle="tooltip" class="uicTooltip uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}">
                                            	<c:out value="${ fn:substring(cell.cellContent , 0, cell.columnSpecifics.charLength) }..." />
                                            </span>
                                          </c:when>
                                          <c:otherwise>
                                            <span ${cell.eventStr} class="uicSpan ${tableId}_${cell.columnSpecifics.elementName}_${rowLoopIndex} uicSpan_${tableId}_${colLoop.index}"><c:out value="${cell.cellContent}"/></span>
                                          </c:otherwise>
                                        </c:choose>
                                      </c:otherwise>
                                    </c:choose>
                                  </c:when>
                                </c:choose>
                              </c:otherwise>
                            </c:choose>
                          </td>
                        </c:when>
                      </c:choose>
                      <c:if test="${ colLoop.last and not empty table.deleteUrl}">
                        <c:url var="deleteUrl" value="${ table.deleteUrl }?totalRecords=${page.totalRecords}&tableIds=${tableId}&order=${table.order}&column=${table.column}&searchFields=${searchFields}&searchValues=${searchValues}&page=${page.pageNo}&pageSize=${page.pageSize}${ identifierParams }"/>
                        <td class="uic_Delete_row">
	                       <span>
	                       <c:choose>
	                            <c:when test="${isDirtyValue eq 'I' or table.isDummy}">
	                             	<a class="uic_Delete" href="javascript:void(0);" onclick="javascript:deleteAddedRows(this)">
	                             		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	                             	</a>
	                            </c:when>
	                            <c:when test="${isDirtyValue eq 'N'}">
	                             	<a class="uic_Delete" href="javascript:void(0);" onclick="javascript:deleteRow(this,'<c:out value="${tableId}"/>','<c:out value="${deleteUrl}"/>','<c:out value="${table.containerId}"/>','<c:out value="${isScroll}"/>');">
	                             		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	                             	</a>
	                            </c:when>
                            </c:choose>
	                       </span>
                        </td>
                      </c:if>
                    </c:forEach>
                  </tr>
                </c:forEach>
                <c:if test="${ fn:containsIgnoreCase(table.totalPosition, 'bottom') }">
                  <jsp:include page="totalCalcuation.jsp">
                   	<jsp:param value="${tableId}" name="tableId"/>
                  </jsp:include>
                </c:if>
			</c:otherwise>
		</c:choose>

<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<div class="uic_whitebg col-lg-12" id="wrapper">
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
  <c:set var="isSubTable" value="${ table.isSubTable }" />
  <c:url value="/pageSearch.htm?totalRecords=${page.totalRecords}&tableIds=${tableId}" var="sortableURL" />
  <c:set var="isScroll" value="${ table.isScrollData }" />
	<c:set value="${table.componentCaption}" var="componentCaption"/>
	<c:set var="componentId" value="${tableId}" />
	<c:if test="${not empty componentCaption.caption or componentCaption.accordianFlag}">
	 <div class="uicComponentHdrPanel uicComponentHdrPanel_${componentId}">
		<div <c:if test="${not empty table.exportIconPosition and fn:containsIgnoreCase(table.exportIconPosition, 'topleft')}">style="padding-left: 25px;"</c:if> class="UicTblCaptionH2 ${componentCaption.captionCssClass}">
			<c:if test="${not empty table.exportIconPosition and fn:containsIgnoreCase(table.exportIconPosition, 'topleft')}">
		  		<c:if test="${not empty table.exportType}">
		        	<spring:message var="exportTitle" code="label.exportTableData"></spring:message>
			        <a title="${exportTitle}" class="uicToolTip uicLeftExport uicExport_${tableId}" style="float: left; left:0px; position: absolute; top: -2px;" href="javascript:void(0);" onclick="downloadTableExcel('<c:out value="${tableId}" />');">
			          <img class="${table.exportType}">
			        </a>
				</c:if>
			</c:if>
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
			<c:if test="${ table.columnShowHide and table.headerFlag }">
		   	<div id="showHideFuncDiv_${tableId}" class="col-lg-1 pull-right">
		        <span class="UicColMngr glyphicon glyphicon-list-alt" aria-hidden="true" onclick="$('#showHideColumns${tableId}').show();" title="Column Manager"></span>
		        <span style="position: relative; background: #ffffff;">
		          <div id="showHideColumns${tableId}" class="UicColumnDropdown overflow">
		            <div class="bg-info alert">
		              <span><b><spring:message code="label.selectColumns"/></b></span>
		              <span style="float: center;"><a href="javascript:void(0);" class="close right" title="Click to Close" onclick="$('#showHideColumns${tableId}').hide();">
		               <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
		              </span>
		            </div>
		           <div class="uicAlignShowHideColumns">
		            <c:if test="${not empty table.subTableUrl }">
		              <div class="checkbox">
			          <label>
			               <input type="checkbox" <c:if test="${table.expDspFlag}">checked="checked"</c:if> onclick="showHideColumns('-1','<c:out value="${tableId}"/>','-1', this)" />
			               <span class="cr"><i class="UicAlignOkIcon glyphicon glyphicon-ok"></i></span>
			               <spring:message code="label.expand"/>
			          </label>
			         </div>
		            </c:if>
		            <c:set var="showHideColumns" value="true" />
		            <c:forEach items="${table.headersMap}" var="entry" varStatus="loop">
		              <c:if test="${showHideColumns}">
		                <c:forEach items="${entry.value}" var="hdr" varStatus="inrLoop">
		                  <c:set var="showHideColumns" value="false" />
		                      <c:set var="columnName" value="${hdr.headerText}" />
	                      <c:if test="${ not empty columnName }">
		                     <div class="checkbox">
					          <label>
					            <input type="checkbox" name="showhide" <c:if test="${ hdr.displayFlag }">checked="checked"</c:if> id="showhide${hdr.superElmId}" 
		                       		onclick="showHideColumns('<c:out value="${hdr.columnNo}"/>','<c:out value="${tableId}"/>','<c:out value="${hdr.superElmId}"/>', this)">
					            <span class="cr"><i class="UicAlignOkIcon glyphicon glyphicon-ok"></i></span>
					            <c:out value="${columnName}" />
					          </label>
					         </div>
	                      </c:if>
		                  <c:set var="columnName" value="" />
		                </c:forEach>
		              </c:if>
		            </c:forEach>
		           </div>
		         </div>
		      </span>
		      <c:if test="${not empty table.exportIconPosition and fn:containsIgnoreCase(table.exportIconPosition, 'topright')}">
	  			<c:if test="${not empty table.exportType}">
		        	<spring:message var="exportTitle" code="label.exportTableData"></spring:message>
			        <a title="${exportTitle}" class="uicToolTip uicRightExport uicExport_${tableId}" style="float: right; right: 7.5em; position: absolute; top: -2px;"
			        href="javascript:void(0);" onclick="downloadTableExcel('<c:out value="${tableId}" />');">
			          <img class="${table.exportType}">
			        </a>
				</c:if>
 	 		 </c:if>
		   </div>
      	 </c:if>  
		</div>
	 </div>
	</c:if>
 <div id="dynamicTableContainer${ tableId }">
    <div id="wrapperDiv${ tableId }">
      <form name="editableTbl" action="saveTableContent.htm" method="post" autocomplete="off" id="editableTbl${ tableId }">
      <input type="hidden" name="tableIds" value="${ tableId }" id="tableId"/>
      <input type="hidden" name="page" id="page" value="${ page.pageNo }"/>
      <input type="hidden" name="pageSize${ tableId }" id="pageSize${ tableId }" value="${ page.pageSize }"/>
      <input type="hidden" name="totalRecords" id="totalRecords${ tableId }" value="${ page.totalRecords }"/>
      <input type="hidden" name="editableDataFlag" id="${ tableId }_editableDataFlag" value="${table.editableDataFlag}" />
      <div id="accordianMainDiv_${tableId}" class="expandCollapse uicComponentMainDataDiv_${componentId}">
      <div id="uicParentDiv_${tableId}" class="UicHideScroll UicHorzShowScroll <c:if test="${isScroll}">uicTableParentDiv_${tableId} UicScrollDiv row-fluid</c:if>">
        <table id="${tableId}" class="table fixTable_${tableId} table-striped uic_dynamictable clear ${table.tableCss}" cellspacing="0">
          <c:if test="${table.headerFlag}">
            <thead>
              <jsp:include page="headers.jsp">
                <jsp:param value="${tableId}" name="tableId" />
                <jsp:param value="${sortableURL}" name="sortableURL" />
              </jsp:include>
            </thead>
          </c:if>
			<!-- Copy Below Code to Scroll table. if done any change inside table tag  -->	
		 <tbody id="uicTableBody_${tableId}">
			<jsp:include page="tableBody.jsp">
                   	<jsp:param value="${tableId}" name="tableId"/>
					<jsp:param value="${sortableURL}" name="sortableURL" />
            </jsp:include>
		 </tbody>
           <!-- End of scroll  -->
        </table>
     </div>
	<div class="col-lg-12">
		<div class="row"> 
		   <c:if test="${not empty table.content[0] and isScroll eq false and page.totalRecords ne 0 }">
		    <div class="col-lg-12">
		      <div id="UicPaginationContainer">
		      
		      	<c:if test="${not empty table.exportIconPosition and fn:containsIgnoreCase(table.exportIconPosition, 'bottomleft')}">
			  		<c:if test="${not empty table.exportType}">
			        	<spring:message var="exportTitle" code="label.exportTableData"></spring:message>
				        <a title="${exportTitle}" class="uicToolTip uicExport uicExport_${tableId}" href="javascript:void(0);" onclick="downloadTableExcel('<c:out value="${tableId}" />');">
				          <img class="${table.exportType}">
				        </a>
					</c:if>
		 		 </c:if>
		      	<c:if test="${page.totalRecords ne 0}">
		       	  <c:url value="/pageSearch.htm?page=##&totalRecords=${ page.totalRecords }&order=${table.order}&column=${table.column}&tableIds=${ tableId }" var="pagableURL" />
		          <c:url value="/pageSearch.htm?totalRecords=${ page.totalRecords }&order=${table.order}&column=${table.column}&tableIds=${ tableId }" var="setPageSizebleURL" />
		          <input type="hidden" id="setPageSizebleURL${tableId}" value="${ setPageSizebleURL }" />
		          <rage:paginator tableId="${tableId}" containerId="${table.containerId}" dropDown="true" currPage="${page.pageNo}" totalPages="${page.totalPages}" uri="${pagableURL}" maxLinks="5" pageSize="${page.pageSize}" totalRecords="${page.totalRecords}" displyMsg="true"/>
	        	</c:if>
	        	<c:if test="${not empty table.exportIconPosition and fn:containsIgnoreCase(table.exportIconPosition, 'bottomright')}">
			  		<c:if test="${not empty table.exportType}">
			        	<spring:message var="exportTitle" code="label.exportTableData"></spring:message>
				        <a title="${exportTitle}" class="uicToolTip uicExport uicExport_${tableId}" href="javascript:void(0);" onclick="downloadTableExcel('<c:out value="${tableId}" />');">
				          <img class="${table.exportType}">
				        </a>
					</c:if>
		 		 </c:if>
		      </div>
		   </div>
		  </c:if>
		</div>
	</div>
 </div>
 <div id="scrollRowdiv${tableId}"></div>
 </form>
</div>
</div>
 <!-- button start here -->
 <c:if test="${not empty table.addRowLabel or not empty table.saveDataLabel or not empty table.undoDeleteLabel or table.buttonLst ne null}">
 <div class="col-lg-12">
 	 <div class="row" style="text-align: center;" id="uic_tableButtons_${componentId}">
	   
      <c:if test="${not empty table.addRowLabel}">
        <span>
         <input type="button" class="btn btn-primary UicBtnRightMargin" value="<c:out value="${table.addRowLabel}"/>" onclick="javascript:addRow('<c:out value="${tableId}"/>');">
        </span>
      </c:if>
      <c:if test="${not empty table.saveDataLabel}">
        <span>
         <input type="button" id="${tableId}_saveButton" disabled="disabled" class="btn btn-success UicBtnRightMargin" value="<c:out value="${table.saveDataLabel}"/>" 
         onclick="javascript:saveData('<c:out value="${tableId}" />');"/>
        </span>
      </c:if>
      <c:if test="${not empty table.undoDeleteLabel}">
        <span>
         <input type="button" id="${tableId}_undoDeleteButton" disabled="disabled" class="btn btn-danger UicBtnRightMargin" value="<c:out value="${table.undoDeleteLabel}"/>" 
         onclick="undoDelete('${tableId}')"/>
        </span>
      </c:if>
	  <c:if test="${ table.buttonLst ne null}">
        <c:forEach items="${table.buttonLst }" var="button" varStatus="buttonLoop">
        <c:choose>
        	<c:when test="${button.displayFlag eq false }">
				<c:set var="buttonStyle" value="display:none;" />
			</c:when>
			<c:otherwise>
				<c:set var="buttonStyle" value="" />
			</c:otherwise> 
		</c:choose>
        	<c:if test="${button.buttonLabel ne null}">
		         <button type="${button.buttonType}" class="btn btn-primary UicBtnRightMargin ${button.buttonCSS}" id="uicButton_${button.uniqueButtonId}" 
		          style="${buttonStyle}" ${button.eventDataStr}>
		        	<c:out value="${button.buttonLabel}"/>
		        </button>        	
        	</c:if>
        </c:forEach>
       </c:if>
    </div>
 </div>
</c:if>  
 <!-- button end here -->
	<h6 style="display: none; visibility: hidden; float: left; font-size: 0px; line-height: 0px;">
		<c:if test="${!isSubTable }">
		  <input type="hidden" id="parentTableId" value="${tableId}" />
		  <input type="hidden" id="addIndex_${tableId}" value="2" />
		</c:if>
		<input type="hidden" id="isDummy_${tableId}" value="${table.isDummy}" />
		<input type="hidden" id="totalPosition_${tableId}" value="${table.totalPosition}" />
		<input type="hidden" id="addedRows_${tableId}" value="0" />
		<input type="hidden" id="isDataEdited_${tableId}" value="N" />
		<input type="hidden" id="noDataFoundMsg_${tableId}" value='<spring:message code="label.noData"/>' />
	</h6>	
</div>
<script type="text/javascript">
var isSubtable = "${isSubTable}";
var isTableTranspose = "${table.isTableTranspose}";
if((isSubtable=='false' || isSubtable==false) && isTableTranspose=='false') {
	try{
		$(".fixTable_${tableId}").tableHeadFixer();	
	}catch(err){
		console.log("colResizable or tableHeadFixer or both function is undefined");		
	}
}
$(document).ready(function(){
    var id = "${tableId}_"+0;
    var isDummy = '${table.isDummy}';
    var isUpdatable = '${table.isUpdatable}';
    var isTableTranspose = '${table.isTableTranspose}';
    if(isTableTranspose=='true'){
    	callTableTranspose();
    }
    if(isDummy=='true' && isUpdatable=='true'){
      changeToEditableRowById(id);
      $("#isDirty_"+id).val('I');
      $("#row_"+id).attr('accesskey', 'in');
    }
     
 	if($('.AdminUITableLayout').length>0){ //Special handling for Admin UI. Calling post load css.
		applyPostLoadChanges("${tableId}");
	}
 	
 	try{
 		$(".UicColorPicker").colorpicker();
	}catch(err){
		console.log("colorpicker function is undefined");		
	}
 	
});

var tableId = "${param.tableId}";
if (tableId == null || tableId == ''){
 	tableId = "${tableId}";
}
changeEventHandler(tableId);

function callTableTranspose(){
	$("table").each(function() {
        var $this = $(this);
        var newrows = [];
        $this.find("tr").each(function(){
            var i = 0;
            $(this).find("th").each(function(){
                  i++;
                  if(newrows[i] === undefined) { newrows[i] = $("<tr></tr>"); }
                  newrows[i].append($(this));
              });
              
              $(this).find("td").each(function(){
                  i++;
                  if(newrows[i] === undefined) { newrows[i] = $("<tr></tr>"); }
                  newrows[i].append($(this));
              });
        });
        $this.find("tr").remove();
        $.each(newrows, function(){
            $this.append(this);
        });
    }); 
}
function changeEventHandler(tableId) {
	var tableContainerId = "#dynamicTableContainer" + tableId;
	$(tableContainerId).find(".uicTxtBox, .uicDropDown, .uicDate, .uicRadio, .uicChkBox, .uicMultiDropDown").change(function(e) {changeEventMethod(e, tableId);});
	//Using 'Onclicl' event for Color div. In case of 'Color', OnChange events on both the textBox and the colorPicker are associated with each other and we cannot be using them. 
	//Hence am using the covering div for event change.OnChange is not supported for Div, hence using Onclick. 
	$(tableContainerId).find(".colorDiv").click(function(e) {changeEventMethod(e, tableId);});
}
/**
 * This method holds logic for setting items for 'SAVE'/'UPDATE' functionality and enabeling the 'SAVE' Button.
 */
 function changeEventMethod(e, tableId){
	//	alert("HI:"+e);
	var colNrow = $(e.target).closest('tr').attr('tabindex');
	var isDirtyValue = $("#isDirty_"+tableId+"_"+colNrow).val(); 
	if(isDirtyValue != 'I')
	$("#isDirty_"+tableId+"_"+colNrow).val("Y");
	$("#isModified_"+tableId+"_"+colNrow).val("Y"); // Setting isModified Flag to keep track of edited rows.
	$("#isDataEdited_"+tableId).val("Y");
	$("#" + tableId + "_saveButton").removeAttr('disabled');
	$(e.target).closest('tr').addClass("editableRow"); // Adding editableRow class, so as to distinctly indentify editable rows.
	e.preventDefault();
}

try{
	getDataOnScroll(tableId);
}catch(err){
	console.log("Undefined or error in getDataScroll function");
}

try{
	initializeDateTimePicker("${tableId}", "Table");
}catch(err){
	console.log("Undefined or error in initializeDateTimePicker function");
}

try{
	$('[data-toggle="tooltip"]').tooltip();
}catch(err){
	console.log("Tooltip is not defined");
}

jQuery.browser = {};
 (function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
 })();
 
/*-------- For Scroll -------------*/
$(function(){
	var scroll = $('#uicParentDiv_'+tableId).css('height');
	var scrollHeight = 0;
	if(scroll != undefined && scroll != 'undefined' && scroll != null){
		scroll = scroll.replace('px','');
		scrollHeight = parseInt(scroll);
	}
    if(scrollHeight <= 280) {
    	$('#uicParentDiv_'+tableId).removeClass("UicShowScroll").addClass('UicHideScroll');	        	
    } else if(scroll >= 280){
    	$('#uicParentDiv_'+tableId).removeClass('UicHideScroll').addClass("UicShowScroll");
	}
    
    var horzScrl = $('#uicParentDiv_${tableId} .JCLRgrips').css('width');
    var scrollwidth = 0;
    if(horzScrl != undefined && horzScrl != 'undefined' && horzScrl != null){
    	horzScrl = horzScrl.replace('px','');
	}else{
		horzScrl = $('#uicParentDiv_${tableId} .CRC').css('width');
	}
    scrollwidth = parseInt(horzScrl);
   /*  alert(scrollwidth); */
    if(scrollwidth <= 1000) {
    	$('#uicParentDiv_'+tableId).removeClass("UicHorzHideScroll").addClass('UicHorzShowScroll');	        	
    } else if(scrollwidth >= 1000){
    	$('#uicParentDiv_'+tableId).removeClass('UicHorzShowScroll').addClass("UicHorzHideScroll");
	}    
});

</script>

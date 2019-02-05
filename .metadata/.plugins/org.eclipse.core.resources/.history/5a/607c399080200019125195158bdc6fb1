<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" type="text/css" href="css/contextMenuTab.css" />
<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
<link rel="stylesheet" type="text/css" href="css/commonCSS/rulesManagementStatement.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/rulesManagementStatement_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<style>
.btn-info {padding:3px 8px !important;}
</style>
<script type="text/javascript">
var contextPath="${pageContext.request.contextPath}";
$('#Status option:selected').remove();
$('#Status').append($('<option selected>', { value : '${currentStatus}' }).text('${currentStatus}'));
var industry="Normalized Template-"+'<c:out value='${templateIdIndustryName}'/>'; 
$("#selectedValueForNormalizedTemplateId").html(industry);
</script>
<c:if test="${sessionParserId eq '6' && (statementFormat eq 'Deposits' || statementFormat eq 'AccountSummary' || statementFormat eq 'AccountActivity')}">
<script type="text/javascript">
$('#customMappingId').show();
$('#residualMappingId').show();
</script>
</c:if>
<form name="customMappingForm" id="customMappingForm">
<input type="hidden" name="encryptedFillingId" value="<c:out value='${caseId}'/>"/>
<input type="hidden" name="section" id="section" value="<c:out value='${statementFormat}'/>"/>
<input type="hidden" name="columnCount" id="columnCount" value="${colCountLength}"/>
<input type="hidden" name="templateId" id="templateId" value="${templateId}"/>
<input type="hidden" name="caseId" id="caseId" value="${caseId}"/>
<input type="hidden" name="parserId" id="parserId" value="${parserId}"/>
<input type="hidden" name="currentStatus" id="currentStatus" value="${currentStatus}"/>
<input type="hidden" name="customerId" id="customerId" value="${customerId}"/>
<input type="hidden" name="wqId" id="wqId" value="${wqId}"/>
<input type="hidden" name="nonEnglishLabelFlag" id="nonEnglishLabelFlag" value="${nonEnglishLabelFlag}"/>
<c:set var="nonEnglishLabelFlagSet" value="${nonEnglishLabelFlag}" scope="page"></c:set>

<div class="modal fade" id="popUp1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
     <div class="modal-content">
       <div class="modal-header" style="padding:8px;">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         <h4 class="modal-title" id="myModalLabel" style="color:#005d95; font-size:14px; font-weight:bold;"><div id="popupheader" style="color:#005d95;">Custom Mapping</div></h4>
       </div>
       <div class="modal-body">       
       		<table id="popUpTable" width="100%" border="0" cellspacing="1" cellpadding="5" style="border-collapse: separate; border-spacing: 1px;" bgcolor="#ebebeb" class="tblstyle1">
			<tr>
				<td class="bg-blue"><label class="lbl-wht">As Reported Label</label></td>
				<td class="bg-blue"><label class="lbl-wht1">Normalized Label</label></td>
			</tr>
			<tr>
			<td width="50%"><input type="text" name="custMapAsRepLabel" id="custMapAsRepLabel" value="" class="wdt250"/></td>
			<td width="50%"><select name="custMapNormItem" id="custMapNormItem" class="customMapping" class="wdt250">
			 <option value="">Select</option>  
			<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
		 		<option value="${NormItemLabel.niItem}~${NormItemLabel.nilLabel}">${NormItemLabel.nilLabel}</option> 
			</c:forEach>
			</select>
			</td>
			</tr>
			<tr>
			<td><input type="text" name="custMapAsRepLabel" id="custMapAsRepLabel" value="" class="wdt250"/></td>
			<td><select name="custMapNormItem" id="custMapNormItem" class="customMapping" class="wdt250">
			 <option value="">Select</option>  
			<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
		 		<option value="${NormItemLabel.niItem}~${NormItemLabel.nilLabel}">${NormItemLabel.nilLabel}</option> 
			</c:forEach>
			</select>
			</td>
			</tr>
			<tr>
			<td><input type="text" name="custMapAsRepLabel" id="custMapAsRepLabel" value="" class="wdt250"/></td>
			<td><select name="custMapNormItem" id="custMapNormItem" class="customMapping" class="wdt250"">
			 <option value="">Select</option>  
			<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
		 		<option value="${NormItemLabel.niItem}~${NormItemLabel.nilLabel}">${NormItemLabel.nilLabel}</option> 
			</c:forEach>
			</select>
			</td>
			</tr>
			<!-- <tr>
			<td style="background:#fff"></td><td align="right" style="background:#fff"></td>
			</tr> -->
			</table>
			<div class="custom-map-btn"><input type="button" class="btn btn-info" name="custmap_button" id="custmap_button" value="Update" onclick="customMapping();"/></div>
       </div>           
     </div>
   </div>
 </div>
 </form>
 
 <!-- End pop up -->
 
 <div class="top-strip">
<a href="#" class="ft-right" id="col-manager"><i class="fa fa-columns custom-font pad5 cus-cls" data-toggle="tooltip" title="Column Manager"></i></a>
<div id="grpChkBox">
	<ul id="showlist" style="display:block">
	 <c:if test="${parserId ne '6' && parserId ne '7' && parserId ne '8' && parserId ne '10'}">
	 	<li><input type="checkbox" name="BU" />BU</li>
	 </c:if>
	  <c:if test="${parserId ne '8' && parserId ne '10'}">
	  	<li><input type="checkbox" name="NormalizedLabel" />Normalized Label</li>
	  </c:if>
	  <c:if test="${parserId eq '6' || parserId eq '7' }">
	  	<li><input type="checkbox" name="AccountNumber" />Account Number</li>
	  	<li><input type="checkbox" name="TimePeriod" />Time Period</li>
	  </c:if>
	  <c:if test="${parserId ne '6' && parserId ne '7' && parserId ne '8' && parserId ne '10'}">
	 	<li><input type="checkbox" name="SubSection" />Sub Section</li>
	 </c:if>
	 
	
	<li><input type="checkbox" name="Note" />Note</li>
  <c:forEach items="${colCountValue}" var="counter">
	<li><input type="checkbox" name="value${counter}" />Value${counter}</li>
  </c:forEach>
	
	
	</ul>
</div>
</div>
	
			<c:if test="${(parserId eq '6' || parserId eq '7')  && ((statementFormat eq 'CardFee') || (statementFormat eq 'CardSummary') || (statementFormat eq 'DepositDetail') || (statementFormat eq 'AccountSummary') || (statementFormat eq 'Deposits') || (statementFormat eq 'DailyBalances') || (statementFormat eq 'AccountActivity') || (statementFormat eq 'Withdrawals'))}">
					<input type="hidden" name="statementFormat" id="statementFormat" value="${statementFormat}"/>
					<div style="margin: 0px 0 18px 0;">
							<table width="" border="0" cellspacing="4" cellpadding="4">
								<tr>
									<td class="td-bg-new">Account No:</td>
									<td class="td-bg-new"><select name="accountNumber" class="form-control"
										id="accountNumber" style="padding:2px; margin: 0 5px 0 5px; color:#000; width:150px;" onchange="getTimePeriodAndCustodianName(this.value)">
										<option value="" selected="selected">All</option>
											<c:if test="${not empty accountNumbers}">
												<c:forEach items="${accountNumbers}" var="accountNumbers">
												<option value="${accountNumbers}" ${accountNumbers == selectedaccountNumbers ? 'selected="selected"' : ''} >${accountNumbers}</option>
												</c:forEach>
											</c:if>
									</select></td>
									<td class="td-bg-new">Time Period:</td>
									<td class="td-bg-new">
									<select name="timePeriod" id="timePeriod" class="custom-select form-control" style="margin: 0 5px 0 5px;">
										<option value="" selected="selected">All</option>
											<c:if test="${not empty timePeriod}">
												<c:forEach items="${timePeriod}" var="timePeriod">
													<option value="${timePeriod}" ${timePeriod == selectedtimePeriod ? 'selected="selected"' : ''} >${timePeriod}</option>
												</c:forEach>
											</c:if>
									</select></td>
									<td class="td-bg-new">Custodian Name:</td>
									<td class="td-bg-new">
									<select name="custodianName" id="custodianName" class="custom-select form-control" style="margin: 0 5px 0 5px;">
										<option value="" selected="selected">All</option>
											<c:if test="${not empty custodianName}">
												<c:forEach items="${custodianName}" var="custodianName">
												<option value="${custodianName}" ${custodianName == selectedcustodianName ? 'selected="selected"' : ''} >${custodianName}</option>
												</c:forEach>
											</c:if>
									</select></td>
									<td class="pad-lt12"><a href="#" class="btn btn-info" onclick="searchResult();"><i class="fa fa-search" data-toggle="tooltip" title="Search"></i></a></td>
								</tr>
							</table>
						</div>
</c:if> 
				
<div style="margin-bottom:10px;">
<form id="norm-form">
<input type="hidden" name="encryptedFillingId" value="<c:out value='${caseId}'/>"/>
<input type="hidden" name="statementType" value="<c:out value='${statementFormat}'/>"/>
<input type="hidden" name="encryptedWqId" value="<c:out value='${wqId}'/>"/>
<input type="hidden" name="searchype" id="searchTypeText" value="" />
<input type="hidden" name="documentStatus" id="documentStatus" value="${currentStatus}" />

<ul id="contextMenuAsRepLabel" class="dropdown-menu context-menu-lbl" role="menu"></ul>
<ul id="contextMenuUsername" class="dropdown-menu context-menu-lbl" role="menu"></ul>
<ul id="contextMenuVal1" class="dropdown-menu customdropdownclass context-menu-val" role="menu"></ul>
<div id="contextMenuValue" class="context-menu-value">
   	<ul>
   		<li>Add</li>
   		<li>Remove</li>
	</ul>
</div>   

<div class="mar-negi9" id="maindiv" style="position: relative;overflow:auto !important; top:-3px">
 <table  border="0" cellspacing="1" cellpadding="5"  style="margin-top:-1px; border-spacing:1px;" bgcolor="#ebebeb" id="myTable" class="tblstyle1 fancyTable">
 <thead>
 <tr class="throw">
    <th width="10px" bgcolor="#6dbcbf" class="chkbox"> <input type="checkbox" name="delPoIdCheckAll" id="headerPoIdCheckBox" value="" onclick="checkUncheckPoIds();" > </th>
    <!-- Hide SEQ column for Bank parser -->
    <c:choose>
      <c:when test="${parserId eq '6' || parserId eq '7' }">
      	<!-- <th align="center" class ="displayNone seq" style="width:10px !important;background:#6dbcbf !important; color:#666 !important;"><strong>SEQ</strong></th>-->
          <th width="38px" align="center" class="custom-blue-bg displayNone seq"><strong>SEQ</strong></th>
      </c:when>
      <c:otherwise>
        <!--  <th align="center" class="seq" style="width:10px !important; background:#6dbcbf !important; color:#666 !important" ><strong>SEQ</strong></th>-->
         <th width="38px" align="center" class="custom-blue-bg seq"><strong>SEQ</strong></th>
      </c:otherwise>
    </c:choose>
     <th width="326px" align="center" class="custom-blue-bg AsReportedLabel"><strong>As Reported Label</strong></th>
     <c:if test="${(nonEnglishLabelFlagSet eq 'Y')}">
     	 <th width="326px" align="center" class="custom-blue-bg NonEnglishLabel"><strong>Non English Label</strong></th>
     </c:if>
    
    <!-- Hide BU column for Bank parser and AP File parser(8)-->
    <c:choose>
    <c:when test="${parserId eq '6' || parserId eq '7' || parserId eq '8' || parserId eq '10'}">
    <th width="10px;" align="center" class="custom-blue-bg BU" style="display: none;"><strong>BU</strong></th>
    </c:when>
      <c:otherwise>
      <th width="10px" align="center" class="custom-blue-bg BU"><strong>BU</strong></th>
      </c:otherwise>
     </c:choose>
     
     <!-- Hide Normalized Label column for AP File parser(8)-->
    <c:choose>
    <c:when test="${parserId eq '8' || parserId eq '10'}">
    <th width="310px" align="center" class="custom-blue-bg NormalizedLabel" style="display: none; z-index:2"><strong>Normalized Label</strong></th>
    </c:when>
     <c:otherwise>
    <th width="310px" align="center" bgcolor="#006995" style="z-index:2" class="NormalizedLabel"><strong>Normalized Label</strong></th>
     </c:otherwise>
     </c:choose>
     
      <c:choose>
        <c:when test="${parserId eq '6' || parserId eq '7' }">
       <th width="120px" align="center" class="custom-blue-bg AccountNumber"><strong>Account Number</strong></th>
      <th width="200px" align="center" class="custom-blue-bg TimePeriod"><strong>Time Period</strong></th>
      
     <th width="15px" align="center" class="custom-blue-bg CustodianName" style="display: none;"><strong>Custodian Name</strong></th>
       </c:when>
        <c:when test="${parserId eq '8' || parserId eq '10'}">
           <th width="90px" align="center" class="custom-blue-bg SubSection" style="display: none;"><strong>Sub Section</strong></th>
        </c:when>
      <c:otherwise>
    <th width="90px" align="center" class="custom-blue-bg SubSection" ><strong>Sub Section</strong></th>
       </c:otherwise>
    </c:choose>
     <th width="15px" align="center" class="custom-blue-bg Note">Note</th>
    
	<c:if test="${parserId eq '5' }">
     <th width="10px" align="center" class="custom-blue-bg ST"><strong>ST</strong></th>
	</c:if>
  <!-- set dynamic header based on column count values -->
   <c:set var="valuesColumnCount" value="0" scope="page"/>
  <c:forEach items="${colCountValue}" var="counter">
  <c:set var="valuesColumnCount" value="${valuesColumnCount + 1}" scope="page"/>
    <th width="80px" align="center" class="custom-blue-bg Value${counter}" id="${counter}ColumnId"><strong>Value${counter}</strong></th>
  </c:forEach>
  </tr>
 </thead>
 <tbody>
 </tbody>
 <input type="hidden" name="valuesColumnCount" id="valuesColumnCount" value="${valuesColumnCount}"/>
</table>
</div>
</form>
</div>
  

<%--For disiplaying child po data starts --%>
<form id="child-norm-form">
<input type="hidden" name="encryptedFillingId" value="<c:out value='${caseId}'/>"/>
<input type="hidden" name="statementType" value="<c:out value='${statementFormat}'/>"/>
<input type="hidden" name="encryptedWqId" value="<c:out value='${wqId}'/>"/>
<input type="hidden" name="searchype" id="searchTypeText" value="" />
<input type="hidden" name="refPOID" id="refPOID" value="" />
<input type="hidden" name="childvaluesColumnCount" id="childvaluesColumnCount" value="${childColCount}"/>
<input type="hidden" name="documentStatus" id="documentStatus" value="${currentStatus}" />

<ul id="childContextMenuUsername" class="dropdown-menu" role="menu"  style="display: none;height: 200px;overflow: auto;"></ul>
<ul id="childContextMenuVal" class="dropdown-menu" role="menu"  style="display: none;"></ul>
<ul id="childContextMenuAsRepLabel" class="dropdown-menu" role="menu"  style="display: none;height: 200px;overflow: auto;"></ul>
<div id="normalizationPochild" class="modal fade" role="dialog" >
  <div class="modal-dialog modal-lg" style="width:99% !important;">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close emptyTable"  data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Notes section</h4>
      </div>
      <div class="modal-body">
  <div class="mar-top-negi16">
  <table width="100%" border="0" cellspacing="2" cellpadding="0" style="margin-bottom: 5px;">
  	<tr>
  		<td width="auto" align="right" valign="middle">
  			<c:if test="${sessionParserId eq '10'}">
				<a href="#"><img src="images/icon_ppt_48.png" width="37" height="37" alt="PPT" class="imgbtns" data-tooltip="PPT"></a>
			</c:if>
			<span class="pull-right">
			<a href="#"><i class="fa fa-save custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Save" onclick="submitchildForm()"></i></a>
			<a href="#"><i class="fa fa-plus custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Add Row" onclick="addRow('Y', 'N')"></i></a>   
			<a href="#"><i class="fa fa-retweet custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Add Duplicate Row" onclick="addRow('Y','D')"></i></a>
			<a href="#"><i class="fa fa-trash custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Delete" onClick="deleteRow('childPoId')"></i></a> 
 			<a href="#"><i class="fa fa-undo custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Undo" onclick="undoDeleteRow()"></i></a>
			</span>
		</td>
  	 </tr>
  </table>
  </div>
 <div style="height:297px; overflow:auto">
<table width="100%" border="0" cellspacing="1" cellpadding="5"  style="margin-top:-1px; border-spacing:1px;" bgcolor="#ebebeb" id="parserOutChildTable" class="tblstyle1 fancyTable">
 <thead>
 <tr class="throw">
    <th width="10px" bgcolor="#6dbcbf"> <input type="checkbox" name="delChildPoIdCheckAll" id="childHeaderPoIdCheckBox" value="" onclick="checkUncheckChildPoIds();" > </th>
    <!-- Hide SEQ column for Bank parser -->
    <c:choose>
      <c:when test="${parserId eq '6' || parserId eq '7' }">
   		   <th align="center" class = "displayNone" style="width:10px !important; background:#6dbcbf !important; color:#fff !important" style="display: none;"><strong>SEQ</strong></th>
      </c:when>
      <c:otherwise>
       		<th  align="center" style="width:10px !important; background:#6dbcbf !important; color:#fff !important" ><strong>SEQ</strong></th>
      </c:otherwise>
    </c:choose>
    <th width="326px" align="center" bgcolor="#006995"><strong>As Reported Label</strong></th>
    <c:if test="${(nonEnglishLabelFlag eq 'Y')}">
     		<th width="326px" align="center" bgcolor="#006995"><strong>Non English Label</strong></th>
	</c:if>
    <!-- Hide BU column for Bank parser and AP File parser(8)-->
    <c:choose>
	    <c:when test="${parserId eq '6' || parserId eq '7' || parserId eq '8' || parserId eq '10'}">
	    	<th width="10px" align="center" class="custom-blue-bg" style="display: none;"><strong>BU</strong></th>
	    </c:when>
	     <c:otherwise>
	      	<th width="10px" align="center" class="custom-blue-bg"><strong>BU</strong></th>
	    </c:otherwise>
     </c:choose>
     <!-- Hide Normalized Label column for AP File parser(8)-->
    <c:choose>
	    <c:when test="${parserId eq '8' || parserId eq '10'}">
	    	<th width="310px" align="center" class="custom-blue-bg" style="display: none; z-index:2"><strong>Normalized Label</strong></th>
	    </c:when>
	     <c:otherwise>
	    	<th width="310px" align="center" bgcolor="#006995" style="z-index:2"><strong>Normalized Label</strong></th>
	     </c:otherwise>
     </c:choose>
     <c:choose>
        <c:when test="${parserId eq '6' || parserId eq '7' }">
	       <th width="300px" align="center" class="custom-blue-bg"><strong>Account Number</strong></th>
	       <th width="300px" align="center" class="custom-blue-bg"><strong>Time Period</strong></th>
	  	   <th width="10px" align="center" class="custom-blue-bg" style="display: none;"><strong>Custodian Name</strong></th>
       </c:when>
       <c:when test="${parserId eq '8' || parserId eq '10'}">
           <th width="100px" align="center" class="custom-blue-bg" style="display: none;"><strong>Sub Section</strong></th>
       </c:when>
       <c:otherwise>
    	   <th width="100px" align="center" class="custom-blue-bg" ><strong>Sub Section</strong></th>
       </c:otherwise>
    </c:choose>

 	<c:if test="${parserId eq '5' }">
     <th width="10px" align="center" class="custom-blue-bg"><strong>ST</strong></th>
	</c:if>

	<c:set var="valuesColumnCount" value="0" scope="page"/>
		<c:forEach var="counter" begin="1" end="${childColCount}">
		<c:set var="valuesColumnCount" value="${valuesColumnCount + 1}" scope="page"/>
		<th width="80px" align="center" class="custom-blue-bg" id="${counter}ColumnId"><strong>Value${counter}</strong></th>
	</c:forEach>	

   <div id="contextMenuValue" style="display:none; position:relative; z-index:999;">
	 <ul class="dropdown-menu" role="menu">
	   <li>Add</li>
	   <li>Remove</li>
	 </ul>
  </div>
  </tr>
  </thead>
  <tbody>
  </tbody>
  </table>
 </div>    	
</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</form>
<%--End For disiplaying child po data starts --%>



<script>
$("#statementFormat").val('${statementFormat}');
var sCount=1;
var addIndex=0;
var pages = [];
var endCount=false;
var bankParser=false;
var updatedPoidsStr='';
var uFlag=0;
var addedNewPoidsStr='';
var addedIds='';

var searchDiv=0;
var accountNumber='';
var timePeriod='';
var custodianName='';

$(document).ready( function(){
	/* Start show hide column functionality */
	$('#grpChkBox').click(function(e){
	    e.stopPropagation();
	});
	$("#col-manager").click(function(e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $('#grpChkBox').hide();
	    $('#showlist').show();
	});
	$(document).click(function() {
		 $('#grpChkBox').hide();
	    $('#showlist').hide();
	}); 

	
	
	console.info("checkBoxArray="+checkBoxArray);
	$("#col-manager").click(function(){
		$("#grpChkBox").toggle();
		console.info("in col-manager click function");
	});

		var $chk = $("#grpChkBox input:checkbox");
		var $tbl = $("#myTable");
		$chk.prop('checked', true);
	
	
		$chk.click(function () {
		console.info("in col-manager in checkbox click function");
		
		var colToHide = $tbl.find("." + $(this).attr("name"));
		$(colToHide).toggle();
		var columnWidth=$("." + $(this).attr("name")).width();
		console.info("columnWidth="+columnWidth);
		var tableWidth;
		if ($(this).is(':checked')) {
		//here remove show column name from array
		checkBoxArray.splice(checkBoxArray.indexOf($(this).attr("name")), 1);
		console.info("TableWidth add="+$('#myTable').width());
		tableWidth=$('#myTable').width()+columnWidth;	 
		}else{
		//Here insert hide column name in array;
		checkBoxArray.push($(this).attr("name"));
		console.info("TableWidth minus="+$('#myTable').width());
		tableWidth=$('#myTable').width()-columnWidth;
		 }
		console.info("updated table width:"+tableWidth);
		$("#myTable").attr("width", tableWidth+"px");
		});
		
	/* End show hide column functionality */
		
	$("#myTable").tableHeadFixer();
	var columnCount = $('#columnCount').val();
	var nonEnglishLabelFlag =$('#nonEnglishLabelFlag').val(); 
	var length = 835;
	if(nonEnglishLabelFlag == 'Y')
		{
			length = 1080;
		}

	length = length + (columnCount * 80);
	
	if(checkBoxArray.length > 0){   
		for (var i = 0; i < checkBoxArray.length; i++)
		{
		 var columnWidth=$("." + checkBoxArray[i]).width();
		 length=length-columnWidth;
		}
	}
	var totalLength = length+'px';
	$("#myTable").attr("width", totalLength);
	
	$(".nav-tabs li").click(function(){
		$(".nav-tabs li").removeClass("active");
		$(this).addClass("active");
	});
	/* Here if exist accountnumber,timeperiod and custodian name means searchable filter for bank parser */
	if(parserId == 6 || parserId == 7){
	bankParser=true;
	searchDiv=0;
	searchDataByFilter(sCount,updatedPoidsStr,uFlag,addedNewPoidsStr,addedIds,searchDiv);
	}
	else{  
		calAjaxData(sCount,updatedPoidsStr,uFlag,addedNewPoidsStr,addedIds);	
	}
	
    (function ($, window) {
	    var menus = {};
	    $.fn.contextMenu = function (settings) {
	        var $menu = $(settings.menuSelector);
	        $menu.data("menuSelector", settings.menuSelector);
	        if ($menu.length === 0) return;
	        menus[settings.menuSelector] = {$menu: $menu, settings: settings};
	        //make sure menu closes on any click
	        $(document).click(function (e) {
	        	var element = e.target.id;
	        	
	        	if(!element.includes("search-criteria") && element !== 'niLableDropdown' && element!='chnageSignHeading' 
	        		&&  element!='scaleHeading'  && element!='mappingHeading' && !element.includes("changeScaleval") && !element.includes("changeScalechildval")){
	        		hideAll();
	        	}
	        });
	        
	        $(document).on("contextmenu", function (e) {
	            var $ul = $(e.target).closest("ul");
	            if ($ul.length === 0 || !$ul.data("menuSelector")) {
	            	
	                hideAll();
	            }
	        });
	        
	        $("#search-criteriaChild").on("keyup", function () {
	            var g = $(this).val().toLowerCase();
	            $(".menu").each(function () {
	                var s = $(this).text().toLowerCase();
	                $(this).closest('.menu')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
	            });
	        });
	        $("#search-criteria").on("keyup", function () {
	            var g = $(this).val().toLowerCase();
	            $(".menu").each(function () {
	                var s = $(this).text().toLowerCase();
	                $(this).closest('.menu')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
	            });
	        });
	        //AsRepLabel
	           $("#search-criteriaAsRepLabel").on("keyup", function () {
	            var g = $(this).val().toLowerCase();
	            $(".menu").each(function () {
	                var s = $(this).text().toLowerCase();
	                $(this).closest('.menu')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
	            });
	        }); 
	        
	         //ChildAsRepLabel
	          $("#search-criteriaChildAsRepLabel").on("keyup", function () {
	            var g = $(this).val().toLowerCase();
	            $(".menu").each(function () {
	                var s = $(this).text().toLowerCase();
	                $(this).closest('.menu')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
	            });
	        }); 
	        
	        $("#search-criteriavalmyTable").on("keyup", function () {
	            var g = $(this).val().toLowerCase();
	            $(".menu").each(function () {
	                var s = $(this).text().toLowerCase();
	                $(this).closest('.menu')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
	            });
	        });
	        
	        $("#search-criteriavalparserOutChildTable").on("keyup", function () {
	            var g = $(this).val().toLowerCase();
	            $(".menu").each(function () {
	                var s = $(this).text().toLowerCase();
	                $(this).closest('.menu')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
	            });
	        });
	        
	        // Open context menu
	        (function(element, menuSelector){
	            element.on("contextmenu", function (e) {
	                // return native menu if pressing control
	                if (e.ctrlKey) return;
	                hideAll();
	                var menu = getMenu(menuSelector);
	                //open menu
	                menu.$menu
	                .data("invokedOn", $(e.target))
	                .show()
	                .css({
	                    position: "absolute",
	                    left: getMenuPosition(e.clientX, 'width', 'scrollLeft'),
	                    top: getMenuPosition(e.clientY, 'height', 'scrollTop')
	                })
	                .off('click')
	                .on('click', 'a', function (e) {
	                    //menu.$menu.hide(); - commented  for test
	                    var $invokedOn = menu.$menu.data("invokedOn");
	                    var $selectedMenu = $(e.target);
	                    callOnMenuHide(menu);
	                    menu.settings.menuSelected.call(this, $invokedOn, $selectedMenu);
	                });
	                
	                callOnMenuShow(menu);
	                return false;
	            });
	        })($(this), settings.menuSelector);

	        function getMenu(menuSelector) {
	            var menu = null;
	            $.each( menus, function( i_menuSelector, i_menu ){
	                if (i_menuSelector == menuSelector) {
	                    menu = i_menu;
	                    return false;
	                }
	            });
	            return menu;
	        }
	        function hideAll() {
	            $.each( menus, function( menuSelector, menu ){
	                menu.$menu.hide();
	                callOnMenuHide(menu);
	            });
	        }
	        function callOnMenuShow(menu) {
	            var $invokedOn = menu.$menu.data("invokedOn");
	            if ($invokedOn && menu.settings.onMenuShow) {
	                menu.settings.onMenuShow.call(this, $invokedOn);
	            }
	        }
	        function callOnMenuHide(menu) {
	            var $invokedOn = menu.$menu.data("invokedOn");
	            menu.$menu.data("invokedOn", null);
	            if ($invokedOn && menu.settings.onMenuHide) {
	                menu.settings.onMenuHide.call(this, $invokedOn);
	            }
	        }
	        function getMenuPosition(mouse, direction, scrollDir) {
	            var win = $(window)[direction](),
	                scroll = $(window)[scrollDir](),
	                menu = $(settings.menuSelector)[direction](),
	                position = mouse + scroll;
	            if (mouse + menu > win && menu < mouse) {
	                position -= menu;
	            }
	            return position;
	        }    
			return this;
	    };
	    
	})(jQuery, window);	 
    
    
      //scrolling functionality 
   $("#maindiv").scroll(function(){
        var tblHeight = $("#myTable").height();
    	 var divScroll = $("#maindiv").scrollTop();
    	 var divheight = $("#maindiv").height();
    	 if((divScroll+2 >= tblHeight - divheight) && !endCount){
    		 var sVal=tblHeight - divheight;
  		   if(sVal<0){
			//if minus values no need to hit scroll
  	    	return false;	
  	    	}
    		         sCount=sCount+1;
    		         uFlag=0;
    				 $('table#myTable').block({message:"",});
    				if(bankParser){
    					searchDiv=1;
    					searchDataByFilter(sCount,updatedPoidsStr,uFlag,addedNewPoidsStr,addedIds,searchDiv);
    				}else{
    					 calAjaxData(sCount,updatedPoidsStr,uFlag,addedNewPoidsStr,addedIds);	
    				}
    	 }
    	});   
    	
    	
});

function callSubSectionDropDown(poId,subSection_val,operation){
	  
	  var subsection_dropdown ="";  
	  var selected = "";
	  var unSelected = "";
	  if(operation == "Addrow"){
		  subsection_dropdown  = '<select id='+poId+' name="addSubSection" class="changeValue form-control" style="width:100%; padding:4px"><option value="">--Select--</option>';  
	  }else  if(operation == "Updaterow"){
		 subsection_dropdown = '<select id='+poId+' name="updSubSection"  class="changeValue form-control" style="width:100%; padding:4px"><option value="">--Select--</option>';
	  }
	  
		<c:forEach items="${subSectionList}" var="subSection" varStatus="status">
			var currentLabel =  '${subSection}'.trim();
				if(currentLabel == subSection_val ){
					selected = selected+'<option selected = "selected" value="'+currentLabel+'">'+currentLabel+'</option>';
				}else{
					unSelected = unSelected+'<option value="'+currentLabel+'">'+currentLabel+'</option>';
				}
		</c:forEach>
		subsection_dropdown = subsection_dropdown+selected+unSelected+'</select>';
		
		return subsection_dropdown;
}

function callFunction(poId,normLable,operation,isChild,indexOrder,selectNiItemList)
{
	  var sel ="";  
	  
	  var selectNiItemListArray=[""]
	  if(selectNiItemList !== undefined){
		  if(selectNiItemList !== "" && selectNiItemList.indexOf(",") !== -1){
			  selectNiItemListArray =selectNiItemList.split(",");
		  }else{
			  selectNiItemListArray = [selectNiItemList];
		  }
	  }
	  
	  var selected = "";
	  var unSelected = "";
	  if(operation == "Addrow"){
		  sel = '<select id=selectedNiItem'+indexOrder+' name="addNormLable" class="custom-select newselect" multiple="multiple" ><option value=" ">--Select--</option>';  
	  }else  if(operation == "Updaterow"){
		 	sel = '<select id=selectedNiItem'+poId+' name="updNormLable" class="custom-select newselect" multiple="multiple" style="width:100%; padding:4px" ><option value=" ">--Select--</option>';
		 
	  }
		<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
				var currentLabel1 =  '<c:out value="${NormItemLabel.nilLabel}"/>';
				var currentNiItemVal =  '<c:out value="${NormItemLabel.niItem}"/>';
				var displayFormat='<c:out value="${NormItemLabel.displayFormat}"/>';
				var header='<c:out value="${NormItemLabel.header}"/>';
				var currentLabel = currentLabel1.replace(/&amp;/g, '&');
				currentLabel=currentLabel.replace(/&#039;/g,"'");
				//console.log(header + " ### ${NormItemLabel.nilLabel}");
				if(selectNiItemListArray.indexOf(currentNiItemVal)>-1 ){
					if(header=='A'){				
						selected = selected+"<option class='headerClass' id=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" selected = 'selected' value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" style='font-style:italic; background:#006995; color:#fff;' title=\"${NormItemLabel.nilLabel}\" >${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}</option>";
					}
					else if(displayFormat=='B'){				
						selected = selected+"<option class='boldClass' id=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" selected = 'selected' value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" style='font-style:italic; background:#006995; color:#fff;' title=\"${NormItemLabel.nilLabel}\" >${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}</option>";
					}
					else{
						selected = selected+"<option class='basicTextFont' id=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" selected = 'selected' value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" title=\"${NormItemLabel.nilLabel}\">${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}</option>";		
					}
				}else{
					if(header=='A'){				
						unSelected = unSelected+"<option class='headerClass' id=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" style='font-style:italic; background:#006995; color:#fff;' title=\"${NormItemLabel.nilLabel}\">${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}</option>";
					}
					else if(displayFormat=='B'){
						unSelected = unSelected+"<option class='boldClass' id=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" style='font-style:italic; background:#006995; color:#fff;' title=\"${NormItemLabel.nilLabel}\">${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}</option>";		
					}else{
						unSelected = unSelected+"<option class='basicTextFont' id=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\" title=\"${NormItemLabel.nilLabel}\">${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}</option>";
					}
				}
		</c:forEach>
		sel = sel+selected+unSelected+'</select>';
	
		return sel;
}


function restoreDrodownCheck(menuName) {
	$("#" + menuName).empty();
	$("#" + menuName).append('<span class="search-box"><input class="form-control search" id="search-criteria" type="text" placeholder="Search" autocomplete="off"/></span>');
	var niLableVal = "";
	var niItemVal = "";
	var nilSection = "";
	var header = "";
	var displayFormat = "";
	var niItemeLableValue = "";
	$("#" + menuName).append('<li><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="" value="-1">--Clear Mapping--</a></li>');
	<c:forEach items="${listOfNormItemLabelsbyTemplate}" var="NormItemLabel" varStatus="status">
	niLableVal = "${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}".replace('"','\"').replace("'", "\'");
	niItemeLableValue = "${NormItemLabel.nilLabel}".replace('"','\"').replace("'", "\'");
	niItemVal = "${NormItemLabel.niItem}";
	nilSection = "${NormItemLabel.nilSection}";
	header = "${NormItemLabel.header}";
	displayFormat = "${NormItemLabel.displayFormat}";
	if(header == 'A')
		{
		$("#" + menuName)
		.append(
		        '<li class="headerClass"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
						+ niItemeLableValue
						+ '" value="'
						+ niItemVal
						+ '~'
						+ niItemeLableValue
						+ '">'
						+ niLableVal
						+ '</a></li>');
		}
	else if(displayFormat == 'B')
		{
		$("#" + menuName)
		.append(
				'<li class="boldClass"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
						+ niItemeLableValue
						+ '" value="'
						+ niItemVal
						+ '~'
						+ niItemeLableValue
						+ '">'
						+ niLableVal
						+ '</a></li>');
		}
	else
		{
		
		$("#" + menuName)
		.append(
				'<li class="basicTextFont"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
						+ niItemeLableValue
						+ '" value="'
						+ niItemVal
						+ '~'
						+ niItemeLableValue
						+ '">'
						+ niLableVal
						+ '</a></li>');
		}
	</c:forEach>

}


function restoreDrodownChildCheck(menuName) {
	$("#" + menuName).empty();
	$("#" + menuName) .append(
					'<span class="search-box"><input class="form-control search" id="search-criteriaChild" type="text" placeholder="Search" autocomplete="off"/></span>');
	var niLableVal = "";
	var niItemVal = "";
	var nilSection = "";
	var niItemeLableValue = "";
	$("#" + menuName) .append(
					'<li><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="" value="-1">--Clear Mapping--</a></li>');
	<c:forEach items="${listOfNormItemLabelsbyTemplate}" var="NormItemLabel" varStatus="status">
	niLableVal = "${NormItemLabel.labelSection}: ${NormItemLabel.nilLabel}".replace('"','\"').replace("'", "\'");;
	niItemeLableValue = "${NormItemLabel.nilLabel}".replace('"','\"').replace("'", "\'");;
	niItemVal = "${NormItemLabel.niItem}";
	nilSection = "${NormItemLabel.nilSection}";
	header = "${NormItemLabel.header}";
	displayFormat = "${NormItemLabel.displayFormat}";
	if(header == 'A')
		{
		$("#" + menuName)
		.append(
				'<li class="headerClass"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
						+ niItemeLableValue
						+ '" value="'
						+ niItemVal
						+ '~'
						+ niItemeLableValue
						+ '">'
						+ niLableVal
						+ '</a></li>');
		}
	else if(displayFormat == 'B')
		{
		$("#" + menuName)
		.append(
				'<li class="boldClass"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
						+ niItemeLableValue
						+ '" value="'
						+ niItemVal
						+ '~'
						+ niItemeLableValue
						+ '">'
						+ niLableVal
						+ '</a></li>');
		}
	else
		{
		$("#" + menuName)
		.append(
				'<li class="basicTextFont"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
						+ niItemeLableValue
						+ '" value="'
						+ niItemVal
						+ '~'
						+ niItemeLableValue
						+ '">'
						+ niLableVal
						+ '</a></li>');
		}
	
	
	
	</c:forEach>
}


function restoreDrodown(valueToSelect, menuName, isArsPoMapping,arsPoMappingNiItem,tableName) 
{
	$("#" + menuName).empty();
	var containerHtmlStr = "<div  class='container' style='width:650px !important'><div class='row'><div class='col-md-12'><div class='panel with-nav-tabs panel-default'>";

	// preparing html for heading tabs
	var tabHeadingHtml = "<div class='panel-heading' style='background:none !important'>";
	tabHeadingHtml = tabHeadingHtml + "<ul class='nav nav-tabs'>";
	tabHeadingHtml = tabHeadingHtml
			+ "<li class='active'><a href='#tab1default' data-toggle='tab' id='mappingHeading' style='float:left'>Mapping</a></li>";
	tabHeadingHtml = tabHeadingHtml
			+ "<li ><a href='#tab2default' data-toggle='tab' id='chnageSignHeading' style='float:left; background:none !important'>Change Sign</a></li>";
	tabHeadingHtml = tabHeadingHtml
			+ "<li ><a href='#tab3default' data-toggle='tab' id='scaleHeading' style='float:left; background:none !important'>Scale</a></li>";
	tabHeadingHtml = tabHeadingHtml + "</ul></div>";

	// end of preparing html for heading tabs

	// Preparing pannel body Html String
	var pannelBodyStr = "<div class='panel-body' style='background:#f5f5f5 !important'><div class='tab-content'>"
	//preparing html for mapping tab 
	var niLableVal = "";
	var niItemVal = "";
	var labelSectioin = "";
	var poAsReLabel = '';
	var nilSection = "";
	var mappingHtml = "<div class='tab-pane fade in active' id='tab1default'>";

	var clearMappingDivStr = "<div  id='clearMapping' style='padding:0px 20px;'></div>";
	var searchSpanStr = "<span class='search-box'><input name ='Cellmappingsearchbox' class='form-control search' id='search-criteriaval"+tableName
			+ "' type='text' placeholder='Search' value='' onclick='resetValtoBlank();' autocomplete='off'/></span>";

	var listSize = "${fn:length(listOfNormItemLabelsbyTemplate)}";
	listSize = listSize - 1;
	var selectNiItemList = $("#niItemSuggstive" + selectedPoIDValue).val();

	var selectNiItemListArray = [ "" ];
	if (isArsPoMapping === "Y") {
		selectNiItemListArray = [ $.trim(arsPoMappingNiItem) ];
	} else {
		if (selectNiItemList !== undefined) {
			if (selectNiItemList !== "" && selectNiItemList.indexOf(",") !== -1) {
				selectNiItemListArray = $.map(selectNiItemList.split(","),$.trim);
			} else {
				selectNiItemListArray = [ $.trim(selectNiItemList) ];
			}
		}
	}

	var liListMenuStr = "<div  style='height: 200px; padding:0 0 0 11px; overflow: auto;'>";
	var selectedLiListMenuStr = "";
	var unSelectedLiListMenuStr = "";
	var displayFormat = "";
	var header="";
	<c:forEach items="${listOfNormItemLabelsbyTemplate}" var="NormItemLabel" varStatus="status">
	niLableVal = "${NormItemLabel.nilLabel}".replace('"','\"').replace("'", "\'");;
	niItemVal = "${NormItemLabel.niItem}";
	labelSectioin = "${NormItemLabel.labelSection}";
	nilSection = "${NormItemLabel.nilSection}";
	displayFormat="${NormItemLabel.displayFormat}";
	header="${NormItemLabel.header}";
	
	if (selectNiItemListArray.indexOf($.trim(niItemVal)) > -1 ) {		
		if(header=='A'){				
			selectedLiListMenuStr = selectedLiListMenuStr
			+ "<li class='headerClass'><div style='background: #89aeaf !important' class='selectedNiLables'><a  id='niLableDropdown' tabindex='-1' class='menu' data-toggle='tooltip' href='javascript:void(0)' title='"
			+ niLableVal + "' value='" + niItemVal + "~" + niLableVal
			+ "~" + nilSection + "'>" + labelSectioin + ": "
			+ niLableVal + "</a></dvi></li>";
		}
		else if(displayFormat=='B'){				
			selectedLiListMenuStr = selectedLiListMenuStr
			+ "<li class='boldClass'><div style='background: #89aeaf !important' class='selectedNiLables'><a  id='niLableDropdown' tabindex='-1' class='menu' data-toggle='tooltip' href='javascript:void(0)' title='"
			+ niLableVal + "' value='" + niItemVal + "~" + niLableVal
			+ "~" + nilSection + "'>" + labelSectioin + ": "
			+ niLableVal + "</a></dvi></li>";
		}
		else{
			selectedLiListMenuStr = selectedLiListMenuStr
			+ "<li class='basicTextFont'><div style='background: #89aeaf !important' class='selectedNiLables'><a  id='niLableDropdown' tabindex='-1' class='menu' data-toggle='tooltip' href='javascript:void(0)' title='"
			+ niLableVal + "' value='" + niItemVal + "~" + niLableVal
			+ "~" + nilSection + "'>" + labelSectioin + ": "
			+ niLableVal + "</a></dvi></li>";
		}
	} else {
		if(header=='A'){				
			unSelectedLiListMenuStr = unSelectedLiListMenuStr
			+ "<li class='headerClass'><a  id='niLableDropdown' tabindex='-1' class='menu' data-toggle='tooltip' href='javascript:void(0)' title='"
			+ niLableVal + "' value='" + niItemVal + "~" + niLableVal
			+ "~" + nilSection + "'>" + labelSectioin + ": "
			+ niLableVal + "</a></li>";
		}
		else if(displayFormat=='B'){				
			unSelectedLiListMenuStr = unSelectedLiListMenuStr
			+ "<li class='boldClass'><a  id='niLableDropdown' tabindex='-1' class='menu' data-toggle='tooltip' href='javascript:void(0)' title='"
			+ niLableVal + "' value='" + niItemVal + "~" + niLableVal
			+ "~" + nilSection + "'>" + labelSectioin + ": "
			+ niLableVal + "</a></li>";
		}
		else{
			unSelectedLiListMenuStr = unSelectedLiListMenuStr
			+ "<li class='basicTextFont'><a  id='niLableDropdown' tabindex='-1' class='menu' data-toggle='tooltip' href='javascript:void(0)' title='"
			+ niLableVal + "' value='" + niItemVal + "~" + niLableVal
			+ "~" + nilSection + "'>" + labelSectioin + ": "
			+ niLableVal + "</a></li>";		
		}					
	}

	</c:forEach>
	liListMenuStr = liListMenuStr + selectedLiListMenuStr + unSelectedLiListMenuStr + "</div>";
	var arsDivBuild = "<div id='ArsStatementYear"+valueToSelect+"'></div>";

	mappingHtml = mappingHtml + clearMappingDivStr + searchSpanStr + liListMenuStr + arsDivBuild + "</div>";

	//end of preparing html for mapping tab 

	//preparing html for change Sign tab 
	var changeSignHtmlStr = "<div class='tab-pane fade' id='tab2default'>";
	changeSignHtmlStr = changeSignHtmlStr
			+ "<div><span style='float:left'><input id='changeSign"
			+ valueToSelect
			+ "' type='radio' name='changeSign"
			+ valueToSelect
			+ "' value='positive'  onclick ='createOrUpdateSignPoMapping();'/><br><i class='glyphicon glyphicon-plus'></i></span>";
	changeSignHtmlStr = changeSignHtmlStr
			+ "<span style='float:left; padding:0 0 0 50px'><input id='changeSign"
			+ valueToSelect
			+ "' type='radio' name='changeSign"
			+ valueToSelect
			+ "' value='negetive'  onclick ='createOrUpdateSignPoMapping();'/><br><i class='glyphicon glyphicon-minus'></i></span></div></div>";

	//end of preparing html for change Sign tab 

	//preparing html for scale tab
	var scaleTabHtmlStr = "<div class='tab-pane fade' id='tab3default'>";
	scaleTabHtmlStr = scaleTabHtmlStr
			+ "<span style='float:left; width:150px; margin-bottom:150px'><select style='width:100%' class='form-control' id='changeScale"
			+ valueToSelect + "'  name = 'changeScale" + valueToSelect
			+ "' >";
	scaleTabHtmlStr = scaleTabHtmlStr + "<option value = '1'>Select</option>";
	<c:forEach items="${scaleCommandList}" var="scaleCommandObj" varStatus="status">
	scaleTabHtmlStr = scaleTabHtmlStr + "<option value='${scaleCommandObj.scaleVal}'>${scaleCommandObj.scaleName}</option>";
	</c:forEach>
	scaleTabHtmlStr = scaleTabHtmlStr
			+ "</select></span><span style='float:left; margin-left:10px'><button type='button' class='btn btn-primary' style='padding:5px!important; border-radius:2px !important' onclick ='createOrUpdateScaleChangePoMapping();'>Submit</button></span></div>";
	//end of preparing html for scale tab
	pannelBodyStr = pannelBodyStr + mappingHtml + changeSignHtmlStr+ scaleTabHtmlStr + "</div></div>";
	//end of Preparing pannel body Html String
	containerHtmlStr = containerHtmlStr + tabHeadingHtml + pannelBodyStr + "</div></div></div></div>";
	//end of Preparing container Html String
	$("#" + menuName).append(containerHtmlStr);

}


function prepareArsStatementRadio(valueToSelect, niLabelVal) {
	normItemLabelToMapping = "";
	var divBuild = "";
	normItemLabelToMapping = niLabelVal;
	var niLabelValArray = niLabelVal.split('~');
	var sectionName = "";
	if (niLabelValArray.length === 4) {
		sectionName = niLabelValArray[3];
	}
	<c:forEach items="${asRepStatementList}" var="asRepStatementObj" varStatus="status">
	divBuild = divBuild + "<div class='arsMappingDate'>"
	divBuild = divBuild
			+ "<div><input id='statementYearRadio"
			+ valueToSelect
			+ "' type='radio' name='statementYearRadio"
			+ valueToSelect
			+ "' value='${asRepStatementObj.arsId}'  onclick ='updateMappingCellData();'/></div>";

	divBuild = divBuild + "<div data-toggle='tooltip' title='${asRepStatementObj.arsAuditFlag}'>${asRepStatementObj.arsDateStr} </div>";
	divBuild = divBuild + "<div>${asRepStatementObj.arsPeriod} </div>";
	
	divBuild = divBuild + "</div>"
	</c:forEach>
	$("#ArsStatementYear" + valueToSelect).html(divBuild);
	$('[data-toggle="tooltip"]').tooltip();
  
}



function restoreDrodownCheckLabel(menuName) {
	$("#" + menuName).empty();
	console.log(menuName+" menuName");
	$("#" + menuName).append('<span class="search-box"><input class="form-control search" id="search-criteriaAsRepLabel" type="text" placeholder="Search" autocomplete="off"/></span>');
	var niLableVal = "";
	var labelPoid = "";
	var nilSection = "";
	var header = "";
	var displayFormat = "";
	var niItemeLableValue = "";
	$("#" + menuName).append('<li><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="" value="-1">--Select--</a></li>');
	var listOfAsRepLabelContextTxt=[${jsonAsRepLabelContextTxt}];
	$.each(listOfAsRepLabelContextTxt, function(index,value){
		niLableVal = value.asRepLabelContextTxtSection+": "+value.asRepLabelContextTxtAsRepLabelVal;
		niItemeLableValue = value.asRepLabelContextTxtAsRepLabelVal;
		nilSection = value.asRepLabelContextTxtSection;
		labelPoid= value.asRepLabelContextTxtPoid;
		$("#" + menuName).append(
				'<li class="headerClass"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
								+ niItemeLableValue
								+ '" value="'
								+ labelPoid
								+ '~'
								+ nilSection
								+ '">'
								+ niLableVal
								+ '</a></li>');	
	});
	
}

function restoreDrodownChildAsRepLabel(menuName) {
	
	console.log(menuName+" menuName");
	$("#" + menuName).append('<span class="search-box"><input class="form-control search" id="search-criteriaChildAsRepLabel" type="text" placeholder="Search" autocomplete="off"/></span>');
	var niLableVal = "";
	var labelPoid = "";
	var nilSection = "";
	var header = "";
	var displayFormat = "";
	var niItemeLableValue = "";
	$("#" + menuName).append('<li><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="" value="-1">--Select--</a></li>');
	var listOfAsRepLabelContextTxt=[${jsonAsRepLabelContextTxt}];
	$.each(listOfAsRepLabelContextTxt, function(index,value){
		niLableVal = value.asRepLabelContextTxtSection+": "+value.asRepLabelContextTxtAsRepLabelVal;
		niItemeLableValue = value.asRepLabelContextTxtAsRepLabelVal;
		nilSection = value.asRepLabelContextTxtSection;
		labelPoid= value.asRepLabelContextTxtPoid;
		$("#" + menuName).append(
				'<li class="headerClass"><a tabindex="-1" class="menu" data-toggle="tooltip" href="javascript:void(0)" title="'
								+ niItemeLableValue
								+ '" value="'
								+ labelPoid
								+ '~'
								+ nilSection
								+ '">'
								+ niLableVal
								+ '</a></li>');	
	});
		
	
}


</script>

 

<!-- below highperlink is used for other than PDF document -->
<a id = "otherDocument" href="" style="display: none" target="_blank" ></a>

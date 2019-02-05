<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/qamessages_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css">
<link rel="stylesheet" type="text/css" href="css/appCSS/media-query${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
 <link type="text/css" href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.blockUI.js"></script>
<script src="js/tableHeadFixer.js"></script>
<script type="text/javascript">
var filingId = "";
var filingIdStr = "";
var encryptedFilingId="";
var encryptedCustomerName="";
var encryptedBusinessName="";
var encryptedCustomerId="";
var encryptedFileName="";
var encryptedCompIdOrCik="";
var originalConvertedFileName="";
var contextPath="${pageContext.request.contextPath}";
var uploadId = "";
var mes="${message}";
var docType = "PDF";
var xCoordinate = "";
var yCoordinate = "";
var pageNo = "";
var caseId = "";
var encryptedCheckId="";
var qaCheckName="";
var qaCheckSection="";
var x2 = "";
var y1 = "";
$(document).ready(function() {
	$(".tbl-head-fix").tableHeadFixer();
	$(".close").click(function(){
		 $('#click_back_panel').remove();
		$("#QAChecksChildClickPopUpId").css("display", "none");
	});
   	$('.closeall').click(function(){
		$('.panel-collapse.in').collapse('hide');
		$('.normtxt1').addClass('collapsed');
	});
   	$('.normtxt1').click(function(){
   		$(this).addClass('collapsed');
   		$('.closeall').addClass('collapsed');
   		$('.panel-collapse.in').collapse('hide');
   	});
	$("#viewer1").html("");

	encryptedFilingId="${encryptedFilingId}";
	decreptedCheckId="${decreptedCheckId}";
	encryptedCheckId="${encryptedCheckId}";
	qaCheckName="${qaCheckName}";
	qaCheckSection="${qaCheckSection}";
	filingId = "${filingId}";
	filingIdStr = "${filingId}";
	encryptedWqId="${wqId}";
	encryptedCustomerName="${customerName}";
	encryptedBusinessName="${businessName}";
	encryptedCustomerId="${customerId}";
	encryptedFileName="${fileName}";
	encryptedCompIdOrCik="${compIdOrCik}";
	});
	
</script>
<style>
#pdfshow div.modal-dialog {width: 98% !important; margin-top:95px !important;}
.myTable tr th{color:#fff !important; font-weight:bold !important; background:#00AECF !important;}
.fade{padding-left:0px !important}
.txt-right{text-align:right !important}
.newtable1 tr td{border:1px solid #ccc}
.tblstyle1 th{text-align:left !important}
.chosen-container .chosen-results{max-height:150px;}
.chosen-container{width:334px !important}
.panel{margin-bottom:0px;}
 #showAdditionalQAChecksPopup{margin-top:65px !important}
 
 .top-strip{padding:1px;  margin:-10px 0 5px 0; position:relative; right:3px; z-index:1;} 
.coloumn-manager{margin: -9px 0 0 0; font-size: 18px; color: #fff;}
.qaMpChkBoxColManager{border:1px solid #ccc; background:#fafafa; width:200px; float:right; display:none; height: auto;max-height: 400px;overflow: auto; margin-top:-8px}
.qaMpChkBoxColManager ul{list-style:none; display:inline;}
.qaMpChkBoxColManager li{border-bottom:1px solid #ccc; padding:6px 0px 6px 6px; font-size:11px; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif; color:#444}
.ft-right{float:right} 
.tblstyle1 tr:nth-child(odd){background: #ffffff !important; font-size:11px}
.tblstyle1 tr:nth-child(even){background: #f1f1f1 !important; font-size:11px}

.newtable tr:nth-child(odd){background: #ffffff !important; font-size:11px}
.newtable tr:nth-child(even){background: #ffffff !important; font-size:11px}

#QACheckParserOutChildTableOnCheckId tr td{font-size:12px;}
.fade{padding-left:0px !important}
.txt-right{text-align:right !important; font-size:11px;}
.txt-left{text-align:left !important; font-size:11px;}
.newtable1 tr td{border:1px solid #eae9e9}
.chosen-container{font-size:11px !important}
/* .tblstyle th, .tblstyle1 th{text-align:left !important} */
.chosen-container .chosen-results{max-height:130px;}
	
.bs-example{margin: 20px;}
.tb-container{border:1px solid #ccc; border-top:0px; padding:10px; border-bottom-left-radius:5px; border-bottom-right-radius:5px;}
.data-table thead th{background:#6dbcbf; color:#fff; text-align:center; font-size:11px;}
.data-table tbody td{font-size:11px;}


@media  screen and (min-width: 1280px) {
#qachecks{height:915px; overflow:auto !important}	
#main{height:917px; overflow:auto !important}
#originalFileDiv{height:917px; overflow:auto !important}
} 

@media  screen and (min-width: 1360px) and (min-height: 637px){
#qachecks{height:500px !important; overflow:auto !important; padding-bottom:70px}	
#main{height:500px !important; overflow:auto !important; padding-bottom:70px}
#originalFileDiv{height:500px !important; overflow:auto !important; padding-bottom:70px}
.mapping-head{margin:2px 0 2px 0;}
.tbl-list-item{height:145px !important; overflow:auto !important}
}

@media  screen and (min-width: 1360px) and (min-height: 662px){
#qachecks{height:540px !important; overflow:auto !important; padding-bottom:75px}	
#main{height:540px !important; overflow:auto !important; padding-bottom:75px}
#originalFileDiv{height:540px !important; overflow:auto !important; padding-bottom:75px}
.mapping-head{margin:2px 0 2px 0;}
.tbl-list-item{height:174px !important; overflow:auto !important}
}

@media  screen and (min-width: 1920px) {
#qachecks{height:970px; overflow:auto !important}	
#main{height:970px; overflow:auto !important}
#originalFileDiv{height:970px; overflow:auto !important}
}
.table-bordered>thead>tr>th{background: #ccc !important; border: 1px solid #ccc !important; color: #333 !important; font-size: 11px !important;}
.accordion-toggle.collapsed > .fa-minus{display:none;}
.accordion-toggle > .fa-plus{display:none;}
.accordion-toggle.collapsed > .fa-plus{display:inline;}
.pad-rt5{padding-right:5px;}


.keyfinancial-head{
font-weight:bold; 
font-size:12px; 
color:#fff; padding:5px; 
background:#073262;
}
.mapping-head{
margin:2px 0 2px 0; 
font-weight:bold; 
font-size:12px; 
background:#073262;
padding:5px}
.txt-risk{font-size:21px; font-weight:bold; font-style:italic; color:#fff; padding-top:2px; margin-left:-10px}
.tbl-list-item{height:145px; overflow:auto}
#qachecks{height:500px !important; overflow:auto !important; padding-bottom:70px}	
#main{height:500px !important; overflow:auto !important; padding-bottom:70px}
#originalFileDiv{height:500px !important; overflow:auto !important; padding-bottom:70px}
a.qalblLinks{color:#900211; text-decoration:underline !important; font-weight:bold}
.customUnmapRow{background:#00bdf2 !important; color:#fff; border:1px solid #00bdf2; padding:5px; margin-bottom:1px}
select#displayRecordsQa{height:23px !important;}
</style>
	
 </head> 
<body>
<!-- start child pop up -->
<div class="modal fade in" id="QAChecksChildClickPopUpId" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document" style="margin-top:70px !important; width:100%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeButtonQAChecksChildClickPopUpId">×</button>
        <h4 class="modal-title" id="headerId">Click Back</h4>
      </div>
      <div class="modal-body">
       <!-- start search form -->
        <div class="btn-wrapper" style="margin:-8px 0 10px 0" id="QAChecksChildClickDivId">
     
      	</div>
     </div>
  </div>
</div>
  </div>
<!-- end child pop up -->
		<div class="container-fluid">
			<div class="tab-pane fade active in" id="displayQaChecks" style="margin-top:10px">
				<div id="qachecks" class="rmDiv">
				<div class="pull-left" style="margin-bottom:30px; width:100%">
				 <div class="keyfinancial-head" style="">Calculation Details of Key Financial Statement Line Items</div>
				 <div id="loadDiv">
				 <c:choose>
			     <c:when test="${not empty normValidationList}">
				 	<c:forEach var="normValidationList" items="${normValidationList}">
    				<div  id="load_${normValidationList.checkId}" class="empty" style="background:#00bdf2; color:#fff; font-size:12px !important; font-weight:bold !important; border:1px solid #00bdf2; padding:5px; margin-bottom:1px">
    				<a id="${normValidationList.checkId}" onclick="showQacheckSubTables(${normValidationList.checkId},'${encryptedFilingId}','${normValidationList.checkIdString}','${normValidationList.checkName}','${normValidationList.section}','${normValidationList.checkStatus}');"  data-toggle="collapse" data-parent="#accordion" href="#collapsedDiv${normValidationList.checkId}" style="font-size:12px; color:#fff !important;" class="accordion-toggle collapsed closeall">
					<span class="fa fa-minus pad-rt5"></span><span class="fa fa-plus pad-rt5"></span>${normValidationList.checkName} - ${normValidationList.checkStatus}</a> 
					<div class="top-strip">
					 <a href="#" class="ft-right coloumn-manager" id="col-manager${normValidationList.checkId}" onclick="javascript:showHideColMAnager(${normValidationList.checkId});"><i class="fa fa-columns"></i></a>
					<div id="qaMpChkBox${normValidationList.checkId}" class="qaMpChkBoxColManager">
						<ul>
						</ul>
					</div> 
					</div>
					</div>
    				<div>
				    <div id="collapsedDiv${normValidationList.checkId}" class="panel-collapse collapse">		
				      <div id="noDataFound${normValidationList.checkId}" style="display:none">No data found.</div>
				      <table id="popUpHeaderTable${normValidationList.checkId}" width="788px" border="0" cellspacing="1" cellpadding="5"   class="tblstyle1 table-bordered newtable mytable">
					 </table>
	 				<div style="height:10px;"></div>
	       				<div style="margin-top:-10px">
	       					<table id="popUpTable" width="788px" border="0" cellspacing="1" cellpadding="5"  class="tblstyle1 table-bordered newtable mytable">
	       						<thead id="popUpTableHeaderId" class=''></thead>
		   					</table>
		   				</div>
		   				<div id="afsCollapse${normValidationList.checkId}" class="panel-collapse collapse">
		   					<table id="tbleChildpopUpTableTableId${normValidationList.checkId}" width="788px" border="0" cellspacing="1" cellpadding="5" class="tblstyle1 table-bordered newtable">
		   						<tbody></tbody>
		   					</table>
		   				</div>
		   				<div style="margin:0 0 5px 0;">
		   					<table id="diffValueTableID${normValidationList.checkId}" width="788px" border="0" cellspacing="1" cellpadding="5"   class="table-bordered tblstyle1 newtable mytable">
	       					</table>
	       				</div>
	       					</div>
					</div>
    				</c:forEach>
			     </c:when>
			     <c:otherwise>
			     <div style="height:30px; overflow:auto; color:#000; font-size:12px; border:1px solid #ccc; padding:0px; border-width: 0px 1px 1px 1px; margin-bottom: 10px;">No data available.</div>
			     </c:otherwise>
			     </c:choose>
			     </div><!-- Load div -->
			    
			     <div>
	    		<c:choose>
				<c:when test="${not empty qaCheckList}">
				<div class="mapping-head">
					<a data-toggle="collapse" data-parent="#insideAccordionmap" href="#tblmapping" class="normtxt1 accordion-toggle collapsed" style="color:#fff !important">
					<span class="fa fa-minus pad-rt5"></span><span class="fa fa-plus pad-rt5"></span>Key Financial Statement Line Items</a>
				</div>
				<div id="tblmapping" class="panel-collapse collapse">
					<div class="tbl-list-item">
					<table width="60%" border="0" cellspacing="1" cellpadding="5" style="margin-top:-1px;" id="myTable" class="table-bordered tblstyle1 newtable mytable tbl-head-fix">
						<thead>
							<tr class="throw1">	
								<th class="empid" width="30%"><strong>Line Item Name</strong></th>
								<th class="fname" width="2%"><strong>Section</strong></th>
								<th class="email" width="2%"><strong>Success/Failure</strong></th>
							</tr>	
						
					</thead>
					<tbody>
						<c:forEach items="${qaCheckList}" var="qaCheckList">
							<tr class="poRow" >
								<td class="empid">${qaCheckList.linetItemLabel}</td>
								<td align="left" class="fname" nowrap="wrap">${qaCheckList.section}</td>
								<c:choose>
								  <c:when test="${not empty qaCheckList.checkStatus && qaCheckList.checkStatus eq 'Success'}">
								<td class="email">${qaCheckList.checkStatus}</td>
								</c:when>
								<c:otherwise>
								<td class="email"><a href="#"  onclick= "callNormalizationPageFromQACheckList('${encryptedFilingId}','${wqId}','${qaCheckList.section}','${customerName}','${businessName}','${customerId}','${fileName}','${compIdOrCik}');" >${qaCheckList.checkStatus}</a></td>
								</c:otherwise>
								</c:choose>
								
									
							</tr>
						</c:forEach>
					</tbody>			
				</table>
				</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="mapping-head normtxt1" class="normtxt1" style="color:#fff !important">
					Key Financial Statement Line Items
				</div>
	    		<div style="height:30px; overflow:auto; color:#000; font-size:12px; border:1px solid #ccc; padding:0px; border-width: 0px 1px 1px 1px;">Mandatory mapping validation's not available.</div>
	    	</c:otherwise>
		</c:choose>
				</div><!-- main-div -->
				
				
				<!--Start Statement ATTR Validation -->
				 <div>
	    		<c:choose>
				<c:when test="${not empty stmtAttrValidationList}">
				<div class="mapping-head">
					<a data-toggle="collapse" data-parent="#insideAccordionmap" href="#tblStmtAttrValDivId" class="normtxt1 accordion-toggle collapsed" style="color:#fff !important">
					<span class="fa fa-minus pad-rt5"></span><span class="fa fa-plus pad-rt5"></span>Other validation checks</a>
				</div>
				<div id="tblStmtAttrValDivId" class="panel-collapse collapse">
					<div class="tbl-list-item">
					<table width="60%" border="0" cellspacing="1" cellpadding="5" style="margin-top:-1px;" id="myTable" class="table-bordered tblstyle1 newtable mytable tbl-head-fix">
						<thead>
							<tr class="throw1">	
								<th class="empid" width="30%"><strong>Check Name</strong></th>
								<th class="fname" width="2%"><strong>Message</strong></th>
								<th class="email" width="2%"><strong>Section</strong></th>
								<th class="email" width="2%"><strong>Status</strong></th>
							</tr>	
						
					</thead>
					<tbody>
						<c:forEach items="${stmtAttrValidationList}" var="qaCheckListForStmtAttrVal">
							<tr class="poRow" >
								<td class="empid">${qaCheckListForStmtAttrVal.checkName}</td>
								<td align="left" class="fname" nowrap="wrap">${qaCheckListForStmtAttrVal.qaMessage}</td>
								<td align="left" class="fname" nowrap="wrap">${qaCheckListForStmtAttrVal.section}</td>
								<c:choose>
								  <c:when test="${not empty qaCheckListForStmtAttrVal.checkStatus && qaCheckListForStmtAttrVal.checkStatus eq 'Success'}">
								<td class="email">${qaCheckListForStmtAttrVal.checkStatus}</td>
								</c:when>
								<c:otherwise>
								<td class="email"><a href="#"  onclick= "callNormalizationPageFromQACheckList('${encryptedFilingId}','${wqId}','${qaCheckListForStmtAttrVal.section}','${customerName}','${businessName}','${customerId}','${fileName}','${compIdOrCik}');" >${qaCheckListForStmtAttrVal.checkStatus}</a></td>
								</c:otherwise>
								</c:choose>
								
									
							</tr>
						</c:forEach>
					</tbody>			
				</table>
				</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="mapping-head normtxt1" class="normtxt1" style="color:#fff !important">
					Other Validation Checks
				</div>
	    		<div style="height:30px; overflow:auto; color:#000; font-size:12px; border:1px solid #ccc; padding:0px; border-width: 0px 1px 1px 1px;">Other Validation Checks not available.</div>
	    	</c:otherwise>
		</c:choose>
				</div><!--End Statement ATTR Validation -->
				
				
				</div>		
	    	</div>
			</div><!-- displayQaChecks -->
			</div>
			
			
			<div id="normalizationPochild" class="modal fade in" role="dialog" style="z-index: 7 !important;">
				<div class="modal-dialog modal-lg" style="width:99% !important; margin-top:97px !important">
					 <div class="modal-content">
					<div class="modal-header">
				        <button type="button" class="close emptyTable" data-dismiss="modal">×</button>
				        <h4 class="modal-title">QA Checks</h4>
				      </div>
				            <div class="modal-body mb-custom-pad">
  
						 <div style="max-height:371px; overflow:hidden">
						 <span id="QACheckParserOutChildTableErrorMessage"></span>
						<table border="0" cellspacing="1" cellpadding="5"  style="margin-top:-1px; border-spacing:1px;" bgcolor="#ebebeb" id="QACheckParserOutChildTable" class="tblstyle1 fancyTable newtable newtable1">
						 <thead>
						 
						  </thead>
						  <tbody>
						
						  </tbody>
						  </table>
						 </div>
 <div class="bs-docs-example">
 <div  id="displayRecordsQaDiv" style="float:left; margin:20px 0 0 0; dispay:none">
        <select id="displayRecordsQa" style="padding:0px !important" class="form-control custom-input" onchange="changeDisplayQaRecords();" >
       	<option value='10' >10</option>
       	<option value='20'>20</option>
       	<option value='50'>50</option>
        </select>
 </div>
<div style="float:left; margin:0 0 0 10px"><p class="checkNamePopUpPagination"  data-step="18" data-intro="pagenation"></p></div>
<div style="float:left; margin:25px 0 0 10px" id="pageInfoQa" ></div>
<div><input type="hidden" name="totalRecordsQa" class="form-control" id="totalRecordsQa" value="0">
<input type="hidden" name="colCountValue" class="form-control" id="colCountValue" value="0">
<input type="hidden" name="checkIdQa" class="form-control" id="checkIdQa" value="0">
<input type="hidden" name="sectionQa" class="form-control" id="sectionQa" value="">
</div>	
</div>  	
     	
</div>
					 </div>
				</div>
			
			</div>
</body>
</body>
</html>
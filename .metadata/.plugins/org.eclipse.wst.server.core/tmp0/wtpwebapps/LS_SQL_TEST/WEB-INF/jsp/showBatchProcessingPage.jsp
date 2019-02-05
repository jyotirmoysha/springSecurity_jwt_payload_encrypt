<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="Expires" content="-1" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/commonCSS/custom-style.css" />
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
	<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="js/choosen/chosen.min.css">
	
	
	<script src="js/uic/jquery-2.1.1.min.js" ></script>
	<script src="js/jquery/jquery-migrate.min.js"></script>
	<script src="js/choosen/chosen.jquery.js"></script>
	<script src="js/tableHeadFixer.js"></script> 
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
<script src="js/common.js?value=${applicationScope['version']}"></script>

	<script>
	$(document).ready(function(){
		$("#myTable").tableHeadFixer();	
		$(".singleChosen").chosen({width: "265px"});
	});

	  function checkUncheckFilingIds(){
		if($('#headerFilingIdCheckBox').is(':checked')){
		 $('input:checkbox[name="filingIdCheckBox"]').prop('checked',true);
		}else{
		 $('input:checkbox[name="filingIdCheckBox"]').prop('checked',false);
		}
	 }


		function createExcelAndXmlDocument() {
			var checkElements = document
					.getElementsByName('transactionIdCheckBox');
			var len = $("[name='transactionIdCheckBox']:checked").length;
			var transIdArray = new Array();
			if (len) {
				for (var i = 0; checkElements[i]; ++i) {
					if (checkElements[i].checked) {
						var $this = $(checkElements[i]).val();
						transIdArray.push($this);
					}
				}
				var processData = "&transIdArray=" + transIdArray;
				actionUrl = "createXMLAndExcelDocument.htm";
				successData = function(data) {
					try {
						$.ajaxSetup({
							async : false,
							cache: true
						});
						$.alert(data);
						hideLoading();
					} catch (e) {
						hideLoading();
						$.alert("Error:" + e);
					}

				};
				showLoading();
				callAjax(processData, successData, errorData, beforeSend,
						actionUrl, reqType, retDataType);

			} else {
				$.alert('Please select Transaction Id CheckBox');
			}
		}
		
		function submitSearchForm(){
			var processData="";
			var transactionId=$('#transactionId').val();
			var status=$('#status').val();
			if(transactionId!='' || status!=''){
			 processData=$("#searchBatchProcessingForm").serialize();
			 showLoading();
			 actionUrl = "searchBatchProcessingResult.htm";
			 successData = function(data) {
				 $('#batchProcessingDataTable').html("");
				 $('#batchProcessingDataTable').html(data);
				 hideLoading();
					console.log(data);

			};	
			errorData=function(data)
			{
				hideLoading();
				
			};
			var retDataType = "html";
			callAjax(processData, successData, errorData, beforeSend, actionUrl,
					reqType, retDataType);
			 //$("#searchBatchProcessingForm").submit();	
			}else{
			 //$.alert("Please select Transaction Id or status");
			 setLocationHref('showBatchProcessing.htm')
			}
					
		}
		
		/* function submitSearchForm(){
			var transactionId=$('#transactionId').val();
			var status=$('#status').val();
			if(transactionId!='' && status!=''){
			 $("#searchBatchProcessingForm").submit();	
			}else{
			 $.alert("Please select Transaction Id and status");
			}
					
		} */
		function downloadExcelAndXmlDocument(transactionId){
			
	/* var checkElements = document.getElementsByName('transactionIdCheckBox');
	var len = $("[name='transactionIdCheckBox']:checked").length;
	var transIdArray = new Array();
	if (len) {
		for (var i = 0; checkElements[i]; ++i) {
			if (checkElements[i].checked) {
				var $this = $(checkElements[i]).val();
				transIdArray.push($this);
			}
		} */
		var processData = "&transIdArray="+transactionId;
		actionUrl = "isDocumentsExist.htm";
		successData = function(data) {
			try {
				result = JSON.parse(data);
				console.info("json result:"+result);
				 for (var prop in result) {
				        
				        if(result[prop]!='Y'){
				        	$.alert("For Transaction Id :"+prop+" Files are not exist !");
				        }else{
				   
				        location.href = "fileDownload.htm?fileName="+prop;
				        }
				  }
				$.ajaxSetup({
					async : false,
					cache: true
				});
				
				hideLoading();
			} catch (e) {
				hideLoading();
				$.alert("Error:" + e);
			}

		};
		showLoading();
		callAjax(processData, successData, errorData, beforeSend,
				actionUrl, reqType, retDataType);

	} 		
	</script>
	<style>
	/* Batch Process Style */
body{overflow:hidden !important}	
.fancyTable{width:100%; border:1px solid #ccc}
.fancyTable thead th{background:#6dbcbf; padding:6px !important; border-right:1px solid #fff; font-family:Helvetica Neue, Helvetica, Arial, sans-serif !important; font-size:11px; font-weight:bold; color:#fff; }
.fancyTable tr td{color:#333 !important; font-size:11px; padding:5px !important; border-right:1px solid #fff;}
.fancyTable tr:nth-child(even) {background: #F4F4F4 !important}
.fancyTable tr:nth-child(odd) {background: #fff !important}
.chosen-container-active.chosen-with-drop .chosen-single {
border: 1px solid #ccc !important;
background: #fff !important;
border-radius:0px !important;
padding:0 0 5px 4px !important;
}

.chosen-container-single .chosen-single{
border: 1px solid #ccc !important;
background: #fff !important;
border-radius:0px !important;
padding:0 0 5px 4px !important;
}
.col-md-3, .col-md-12{padding-left:0px !important}

.chosen-container-single .chosen-single { height: 30px; }
span{margin-top:3px;}
</style>	
</head>
		
		<section style="padding-top:110px !important;">

			<div class="container-fluid rmDiv" style="margin:0 30px 0 30px !important">
			<div class="row">
			<%-- <form name="searchBatchProcessingForm" id="searchBatchProcessingForm" method="POST" action="searchBatchProcessingResult.htm"> --%>
			<form name="searchBatchProcessingForm" id="searchBatchProcessingForm" method="POST" >
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body custom-padding">
					<span class="pull-left mar-lt10 mar-rt5"><label for="firstname" class="pad-top6">Transaction ID</label></span>
					<span class="pull-left mar-rt5">
					<select  tabindex="2" id="transactionId" name="transactionId" class="singleChosen form-control" style="width:271px; !important">
			          <option value="">All</option>
			         <c:forEach items="${distinctTransIds}" var="distinctTransIds" varStatus="status">
					  <option value="${distinctTransIds}" ${distinctTransIds == selectedtransactionId ? 'selected="selected"' : ''} >${distinctTransIds}</option>
					  </c:forEach>
			         </select>
					</span>
					
					<span class="pull-left mar-lt10 mar-rt5"><label for="firstname" class="pad-top6">Status</label></span>
					<span class="pull-left mar-rt5">
						<select class="form-control" name="status" id="status">
	                        <option value="">Select</option>
	                        <c:forEach items="${statusList}" var="statusObj" >
	                        <option value="${statusObj.statusName}" ${statusObj.statusName == selectedstatus ? 'selected="selected"' : ''} >${statusObj.statusName}</option>
							</c:forEach>
	                     </select>
					</span>
					
						<span class="dropdown pull-right">
						<button type="button" class="btn btn-info" style="border-radius:3px; padding:5px 9px 7px 9px!important" onclick="submitSearchForm();">Search</button>
						<c:if test="${userAccess eq '1' || userAccess eq '2'}">
						<button type="button" class="btn btn-info" style="border-radius:3px; padding:5px 9px 7px 9px!important" onclick="createExcelAndXmlDocument();">Create Document</button>
						</c:if>
						<!-- <button type="button" class="btn btn-primary" style="border-radius:3px; padding:5px 9px 7px 9px!important"onclick="downloadExcelAndXmlDocument();">Download Document</button> -->
						<button type="button" class="btn btn-info" style="border-radius:3px; padding:5px 9px 7px 9px!important" onclick="setLocationHref('showBatchProcessing.htm')">Refresh</button>
						</span>	
						
					</div>
					</div>
					 
				</div>
			</form>
			
			

			<div class="clearfix"></div>
			<div class="col-md-12">
			<div style="height:404px; overflow:auto">
			<div id="batchProcessingDataTable">
				<table class="table newTable fancyTable datatable-new" id="myTable">
					<thead>
						<tr>
							<th width="1%" bgcolor="#6dbcbf">
							<!--  <input type="checkbox" name="headerPoIdCheckBox" id="headerPoIdCheckBox" value="" onclick="checkUncheckFilingIds();" > -->
						    </th>
							<th>Transaction ID</th>
							<th>Case ID</th>
							<th>Creation Date</th>
							<th>Company</th>
							<th>Stmt Period</th>
							<th>Stmt Month&Year</th>
							<th>Source</th>
							<th>Document Status</th>
							<th>Download Status</th>
							<th>Locked By</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="transactionIdTemp" scope="session" value="${0}"/>
						<c:forEach items="${workQueueList}" var="workQueueObj" varStatus="loop">
						<tr>
						  <c:choose>
						   <c:when test="${workQueueObj.transactionId ne transactionIdTemp}">
						   <td align="center"><input type="checkbox" id="transactionIdCheckBox" name="transactionIdCheckBox" value="${workQueueObj.transactionId}"/></td>
						   <td>${workQueueObj.transactionId}</td>
						   </c:when>
						   <c:otherwise>
						   <td></td>
						   <td></td>
						   </c:otherwise>
						   	</c:choose>
							<td>${workQueueObj.filingId}</td>
							<td>${workQueueObj.createDate}</td>
							<td>${workQueueObj.industryName}</td>
							<td>${workQueueObj.wqPeriod}</td>
							<td>${workQueueObj.wqMonthYear}</td>
							<td>${workQueueObj.wqParserDescription}</td>
							<td>${workQueueObj.wqStatus}</td>
							<c:choose>
						   <c:when test="${workQueueObj.transactionId ne transactionIdTemp}">
						   <c:choose>
						   <c:when test="${workQueueObj.downloadStatus eq 'Doc Creation Completed'}">
						   <td><a href="javascript:void(0)" onclick="downloadExcelAndXmlDocument(${workQueueObj.transactionId});">${workQueueObj.downloadStatus}</a></td>
						   </c:when>
						   <c:otherwise>
						   <td>${workQueueObj.downloadStatus}</td>
						   </c:otherwise>
						   </c:choose>
						   </c:when>
						   <c:otherwise>
						   <td></td>
						   </c:otherwise>
						   </c:choose>
							<td>${workQueueObj.lockedBy}</td>
							</tr>
						<c:set var="transactionIdTemp" scope="session" value="${workQueueObj.transactionId}"/>
						</c:forEach>
					</tbody>
				</table>
				</div>
				</div>
				
				<div class="col-md-12 text-center">
				
			</div>
				
				</div><!-- col-md-12 -->
			</div>
			</div>
		</section>
		<footer>
			<div class="footer_wpr main-doc-width main_min_width"> <jsp:include page="footer.jsp" ></jsp:include></div>
		</footer>
		<div id="loadinglayer"></div>
</body>




</html>

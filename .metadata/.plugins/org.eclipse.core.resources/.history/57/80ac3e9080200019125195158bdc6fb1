
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/upload-template-media-query_${applicationScope['cssType']}.css?value=${applicationScope['version']}".css" /> 
<link rel="stylesheet" type="text/css" href="js/choosen/chosen.css" /> 
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/choosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/tableHeadFixer.js"></script> 
<script src="js/jquery-confirm.min.js" ></script>
	
<script type="text/javascript">
var resultdata=[];
$(document).ready( function(){
	$('[data-toggle="tooltip"]').tooltip(); 
	 $(".singleChosen").chosen({width: "265px"});
	$("#myTable").tableHeadFixer(); 
	
	console.info("clickedButton="+"${clickedButton}"); 
	
	if("${clickedButton}"==''){
	$("#dealerTemplateDivId").hide();
	$("#btnback").hide();
	$("#DealerTable").hide();
	$("#btn-wrap").hide();
	
	$("#btnTab").show();	
	$(".DownloadDiv").show();
	$(".UploadDiv").show();
	}else{
	$("#btnTab").hide();	
	$(".DownloadDiv").hide();
	$(".UploadDiv").hide();
	$("#dealerTemplateDivId").show();
	$("#btnback").show();
	$("#DealerTable").show();
	$(".btn-wrap").show();
	}
	
	$("#btnTab").click(function(){
	$("#btnTab").hide();	
	$(".DownloadDiv").hide();
	$(".UploadDiv").hide();
	$("#dealerTemplateDivId").show();
	$("#btnback").show();
	});
	
	
	$("#btnback").click(function(){
	$("#dealerTemplateDivId").hide();
	$("#DealerTable").hide();
	$(".btn-wrap").hide();
	$("#btnback").hide();
	$("#btnTab").show();	
	$(".DownloadDiv").show();
	$(".UploadDiv").show();
	});
	
	if("${submitFlag}"=='true'){
		$("#btnTab").hide();	
		$(".DownloadDiv").hide();
		$(".UploadDiv").hide();
		$("#dealerTemplateDivId").show();
		$("#btnback").show();
		$("#DealerTable").hide();
		$(".btn-wrap").hide();
	}
	

$('#companyName').autocomplete({
minLength: 1,
source: getCompanyData,
select:function(event,ui){
var selectedCompany = $.trim(ui.item.label);
$.each(resultdata, function(k, v) {
	if(selectedCompany===v){
	$('#companyId').val(k);		
	}
});
}
});

$('#companyNameToExport').autocomplete({
	minLength: 1,
	source: getCompanyDataByCompanyName,
	select:function(event,ui){
	var selectedCompany = $.trim(ui.item.label);
	var resultVal=[];
	$.each(resultdata, function(k, v) {
		if(selectedCompany===k){
			resultVal=v.split("~");
			if((resultVal!=null && resultVal!=undefined && resultVal!="undefined") && resultVal.length==2){
				$('#eIdToExport').val(resultVal[1]);	
				$('#companyIdToExport').val(resultVal[0]);
			}else{
				$('#eIdToExport').val("");	
				$('#companyIdToExport').val("");
			}
			
		}
	});
	}
	});
	
$('#companyIdToExport').autocomplete({
	minLength: 1,
	source: getCompanyDataByCompanyId,
	select:function(event,ui){
	var selectedCompany = $.trim(ui.item.label);
	var resultVal=[];
	$.each(resultdata, function(k, v) {
		if(selectedCompany===k){
			resultVal=v.split("~");
			if((resultVal!=null && resultVal!=undefined && resultVal!="undefined") && resultVal.length==2){
				$('#eIdToExport').val(resultVal[1]);	
				$('#companyNameToExport').val(resultVal[0]);
			}else{
				$('#eIdToExport').val("");	
				$('#companyNameToExport').val("");
			}
		}
	});
	}
	});

$('#companyNameToExportExtraction').autocomplete({
	minLength: 1,
	source: getCompanyDataByCompanyNameForExtract,
	select:function(event,ui){
	var selectedCompany = $.trim(ui.item.label);
	var resultVal=[];
	$.each(resultdata, function(k, v) {
		if(selectedCompany===k){
			resultVal=v.split("~");
			if((resultVal!=null && resultVal!=undefined && resultVal!="undefined") && resultVal.length==2){
				$('#eIdToExportExtraction').val(resultVal[1]);	
				$('#companyIdToExportExtraction').val(resultVal[0]);
			}else{
				$('#eIdToExportExtraction').val("");	
				$('#companyIdToExportExtraction').val("");
			}
			
		}
	});
	}
	});
	
$('#companyIdToExportExtraction').autocomplete({
	minLength: 1,
	source: getCompanyDataByCompanyIdForExtract,
	select:function(event,ui){
	var selectedCompany = $.trim(ui.item.label);
	var resultVal=[];
	$.each(resultdata, function(k, v) {
		if(selectedCompany===k){
			resultVal=v.split("~");
			if((resultVal!=null && resultVal!=undefined && resultVal!="undefined") && resultVal.length==2){
				$('#eIdToExportExtraction').val(resultVal[1]);	
				$('#companyNameToExportExtraction').val(resultVal[0]);
			}else{
				$('#eIdToExportExtraction').val("");	
				$('#companyNameToExportExtraction').val("");
			}
		}
	});
	}
	});


});




function resetCompanyInfo(){
	$('#companyNameToExport').val("");
	$('#companyIdToExport').val("");
	$('#eIdToExport').val("");
}

function resetCompanyInfoForExtraction(){
	$('#companyNameToExportExtraction').val("");
	$('#companyIdToExportExtraction').val("");
	$('#eIdToExportExtraction').val("");
}

function resetFinanceItemFilter(){
	$('#companyNameToExport').val("");
	$('#companyIdToExport').val("");
	$('#eIdToExport').val("");
	$('#startDateToExport').val("");
	$('#endDateToExport').val("");
}

function resetExtractionFilter(){
	$('#companyNameToExportExtraction').val("");
	$('#companyIdToExportExtraction').val("");
	$('#eIdToExportExtraction').val("");
	$('#startDateToExportExtraction').val("");
	$('#endDateToExportExtraction').val("");
}

function setCompanyNameOnFocusOut(searchType){
	var selectedCompanyId=$("#companyIdToExport").val();
	var resultVal=[];
	$.ajax({
		type: 'GET',
		url: 'companyIdForFItems.htm',
		dataType: "json",
		async:false,
		cache: true,
		data: {companyIdToExport : $("#companyIdToExport").val(),autoCompleteflag :"N"},
		success: function(data){
			if (data != null){  
				var resultJSON=JSON.stringify(data);
				resultdata = $.parseJSON(resultJSON);
				$.each(resultdata, function(k, v) {
					if(selectedCompanyId==k){
						resultVal=v.split("~");
						if((resultVal!=null && resultVal!=undefined && resultVal!="undefined") && resultVal.length==2){
							if(searchType == "fITem"){
								$('#eIdToExport').val(resultVal[1]);	
								$('#companyNameToExport').val(resultVal[0]);
							}else{
								$('#eIdToExportExtraction').val(resultVal[1]);	
								$('#companyNameToExportExtraction').val(resultVal[0]);
							}
							
						}else{
							if(searchType == "fITem"){
								$('#eIdToExport').val("");	
								$('#companyNameToExport').val("");
							}else{
								$('#eIdToExportExtraction').val("");	
								$('#companyNameToExportExtraction').val("");
							}
							
						}
					}
			   
				});
			}
		}
	});
}
function setCompanyIDOnFocusOut(searchType){
	var selectedCompanyName=$("#companyNameToExport").val();
	var resultVal=[];
	$.ajax({
		type: 'GET',
		url: 'companyNameForFItems.htm',
		dataType: "json",
		async:false,
		cache: true,
		data: {companyNameToExport : $("#companyNameToExport").val(),autoCompleteflag :"N"},
		success: function(data){
			if (data != null){  
				var resultJSON=JSON.stringify(data);
				resultdata = $.parseJSON(resultJSON);
				$.each(resultdata, function(k, v) {
					if(selectedCompanyName==k){
						resultVal=v.split("~");
						if((resultVal!=null && resultVal!=undefined && resultVal!="undefined") && resultVal.length==2){
							if(searchType == "fITem"){
								$('#eIdToExport').val(resultVal[1]);	
								$('#companyIdToExport').val(resultVal[0]);
							}else{
								$('#eIdToExportExtraction').val(resultVal[1]);	
								$('#companyIdToExportExtraction').val(resultVal[0]);
							}
							
						}else{
							if(searchType == "fITem"){
								$('#eIdToExport').val("");	
								$('#companyIdToExport').val("");
							}else{
								$('#eIdToExportExtraction').val("");	
								$('#companyIdToExportExtraction').val("");
							}
							
						}
					}
				});
			}
		
		}
	});
	
}
function getCompanyDataByCompanyName(request, response)
{
	$('#startDateToExport').val("");
	$('#endDateToExport').val("");
	$('#eIdToExport').val("");
	console.log($("#companyNameToExport").val());
	var resultsArray=[];
	console.info("in getCompanyDataByCompanyName function ");
	var resultsArray =[];
	$.ajax({
		type: 'GET',
		url: 'companyNameForFItems.htm',
		dataType: "json",
		async:false,
		cache: true,
		data: {companyNameToExport : $("#companyNameToExport").val(),autoCompleteflag :"Y"},
		success: function(data){
		if (data != null){  
		var resultJSON=JSON.stringify(data);
		resultdata = $.parseJSON(resultJSON);
		$.each(resultdata, function(k, v) {
		   resultsArray.push(k);
		});
		}
		response(resultsArray);
		}
	});
	
}


function getCompanyDataByCompanyId(request, response)
{
	$('#startDateToExport').val("");
	$('#endDateToExport').val("");
	$('#eIdToExport').val("");
	console.log($("#companyIdToExport").val());
	var resultsArray=[];
	console.info("in getCompanyDataByCompanyId function ");
	var resultsArray =[];
	$.ajax({
		type: 'GET',
		url: 'companyIdForFItems.htm',
		dataType: "json",
		async:false,
		cache: true,
		data: {companyIdToExport : $("#companyIdToExport").val(),autoCompleteflag :"Y"},
		success: function(data){
		if (data != null){  
		var resultJSON=JSON.stringify(data);
		resultdata = $.parseJSON(resultJSON);
		$.each(resultdata, function(k, v) {
		   resultsArray.push(k);
		});
		}
		response(resultsArray);
		}
	});
	
}

function getCompanyDataByCompanyNameForExtract(request, response)
{
	$('#startDateToExportExtraction').val("");
	$('#endDateToExportExtraction').val("");
	$('#eIdToExportExtraction').val("");
	console.log($("#companyNameToExportExtraction").val());
	var resultsArray=[];
	console.info("in getCompanyDataByCompanyNameExtraction function ");
	var resultsArray =[];
	$.ajax({
		type: 'GET',
		url: 'companyNameForFItems.htm',
		dataType: "json",
		async:false,
		cache: true,
		data: {companyNameToExport : $("#companyNameToExportExtraction").val(),autoCompleteflag :"Y"},
		success: function(data){
		if (data != null){  
		var resultJSON=JSON.stringify(data);
		resultdata = $.parseJSON(resultJSON);
		$.each(resultdata, function(k, v) {
		   resultsArray.push(k);
		});
		}
		response(resultsArray);
		}
	});
	
}


function getCompanyDataByCompanyIdForExtract(request, response)
{
	$('#startDateToExportExtraction').val("");
	$('#endDateToExportExtraction').val("");
	$('#eIdToExportExtraction').val("");
	console.log($("#companyIdToExportExtraction").val());
	var resultsArray=[];
	console.info("in getCompanyDataByCompanyId function ");
	var resultsArray =[];
	$.ajax({
		type: 'GET',
		url: 'companyIdForFItems.htm',
		dataType: "json",
		async:false,
		cache: true,
		data: {companyIdToExport : $("#companyIdToExportExtraction").val(),autoCompleteflag :"Y"},
		success: function(data){
		if (data != null){  
		var resultJSON=JSON.stringify(data);
		resultdata = $.parseJSON(resultJSON);
		$.each(resultdata, function(k, v) {
		   resultsArray.push(k);
		});
		}
		response(resultsArray);
		}
	});
	
}


function exporFItemsByFilter() {
	var startDate=$('#startDateToExport').val();
	var endDate=$('#endDateToExport').val();
	var companyIdToExport=$('#companyIdToExport').val();
	var companyNameToExport=$('#companyNameToExport').val();
	var eIdToExport=$('#eIdToExport').val();
	if($.trim(startDate).length>0 ||  $.trim(endDate).length>0 || $.trim(companyIdToExport).length>0 ||  $.trim(companyNameToExport).length>0){
		location.href = "exportFinancialItemExcelByFilter.htm?startDate="+encodeURIComponent(startDate)+"&endDate="+encodeURIComponent(endDate)+"&companyIdToExport="+encodeURIComponent(companyIdToExport)+"&companyNameToExport="+encodeURIComponent(companyNameToExport)+"&eIdToExport="+encodeURIComponent(eIdToExport);
	}else{
		$.alert("Please provide input to download the data.");
	}
	
}

function uploadFinancialItems() {
	showLoading();
	var myForm = new FormData();
	myForm.append("file", importInputFile.files[0]);
	var filename = $("#importInputFile").val();
	 var extension = filename.replace(/^.*\./, '');
	  if(extension.toLowerCase() === "xlsx"){
		  console.log("SDFDSA1 "+filename);
		 $.ajax({
			    url: insertParam('importFinancialITemsExcel.htm'),
			    data: myForm,
			    dataType: 'text',
			    processData: false,
			    contentType: false,
			    type: 'POST',
			    cache: true,
			    success: function(data){
			    	console.log("SDFDSA "+data);
			    	$.alert(data);
			    	$("#importInputFile").val("");
			    	hideLoading();
			    	 
			    },error: function(data) {
			    	$("#importInputFile").val("");
			    	hideLoading();
				}
			  });
	 }/* else{
		 $("#uploadErrors").html("<span style='color:#008000'>Selected file type is not supporting to upload.<BR>Please select Excel file to upload.</span>");
	 } */
	
	
}


function exporExtractionDataByFilter() {
	var startDate=$('#startDateToExportExtraction').val();
	var endDate=$('#endDateToExportExtraction').val();
	var companyIdToExport=$('#companyIdToExportExtraction').val();
	var companyNameToExport=$('#companyNameToExportExtraction').val();
	var eIdToExport=$('#eIdToExportExtraction').val();
	if($.trim(startDate).length>0 ||  $.trim(endDate).length>0 || $.trim(companyIdToExport).length>0 ||  $.trim(companyNameToExport).length>0){
		location.href = "exportPdfExtractionMetaDataFilter.htm?startDate="+encodeURIComponent(startDate)+"&endDate="+encodeURIComponent(endDate)+"&companyIdToExport="+encodeURIComponent(companyIdToExport)+"&companyNameToExport="+encodeURIComponent(companyNameToExport)+"&eIdToExport="+encodeURIComponent(eIdToExport);
	}else{
		$.alert("Please provide input to download the data.");
	}
	
}

function uploadExtractionMetaData() {
	showLoading();
	var myForm = new FormData();
	myForm.append("file", importExtractionInputFile.files[0]);
	var filename = $("#importExtractionInputFile").val();
	 var extension = filename.replace(/^.*\./, '');
	  if(extension.toLowerCase() === "xlsx"){
		  console.log("extract1 "+filename);
		 $.ajax({
			    url: insertParam('importPdfExtractionMetaDataFilter.htm'),
			    data: myForm,
			    dataType: 'text',
			    processData: false,
			    contentType: false,
			    type: 'POST',
			    cache: true,
			    success: function(data){
			    	console.log("extract123 "+data);
			    	$.alert(data);
			    	$("#importExtractionInputFile").val("");
			    	hideLoading();
			    	 
			    },error: function(data) {
			    	$("#importExtractionInputFile").val("");
			    	hideLoading();
				}
			  });
	 }/* else{
		 $("#uploadErrors").html("<span style='color:#008000'>Selected file type is not supporting to upload.<BR>Please select Excel file to upload.</span>");
	 } */
	
	
}



function getCompanyData(request, response)
{
	console.log($("#companyName").val());
	var resultsArray=[];
	console.info("in getCompanyData function ");
	var resultsArray =[];
	$.ajax({
		type: 'GET',
		url: 'companyNameAutoComplete.htm',
		dataType: "json",
		async:false,
		cache: true,
		data: {companyName : $("#companyName").val()},
		success: function(data){
		if (data != null){  
		var resultJSON=JSON.stringify(data);
		resultdata = $.parseJSON(resultJSON);
		$.each(resultdata, function(k, v) {
		   resultsArray.push(v);
		});
		}
		response(resultsArray);
		}
	});
	
}

	function searchDealerTemplateRules(){
		var dealerName=$('#dealerName').val();
		if(dealerName!=''){
	    document.searchDealerNameForm.submit();
		}else{
			$.alert("Please select Dealer Name");
		}
	}
	
function generateFinancialExport() {
var companyId=$("#companyId").val();
if(companyId!=''){
var processData = "companyId="+companyId;
actionUrl = "isFinancialItemExistByCompanyId.htm";
successData = function(data) {
		try {
		
			result = JSON.parse(data);
			console.info("json result:"+result);
			if (result.hasOwnProperty('existFlag')) {
				/* Here we split string by comma */
				var existFlag=result['existFlag'];
			        if(existFlag!='Y'){
			        $.alert("Records are not exist !");
			        }else{
			        hideLoading();
			        location.href = "exportFinancialItemExcel.htm?companyId="+encodeURIComponent(companyId);
			        }
			 
			}
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
}

</script>
<style>
body{overflow:auto !important}
</style>	
			<div class="container-fluid mar-top80 rmDiv">
				<div class="row">
					<div class="col-md-3">
						<div class="panel panel-default">
							<div class="panel-heading text-center">Normalization Rules</div>
							<div class="panel-body lt-panel">
								<div class="account">
								<h4>Download</h4>
									<p>Click on the download link to download the blank excel template</p>
									<p>Enter the 'As reported labels' and 'Normalized labels' which you want to add to your Meta-data file</p>
								</div>
								
								<div class="account">
									<h4>Upload</h4>
									<p>Click on the Browse button and select the template file in which you have added the 'As reported labels' and 'Normalized labels'</p>
									<p>Click on 'Upload' button, once the file gets uploaded to the specified destination you would receive the confirmation message for the same</p>
								</div>
							</div>
						</div>
					</div><!--- col-md-3 -->
				
					<div class="col-md-9">
					<div class="row">
					<div id="upload-div-new" class="upload-panel">
						<div class="col-md-6">
							<div class="panel panel-default panel-min-ht">
								<div class="panel-heading text-center">Upload Metadata Template</div>
								<div class="panel-body text-center" style="margin-top:10px;">
									<a href="javascript:void(0)"  onclick="setLocationHref('downloadNormalizationTemplate.htm?templateType=normRules')">Metadata-template.xls</a>
								</div>
							</div>	
						</div>
						<div class="col-md-6 download-panel">
							<div class="panel panel-default panel-min-ht">
								<div class="panel-heading text-center">Download Metadata Template</div>
								<div class="panel-body text-center">
									<c:if test="${param.msg eq'0'}">
							<div style="color:red">Template uploaded unsuccessfully.</div>
							</c:if>
							<c:if test="${param.msg eq '2'}">
							<div style="color:red">Template uploaded successfully. Please see the FailedRecords xls file.</div>
							</c:if>
							<c:if test="${param.msg eq '1'}">
							<div style="color:red">Template uploaded successfully.</div>
							</c:if>
							<c:if test="${param.msg eq '3'}">
							<div style="color:red"> please select valid Xls/Xlsx.</div>
							</c:if>
							<c:if test="${param.msg eq '4'}">
							<div style="color:red">Please select file to upload.</div>
							</c:if>
							<form id="templateupload" action="upload_template.htm" method="POST" enctype="multipart/form-data">
								<input id="fileupload" type="file" name="fileupload"  style="margin:0  auto 15px auto; display:inline" />  </td>
								<input  type="button" value="Upload Template" class="btn btn-info start" onClick="javascript:submitTemplet();">
							</form>
								</div>
							</div>	
						</div>
					
						<c:if test="${userAccess eq '1' || userAccess eq '2'}"> 
							<div class="col-md-12 expo-import-panel">
							<div class="panel panel-default">
								<div class="panel-heading text-center">Export/Import Financial Items</div>
								<div class="panel-body">
								    <div id="exportFinancialDiv">
									<div class="row">
									<div class="col-md-12 mar-negi12 txt-error">*Please provide company information/date range </div>
										<div class="col-md-3 comp-name">
											<label>Company Name:</label>
											<input type="text" class="form-control" id="companyNameToExport" name="companyNameToExport"  onblur="setCompanyIDOnFocusOut('fITem');"/>
						  					<input type="hidden" class="form-control" name="eIdToExport" id="eIdToExport" value="" />
										</div>
										
										<div class="col-md-3 comp-id">
											<label>Company Id:</label>
											<input type="text" id="companyIdToExport" class="form-control" name="companyIdToExport"  onblur="setCompanyNameOnFocusOut('fITem');"/>
										</div>
										
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4 str-dt">
													<label>Start Date:</label>
													<input type="text" class="form-control" id="startDateToExport" name="startDateToExport"  readonly="readonly" onkeyup="resetCompanyInfo();" onchange="resetCompanyInfo();" onfocus="resetCompanyInfo();"/>
												</div>
												
												<div class="col-md-4 end-dt">
													<label>End Date:</label>
													<input type="text" class="form-control" id="endDateToExport" name="endDateToExport" readonly="readonly" onkeyup="resetCompanyInfo();" onchange="resetCompanyInfo();" onfocus="resetCompanyInfo();"/>
												</div>
												
												<div class="col-md-4">
													<span class="pull-right btn-panel">
														<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top"  title="Financial Item Export" onclick="exporFItemsByFilter();" id="exportToExcel"><i class="glyphicon glyphicon-export custom-font pad5 cus-cls mar-rt5"></i></a>
														<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top" title="Financial Item Import" onclick="$('#importInputFile').click();" id="exportToExcel"><i class="glyphicon glyphicon-import custom-font pad5 cus-cls mar-rt5"></i></a>
														<a href="JavaScript:resetFinanceItemFilter();" data-toggle="tooltip" data-placement="top" title="Reset"  id="resetFinanceItemFilter"><i class="fa fa-undo custom-font pad5 cus-cls mar-rt5"></i></a>
													</span>
													<form enctype="multipart/form-data" id="impFinanceFile" >
													 	<input type="file" id="importInputFile" name="importInputFile" style="display: none;" onchange="uploadFinancialItems();" />
													</form>
												</div>
											</div><!-- row -->
										</div><!-- col-md-6 -->
									</div>
									</div>
								</div>
							</div>	
						</div>
				</c:if>
						
						
						
						
					
						 <c:if test="${userAccess eq '1' || userAccess eq '2'}"> 
						<div class="col-md-12 expo-import-extraction-panel">
							<div class="panel panel-default">
								<div class="panel-heading text-center">Export/Import Extraction Rules</div>
								<div class="panel-body">
									
									<div id="exportFinancialDiv">
									<div class="row">
									<div class="col-md-12 mar-negi12 txt-error">*Please provide company information/date range </div>
										<div class="col-md-3 comp-name">
											<label>Company Name:</label>
											<input type="text" id="companyNameToExportExtraction" name="companyNameToExportExtraction" class="form-control"  onblur="setCompanyIDOnFocusOut('Extraction');"/>
						 					 <input type="hidden" name="eIdToExportExtraction" id="eIdToExportExtraction" value="" class="form-control" />
										</div>
										
										<div class="col-md-3 comp-id">
											<label>Company Id:</label>
											<input type="text" id="companyIdToExportExtraction" name="companyIdToExportExtraction" class="form-control"  onblur="setCompanyNameOnFocusOut('Extraction');"/>
										</div>
										
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4 str-dt">
													<label>Start Date:</label>
													<input type="text" id="startDateToExportExtraction" name="startDateToExportExtraction" class="form-control" readonly="readonly" onkeyup="resetCompanyInfoForExtraction();" onchange="resetCompanyInfoForExtraction();" onfocus="resetCompanyInfoForExtraction();"/>
												</div>
												<div class="col-md-4 end-dt">
													<label>End Date:</label>
													<input type="text" id="endDateToExportExtraction" name="endDateToExportExtraction" class="form-control"  readonly="readonly" onkeyup="resetCompanyInfoForExtraction();" onchange="resetCompanyInfoForExtraction();" onfocus="resetCompanyInfoForExtraction();"/>
												</div>
												<div class="col-md-4">
													<span class="pull-right btn-panel">
													<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top"  title="Extraction Data Export" onclick="exporExtractionDataByFilter();" id="exportToExcel"><i class="glyphicon glyphicon-export custom-font pad5 cus-cls mar-rt5"></i></a>
													<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top" title="Extraction Data Import" onclick="$('#importExtractionInputFile').click();" id="exportToExcel"><i class="glyphicon glyphicon-import custom-font pad5 cus-cls mar-rt5"></i></a>
													<a href="JavaScript:resetExtractionFilter();" data-toggle="tooltip" data-placement="top" title="Reset"  id="resetExtractionFilter"><i class="fa fa-undo custom-font pad5 cus-cls mar-rt5"></i></a>
													</span>
													<form enctype="multipart/form-data" id="impFinanceFile" >
													<input type="file" id="importExtractionInputFile" name="importExtractionInputFile" style="display: none;" onchange="uploadExtractionMetaData();" />
													</form>
												</div>
											</div><!-- row -->
										</div><!-- col-md-6 -->
									</div>
									</div>
									<c:if test="${not empty submitFlag}">
									<c:if test="${submitFlag}">
									<div id="error-div" class="error-div" style="margin-top:40px; background:none !important; text-align:center; font-weight:bold; border:1px solid #ccc; color:#3c763d !important">
								    Dealer Template Rules has been submitted successfully
				              		</div>
									</c:if>
									</c:if>
								</div>
							</div>	
						</div>
						</c:if> 
						
						<c:if test="${userAccess eq '1' || userAccess eq '2'}"> 
						<div class="col-md-6 download-finance-item-panel">
							<div class="panel panel-default">
								<div class="panel-heading text-center">Download Financial Item Details</div>
								<div class="panel-body">
								<div id="exportFinancialDiv">
									<div class="col-md-4 comp-name"><label>Company Name:</label></div>
									<div class="col-md-6 comp-name">
										<input type="text" id="companyName" name="companyName" class="form-control"/></span>
						  				<input type="hidden" name="companyId" id="companyId" value="" />
									</div>
									<div class="col-md-2">
										<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top" title="Financial Item Export" onclick="generateFinancialExport();" id="exportToExcel"><i class="glyphicon glyphicon-export custom-font pad5 cus-cls mar-rt5"></i></a>
									</div>
								</div>
									
								</div>
								</div>
							</div>	
						</c:if>
						</div>
					</div>
</div>
</div>
</div>

<script>

function submitTemplet(){

      var flag = 0;
	  var val=$("#fileupload").val();
	  var ar_name = [];
	  var validExtensions = new Array();
	    validExtensions[0] = 'xls';
        validExtensions[1] = 'xlsx'; 
        
	     if(val!==""){ 
		        ar_name = val.split('.');
		          if(ar_name.length > 2){
		  	          $.alert("please select valid Xls/Xlsx");
		  	         return false;
		          } 	
	       var extension = ar_name[1].toLowerCase();
		   for (var i = 0; i < validExtensions.length; i++) {
		          if (extension == validExtensions[i]) {
		           flag = 1;
		           break;
		       }
		   }
	        if (flag == 1) {
	        	//upload Template File 
				uploadTemplateFile();
			} else {
				$.alert('Please select valid xls/xlsx');
				return false;
			}
		} else {
			$.alert('Please select file to upload');
			return false;
		}

	}
	$(
			'#startDateToExport, #endDateToExport, #startDateToExportExtraction, #endDateToExportExtraction')
			.datepicker();

	function uploadTemplateFile() {
		showLoading();
		var myForm = new FormData();
		myForm.append("file", fileupload.files[0]);
		$.ajax({
			url : insertParam('upload_template.htm'),
			data : myForm,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			cache: true,
			success : function(data) {
				$.alert(data);
				hideLoading();
			},
			error : function(data) {
				$("#importInputFile").val("");
				hideLoading();
			}
		});
	}
</script>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
<link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/rules_management_normalization_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css">
<script type="text/javascript" src="js/jquery.blockUI.js"></script>
<link href="css/defaultTheme.css" rel="stylesheet" media="screen" />
<link href="css/myTheme.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-checkbox.css" />
<script src="js/jquery.fixedheadertable.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.multiselect.css" />
<script type="text/javascript" src="js/jquery.multiselect.js"></script>
<script type="text/javascript" src="js/contextmenu/jquery.contextmenu.js"></script>
<script type="text/javascript" src="js/appjs/rules_management_statement.js?value=${applicationScope['version']}"></script>
<link rel="stylesheet" type="text/css" href="js/contextmenu/jquery.contextmenu.css" />
<script src="js/tableHeadFixer.js"></script>
<script src="js/common.js?value=${applicationScope['version']}"></script>
<script src="js/jquery.darktooltip.js"></script>
<!-- --for processing wheel -->
<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
<style>
 body{overflow:hidden !important}
 .info-tab{padding: 8px 0 0 0; color: #fff; position: relative; top:3px !important; z-index: 999; right: 22px;}
 .fa-search{padding:3px 0px 3px 0 !important; font-size:15px !important;}
.newtable{border:1px solid #ccc}
.newtable thead tr th{background:#074156 !important; color:#fff !important; font-size:11px !important; padding:4px; border-right:1px solid #fff}
.newtable tbody tr td{color:#333 !important; padding:0px 5px 0px 5px !important; font-size:11px !important; border:1px solid #ccc} 
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".N").hide();
		uicTableDivHide();
		viewData('${wqId}', '${caseId}', "${statementFormat}",
		"${customerId}"); 
		$('#myselect').multiselect();
			 $('#myselect').on('change', function() {
			    var numstr = $(this).val() + "";
			    var numarr = numstr.split(',');
			    $(".poRow").hide();
			    $.each(numarr, function(i, val) {
			    			$("."+val).show();
			    });
			    $(".collapseRowClass").hide();
			});
		
		$("#multipleselect").multiselect();
		$('.custom_search').multiselect({ 
	         includeSelectAllOption: true,
	         enableFiltering:true,
			 enableCaseInsensitiveFiltering:true,
			 includeSelectAllOption: false,
			  buttonWidth: 250  
	    });
			
			
			//hide or show NormalizedDirectory
			   var normDirectry='${normDirectry}';      	
			   if(normDirectry=='N'){
					 $("#normdirect").hide(); 
				}
			   
			  	
				getOrigionalFileName('${customerId}', '${wqId}');
				showConvertedFiles('${customerId}', '${wqId}'); 

			});
			
			
	/* This function used only when parser is pdf based parser  */
	function pdfBasedMerge() {
		var checkboxArray = new Array();
		var filingId = $("#filingId").val();
		$("input[name='multiselect_multipleselect']").each(function() {
			if ($(this).prop("checked") == true) {
				checkboxArray.push($(this).val() + "~" + "Y");

			} else if ($(this).prop("checked") == false) {
				checkboxArray.push($(this).val() + "~" + "N");

			}
		});

		var processData = "&checkboxArray=" + encodeURIComponent(checkboxArray) + "&filingId="
				+ encodeURIComponent(filingId);
		actionUrl = "mergePdfBasedParser.htm";
		successData = function(data) {
			try {
				$.ajaxSetup({
					async : false,
					cache: true
				});
				hideLoading();
				//$.alert(data);

			} catch (e) {
				hideLoading();
				//$.alert("Error:" + e);

			}

		};

		showLoading();
		callAjax(processData, successData, errorData, beforeSend, actionUrl,
				reqType, retDataType);
	}
	/* This function used for delete records from LS_PDF_EXTRACTION_METADATA table and parser_output table based on table id */
	function deleteStatements() {

		var checkboxArray = new Array();
		var filingId = $("#filingId").val();

		var i=0;
		$("input[name='multiselect_multipleselect']").each(function() {
			
			if ($(this).prop("checked") == true) {
				
				checkboxArray.push($(this).val());
				var target = 'ui-multiselect-multipleselect-option-'+i; // or whatever
				$('label[for="' + target + '"]').hide();

			}
			i++;
		});
		$("#multipleselect").val("Select Statements");
		

		if ($.confirm('Please confirm deletion for selected statements')) {
			// Delete it!
			var processData = "&checkboxArray=" + encodeURIComponent(checkboxArray) + "&filingId="
					+ encodeURIComponent(filingId);
			actionUrl = "deleteStatements.htm";

			successData = function(data) {
				try {
					$.ajaxSetup({
						async : false,
						cache: true
					});
					hideLoading();
					$('#multipleselect').next('button').find('span:last').text('Select Statements');
					var wqId = $("#wqId").val(); 
					var caseId = $("#encryptedFilingId").val(); 
					var statementFormat = $("#statementFormat").val(); 
					var customerId = $("#customerId").val(); 
				
					viewData(wqId, caseId, statementFormat,customerId);
					//$.alert(data);

				} catch (e) {
					hideLoading();
					//$.alert("Error:" + e);

				}

			};

			showLoading();
			callAjax(processData, successData, errorData, beforeSend,
					actionUrl, reqType, retDataType);

		}
	}
	
	 function submitImportForm(fieldId) {
		$("#impFileForm").submit();
		var control = $('#'+fieldId);
		 control.replaceWith( control = control.clone( true ) );
	    }
	 
	 /* This function used for show pop up after click on complany level button */
	 function showCompanyLevelPopUp(val){
		 var filingId = $("#filingId").val();
		 var actionUrl = "showCompanyLevelPopUp.htm";
		 var processData="levelName="+encodeURIComponent(val)+"&filingId="+encodeURIComponent(filingId);
		 
			successData = function(data) {
				try {
					
					$.ajaxSetup({
						async : false,
						cache: true
					});
					hideLoading();
				    $('#companyLevelPopupId').html(data);
					$('#companyLevelMainPopupId').modal('show');
					
				} catch (e) {
					hideLoading();
					$.alert("Error:" + e);

				}

			};
			showLoading();
			callAjaxGet(processData, successData, errorData, beforeSend,
					actionUrl, reqType, retDataType);
		   
		  
		 
	 }//end showCompanyLevelPopUp function
function importExcelFile(){
console.info("start importExcelFile function");
try{
		showLoading();
		 var requestData = new FormData(document.getElementById("impFileForm")); // your form ID
	   // var url = jQuery("#impFileForm").attr("action"); // your form action
	    var fillingId=$("#encryptedFillingId").val();
	    var WqId=$("#encryptedWqId").val();
	    var statementFormat=$("#statementFormat").val();
	    var customerName=$("#encryptedcustomerName").val();
	    var businessName=$("#encryptedbusinessName").val();
	    var customerId=$("#encryptedCustomerId").val();
	    var fileName=$("#encryptedxfileName").val();
	    var compIdOrCik=$("#encryptedCompIdOrCik").val();
		$.ajaxSetup({
			async : false,
			cache: true
		});
	    $.ajax({
	        url: "importExcel.htm",
	        type: "POST",
	        data: requestData, // this will get all the input fields of your form.
	        enctype: 'multipart/form-data',
	        processData: false,  // tell jQuery not to process the data
	        contentType: false,   // tell jQuery not to set contentType
	        cache: true,
	        success: function(data) {
	        hideLoading();
	        result = JSON.parse(data);
	    	if (result.hasOwnProperty('msg')) {
	    		var msg=result['msg'];
	    		if(msg==='success'){
    			$.alert("File Imported successfully");
    	        var urlDynamic = insertParam("rules_management_normalization.htm");	
    	        var parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat="+statementFormat+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
	   			 ajaxCallforAll(urlDynamic,parametersDynamic);
	    		}else{
	    		$.alert(msg);
	    		}
	    	}
	        }
	    });  // JQUERY Native Ajax End
	  
}  catch(e){
    $.alert('An error has occurred: '+e.message)
}
}//end methode

function showCompanyGlobalLevelReviewPopUp(levelName){
	 var filingId = $("#filingId").val();
    var actionUrl = "showReviewCompanyGlobalLevelPopup.htm";
    var processData="levelName="+encodeURIComponent(levelName)+"&filingId="+encodeURIComponent(filingId);
		successData = function(data) {
			try {
				$.ajaxSetup({
					async : false,
					cache: true
				});
				hideLoading();
			    $('#reviewcompanyGlobalLevelPopupDivId').html(data);
				$('#reviewcompanyGlobalLevelPopupId').modal('show');
			} catch (e) {
				hideLoading();
				$.alert("Error:" + e);
			}
		};
		showLoading();
		callAjaxGet(processData, successData, errorData, beforeSend,
				actionUrl, reqType, retDataType);
}



$(document).on('hide.bs.modal','#companyLevelMainPopupId', function () {
    $('#companyGlobalLevelData thead').empty();
    $('#companyGlobalLevelData tbody').empty();
});		
	
	
	function viewData(WqId, fillingId, statementFormat, customerId) {
		setDataHead(statementFormat);
		//$('#data-div-1').html("Data Loading............");

		showLoading();
		processData = '&statementFormat=' + encodeURIComponent(statementFormat) + '&WqId=' + encodeURIComponent(WqId)
				+ '&fillingId=' + encodeURIComponent(fillingId) + "&customerId=" + encodeURIComponent(customerId);
			/*
			Here if statementformat(section) is Supplemental Information then call rulesmgnt_supplemental_Info controller
			 */

				actionUrl = "rules_management_statement.htm";



		successData = function(data) {
			$('#data-div-1').html(data);
			hideLoading();
			highlightSelectedColumns();
		};
		errorData = function(data) {
			$('#data-div-1').html(data);//.show();
			hideLoading();
		};
		retDataType = "html";
		callAjaxGet(processData, successData, errorData, beforeSend, actionUrl,
				reqType, retDataType);
	}
	
	function highlightSelectedColumns(){
		var selectedSection = $("#datahead").html();
		if(selectedSection != undefined){
			if(selectedSection in sectionMap){
				var selectedArry = sectionMap[selectedSection];
				var arrayLength = selectedArry.length;
				for (var i = 0; i < arrayLength; i++) {
				    $("#myTable").find("tr").find("td:eq("+selectedArry[i]+")").addClass('selectedTD');
				}
			}
		}
	}
	
	function setDataHead(stmtFormat) {
		var head = "";
		
		<c:forEach items="${sessionSectionList}" var="groupMap"> 
	    var groupKey = "<c:out value="${groupMap.key}"/>";
	    var groupValue = "<c:out value="${groupMap.value}"/>";
		  if (groupKey == stmtFormat){
			  head=groupValue;
		  }  
	   	</c:forEach>
	   	$("#datahead").html(head).show();
	
	   	$("#refreshBtn").attr(
				'onclick',
				'viewData("${wqId}","${caseId}","' + stmtFormat
						+ '","${customerId}")');
		$("#export").attr(
				'onclick',
				'exportToExcel("${wqId}","${caseId}","' + stmtFormat
						+ '","${customerId}")');

	}

	function exportToExcel(wqId, caseId, statementFormat, customerId) {
		var custName = '${param.customerName}';
		setLocationHref('exportToExcel.htm?customerName=' + encodeURIComponent(custName)
				+ '&statementFormat=' + encodeURIComponent(statementFormat) + '&encryptedWqId='
				+ encodeURIComponent(wqId) + '&encryptedFillingId=' + encodeURIComponent(caseId)
				+ "&encryptedCustomerId=" + encodeURIComponent(customerId));
		
	}


	function getTimePeriodAndCustodianName(accountNumber) {

		if(accountNumber!=''){
		var statementFormat = $('#statementFormat').val();
		processData = "&statementFormat=" + encodeURIComponent(statementFormat)
				+ "&fillingId="+encodeURIComponent('${caseId}')+"&accountNumber="
				+ encodeURIComponent(accountNumber);
		actionUrl = "getTimePeriodAndCustodianName.htm";

		successData = function(data) {
			result = JSON.parse(data);
			/***** check result success *********************/

			$.ajaxSetup({
				async : false,
				cache: true
			});

			if (result.hasOwnProperty('list1')) {

				$('#timePeriod').find('option').remove().end();

				$('#timePeriod').append("'" + result['list1'] + "'");

			}
			if (result.hasOwnProperty('list2')) {
				$('#custodianName').find('option').remove().end();
				$('#custodianName').append("'" + result['list2'] + "'");
			}

		};

		errorData = function(data) {

			//$.alert(data);
			hideLoading();

		};
		if (processData == '') {
			console.info("data is empty");
			/* $.alert("No Data Available"); */
		} else {

			console.info(processData);
			callAjax(processData, successData, errorData, beforeSend,
					actionUrl, reqType, retDataType);

		}
		}//end accountNumber if
	}

	/* This function called after click on DebitACH button */
	function debitACHMapping() {
		if ($.confirm("Please confirm whether Debit ACH Mapping to be mapped ") == true) {
			showLoading();
			var fillingId = $('#encryptedFilingId').val();
			processData = "&fillingId=" + encodeURIComponent(fillingId);
			actionUrl = "debitACHMapping.htm";
			successData = function(data) {
				if (data == "true") {
					/* $.alert("Debit ACH Mapping has been done Successfully");Industry */
				} else {
					/* $.alert("Debit ACH Mapping Failed"); */
				}
				hideLoading();

			};
			errorData = function(data) {
				/* $.alert("Fail=" + data); */
				hideLoading();
			};
			retDataType = "html";
			callAjax(processData, successData, errorData, beforeSend,
					actionUrl, reqType, retDataType);
		}
	}
</script>
	
	<jsp:include page="common/appheader.jsp">
		<jsp:param name="pageNo" value="5" />
		<jsp:param value="${caseId}" name="caseId" />
				<jsp:param value="${decryptedFillingId}" name="decryptedFillingId" />
				<jsp:param value="${customerId}" name="customerId" />
				<jsp:param value="${decryptedCustomerName}" name="decryptedCustomerName" />
				<jsp:param value="${businessName}" name="bussinessName" />
				<jsp:param value="${decryptedCompIdOrCik}" name="decryptedCompIdOrCik" />
				<jsp:param value="${wqId}" name="wqId" />
				<jsp:param value="${encriptedWqEId}" name="encriptedWqEId" />

	</jsp:include>
	<div id="companyLevelPopupId"></div>
	<div id="reviewcompanyGlobalLevelPopupDivId"></div>

 <div class="container-fluid rmDiv" style="margin-top:100px">
	<div class="row">
		<div class="col-md-12">
			<span class="pull-left"><h4 class="font16 mar-top8 mar-rt5" id="datahead"></h4></span>
			<span class="pull-right"><select name="example-optgroup" multiple="multiple" size="5" id="multipleselect" class="form-control mar-lt27" style="width: 345px !important">
				<c:forEach items="${pdfExtractionMetadata}" var="pdfExtractionMetadata">
					<c:set var="objList" value="${pdfExtractionMetadata.value}" />
					<optgroup label="${pdfExtractionMetadata.key}" spellcheck="">
						<c:forEach var="commandObj" items="${objList}">
							<option value="${commandObj.tableId}~${commandObj.section}">
								<c:out value="${commandObj.beginKeyword}" /> - <c:out value="${commandObj.beginPageNumber}" />
							</option>
						</c:forEach>
					</optgroup>
				</c:forEach>
			</select> 	
			

		<input type="button" class="btn btn-primary" onclick="pdfBasedMerge()" value="Merge" />
		<input type="button" class="btn btn-primary" onclick="deleteStatements()" value="Delete" />
		<input type="button" class="btn btn-primary" onclick="columnMerge()" value="Column Merge" />
		</span>	
		
		</div>
		</div>
		</div><!-- col-md-12 -->
		<div class="col-md-12 rmDiv">
			<div class="panel panel-default">
			<div class="panel-body custom-padding">
				<div class="row" style="margin-right:-38px !important">
				<div class="col-md-12">
				<input type="hidden" name='wqId' id='wqId' value="${wqId}" />
				<input type="hidden" name='filingId' id='filingId' value="${decryptedFillingId}" />
				<input type="hidden" name='encryptedFilingId' id='encryptedFilingId' value="${caseId}" />
				<input type="hidden" name='customerId' id='customerId' value="${customerId}" />
					<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top6">Status</label></span>
					<span class="pull-left mar-rt5">
					<select name="Status" class="form-control" id="Status" style="width: auto; color: #000000; padding: 4px;">
						<c:if test="${not empty statusList}">
										 <option value="${currentStatus}">${currentStatus}</option>
											<c:forEach items="${statusList}" var="statusList">
											<c:if test="${currentStatus ne statusList.statusName}">
											<option value="${statusList.statusName}">${statusList.statusName}</option>
											</c:if>
											</c:forEach>
						</c:if>				
					</select>
					</span>
					<span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" onclick="return modifyStatus();" value="Modify Status" /></span>
				
					<c:if test="${sessionParserId ne '8'}">
				   <span class="dropdown pull-left mar-rt5">
				    <a href="#" class="btn btn-primary" dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span id="selectedValueForNormalizedTemplateId" data-toggle="tooltip" title="Normalized Template"></span><b class="caret mar-lt5"></b></a>
				   	<ul class="dropdown-menu">
							<c:choose>
									<c:when test="${not empty templateIdNameList}">
										<c:forEach items="${templateIdNameList}" var="dropDownNtl" varStatus="loop">
										<c:set var="industryName" value="${dropDownNtl.value}"/>
											<li><a href="#"  onclick="executeNormalisedTemplate('<c:out value="${dropDownNtl.value}"/>','<c:out value="${caseId}"/>','<c:out value="${dropDownNtl.key}"/>')">
									          <c:out value="${dropDownNtl.value}"/>
											</a></li>
										</c:forEach>
									</c:when>
								</c:choose>
						</ul>
				   </span>
					
		
				 	<span class="dropdown pull-left mar-rt5" id="normdirect">
					<a href="#" class="btn btn-primary" dropdown-toggle" data-toggle="dropdown"><i class="fa fa-file" data-toggle="tooltip" title="Normalization Directory" style="padding:0 0 5px 0"></i> <b class="caret mar-lt5"></b></a>
						<ul class="dropdown-menu">	
							<li><a id="popUpHover" onclick="showCompanyLevelPopUp('CompanyLevel'); return false;"  href="#">Company Level</a></li>
							
							<c:if test="${userAccess eq '1' || userAccess eq '2'}">
							<c:if test="${industryLevelAccess eq 'allow'}">
							<li><a id="popUpHover" onclick="showCompanyLevelPopUp('IndustryLevel'); return false;"  href="#">Industry Level</a></li>
							</c:if>
							<li><a id="Global" onclick="showCompanyLevelPopUp('GlobalLevel'); return false;" href="#">Global Level</a></li>
							<li><a id="ReviewCompany" href="#"  onclick="showCompanyGlobalLevelReviewPopUp('CompanyLevel'); return false;">Review Company Level Mapping</a></li>
							<c:if test="${industryLevelAccess eq 'allow'}">
							<li><a id="ReviewIndustry" href="#"  onclick="showCompanyGlobalLevelReviewPopUp('IndustryLevel'); return false;">Review Industry Level Mapping</a></li>
							</c:if>
							<li><a id="ReviewGlobal" href="#" onclick="showCompanyGlobalLevelReviewPopUp('GlobalLevel'); return false;">Review Global Level Mapping</a></li>
							</c:if>
							
							
							
						</ul>
					</span> 
					<span><input type="text" id="asReportedLable" class="form-control custom-search-box" placeholder="As Reported label"><i onclick="searchReporedLable();" class="fa fa-search pull-right" style="position: relative; right: 385px; top: 5px;"></i></span>
				<security:authorize access="hasAnyRole('ROLE_USER_RISK')">
					<span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" onclick="return debitACHMapping();" value="DebitACH"/></span>
				</security:authorize>
				</c:if>	
					
					<span class="pull-left mar-rt5">
						<select id="myselect" class="form-control"  multiple="multiple">
						<option selected="selected" value="noMapping">No Mapping</option>
						<option selected="selected" value="multiMatch">Multi Match</option>
						<option selected="selected" value="manualReview">Manual Review</option>
						<option selected="selected" value="noReview">No Review</option>
						<option selected="selected" value="GlobalLevel">Global Mapping</option>
						<option selected="selected" value="CompanyLevel">Company Mapping</option>
						<option selected="selected" value="manual">Manual Mapping</option>
					</select>
					</span> 
					<span class="pull-right icon-panel">
						<a href="#"><i class="fa fa-save custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Save" onClick="submitForm()"></i></a>
						<a href="#"><i class="fa fa-plus custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Add" onClick="addRow('N', 'N')"></i></a>
						<a href="#"><i class="fa fa-retweet custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Add Duplicate" onClick="addRow('N','D')"></i></a>
						<a href="#"  id="refreshBtn"><i class="fa fa-refresh custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Refresh"></i></a>
						<a href="#"><i class="fa fa-trash custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Remove" onClick="deleteRow('delPoId')"></i></a>
						<a href="#"><i class="fa fa-undo custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Undo" onClick="undoDeleteRow()"></i></a>
						<c:if test="${sessionParserId ne '8'}">
						<a href="#" id="export"><i class="glyphicon glyphicon-export custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Export" onClick="exportToExcel('<c:out value="${wqId}"/>','<c:out value="${caseId}"/>','<c:out value="${statementFormat}"/>','<c:out value="${customerId}"/>');"></i></a>
						<a href="#"><i class="glyphicon glyphicon-import custom-font pad5 cus-cls" data-toggle="tooltip" data-placement="top" title="Import" onclick="$('#importInputFile').click();"></i></a>
					    <form enctype="multipart/form-data" id="impFileForm" >
								    <input type="hidden" name="MAX_FILE_SIZE" value="20000" />
									<input type="hidden" id="encryptedWqId" name="encryptedWqId" value="${wqId}" /> 
									<input type="hidden" id="statementFormat" name="statementFormat" value="${statementFormat}" id="statementFormat" /> 
									<input type="hidden" id="encryptedCustomerId" name="encryptedCustomerId" value="${param.customerId}" /> 
									<input type="hidden" id="encryptedCompIdOrCik" name="encryptedCompIdOrCik" value="${param.compIdOrCik}" />
									<input type="hidden" id="encryptedxfileName" name="encryptedxfileName" value="${param.fileName}" />
									<input type="hidden" id="encryptedcustomerName" name="encryptedcustomerName" value="${customerName}" />
									<input type="hidden" id="encryptedbusinessName" name="encryptedbusinessName" value="${businessName}" />
									<input type="hidden" id="encryptedFillingId" name="encryptedFillingId" value="${caseId}" />
								    <input type="file" id="importInputFile" name="importInputFile" style="display: none;" onchange="importExcelFile();" />
								    
						</form>
						</c:if>
					</span>			
					
					
				</div>
			</div>
			</div><!--- panel-body -->
			</div><!--- panel-default -->
				
				<div class="" style="margin:-13px 0 0 0" id="data-div-1"></div>
			
	</div><!--- col-md-12 -->


	
	
	
	
	
	 <footer>
		<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp"></jsp:include></div>
	</footer> 

	<div id="text-file-data"></div>

<div id="loadinglayer"></div>


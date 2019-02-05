<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />  
<link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/rules_extraction_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css">
<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.custom.css" />
<script src="js/jGrowl/jquery.jgrowl.min.js"></script>
<script src="js/jquery/jquery-ui.custom.min.js"></script>
<script src="js/common.js?value=${applicationScope['version']}"></script>
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
<script src="js/jquery.darktooltip.js"></script>	
	<script>

/*This function used for click on refresh button reload rules_extraction_subpage */
	 
$(document).ready(function(){
	   // getOrigionalFileName('${customerId}');
	   var statementType = '<c:out value="${statementType}"/>';
	$("#templateFormId > li.menuItem").click(function(event)
	{
		$("#templateFormNameId").html('Template Name'  + $(event.target).text()+ ' <span class="caret mar-lt10" style="margin-left:5px"></span>');
		$("#templateFormNameId").val($(event.target).text());
		$("#templateFormId li").removeClass("active");
		$(this).addClass("active");
		callSubPage(statementType);
	});
	   getOrigionalFileName('<c:out value="${customerId}"/>','<c:out value="${wqId}"/>');
	   showConvertedFiles('${customerId}', '${wqId}');
	   
	/* var statementType='<c:out value="${param.statementType}"/>';
	   var itrCheck = '<c:out value="${statementType}"/>'; */
	   var currentStatus = '<c:out value="${currentStatus}"/>';
	   if(statementType == "ITR"){
		   statementType = 'itr';
	   }
	   else if(statementType == "pdfBasedITR"){
		statementType = 'pdfBasedITR';
	   	var selectedTemplateFormId = '<c:out value="${selectedTemplateFormId}"/>';
	    $("#templateFormNameId").html('Template Name' +$('#'+selectedTemplateFormId).text()+ ' <span class="caret mar-lt10" style="margin-left:5px"></span>');
		$("#templateFormNameId").val($('#'+selectedTemplateFormId).text());
		$("#templateFormId li").removeClass("active");
		$("#templateFormId li[id='"+selectedTemplateFormId+"']").addClass("active");
	   }
	   callSubPage(statementType);
	   uicTableDivHide();
	});

$('a[target^="_new"]').click(function(e) {
   window.open(this.href, 'newwindow', 'width=900, height=700, top=300, left=350,scrollbars=yes, resizable=yes');
   return false;
});
	
	 /* Following All javascript function used for common both pages Financial,ITR,SEC */

    function callSubPage(statementType)
    {
    	if(statementType=='Financial'){
    		showRulesExtractionSubPage('<c:out value="${fillingId}"/>','<c:out value="${customerId}"/>');
    		}else if(statementType=='itr'){
    			showITRSubPage('<c:out value="${fillingId}"/>');
    		}else if(statementType=='Bank'){
    		showBankParserSubPage('<c:out value="${fillingId}"/>');
    		}else if(statementType=='pdfBasedITR'){
    			showPDFBasedITRSubPage('<c:out value="${fillingId}"/>');
    		}
    }
    
    function refreshExtractionSubPage(fillingId){
     	var pageType=$('#pageHead').text();
   		if(pageType=='Financial'){
   			showRulesExtractionSubPage('<c:out value="${fillingId}"/>','<c:out value="${customerId}"/>');
   		}else if(pageType=='ITR'){
			showITRSubPage(fillingId);
   		}else if(pageType=='PDF Based ITR'){
			showPDFBasedITRSubPage(fillingId);
		}else if(pageType=='Bank'){
   			var fileUploadId=$("#uploadId").val();
   			showBankParserSubPage('<c:out value="${fillingId}"/>');
   		}
    }
    
    
	function showRulesExtractionSubPage(fillingId,customerId)
	{
		showLoading();
	 	var pageType=$('#pageHead').text();
		if(pageType=='Financial'){
			$('#pageHead').html("Financial").show();
	 		processData='&fillingId='+encodeURIComponent(fillingId)+'&customerId='+encodeURIComponent(customerId);
			actionUrl="rules_extraction_subpage.htm";
			successData=function(data)
			{
				$('#rules_extraction_subpage_div').html(data);
				hideLoading();
			};
			errorData=function(data)
			{
				$('#rules_extraction_subpage_div').html(data);//.show();
				hideLoading();
			};
			console.info("--------Value Validated-------");
			retDataType="html";
			callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
		}else if(pageType=='ITR'){
			showITRSubPage(fillingId);
		}else if(pageType=='PDF Based ITR'){
			showPDFBasedITRSubPage(fillingId);
		}else if(pageType=='Bank'){
			var fileUploadId=$("#uploadId").val();
			showBankParserSubPage('${fillingId}');
		}

	   

	}
   /* This function called when click On Reprocess button */
   
   function showITRSubPage(fillingId)
   {  
   			showLoading();
   			$('#pageHead').html("ITR").show();
   	 		processData='&fillingId='+encodeURIComponent(fillingId);
   			actionUrl="rules_management_itr.htm";
   			successData=function(data)
   			{
   				$('#rules_extraction_subpage_div').html(data);
   				hideLoading();
   			};
   			errorData=function(data)
   			{
   				$('#rules_extraction_subpage_div').html(data);//.show();
   				hideLoading();
   			};
   			console.info("--------Value Validated-------");
   			retDataType="html";
   			callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
   }
   
   
   function showPDFBasedITRSubPage(fillingId)
   {	
	   showLoading();
	   
   			$('#pageHead').html("PDF Based ITR").show();
   			var templateId = $("#templateFormId li.active").attr('id');
   			$('#selectedTemplateFormId').val(templateId);
   			console.log("templateId " + templateId);
   			if(templateId == undefined)
   				{
   					hideLoading();
   					return false;
   				}
   	 		processData='&fillingId='+encodeURIComponent(fillingId)+'&templateId='+templateId;
   			actionUrl="rules_management_pdfbased_itr.htm";
   			successData=function(data)
   			{
   				$('#rules_extraction_subpage_div').html(data);
   				hideLoading();
   			};
   			errorData=function(data)
   			{
   				$('#rules_extraction_subpage_div').html(data);//.show();
   				hideLoading();
   			};
   			console.info("--------Value Validated-------");
   			retDataType="html";
   			callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
   }

   /*
   This function called when parser is Bank ie parser id 6
   */
   function showBankParserSubPage(fillingId)
   {	
   			$('#pageHead').html("Bank").show();
   			var fileUploadId=$("#uploadId").val();
   			if(fileUploadId!="0"){
   			showLoading();
   			if (typeof fileUploadId === "undefined") {
   				fileUploadId="0";
   			}
   	 		
   			processData='&fillingId='+encodeURIComponent(fillingId)+'&fileUploadId='+encodeURIComponent(fileUploadId);
   			actionUrl="rules_management_bankparser.htm";
   			successData=function(data)
   			{
   				$('#rules_extraction_subpage_div').html(data);
   				hideLoading();
   			};
   			errorData=function(data)
   			{
   				$('#rules_extraction_subpage_div').html(data);//.show();
   				hideLoading();
   			};
   			console.info("--------Value Validated-------");
   			retDataType="html";
   			callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
   			}//end if
   }
   
   
   
   /* This function  called when click on reprocess button */
  function reProcessRules(){
		var reProcessType=$("#Status").val();
		if(reProcessType!='')
		{
		showLoading();
	 	var pageType=$('#pageHead').text();
	 	var uploadId="";
	 	/*Here entity id means company id*/
	 
	 	
	 	var entityId=$("input[name=etrbc_cid]").val();
	 	/*entity id blank means company id is null*/
			if(entityId=='' || typeof entityId === "undefined"){
				entityId=0;
			}
	 	if(pageType=='Financial'){
		processData="&fillingId="+encodeURIComponent('${fillingId}')+"&customerId="+encodeURIComponent('${customerId}')+"&wqId="+encodeURIComponent('${wqId}')+"&reProcessType="+reProcessType+"&uploadId="+encodeURIComponent(uploadId)+"&entityId="+encodeURIComponent(entityId);
			}else if(pageType=='Bank'){
			uploadId=$('#uploadId').val();
		    processData="&fillingId="+encodeURIComponent('${fillingId}')+"&customerId="+encodeURIComponent('${customerId}')+"&wqId="+encodeURIComponent('${wqId}')+"&reProcessType="+reProcessType+"&uploadId="+encodeURIComponent(uploadId)+"&entityId="+encodeURIComponent(entityId);
			}else{
			processData="&fillingId="+encodeURIComponent('${fillingId}')+"&customerId="+encodeURIComponent('${customerId}')+"&wqId="+encodeURIComponent('${wqId}')+"&reProcessType="+reProcessType+"&uploadId="+encodeURIComponent(uploadId)+"&entityId="+encodeURIComponent(entityId);
			}
		actionUrl="call_rule_reprocess.htm";
		
		successData=function(data)
		{
			hideLoading();
		};
		errorData=function(data)
		{
			hideLoading();
		};
		retDataType="html";
		callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
	}else{
		$.alert("Select reprocess type.");
	}
 }
   
   function discriptiveReprocessRules()
   {
			showLoading();

	   		processData="&fillingId="+encodeURIComponent('${fillingId}');

			actionUrl="call_rule_reprocess_descriptive.htm";
			
			successData=function(data)
			{
				$.alert("Request submitted successfully.");
				hideLoading();
			};
			errorData=function(data)
			{
				hideLoading();
			};
			retDataType="html";
			callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
	   
	}



	  function submitOcrType(inputOcrType)
		{
		   showLoading();
	  		    processData="&fillingId="+encodeURIComponent('${fillingId}')+"&ocrType="+encodeURIComponent(inputOcrType);
				actionUrl = "forcedOCR.htm";
				successData = function(data) {
					if(data){
						$.alert("Request submitted successfully.");
					}else{
						$.alert("Error Occured, please try again.");	
					}
					hideLoading();
				};
				errorData = function(data) {
					$.alert("error" + data);
				};
				callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);		
			
		}


	/*  This function used for submit form onclick button from rules_managegement_subpage.jpa  */
	function submitForm()
	{
		
		var pageType=$('#pageHead').text();
		if(pageType=='Financial')
		{
		   if (typeof $("input[name=pemPid]").val() === "undefined") {
			   $.alert("No change in existing records.");  	
			return true;
		   }
		 var processdata=$("#rules_mgmt_extraction").serialize();
		 var url="save_rules_management_extraction.htm";
		}else if(pageType=='ITR'){
			var processdata=$("#rules_mgmt_extraction").serialize();
	   	    var url="update_rules_management_ITR.htm";
		}else if(pageType=='PDF Based ITR'){
			if (typeof $("input[name=extractionRuleId]").val() === "undefined") {
				$.alert("No change in existing records.");  	
				return false;
			   }
			var processdata=$("#rules_mgmt_extraction").serialize();
	   	    var url="update_rules_management_pdfbased_ITR.htm";
		}else if(pageType=='Bank'){
			var processdata=$("#rules_mgmt_extraction").serialize();
	   	    var url="save_rules_management_bankparser.htm";
		}
		if(pageType=='PDF Based ITR' && !dataValidate())
			{
			$.alert("Please enter all mandetory fields data.");
				return false;
			}
		$.ajaxSetup({
			cache: true
		});
		$('#loadinglayer').css("display","block");
		   $.ajax({
		        type : "post",
		        url: url,
		        data:processdata,
		        cache: true,
		        success : function(data) {
		          $('#rules_extraction_subpage_div').html(data);
		           hideLoading(); 
		     	        },    
		        error : function(xhr, ajaxOptions, thrownError) {
		        	$.alert("Error: Extraction Rules Added Failed.");
		        	hideLoading();
		        	$('#rules_extraction_subpage_div').html(ajaxOptions);//.show();
					
		        }
		    });
		   
	}//end funcion submit form.
	function deleteRules()
	{
		showLoading();
		var pageType=$('#pageHead').text();
		var checkBoxArray=new Array();
		$("input:checkbox[id=checkbox]:checked").each(function(){
			checkBoxArray.push($(this).val());
		});
		if(checkBoxArray.length>0)
		{
		showLoading();
		 processData="param="+checkBoxArray;
		 if(pageType=='PDF Based ITR'){
		 actionUrl="deleteExtractionPdfbasedITRRules.htm";
		 }else if(pageType=='ITR'){
		 actionUrl="deleteExtractionITRRules.htm";
		 }else{
		 actionUrl="deleteExtractionRules.htm";
		 }
		 successData=function(data)
		 {
		console.info("data="+data);
		 if(data)
		 {
			 $.alert("Rules Deleted Successfully.");
			 //here need to delete row from UI.
			 $("input:checkbox[id=checkbox]:checked").each(function(){
				 $(this).parents("tr").remove();
			});
			 
		 }else{
			 $.alert("Rules deletion failed.");
		 }
		 hideLoading();
		 };
		 
		 errorData=function(data)
		 {
			 $.alert("Fail="+data);
		 	hideLoading();
		 };
		console.info("--------Value Validated-------");
		retDataType="html";
		callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
		}else
		{
			$.alert('Please select Row');
		}
		

		 hideLoading();
	}
	
	
	function dataValidate()
	{
		var status = true;
		$( ".pageNumber" ).each(function( index ) {
				$(this).closest('td').find("input").each(function() {
					var  updatedval=$(this).val();
					if(updatedval== null || updatedval == undefined || updatedval == '')
					 {
						status=false;
						return false; 
					 }
			   });	
			}); 
		
		if(status)
			{
				$( ".concept" ).each(function( index ) {
					$(this).closest('td').find("input").each(function() {
						var  updatedval=$(this).val();
						if(updatedval== null || updatedval == undefined || updatedval == '')
						 {
							status=false;
							return false; 
						 }
			    	});	
				}); 
		}
				
		return status;
	}
	</script>
	
	
 <!-- custom configuration model -->
<div id="customeConfigPoupId">
</div> 
<!-- view GlobalMeta model -->
<div id="viewGlobalPopUpId">
</div> 
   
<style>
.form-control{ height:32px !important; border-radius:3px !important; padding:2px 12px; font-size:13px;  font-family:open sans;}
.multiselect-container>li>a>label {padding: 0px 20px 0px 15px !important;}
</style>
<jsp:include page="common/appheader.jsp" >
		    <jsp:param name="pageNo" value="4"/> 
		            <jsp:param value="${caseId}" name="caseId"/>
		            <jsp:param value="${decryptedFillingId}" name="decryptedFillingId"/>
		            <jsp:param value="${decryptedCustomerName}" name="decryptedCustomerName"/>
		            <jsp:param value="${businessName}" name="bussinessName"/>
		            <jsp:param value="${decryptedCompIdOrCik}" name="decryptedCompIdOrCik"/>
		            <jsp:param value="${wqId}" name="wqId"/> 
		      		<jsp:param value="${encriptedWqEId}" name="encriptedWqEId" />
		   </jsp:include>	
		<section>
			<div class="container-fluid mar-top80 rmDiv">
				<div class="row">
					<div class="col-md-6"><h4 id="pageHead" class="font16 mar-top8">Financial</h4></div>
				<form name="rules_mgmt_extraction" id="rules_mgmt_extraction" action="" method="POST">
			<div class="col-md-12 mar-negi4">
			<div class="panel panel-default">
			<div class="panel-body custom-padding">
				
				<div class="row" style="margin-right:-18px !important">
				<div class="col-md-12">
				 <input type="hidden" name='filingId' id='filingId' value="${decryptedFillingId}"/>
				 <input type="hidden" name='encryptedFilingId' id='encryptedFilingId' value="${caseId}"/>
				 <input type="hidden" name='customerId' id='customerId' value="${customerId}"/>
				 <input type="hidden" name='wqId' id='wqId' value="${wqId}"/>
				 <input type="hidden" name='selectedTemplateFormId' id='selectedTemplateFormId' value="${selectedTemplateFormId}"/>
					<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top6">Process: </label></span>
					<span class="pull-left mar-rt5">
					<select name="Status" class="status form-control wdt-180" id="Status">
				      <option value="">Select</option>
					  <option value="Reprocess">Reprocess</option>
					  <option value="REEXTRACTION">ReExtraction</option>
				     </select>
					</span>
					<span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" value="Submit" onclick="return reProcessRules();" /></span>
					<!-- <span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" value="Forced OCR"  onclick="return forcedOCR();" /></span> -->					
					<!-- <span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" value="Discriptive Reprocess" onclick="return discriptiveReprocessRules();"/></span> -->
 						<span class="dropdown pull-left mar-rt5">
						<a href="#" class="btn btn-primary" dropdown-toggle" data-toggle="dropdown"><i class="glyphicon" style="padding:0 5px 0 0"></i>Forced OCR<b class="caret" style="margin-left:5px"></b></a>
							<ul class="dropdown-menu">
							<li><a href="#" onclick="return submitOcrType('IMAGE');"><b>Image</b>&rarr;<b> OCR</b></a></li>
						  	<li><a href="#" onclick="return submitOcrType('TEXT');"><b>Text</b>&rarr;<b> Image</b>&rarr;<b> OCR</b></a></li>
						   	</ul>
						</span>	
					  <c:if test="${USERACCESS eq '1' || USERACCESS eq '2'}">
					   <c:if test="${statementType eq 'Financial'}">
					  <span class="dropdown pull-left mar-rt5">
						<a href="#" class="btn btn-primary" dropdown-toggle" data-toggle="dropdown"><i class="glyphicon" style="padding:0 5px 0 0"></i>View/Update Metadata<b class="caret" style="margin-left:5px"></b></a>
							<ul class="dropdown-menu">
							<li><a href="#" onclick="updateRulesAtGlobalLevel();">Update Global Metadata</a></li>
						  	<li><a href="#" onclick="viewGlobalMetadata();">View Global Metadata</a></li>
						   	</ul>
						</span>	
						</c:if>
					</c:if>
					<c:if test="${statementType eq 'Financial'}">
					  <span class="pull-left mar-rt5"><a href="javascript:void(0);" class="btn btn-info" data-toggle="modal"  onclick="showCustomConfigPoupUp('${decryptedFillingId}');"><i class="fa fa-th" style="padding:0 5px 0 0"></i>Custom Configuration</a></span>
					  </c:if>				
					 <c:if test="${statementType eq 'pdfBasedITR'}">
				  		<div class="dropdown pull-left">
						  <button class="btn btn-primary dropdown-toggle" id="templateFormNameId" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							Template Name
							<span class="caret mar-lt10" style="margin-left:5px"></span>
						  </button>
						  <ul id="templateFormId" class="dropdown-menu">
								<li class="active" style="display:none"></li>
								<c:forEach var="templateListObject" items="${itrTemplateFormMetadataList}">
							  		<li class="menuItem" value="${templateListObject.templateId}" id="${templateListObject.templateId}">${templateListObject.templateName}</li>
							  	</c:forEach>
						 </ul>
						</div> 
					  </c:if>
					
					 <span class="pull-right">
						<a href="#"><i class="fa fa-save custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Save" onclick="return submitForm();"></i></a>
						<a href="#"><i class="fa fa-trash custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Remove" id="DeleteButton" onClick="deleteRules();" ></i></a>
 					    <c:if test="${statementType eq 'ITR'}">
    						<a href="#"><i class="fa fa-plus custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Add" onClick="addITRRow()"></i></a>
   						</c:if>
						<a href="#"><i class="fa fa-refresh custom-font pad5 cus-cls" data-toggle="tooltip" data-placement="top" title="Refresh" onclick="return refreshExtractionSubPage('${fillingId}')"></i></a>
					</span>
					
				</div>
			</div>
			</div><!--- panel-body -->
			</div><!--- panel-default -->
			
			<div class="row mar-top-negi16">
				<div class="col-md-12">
					<!-- Here add rules_extraction_subpage.jsp -->
						<div id="rules_extraction_subpage_div"></div>
					<!-- End add rules_extraction_subpage.jsp -->
				</div>
			</div>	
			</div><!-- row -->
			</form>
			</div><!-- container-fluid -->
			</div>	
		</section>
		 <footer>
			<div class="footer_wpr main-doc-width"> <jsp:include page="footer.jsp" ></jsp:include></div>
		</footer> 
        <!-- <script src="js/bootstrap.min.js"></script> -->
        <script src="assets/js/docs.min.js"></script>
        
 
<div id="loadinglayer"></div>


<style>
.active{background:#ddf9ff;}
#templateFormId li{border-bottom:1px solid #ccc; padding:5px}

</style>
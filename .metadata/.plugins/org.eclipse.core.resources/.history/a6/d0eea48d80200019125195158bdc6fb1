/**************************** Ajax Call Functionality **************************************/
var processData;
var suceessData; 
var errorData;
var beforeSend;
var actionUrl; 
var reqType;
var retDataType;
var timeOut;
var urlDynamic;
var win1 ;
var strurl;
var allowAccess;
var strValuex='';
var parametersDynamic='';
/*var noteText="0";*/


function setAnchorPosition(strValue)
 {
   strValuex = strValue;  
 }
  
function getPosition(element){
      var e = document.getElementsByName(element)[0];
      var left = 0;
      var top = 0;
      do{
          left += e.offsetLeft;
          top += e.offsetTop;
      }while(e = e.offsetParent);
      return [left, top];
  }
  
function openURLInNewWindowForAnchor(strURL,anchorTag)
{
  strurl = insertParam(strURL);
  if( strValuex == '')
	{
		var win = window.open(strurl+"#"+anchorTag, '_new','Anchor File','width=1200,height=800');
		win.focus();
	}
  else
	{		 
	 	var win = window.open("", '_new','Anchor File','width=1200,height=800');
	 	win.document.body.innerHTML = strValuex;
	 	this_obj  = win.document.getElementsByName(anchorTag)[0];
	 	setTimeout(function() {
	 		this_obj.scrollIntoView();
	 	}, 100);
	}
}


function globalHideShow(activeDivId, activeGroup)
{
	$(".tabOption").each(function(){
		var activeDivLink = activeDivId.split("Div")[0] + "Link" ;
		if ($(this).hasClass(activeGroup)){
			if ($(this).parent().attr("id") == activeDivLink ){
				$(this).addClass("active");
			}else{
				$(this).removeClass("active");
			}
			$(this).parent().show();
		}else{
			$(this).parent().hide();
		}
	});
	$(".lsContentDiv").each(function(){
		if($(this).attr("id") == activeDivId)
			$("#"+$(this).attr("id")).show();
		else
			$("#"+$(this).attr("id")).hide();	
	});
}

function globalHideShow(activeDivId)
{
	$(".lsContentDiv").each(function(){
		if($(this).attr("id") == activeDivId)
			$("#"+$(this).attr("id")).show();
		else
			$("#"+$(this).attr("id")).hide();	
	});
}
  
function setLocationHref(strURL)
{
	console.info("in setLocationHref=1");
	if(strURL=='welcome.htm')
		{
			sectionMap = {};
		}
	strurl = insertParam(strURL);
	window.location = strurl;
}
function setLocationHref(strURL, activeDivId)
{
	if(strURL=='welcome.htm')
	{
			sectionMap = {};
	}
	else if(strURL=='logout.htm')
	{
		
		window.location.href = strURL;
		return false;
		
	}
	strurl = insertParam(strURL);
	if(strURL=='welcome.htm' || strURL.indexOf('normalizedViewExportToExcel.htm')!=-1 || strURL.indexOf('exportToExcel.htm') != -1 || 
			strURL.indexOf('documentUploadList.htm')!=-1 ||
			strURL.indexOf('normalizationExportTemplate.htm')!=-1 ||
			strURL.indexOf('normalizationTemplateExportToExcel.htm')!=-1 ||
			strURL.indexOf('downloadNormalizationTemplate.htm')!=-1 || strURL.indexOf('forgotPwd.htm')!=-1  
			|| strURL.indexOf('exportFinancialItemExcel.htm')!=-1 || strURL.indexOf('downloadCRTemplate.htm')!=-1){
		window.location = strurl;
	  }
	else{
	ajaxCallforAll(strurl,parametersDynamic);
   }
	menuActive(activeDivId);
 }

function openURLInNewWindow(strURL)
{
	strurl = insertParam(strURL);
	var win = window.open(strurl, '_blank');
	win.focus();
}

function  getText()
 {
	 alert(win1.document.body.innerHTML);
 }

function openURLInNewWindowForTextFile(strURL){
	strurl = insertParam(strURL);
	var win = window.open(strurl, '_blank','TextFile','width=1200,height=800');
	win.focus();	
}



function insertParam(strurl) {
	return strurl;
}

function callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType)
{
	actionUrl = insertParam(actionUrl);
	var parametersTokenVal=processData;
	$.ajaxSetup({
		cache: true
	});
		$.ajax({
		type:'POST',
		url:actionUrl,
		beforeSend:beforeSend,
		data:parametersTokenVal ,
		success:successData,
		error:errorData,
		dataType:retDataType,
		async:true,
		cache:true
	});  
	
	emptyAjaxVar();
}


function callAjaxGet(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType)
{
	actionUrl = insertParam(actionUrl);
	var parametersTokenVal=processData;
	$.ajaxSetup({
		cache: true
	});
		$.ajax({
		type: 'GET',
		url: actionUrl,
		beforeSend:beforeSend,
		data:parametersTokenVal ,
		success: successData,
		error: errorData,
		dataType:retDataType,
		async:true,
		cache: true
	});  
	
	emptyAjaxVar();
}

function emptyAjaxVar()
{
	processData="";
	suceessData=""; 
	errorData="";
	beforeSend="";
	actionUrl=""; 
	retDataType="";
	timeOut=100000;	

}

/************* Validation Functions *******************************************/

function checkNotEmpty(value)
{
	var checkValue=value;
	if(checkValue && checkValue.trim().length)
		return true;
	else
		return false;
}


/************************* Utility Functions *********************/

function createDateTime(timestamp)
{
	var date=new Date(timestamp);
	 var day=date.getDate();
	 var month=date.getMonth()+1;
	 var year=date.getFullYear();
	 var hr=date.getHours();
	 var ss=date.getSeconds(); 
	 date=day+"-"+month+"-"+""+year+" "+hr+":"+ss;
	 return date;
}

/************************* File Data *********************************/

function getDataFromTextFile(fileName,customerId)
{
	actionUrl="readFile.htm";
	processData="FileName="+encodeURIComponent(fileName)+"&customerId="+encodeURIComponent(customerId);
	retDataType='html';
	successData=function(data)
	{	 
		$("#text-file-data").html(data).hide(); 
	};
	errorData=function(data)
	{
		$("#text-file-data").html(data).hide();
	};
	if(checkNotEmpty(fileName))
	{
		callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
	}
	else
	{
		$("#text-file-data").text("Not Valid FileName");
	} 
}



function showDataFileWindow(fileName)
{
	var fileWindow = window.open(fileName, "_blank", "toolbar=No, scrollbars=yes, resizable=yes, top=50, left=100, width=1000, height=500");
	fileWindow.document.write($('anchor-data-file').text());
}
/*
 * This function used for show Converted files 
 */
function showConvertedFiles(customerId, wqId){
	processData="&customerId="+customerId+"&wqId="+wqId;
	actionUrl="getConverted_FileNames.htm";
	successData=function(data)
	{
		$('#ConvertedFilesDoc').html(data);
	};
	errorData=function(data)
	{
		$('#ConvertedFilesDoc').html(data);//.show();
	};
	retDataType="html";
	callAjaxGet(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
}



/*
 * This function used for show showOrgionalFile  files from file info tab 
 */
function showConvertedFilesInTab(fileName, customerId,wqId,flag)
{
	var url="showOrgionalFile.htm?fileName="+encodeURIComponent(fileName)+"&customerId="+encodeURIComponent(customerId)+"&wqId="+encodeURIComponent(wqId)+"&flag="+encodeURIComponent(flag);
	filesDownloads(url);	
}

function showOrgionalFile(fileName, customerId)
{
	var url="showOrgionalFile.htm?fileName="+encodeURIComponent(fileName)+"&customerId="+encodeURIComponent(customerId);
	filesDownloads(url);
}


function showTextFilePopupwindow(customerId, wqId,fillingId,fileFlag)
{
	openURLInNewWindowForTextFile("showTextFile.htm?customerId="+encodeURIComponent(customerId)+"&wqId="+encodeURIComponent(wqId)+"&fillingId="+encodeURIComponent(fillingId)+"&fileFlag="+encodeURIComponent(fileFlag));
}

/*
 * This function used for show show anchor file on rules managementpage 
 */
function showAnchorFile(customerId,wqId,fillingId,Anchor)
{
	openURLInNewWindowForAnchor("showAnchorFile.htm?customerId="+encodeURIComponent(customerId)+"&wqId="+encodeURIComponent(wqId)+"&fillingId="+encodeURIComponent(fillingId)+"&Anchor="+encodeURIComponent(Anchor),Anchor);
}

function showConvertedFilesPopup() {
	$('#ConvertedFilesDoc').show();
}
function hideConvertedFilesPopup() {
	$('#ConvertedFilesDoc').hide();
}
function getOrigionalFileName(customerId, wqId)
{
			processData="&customerId="+encodeURIComponent(customerId)+"&wqId="+encodeURIComponent(wqId);
			actionUrl="getOriognal_FileName.htm";
			successData=function(data)
			{
				$('#orgDoc').html(data);
			};
			errorData=function(data)
			{
				$('#orgDoc').html(data);
			};
			retDataType="html";
			callAjaxGet(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
}


function showAnchorDataFileWindow(anchor)
{
	var lnkscript='<script src="js/uic/jquery-2.1.1.min.js"></script>';
	var script="<script>" +
			"function getFocus(anchor){var x=document.getElementsByName(anchor);" +
			"if(x.length>0){var SupportDiv = x[0];window.scroll(0,findPos(SupportDiv));" +
			"SupportDiv.css('background-color','yellow');SupportDiv.focus();SupportDiv.scrollintoview();}" +
			"else{var SupportDiv = x[0];window.scroll(0,findPos(SupportDiv));" +
			"SupportDiv.css('background-color','yellow');SupportDiv.focus();SupportDiv.scrollintoview();" +
			"}" +
			"}" +
			"function findPos(obj){var curtop = 0;" +
			"if (obj.offsetParent) {" +
			"do {curtop += obj.offsetTop;" +
			"} while (obj = obj.offsetParent);" +
			"return [curtop];" +
			"	}" +
			"}"+
			"$(document).ready(function(){	getFocus('"+anchor+"'); });"+"<"+"/script>";
	var x=window.open();
	x.document.write($('anchor-data-file').text()+lnkscript+script);
	x.document.close();
}
 
function getDataFromAnchorTextFile(customerId,fillingId)
{
	actionUrl="readAnchorFile.htm";
	processData="fillingId="+encodeURIComponent(fillingId)+"&customerId="+encodeURIComponent(customerId)+"&wqId=0";
	retDataType='html';
	successData=function(data)
	{
		$("anchor-data-file").text(data).hide(); 
		
	};
	errorData=function(data)
	{
		$("anchor-data-file").text(data).hide();
	};
	if(checkNotEmpty(fillingId) && checkNotEmpty(customerId))
	{
		callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
	}
	else
	{
		$("anchor-data-file").text("Not Valid FileName");
		
	} 
}


/************ Loading window **************/
function showLoading(){
	$('#loadinglayer').css("display","block");  
}

function hideLoading(){
	$('#loadinglayer').css("display","none");
}

function showStmntlblhs(thisObj, index){
	$(".stmnt-attr_"+index).slideToggle();
	$(thisObj).toggleClass("hide-stmnt-attr");
}

function showStmntlbl(){
	$(".stmnt-attr").slideToggle();
	$(".show-stmnt-attr").toggleClass("hide-stmnt-attr");
}

/* ** Start-Modify Status function ** */
function modifyStatus()
{
	showLoading();
	var statusName=$("#Status option:selected").text();
	var customerId = $('#customerId').val();
	var fillingId=$('#encryptedFilingId').val();
	var wqId = $('#wqId').val();
	processData="&fillingId="+encodeURIComponent(fillingId)+"&customerId="+encodeURIComponent(customerId)+"&wqId="+encodeURIComponent(wqId)+"&statusName="+encodeURIComponent(statusName);
	actionUrl="modify_status.htm";
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
}
function columnMerge()
{
	var fillingId=$('#encryptedFilingId').val();
	var statementFormat=$('#statementFormat').val();
	processData="&fillingId="+encodeURIComponent(fillingId)+"&statementFormat="+encodeURIComponent(statementFormat);
	actionUrl="column_Merge.htm";
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
}


function executeNormalisedTemplate(type, filingId,templateId){
	var industry="Normalized Template"+"-"+type;
	$("#selectedValueForNormalizedTemplateId").html(industry);
	showLoading();
	
	processData='&filingId='+encodeURIComponent(filingId)+'&type='+encodeURIComponent(type)+'&templateId='+encodeURIComponent(templateId);
	actionUrl="normalizeTemplate.htm";
	successData=function(data)
	{
		if (data =="true"){
			$('#refreshBtn').click();
		}else{
		}
		hideLoading();
	};
	errorData=function(data)
	{
		alert("Failed to execute the process");
		hideLoading();
	};
	retDataType="html";
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
}


function callRulesManageMentPage(fillingId,WqId,customerName,businessName,fileName,customerId,statementType,compIdOrCik,parserId,activeDivId)
{
	if(parserId=='6'){
		statementType="Bank";
	}else if(parserId=='4'){
		statementType="ITR";
	}else if(parserId=='24'){
		statementType="pdfBasedITR";
	}else{
		statementType="Financial";
	}

	urlDynamic=insertParam("rules_management_extraction.htm");
	parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&fileName="+encodeURIComponent(fileName)+"&customerId="+encodeURIComponent(customerId)+"&statementType="+encodeURIComponent(statementType)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
    ajaxCallforAll(urlDynamic,parametersDynamic);	
}
function callNormalizationPage(fillingId,WqId,statementFormat,customerName,businessName,customerId,fileName,compIdOrCik)
{
	 urlDynamic=insertParam("rules_management_normalization.htm");
	 parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat="+encodeURIComponent(statementFormat)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik); 
	 ajaxCallforAll(urlDynamic,parametersDynamic);
}

function callQACheckListPage(fillingId,WqId,customerName,businessName,fileName,customerId,compIdOrCik,activeDivId)
{
	urlDynamic=insertParam("qamessage_checklist.htm");
	parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&fileName="+encodeURIComponent(fileName)+"&customerId="+encodeURIComponent(customerId)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
	ajaxCallforAll(urlDynamic,parametersDynamic);
}


function callNormalizationviewPage(fillingId,WqId,customerName,businessName,fileName,customerId,compIdOrCik,activeDivId){
	showLoading();
			 try{
				$.ajaxSetup({
					 async:false,
					 cache: true
				});

				var statementFormat = 'IS';
				if (parserId == '18') {
					statementFormat = 'DOS';
				}
					/*if  parser id is 6 ie bank parser then show AccountSummary by default*/
					if(parserId=='6'){
						urlDynamic=insertParam("bank_normalization_view.htm");
						parametersDynamic="accId=null&fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
						ajaxCallforAll(urlDynamic,parametersDynamic);
					}
					else {
						urlDynamic=insertParam("normalization_view.htm");
						parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&fileName="+encodeURIComponent(fileName)+"&customerId="+encodeURIComponent(customerId)+"&compIdOrCik="+encodeURIComponent(compIdOrCik)+"&statementFormat="+encodeURIComponent(statementFormat);
						ajaxCallforAll(urlDynamic,parametersDynamic);
					}
			 }catch(e){
				 
				 setLocationHref("login.htm","");
			 }	
		//hideLoading();
}	 


function displayExtractionSuccess(fillingId, WqId, statementFormat, customerName, businessName, customerId, fileName, compIdOrCik){
	showLoading();
	processData='wqId='+encodeURIComponent(WqId)+"&fillingId="+encodeURIComponent(fillingId);
	actionUrl="validateWqId.htm";
		 successData=function(data)
			{
			 try{
				result=JSON.parse(data);
				/***** check result success *********************/
				$.ajaxSetup({
					 async:false,
					 cache: true
				});
				if(result.hasOwnProperty('validateWqIdFlag'))
				{
					validateWqIdFlag=result['validateWqIdFlag'];
				}
				if(result.hasOwnProperty('parserId'))
				{
					parserId=result['parserId'];
				}
				if(result.hasOwnProperty('allowAccess'))
				{
					allowAccess=result['allowAccess'];
				}
				if(validateWqIdFlag){
					alert("The case is being used by other user.");
				}
				else if(!allowAccess){
					alert("Case is not assigned");
				}
				else{
							/*<!-- if  parser id is 6 ie bank parser then show AccountSummary by default and parser id is 8 for AP File parser -->*/
							if(parserId=='6'){
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=AccountSummary&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");	
							}else if(parserId=='8'){
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=VendorAddress&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");
							}else if(parserId=='9'){
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=NMP&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");
							}else if(parserId=='10'){
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=Key Developments&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");
							}else if(parserId=='20'){
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=Broker Position&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");
							}else if(parserId=='13'){
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=Valuation Summary&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");
							}else if(parserId=='18'){
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=DOS&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");
		 					}
							else{
								parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&statementFormat=IS&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
								urlDynamic = insertParam("rules_management_normalization.htm");	
							}
							 ajaxCallforAll(urlDynamic,parametersDynamic);	
				}
					
			 }catch(e){
				 window.location.href = insertParam("login.htm");
			 }	
		hideLoading();

	};
	errorData=function(data)
	{
		alert("Failed to execute the process");
		hideLoading();
	};
	retDataType="html";
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
}




function displayExtractionFailure(fillingId,WqId,statementFormat,customerName,businessName,customerId,fileName,compIdOrCik){
	showLoading();
	processData='wqId='+encodeURIComponent(WqId)+"&fillingId="+encodeURIComponent(fillingId);
	actionUrl="validateWqId.htm";
	 successData=function(data)
		{
		 try{
			result=JSON.parse(data);
			/***** check result success *********************/
		
			$.ajaxSetup({
				 async:false,
				 cache: true
			});
			
			if(result.hasOwnProperty('validateWqIdFlag'))
			{
				validateWqIdFlag=result['validateWqIdFlag'];
			}
			if(result.hasOwnProperty('parserId'))
			{
				parserId=result['parserId'];
			}
			if(result.hasOwnProperty('allowAccess'))
			{
				allowAccess=result['allowAccess'];
			}
			if(validateWqIdFlag){
				alert("The case is being used by other user.");
			}
			else if(!allowAccess){
				alert("Case is not assigned");
			}else
			{
				if(parserId=='6'){
					statementType="Bank";
				}else if(parserId=='4'){
					statementType="ITR";
				}else if(parserId=='24'){
					statementType="pdfBasedITR";
				}else{
					statementType="Financial";
				}
				parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&statementType="+encodeURIComponent(statementType)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
				urlDynamic = insertParam("rules_management_extraction.htm");	
				ajaxCallforAll(urlDynamic,parametersDynamic);
			}
		 }catch(e){
			 window.location.href = insertParam("login.htm");
		 }	
		hideLoading();
	};
	errorData=function(data)
	{
		alert("Failed to execute the process");
		hideLoading();
	};
	retDataType="html";
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
}

function displayNormalizedView(fillingId, WqId, statementFormat, customerName, businessName, customerId, fileName, compIdOrCik){

	showLoading();
	processData='wqId='+encodeURIComponent(WqId)+"&fillingId="+encodeURIComponent(fillingId);
	actionUrl="validateWqId.htm";
	 successData=function(data)
		{
		 try{
			result=JSON.parse(data);
		
			/***** check result success *********************/
		
			$.ajaxSetup({
				 async:false,
				 cache: true
			});
			
			if(result.hasOwnProperty('validateWqIdFlag'))
			{
				validateWqIdFlag=result['validateWqIdFlag'];
			
			}
			if(result.hasOwnProperty('parserId'))
			{
				parserId=result['parserId'];
			}
			if(result.hasOwnProperty('allowAccess'))
			{
				allowAccess=result['allowAccess'];
			}
			if(validateWqIdFlag){
				alert("The case is being used by other user.");
			}
			else if(!allowAccess){
				alert("Case is not assigned");
			}
			else{
						var statementFormat='IS';
						if(parserId=='18'){
						statementFormat='DOS';
						}
						if(parserId=='6'){
							parametersDynamic="accId=null&fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
							urlDynamic   = insertParam("bank_normalization_view.htm");
						}else{
							parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik)+"&statementFormat="+encodeURIComponent(statementFormat);
							urlDynamic=insertParam("normalization_view.htm");
						}
	 				 ajaxCallforAll(urlDynamic,parametersDynamic);
		
				}
		 }catch(e){
			 window.location.href =insertParam("login.htm");
		 }	

	  
	hideLoading();

};
	errorData=function(data)
	{
		alert("Failed to execute the process");
		hideLoading();
	};
	retDataType="html";
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);	
}

function displayQamessageChecklist(fillingId,WqId,statementFormat,customerName,businessName,customerId,fileName,compIdOrCik){
	showLoading();
	processData='wqId='+encodeURIComponent(WqId)+"&fillingId="+encodeURIComponent(fillingId);
	actionUrl="validateWqId.htm";
	 successData=function(data)
		{
		 try{
			result=JSON.parse(data);
			/***** check result success *********************/
			$.ajaxSetup({
				 async:false,
				 cache: true
			});
			
			if(result.hasOwnProperty('validateWqIdFlag'))
			{
				validateWqIdFlag=result['validateWqIdFlag'];
			}
			if(result.hasOwnProperty('parserId'))
			{
				parserId=result['parserId'];
			}
			if(result.hasOwnProperty('allowAccess'))
			{
				allowAccess=result['allowAccess'];
			}
			if(validateWqIdFlag){
				alert("The case is being used by other user.");
			}
			else if(!allowAccess){
				alert("Case is not assigned");
			}
			else
			{

				urlDynamic=insertParam("qamessage_checklist.htm");
				parametersDynamic="fillingId="+encodeURIComponent(fillingId)+"&WqId="+encodeURIComponent(WqId)+"&customerName="+encodeURIComponent(customerName)+"&businessName="+encodeURIComponent(businessName)+"&customerId="+encodeURIComponent(customerId)+"&fileName="+encodeURIComponent(fileName)+"&compIdOrCik="+encodeURIComponent(compIdOrCik);
				ajaxCallforAll(urlDynamic,parametersDynamic);
			}
		 }catch(e){
			 window.location.href = insertParam("login.htm");
		 }	

		hideLoading();
	
	};
	errorData=function(data)
	{
		alert("Failed to execute the process");
		hideLoading();
	};
	retDataType="html";
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
}

function ajaxCallforAll(urlDynamic,parametersDynamic){
		showLoading();
		var parametersTokenVal=parametersDynamic;
		$.ajaxSetup({
			cache: true
		});
		setTimeout(function(){
	$.ajax({
		 type: "POST",  
		   url: urlDynamic,
		   data: parametersTokenVal,
		  contentType: "application/x-www-form-urlencoded;charset=utf-8",
		  async: false,
		  cache: true,
		  beforeSend: function () {
			  showLoading();
		    },
		 success: function(data){
			 hideLoading();
			 $("#mainPageDiv").html("");
			 $("#mainPageDiv").html(data);
		},error: function(data) {
			alert("error");
			hideLoading();
		}	
	});
	},10);
}
 

/**
 * This is common function used on bulkupload.jsp and report.jsp 
*/
/* This function used for get industry list based on portfolio id */

function getIndustryList(portfolioId){
	 $('.inputsource').addClass('loadinggif'); 
var industryList='<option value="0">Select</option>';
 if(portfolioId!=""){ 
	 processData="portFolioId="+encodeURIComponent(portfolioId);
 	actionUrl="getIndustryList.htm";
 	successData=function(data)
 	{
 		data = $.parseJSON(data);
 		$.each(data, function(i, item) {
 		    industryList += '<option value='+item.industryTypeId+'>'+item.industryName+'</option>';
 		});
 		$("#industryType").html(industryList); 
 		$('.inputsource').removeClass('loadinggif');	
 	};
 	errorData=function(data)
 	{
 		alert("error while uploading industry type.");
 	};
 	
 
 	retDataType='html';
 	callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
}
}

/* --------------fileInfoTab Functions -------------------  */

$('a[target^="_new"]').click(function(e) {
	   window.open(this.href, 'newwindow', 'width=900, height=700, top=300, left=350,scrollbars=yes, resizable=yes');
	   return false;
	});


//note Text for default
function calCompanyNotes(wqEid){	
	if(wqEid==''){
	alert('Error..');
	 $(".popover").hide();	
	}else{
	calNoteText(wqEid);	
	}
}


function calNoteText(wqEid){	
	var processData='&encriptedWqEId='+wqEid;
	actionUrl="filesInfo_notesText.htm";
	successData=function(data)
	{
	$("#noteTxId").val(data);
	$("#noteOldTxt").val(data);
	};
	errorData=function(data)
	{
		alert("error"+data);
	};
	if(processData=='')
	{
		console.info("data is empty");
	}
	else
	{
	console.info(processData);
	callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);		
	}	
	
}

function close_popover (){
	 $(".popover").hide();		
}

function saveNotes(){ 
	$("#noteContent").hide();	
	   var newTxid=$("#noteTxId").val();
		var oldTxid=$("#noteOldTxt").val();
		if(newTxid.trim()==oldTxid.trim()){
			return false;
		}
	   var processData=$('#notes-form').serialize();
		actionUrl="notes_Save.htm";
		successData=function(data)
		{
		$("#noteTxId").val(data);
		$("#noteOldTxt").val(data);
		noteText="1";
		};
		errorData=function(data)
		{
			alert("error"+data);
		};
		if(processData=='')
		{
			console.info("data is empty");
		}
		else
		{
		console.info(processData);
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);		
		}
		$('.popover').fadeOut();
	}
	
	function highlightedFiles(){
		 showLoading();
		var customerId = $('#customerId').val();
		  var wqId = $('#wqId').val();
		 var processData='&customerId='+customerId+'&wqId='+wqId;
		 actionUrl="getHighlighted_FileNames.htm";
		successData=function(data)
		{
			var flag =data.flag;
			$("#HighlightedFiles-modal").modal('show');
			$('#HighlightedFilesDoc').empty();
	    if(flag){
			var fileList =data.existsHighlightedList;
			var encryptedcustomerId =data.encryptedcustomerId;
			var encryptedWqId =data.encryptedWqId;
			var filesize=fileList.length;
			 $.each(fileList , function( key, value ) {	
		      $('#HighlightedFilesDoc').append('<a href="#" style="text-decoration:underline" onclick="showConvertedFilesInTab(\''+value+'\',\''+encryptedcustomerId+'\',\''+encryptedWqId+'\',\'3\')" >'+value+'</a>' );
				if(filesize > 1 ){
				 $('#HighlightedFilesDoc').append(' |');
				}     
		});
		}else{
			$('#HighlightedFilesDoc').append("Requested file does not exist.");
		}
	    hideLoading();
		};
		errorData=function(data)
		{
			alert("error"+data);
			hideLoading();
		};
		console.info(processData);
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);	

	}


	//download on same browser
	function filesDownloads(url){
	$.fileDownload(url).fail(function() {
		$.alert({
		    content: 'File does not exist on server',
		});
	});
	}

	function checkNumaricRules(value)
	{
		value=value.trim();
		if(value!='')
		{		
		var numaricString = generateNumberForUS(value);
		if(checkNumber(value))
			{
				return true;			
			}
		numaricString = generateNumberForSpanish(value);
		if(checkNumber(generateNumberForSpanish(value)))
			{
				return true;
			}
		return false;
		}
		return true;
	}
	
	function generateNumberForSpanish(value)
	{
		value = value.replace(/,/g, '#');
		value = value.replace(/\./g, ',');
		value = value.replace(/#/g, '.');  
	    return value;
	}
	
	function generateNumberForUS(value)
	{
	    return value;
	}
	
	function checkNumber(number)
	{
		var regex = /(?=.)^\$?(^[-]?([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+)?(\.[0-9]{1,10})?$/;
		return regex.test(number); 
	}
function menuActive(activeDivId){
	 $(".uicTableDiv").hide();
	 $(".navbar-nav li").each(function(n) {
	        $(this).removeClass("active");
	     })
	if(activeDivId!=''){     
	$("#"+activeDivId).addClass('active');  	
	}
}

function uicTableDivHide(){
$(".uicTableDiv").hide();
}
	

function addThousandsSeparator(input) {
    var output = input
	var minussign='';
    if (input<0){
    	input=Math.abs(input);
    	output = input;
    	minussign="-";
    }  
    if (parseFloat(input)) {
        input = new String(input); // so you can perform string operations
        var parts = input.split("."); // remove the decimal part
        parts[0] = parts[0].split("").reverse().join("").replace(/(\d{3})(?!$)/g, "$1,").split("").reverse().join("");
        output = parts.join(".");
    }

    return minussign+output;
}

function formatNumber(num) {
	try {
		var x = num.split('.');
		var x1 = x[0];
		var x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2;
	} catch (e) {
		return "";
	}
}

function showChildItems(nivId,niItem,filingId,encryptedFilingId){
	showLoading();
	
	$('#QAChecksChildClickDivId').html('');
	processData = '&nivId=' + encodeURIComponent(nivId)+'&niItem='+encodeURIComponent(niItem);
	
	
	actionUrl = "showChiledItems.htm";
	var htmlString="";
	successData = function(data) {
		try{
			var htmlString="";
			var parserOutputObj;
			
			htmlString =htmlString+ "<div class='tab-pane fade in active' id='click_back_panel'>";	
			htmlString =htmlString+ "<div class='container-fluid'>";		
			
			htmlString =htmlString+ "<div class='row'>";
			htmlString =htmlString+ "<div class='col-md-4' id='childItems'>";
			htmlString =htmlString+ "<div class='panel panel-default'>";
			htmlString =htmlString+ "<div class='panel-body'>";
			
			
			htmlString =htmlString+ "<table width='100%' border='0' cellspacing='1' cellpadding='5'  style='margin-top:-1px; border-spacing:1px;' bgcolor='#006995' id='normChildTable' class='table table-bordered tblstyle1 fancyTable tblstyle newtable'>";
			htmlString =htmlString+"<thead>";
			htmlString =htmlString+"<tr class='throw'>";
			htmlString =htmlString+"<th align='center' class='blue-th' id='asRepLabel'><strong>As Reported in Financial Statement</strong></th>";
			htmlString =htmlString+"<th align='center' class='blue-th' id='section'><strong>Section</strong></th>";
			htmlString =htmlString+"<th align='center' class='blue-th' id='niValue'><strong>Value</strong></th>";
			htmlString =htmlString+"</tr>";
			htmlString =htmlString+"</thead>";
			htmlString =htmlString+"<tbody>";
			for(var i=0;i<data.poObject.length;i++){
	           	parserOutputObj=data.poObject[i];
	           	htmlString =htmlString+"<tr class=' poRow'>";
	           	if(parserOutputObj.isParent==='Y' && i==0)
            	{
	           		htmlString=htmlString+"<td align='left'>"+parserOutputObj.asRepLabel+"</td>";
	           	}else{
            		if(parserOutputObj.poFilerReported==='C'){
            			htmlString=htmlString+"<td align='left'><p style='padding-left:16px'>Less: "+parserOutputObj.asRepLabel+"</td>";
            		}else{
            			htmlString=htmlString+"<td align='left'><p style='padding-left:16px'>Add: "+parserOutputObj.asRepLabel+"</td>";
            		}
            		
            	}
	           	htmlString=htmlString+"<td align='left' nowrap='wrap'>"+parserOutputObj.section+"</td>";
	        	htmlString=htmlString+"<td align='left'>";
	           	if(parserOutputObj.isCoordinateExists==='Y'){
	           		htmlString=htmlString+"<a href='#' onclick=\"callPdfForClickBackFromQARolledup('"+encryptedFilingId+"','"+parserOutputObj.clickbackCoordinates+"','"+parserOutputObj.uploadId+"');\"> $"+$.trim(formatNumber(parserOutputObj.asRepValue))+"</a>";
	           	}else{
	           		if($.trim(parserOutputObj.asRepValue) == ''){
	           			htmlString=htmlString+"$"+$.trim(formatNumber(parserOutputObj.asRepValue));
	           		}else{
	           			htmlString=htmlString+parserOutputObj.asRepValue;
	           		}
	           	}
	           	htmlString=htmlString+"</td>";
	           	htmlString=htmlString+"</tr>";
	        }
			if(data.poObject.length>0){
				htmlString =htmlString+"<tr class=' poRow'>";
				htmlString=htmlString+"<td align='left' colspan='2'>Total </td>";
				htmlString=htmlString+"<td align='left'>";
				if(data.totalNiValue!=null && data.totalNiValue != undefined && data.totalNiValue!='undefined'){
					htmlString=htmlString+"$"+$.trim(formatNumber(data.totalNiValue));
				}
				htmlString=htmlString+"</td>";
				htmlString=htmlString+"</tr>";
			}
			htmlString=htmlString+"</tbody>";
			htmlString=htmlString+"</table>";
			htmlString =htmlString+ "</div>";
			htmlString =htmlString+ "</div>";
			htmlString =htmlString+ "</div>"; 
			htmlString =htmlString+ "<div class='col-md-8'>";	
			htmlString =htmlString+ "<div class='panel panel-default'>";	
			htmlString =htmlString+ "<div class='panel-body' id ='viewer1'> Click the values for clickback reference ";	
			htmlString =htmlString+ "</div>";
			htmlString =htmlString+ "</div>";
			htmlString =htmlString+ "</div>"; 
			htmlString =htmlString+ "</div>"; 
			htmlString =htmlString+ "</div>"; 
			htmlString =htmlString+ "</div>"; 
			$('#QAChecksChildClickDivId').prepend(htmlString);
			$("#QAChecksChildClickPopUpId").css("display", "block");
			hideLoading();
        }catch(err){
        	hideLoading();
        }
		
	}
		
	errorData = function(data) {
		alert("Problem occurred while getting the values.");
		
	};
	
	callAjax(processData, successData, errorData, beforeSend, actionUrl,
			reqType, retDataType);
}
	

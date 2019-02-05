globaleCaseId=String('${fillingId}');

$(document).ready(function(){
$("#chkNodata").prop("checked", false);
$('.noData').hide();
$('tr.Ratio').click(function(){
    if($(this).hasClass('expand')){
    	 $('.hiddenRow').hide();
         $('.RatioHidden').hide();
         $('.sectionheadRatio>a>i.custom-ft').removeClass('fa-minus-circle').addClass('fa-plus-circle');
    }
    else{
      $('.tr.Ratio').removeClass('expand');
      $('.hiddenRow').show();
    }
  });
	
	$('.sectionhead').click(function(){
	   //$(this).find('i').toggleClass('fa-plus-circle fa-minus-circle')
	});
	
	/*$('.sectionheadRatio').click(function(){
		$(this).find('i').toggleClass('fa-plus-circle fa-minus-circle')
	});*/

	$('body').on("click", ".dropdown-menu", function (e) {
		$(this).parent().is(".open") && e.stopPropagation();
		});

	$('.clsChkData').on('change', function(e) {
	    if ($('.clsChkData:checked').length == 0 && !this.checked){
	    	this.checked = true;
	    	$.alert({
			title: 'Alert!',
			content: 'User must select at least One Checkbox!',
			});
	    }
	    });
		
	
$('#chkNodata, #chkdata ').on('change', function(){
		showData();
	});		
	

/*$('.toggleCustomClass').click(function(){
	
	var sectionClick = $(this).attr('data-target');
	if($('#collapse'+sectionClick+'TRId').hasClass('expand'))
		{
			$('.collapse'+sectionClick).show();
		}
	else
		{
			showDataCustom(sectionClick);
		}
});*/
	
	//hide functionality
	$(".N").hide();
	uicTableDivHide();
	getOrigionalFileName($('#customerId').val(),$('#wqId').val());
	showConvertedFiles($('#customerId').val(),$('#wqId').val());
		var thlength = $("#myTable tr:eq(5) th").length;
		$("#myTable").find("tr:first td");
		$("#myTable tr:eq(0) th:eq(0)").css("width", "400px");
		/*start function add <td> dynamically*/
		
		$("#myTable tr").each(function(index){
			var myrowtd = $(this).find('td').length;
			var addtdcount = thlength - myrowtd;
			var myrow = $(this);
			if(myrowtd < thlength){
				for(var j=0; j < addtdcount; j++){
					var myclass = $(myrow).find("td:last").attr("class");
					if(j==addtdcount-1){
					$(myrow).find("td:last").after('<td   class="'+myclass+'">&nbsp;</td>');
					}else{
					$(myrow).find("td:last").after('<td   class="'+myclass+'">&nbsp;</td>');
					}
				}
			}
		});
	
		/*
		 * 		 * End function add <td> dynamically
		 */
		$("#myTable").tableHeadFixer();
		$("#normChildTable").tableHeadFixer();
		$("#formulaChildPopUpTableId").tableHeadFixer();
		$('#Link1').click(function(){
			$('#finRatios').show();
			$('#finStatement').hide();
			$('#debtCapacity').hide();
		});
		$('#Link2').click(function(){
			$('#finRatios').hide();
			$('#finStatement').hide();
			$('#debtCapacity').show();
		});
		
		$('[data-toggle="tooltip"]').tooltip()
	

		
		$('#myTable tr').each(function() {
			var customerId = $(this).find("td:eq(0)").attr("class");
			if(customerId=="subheadtd"){
				$(this).addClass('header');
			}
		});
		
		$('.header').click(function(){	
			$(this).find('i').toggleClass('fa-plus-circle fa-minus-circle')	
			var sectionClick = $(this).attr('sectionNameTr');
			if($('#collapse'+sectionClick+'TRId').hasClass('expand'))
				{
					$('.collapse'+sectionClick).show();
				}
			else
				{
					showDataCustom(sectionClick);
				}
			$(this).toggleClass('expand').nextUntil('tr.header').slideToggle(100);
			});
}); // ready completed

function showData()
{
	var checked = [];
    $(":checkbox.clsChkData").map(function() {
        if(this.checked) 
        {
        	checked.push(this.id);
        }
    });
    var sectionArray = [];
    $('.toggleCustomClass').each(function () {
    	sectionArray.push($(this).attr('data-target'));
    });
	console.log(sectionArray);
    if(sectionArray!=null)
    {
	    for(var i in sectionArray) 
        {
    	if($('#collapse'+sectionArray[i]+'TRId').hasClass('expand'))
			{
			    $('.collapse'+sectionArray[i]+'.noData').hide();
			    $('.collapse'+sectionArray[i]+'.showData').hide();
				if (jQuery.inArray("chkdata", checked)!='-1') {
					$('.collapse'+sectionArray[i]+'.showData').show();
			    } 
				if (jQuery.inArray("chkNodata", checked)!='-1') {
					$('.collapse'+sectionArray[i]+'.noData').show();
			    }
			}
        }	
    }
}



function showDataCustom(sectionClick)
{
	var checked = [];
    $(":checkbox.clsChkData").map(function() {
        if(this.checked) 
        {
        	checked.push(this.id);
        }
    });
    $('.collapse'+sectionClick+'.noData').show();
    $('.collapse'+sectionClick+'.showData').show();
	if (jQuery.inArray("chkdata", checked)!='-1') {
		$('.collapse'+sectionClick+'.showData').hide();
    } 
	if (jQuery.inArray("chkNodata", checked)!='-1') {
		$('.collapse'+sectionClick+'.noData').hide();
    } 
}


function showTable(divid){
	  $('.financeTable').hide();
	  $('#'+divid).show();
	}

function setDataHead(stmtFormat)
{
	var head="";
		if(stmtFormat=='IS')
			head="Income Statement";
		else if(stmtFormat=='BS')
			head="Balance Sheet";
		else if(stmtFormat=='CF')
			head="Cash Flow Statement";
		else if(stmtFormat=='OPEX')
			head="Operating Expenses";
		else if(stmtFormat=='BKST')
			head="Bank Statement";
		else if(stmtFormat=='BKS')
			head="Bank Summary";
		else if(stmtFormat=='AccountSummary')
			head="Account Summary";
		else if(stmtFormat=='Deposits')
			head="Deposits";
		else if(stmtFormat=='DailyBalances')
			head="Daily Balances";
	 $("#datahead").html(head).show();
	 $("#refreshBtn").attr("onclick", "viewData(\"$('#wqId').val()\",\"$('#caseId').val()\",\"'+stmtFormat+'\",\"$('#customerId').val()\")");
}

function normalizedViewExportToExcel(wqId, decryptedFillingId,  customerId, decryptedCustomerName, bussinessName, fileName, decryptedCompIdOrCik,column) {
	var downloadType = $('#exportdropdown :selected').text();
	$("#exportdropdown").val("");
	console.info("downloadType="+downloadType);
	var userGroupName=$('#userGroupName').val();
	/**
	Here if dropdown type is xml then download xml file otherwise downlad excel file
	**/
	if(downloadType!='Select File Type'){
	if(downloadType=='XML'){
	filesDownloads('download.htm?encryptFilingId='+encodeURIComponent(decryptedFillingId));	
	}else if(downloadType=='XBRL')
	{
	 filesDownloads('downloadXBRLFile.htm?encryptFilingId='+encodeURIComponent(decryptedFillingId));
	}else{
	var oparationName;
	var downloadControllerName = $('#downloadControllerName').val();
	$('#loadinglayer').css("display","block");  
    setLocationHref(downloadControllerName+'.htm?customerName=' + encodeURIComponent(decryptedCustomerName)
    			+ '&WqId='+ encodeURIComponent(wqId) 
    			+ '&fillingId=' + encodeURIComponent(decryptedFillingId)
    			+ "&customerId=" + encodeURIComponent(customerId)
    			+ "&businessName=" + encodeURIComponent(bussinessName)
    			+ "&fileName=" + encodeURIComponent(fileName)
    			+ "&compIdOrCik=" + encodeURIComponent(decryptedCompIdOrCik)
    			+ "&oparationName=" + encodeURIComponent(oparationName)
    			+ "&downloadType=" + encodeURIComponent(downloadType));
		$('#loadinglayer').css("display","none");
	}
	}//end empty dropdown condition
	else{
		$.alert("Please select download document type");
	}
	
}//end function	
	
function downloadCRTemplate(wqId, decryptedFillingId,  customerId, decryptedCustomerName, bussinessName, fileName, decryptedCompIdOrCik) 
{
	var oparationName= $("#operationName").val();
    if(oparationName!='Units')
    {
    	if ($.confirm("Please confirm the Units coversion to export the output") == true) 
    	  {
	    	$('#loadinglayer').css("display","block");  
	    	setLocationHref('downloadCRTemplate.htm?customerName=' + encodeURIComponent(decryptedCustomerName)
	    			+ '&WqId='+ encodeURIComponent(wqId) 
	    			+ '&fillingId=' + encodeURIComponent(decryptedFillingId)
	    			+ "&customerId=" + encodeURIComponent(customerId)
	    			+ "&businessName=" + encodeURIComponent(bussinessName)
	    			+ "&fileName=" + encodeURIComponent(fileName)
	    			+ "&compIdOrCik=" + encodeURIComponent(decryptedCompIdOrCik)
	    			+ "&oparationName=" + encodeURIComponent(oparationName));
			$('#loadinglayer').css("display","none");
  		}
  	}
}


/* This function called from GenrateXMLDocuement button  */
function generateXMLDocument(formatType,encryptFilingId) 
{
	var processData = "&formatType=" + encodeURIComponent(formatType) + "&encryptFilingId="+ encodeURIComponent(encryptFilingId);
	actionUrl = "generateXMLDocument.htm";
	successData = function(data) {
		try {
			$.ajaxSetup({
				async : false,
				cache: true
			});
			setTimeout(function(){ 
				hideLoading();   
				if(data){
					$.alert("XML document is generated");
				}                    
				},6000);
		} catch (e) {
			$.alert(e);
			hideLoading();
		}
	};
	showLoading();
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
}

/* This function called from Submit Case button */
function submitCase(wqId, fillingId,customerId,customerName) 
{
	var parametersDynamic="wqId="+encodeURIComponent(wqId)+"&fillingId="+encodeURIComponent(fillingId)+"&customerId="+encodeURIComponent(customerId)+"&customerName="+encodeURIComponent(customerName); 
	var tokenizedURL= insertParam("updateMakerCheckerStatus.htm");
	$.ajaxSetup({
		cache: true
	});
	 $.ajax({
			type : "POST",
			url : tokenizedURL,
			data:parametersDynamic,
			async:false,
			success : function(data) {
				showWorkQueue();
			}
	 });
}
	
function openChildElements(nivId){
	showLoading();
	$('#normChildTable tbody').empty();
	processData = '&nivId=' + encodeURIComponent(nivId);
	actionUrl = "getNiChildRecords.htm";
	successData = function(data) {
		try{
			var htmlString="";
			var parserOutputObj;
			if(data.balancingValue === '-1')
				{
					$('#niLabel').show();
				}
			else
				{
					$('#niLabel').hide();
				}
			if(data.nonEnglishLabelFlag === 'Y'){
				for(var i=0;i<data.poObject.length;i++){
	            	parserOutputObj=data.poObject[i];
	            	if(parserOutputObj.poFilerReported==='P')
	            	{
	            		htmlString=htmlString+"<tr class=' poRow txtBold'>";
	            	}
            	else
            		{
            			htmlString=htmlString+"<tr class=' poRow'>";
            		}
	            	htmlString=htmlString+"<td align='left'>";
	            	htmlString=htmlString+parserOutputObj.poIndex+"</td>";
	            	htmlString=htmlString+"<td align='left'>"+parserOutputObj.asRepLabel+"</td>";
	            	htmlString=htmlString+"<td align='left'>";
	            	htmlString=htmlString+parserOutputObj.nonEnglishLable+"</td>";
	            	htmlString=htmlString+"<td align='left'>";
	            	htmlString=htmlString+parserOutputObj.section+"</td>";
	            	if(data.balancingValue === '-1')
	            		{
	            			htmlString=htmlString+"<td align='left'>";
	            		}	   
	            	else
	            		{
	            			htmlString=htmlString+"<td align='left' style='display: none;'>";
	            		}
	            	htmlString=htmlString+parserOutputObj.niLabel+"</td>";
	            	
	            	htmlString=htmlString+"<td align='right'>";
	            	if(parserOutputObj.isCoordinateExists == 'Y')
	            		{
	            			htmlString = htmlString+"<a href='#' onclick='openPDFDoc(\""+parserOutputObj.filingId+"\",\" \",\""+parserOutputObj.poId+"\",\""+parserOutputObj.column+"\");'>";
	            			htmlString=htmlString+parserOutputObj.asRepValue+"</a></td>";
	            		}
	            	else
	            		{
	            		htmlString=htmlString+parserOutputObj.asRepValue+"</td>";
	            		}
	            	htmlString=htmlString+"</tr>";
	            }
			}else{
				for(var i=0;i<data.poObject.length;i++){
	            	parserOutputObj=data.poObject[i];
	            	if(parserOutputObj.poFilerReported==='P')
		            	{
		            		htmlString=htmlString+"<tr class=' poRow txtBold'>";
		            	}
	            	else
	            		{
	            			htmlString=htmlString+"<tr class=' poRow'>";
	            		}
	            	htmlString=htmlString+"<td align='left'>";
	            	htmlString=htmlString+parserOutputObj.poIndex+"</td>";
	            	
	            	htmlString=htmlString+"<td align='left'>"+parserOutputObj.asRepLabel+"</td>";
	            	
	            	htmlString=htmlString+"<td align='left'>";
	            	htmlString=htmlString+parserOutputObj.section+"</td>";
	            	if(data.balancingValue === '-1')
	            		{
	            			htmlString=htmlString+"<td align='left'>";
	            			htmlString=htmlString+parserOutputObj.niLabel+"</td>";
	            		}
	            	else
	            		{
	            			htmlString=htmlString+"<td align='left' style='display: none;'>";
	            			htmlString=htmlString+parserOutputObj.niLabel+"</td>";
	            		}
	            	
	            	htmlString=htmlString+"<td align='right'>";
	            	if(parserOutputObj.isCoordinateExists == 'Y')
	            		{
	            			htmlString = htmlString+"<a href='#' onclick='openPDFDoc(\""+parserOutputObj.filingId+"\",\" \",\""+parserOutputObj.poId+"\",\""+parserOutputObj.column+"\");'>";
	            			htmlString=htmlString+addThousandsSeparator(parserOutputObj.asRepValue);+"</a></td>";
	            		}
	            	else
	            		{
	            		htmlString=htmlString+parserOutputObj.asRepValue+"</td>";
	            		}
	            	htmlString=htmlString+"</tr>";
	            }
			}
			
			hideLoading();
            $('#normChildTable tbody').append(htmlString);
        }catch(err){
        	hideLoading();
        }
		$("#normalizationchild").modal('show');
	}
		
	errorData = function(data) {
		$.alert("Problem occurred while getting the values.");
		
	};
	
	callAjax(processData, successData, errorData, beforeSend, actionUrl,
			reqType, retDataType);
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
        var fVar= output.split(".")
	    if(fVar.length <2){
	    	output=output+'.00';
	    }
    }

    return minussign+output;
}
function generateXBRLDocument(encryptFilingId) 
{
	var processData = "&encryptFilingId="+ encodeURIComponent(encryptFilingId);
	actionUrl = "generateXBRLDocument.htm";
	successData = function(data) {
		try {
			$.ajaxSetup({
				async : false,
				cache: true
			});
			setTimeout(function(){ 
				hideLoading();   
					$.alert(data);
				},6000);
		} catch (e) {
			$.alert(e);
			hideLoading();
		}
	};
	showLoading();
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
}
/**
 * This function called after click on 
 * @param templateId
 * @param niItem
 */
function showFormulaCalcPopUp(templateId,niItem,arsId,filingId,value,parentNormLableName)
{
		showLoading();
		processData='templateId='+encodeURIComponent(templateId)+"&niItem="+encodeURIComponent(niItem)+"&arsId="+encodeURIComponent(arsId)+"&filingId="+encodeURIComponent(filingId);
		actionUrl="showFormulaCalcPopUpData.htm";
		
		$('#formulaChildPopUpTableId tbody').empty();
		$("#FormulaSpanId").html("");
		$("#calctotalId").html("");

			 successData=function(data)
				{
				 try{
					result=JSON.parse(data);
					/***** check result success *********************/
					$.ajaxSetup({
						 async:false,
						 cache: true
					});
					if(result.hasOwnProperty('formula'))
					{
						formula=result['formula'];
						$("#FormulaSpanId").html(parentNormLableName+" = "+formula)
					}
					/*if(result.hasOwnProperty('formulaTotal'))
					{
						formulaTotal=result['formulaTotal'];
						$("#calctotalId").html(formulaTotal)
					}*/
					$("#parentNormLableName").html(parentNormLableName);
					$("#calctotalId").html(formatValue(value));
					var count = 0;
					if(result.hasOwnProperty('childTableData'))
					{
						childTableData=result['childTableData'];
						var rowData;
						$.each(childTableData, function(normLable, value)
						{
							if(value==''){
								value=0;
							}
						  rowData+="<tr><td >"+normLable+"</td><td align='right'>"+formatValue(value)+"</td></tr>";
						  count++;
						});
					$("#formulaChildPopUpTableId").append(rowData);
					if(count>9)
						{
							$("#parentNormLableNameDiv").css({'margin-top':'1px','width':'98.2%'});
							$("#parentNormLableTbl").css({'width':'99.9%'});
							
						}
					else
						{
							$("#parentNormLableNameDiv").css({'margin-top':'-10px','width':'100%'});
							$("#parentNormLableTbl").css({'width':'99.9%'});
						}
					}
						
					$('#modalRatio').modal('toggle');
				 }catch(e){
					 	$.alert("Error:",e);
				 }	
			hideLoading();

		};
		errorData=function(data)
		{
			$.alert("Failed to execute the process");
			hideLoading();
		};
		retDataType="html";
		callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
	}

function formatValue(num) {
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
		return "-";
	}
}


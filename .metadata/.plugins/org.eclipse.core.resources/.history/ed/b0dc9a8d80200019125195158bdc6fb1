var normItemDropDown;
function populateQAMessages(filingId){		
	var wqId = $('#wqId').val();
	var customerName = $('#customerName').val();	
	var businessName = $('#bussinessName').val();
	var filename = $('#fileName').val();
	var customerId = $('#customerId').val();
	var compIdOrCik = $('#compIdOrCik').val();
		processData = '&caseID='+encodeURIComponent(filingId)+'&wqId='+encodeURIComponent(wqId)+'&customerName='+encodeURIComponent(customerName)+
		'+&businessName='+encodeURIComponent(businessName)+'&fileName='+encodeURIComponent(filename)+'&customerId='+encodeURIComponent(customerId)+
		'+&compIdOrCik='+encodeURIComponent(compIdOrCik);

	actionUrl = "qaChecklistDetails.htm";		
	successData = function(data){		
		$('#data-div-1').html(data);
		hideLoading();
	};
	errorData = function(data){		
		$('#data-div-1').html(data);
		hideLoading();
	};
	retDataType="html";
	showLoading();
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
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
	 $("#datahead").html(head).show();
	 
		var wqId = $('#wqId').val();
		var caseId = $('#caseId').val();	
		var customerId = $('#customerId').val();
	 
	 $("#refreshBtn").attr('onclick', 'viewData(wqId,caseId,"'+stmtFormat+'",customerId)');
}


/**
 * This function called after click on check name hyperlink
 */
 function showNormalizeDataPopup(checkId,fillingId,section,currentPageNo){	 
	showLoading();
	if(currentPageNo==0){
		$("#totalRecordsQa").val(currentPageNo);
		$("#colCountValue").val(currentPageNo);
		$("#checkIdQa").val(checkId);
		$("#sectionQa").val(section);
		$("#displayRecordsQa option:first").attr('selected','selected');	
		currentPageNo=1
	}
	var totalRecordsQa=	$("#totalRecordsQa").val();
	var colCountValue =	$("#colCountValue").val();
	var displayRecordsQa =	$("#displayRecordsQa").val(); 
	var checkIdQa=$("#checkIdQa").val(checkId);
	processData = 'checkId='+encodeURIComponent(checkId)+'&fillingId='+encodeURIComponent(fillingId)+'&poSection='+encodeURIComponent(section)+'&isSubSection='+encodeURIComponent("N")+'&currentPageNo='+encodeURIComponent(currentPageNo)+'&totalRecords='+encodeURIComponent(totalRecordsQa)+'&colCountValue='+encodeURIComponent(colCountValue)+'&displayRecords='+encodeURIComponent(displayRecordsQa);
	actionUrl = "getQANormDataPopUp.htm";
	successData = function(data) {
	setDataToQaTable(data,checkId,fillingId,section,currentPageNo);
	if(currentPageNo==1){	
	$("#normalizationPochild").modal('show');
	}
	}//end success data loop
	errorData = function(data) {
		$.alert("Problem occurred while getting the values.");
	};
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
}

function updateNormDetails(obj,paramData){
	showLoading();
	var filingId=$("#filingId").val();
	var poId = $(obj).closest('tr').find('input[name="poId"]').val();
	
	processData = 'paramData='+encodeURIComponent(paramData)+'&fillingIdParam='+encodeURIComponent(filingId)+'&poId='+encodeURIComponent(poId);
	actionUrl = "updateNormDetailsQAChecks.htm";
	successData = function(data) {
	try {
	hideLoading();
	$.alert(data);
	}catch (err) {
		$.alert("Error:"+err);
	}
	}//end success data loop
	errorData = function(data) {
		$.alert("Problem occurred while getting the values.");
	};
callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
}

function callNormalizationPageFromQACheckList(fillingId,WqId,statementFormat,customerName,businessName,customerId,fileName,compIdOrCik)
{
	var sectionList = new Array();
	$('#normalizationLink ul li').each(function(i)
			{
			   sectionList.push( $(this).attr('id'));   
			});
	if((jQuery.inArray(statementFormat.toString(), sectionList) != -1))
		{
			callNormalizationPage(fillingId,WqId,statementFormat,customerName,businessName,customerId,fileName,compIdOrCik);
		}
	else
		{
			$.alert("Section not available/Extracted");
		}
}


//
function showQacheckSubTables(checkId,filingId ,checkIdStr,checkName,section,qaStatus)
{	
	var loadCls=$("#load_"+checkId).hasClass("empty");
		var difValTotal=0;
		var thArray = new Array();
		//singn operater changes dunamically for Qa Validation
	 	$('.closeall').each(function(i)
		{
	 	   var id=this.id;
		   if(id==checkId)
			{
				var flagSing=$(this).hasClass('collapsed');
				$(".normtxt").addClass('collapsed');
				if(!flagSing){
					$(this).addClass('collapsed');
				}
				else{
				$(this).removeClass('collapsed');
				}
			}
			else
			{
    			$(this).addClass('collapsed');	
			}
		});
	 
	if(loadCls)
	{
		$('div#loadDiv').block({message:"",}); 
		$("#load_"+checkId).addClass("loaded");
	    $("#load_"+checkId).removeClass("empty");
		var url = "showQacheckSubTotal.htm";
		var processData = 'checkId='+encodeURIComponent(checkIdStr)+'&fillingId='+encodeURIComponent(filingId);
		url=insertParam(url);
		var subtotal = 0;
		var popupheader='';
		var arv_value='';  
		var differnceValue='';
		var mytabledata = "<tr class='throw1'><td style='width:90%'>Subtotal of Mapped Items</td><td id='subTotalValue' align='right'></td></tr>";
		$.ajax({
			type: "post",
			url: url,
			data:processData,
			async:true,
			success : function(data)
			{
				var dataLen= Object.keys(data).length; 
				if(dataLen==0)
				{
					$("#noDataFound"+checkId).show();
				}
				hideLoading();
				var stmntYearRow="";
				var mappedItemRow="";
				var arsValueRow="";
				var subTotalRow="";
				var diffValueRow="";
				var subTotalMappedItemRow="";
				var popUpTableHeaderRow="";
			
				var colManagerHtmlStr="";
				$.each(data, function(key, value)
				{
					if(key==='STATEMENT YEAR')
					{
						stmntYearRow+="<tr>";
						stmntYearRow+="<th class='txt-left'><strong>Details :</strong></th>";
						var CheckIdPopUpDataCommandObj;
						for(var i =0;i < value.length;i++)
						{
						 CheckIdPopUpDataCommandObj = value[i];
						 
						 if(CheckIdPopUpDataCommandObj!=null)
							{
								thArray.push(CheckIdPopUpDataCommandObj.year);
								stmntYearRow+="<th style='text-align:right !important; width:80px' name='"+CheckIdPopUpDataCommandObj.year+"' class='"+CheckIdPopUpDataCommandObj.year+"'>"+CheckIdPopUpDataCommandObj.year+"</th>";	 
								colManagerHtmlStr=colManagerHtmlStr+"<li><input type='checkbox' checked onclick ='javascript:showhideColumn("+checkId+","+CheckIdPopUpDataCommandObj.year+");' name='"+CheckIdPopUpDataCommandObj.year+"' />"+CheckIdPopUpDataCommandObj.year+"</li>";
							}
						}
						stmntYearRow+="</tr>";
					}
					else if(key==='ARS VALUE')
					{
						arsValueRow+="<tr>";
						arsValueRow+="<td class='txt-left'><strong>As Reported in Financial Statement:</strong> "+checkName+"</td>";
						for(var i =0;i < value.length;i++)
						{
						 var CheckIdPopUpDataCommandObj = value[i];
						 if(CheckIdPopUpDataCommandObj!=null)
							{
								if(CheckIdPopUpDataCommandObj.isParent == 'Y')
								{
									if($.trim(CheckIdPopUpDataCommandObj.arv_value) == ''){
										arsValueRow+="<td class='txt-right "+thArray[i]+"'>"+CheckIdPopUpDataCommandObj.arv_value+"</td>";
									}
									else{
										arsValueRow+="<td class='txt-right "+thArray[i]+"'><a href=\"javascript:showChildItemsFromQAchecks("+CheckIdPopUpDataCommandObj.niId+","+CheckIdPopUpDataCommandObj.niItem+","+filingIdStr+",'"+filingId+"');\" class='tablink'>$ "+addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.arv_value, 10))+"</a></td>";
									}
								}
								else if(CheckIdPopUpDataCommandObj.isClickAvailable == 'Y')
								{
									if($.trim(CheckIdPopUpDataCommandObj.arv_value) == ''){
										 arsValueRow+="<td class='txt-right "+thArray[i]+"'>"+CheckIdPopUpDataCommandObj.arv_value+"</td>";
									}else{
										arsValueRow+="<td class='txt-right "+thArray[i]+"'><a href=\"javascript:showQAChecksClickBack('"+filingId+"','"+CheckIdPopUpDataCommandObj.clickbackCoordinates+"','"+CheckIdPopUpDataCommandObj.uploadId+"');\" class='tablink'>$ "+addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.arv_value, 10))+"</a></td>";
									}	 
								}
								else
								{
									 if($.trim(CheckIdPopUpDataCommandObj.arv_value) == ''){
										arsValueRow+="<td class='txt-right "+thArray[i]+"'>"+CheckIdPopUpDataCommandObj.arv_value+"</td>";
									 }else{
										arsValueRow+="<td class='txt-right "+thArray[i]+"'>$ "+addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.arv_value, 10))+"</td>";
									 }
								 }
							}
						}
						arsValueRow+="</tr>";
					}
					else if(key==='TotalMappedValues')
					{
						subTotalRow+="<tr>";
						subTotalRow+="<td style='width:620px; font-weight:bold' class='txt-left' colspan='"+tdCounter+"'><a class='normtxt accordion-toggle collapsed' data-parent='#insideAccordion' data-toggle='collapse' href='#afsCollapse"+checkId+"'><span class='fa fa-minus pad-rt5'></span><span class='fa fa-plus pad-rt5'></span> Normalized Value :"+checkName+"</a></td>";
						subTotalMappedItemRow+="<tr>";
						subTotalMappedItemRow+="<td style='width:620px' class='txt-left'><strong>Subtotal:</strong></th>";
						for(var i =0;i < value.length;i++)
						{
							var CheckIdPopUpDataCommandObj = value[i];
							if(CheckIdPopUpDataCommandObj!=null)
							{
								if($.trim(CheckIdPopUpDataCommandObj.subTotal) == ''){
									subTotalRow+="<td class='txt-right "+thArray[i]+"' style='width:80px'>"+CheckIdPopUpDataCommandObj.subTotal+"</td>";
									subTotalMappedItemRow+="<td class='txt-right "+thArray[i]+"' style='width:80px'>"+CheckIdPopUpDataCommandObj.subTotal+"</td>";
								}else{
									subTotalRow+="<td class='txt-right "+thArray[i]+"' style='width:80px'>$ "+ addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.subTotal, 10))+"</td>";
									subTotalMappedItemRow+="<td class='txt-right "+thArray[i]+"' style='width:80px'><strong>$ "+ addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.subTotal, 10))+"</strong></td>"; 
								}	
							}
						}
						subTotalRow+="</tr>";
						subTotalMappedItemRow+="</tr>";
					}
					else if(key==='diffrenceValue')
					{
						var tdCounter=value.length+1;
						popUpTableHeaderRow+="<tbody><tr>";
						popUpTableHeaderRow+="</tr></tbody>";
						diffValueRow+="<tr>";
						diffValueRow+="<td class='txt-left customUnmapRow' style='width:620px'><div style='float:left'><a class='normtxtdiffval accordion-toggle collapsed' data-parent='#insideAccordion' data-toggle='collapse' href='#'><strong>Difference in value :  </strong></a></div><div class='unmappedWrapper' style='float:left; display:none'><span style='padding:0 0 0 10px'><a href='#' class='qalblLinks'  onclick=\"javascript:showNormalizeDataPopup('"+checkIdStr+"','"+filingId+"','"+section+"','0');\" >Unmapped Labels</a></span>&nbsp;&nbsp; &#124; <span style='padding:0 0 0 10px'><a href='#' class='qalblLinks' onclick=\"javascript:callNormalizationPageFromQACheckList('"+encryptedFilingId+"','"+encryptedWqId+"','"+section+"','"+encryptedCustomerName+"','"+encryptedBusinessName+"','"+encryptedCustomerId+"','"+encryptedFileName+"','"+encryptedFileName+"');\">Back to Original Statement</a></span></div></td>";
						for(var i =0;i < value.length;i++)
						{
							var CheckIdPopUpDataCommandObj = value[i];
							if(CheckIdPopUpDataCommandObj!=null)
							{
								if($.trim(CheckIdPopUpDataCommandObj.diffValue) == ''){
									diffValueRow+="<td style='text-align:right !important; width:80px' class='customUnmapRow "+thArray[i]+"'>"+CheckIdPopUpDataCommandObj.diffValue+"</strong></td>";
								}else{
									difValTotal=parseInt(difValTotal)+parseInt(CheckIdPopUpDataCommandObj.diffValue);
									diffValueRow+="<td style='text-align:right !important; width:80px' class='customUnmapRow "+thArray[i]+"'><strong>$ "+addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.diffValue, 10))+"</strong></td>";
								} 
							}
						}
						diffValueRow+="</tr>";
					}
					else
					{
						if(key!='ARS VALUE' && key!='STATEMENT YEAR' && key!='TotalMappedValues' && key!='diffrenceValue')
						{
							mappedItemRow+="<tr>";
							mappedItemRow+="<td class='txt-left' style='width:620px'><span style='margin-left:30px'>"+key+"</span></td>";
							for(var i =0;i < value.length;i++)
							{
								if(value[i]!=null)
								{
									var CheckIdPopUpDataCommandObj = value[i];
									if(CheckIdPopUpDataCommandObj!=null)
									{
										if(CheckIdPopUpDataCommandObj.isParent == 'Y')
										{
											if($.trim(CheckIdPopUpDataCommandObj.values) == ''){
												mappedItemRow+="<td class='txt-right "+thArray[i]+"'  style='width:80px'>"+CheckIdPopUpDataCommandObj.values+"</td>";
											}else{
												mappedItemRow+="<td class='txt-right "+thArray[i]+"'  style='width:80px'><a href=\"javascript:showChildItemsFromQAchecks("+CheckIdPopUpDataCommandObj.niId+","+CheckIdPopUpDataCommandObj.niItem+","+filingIdStr+",'"+filingId+"');\" class='tablink'>$ "+addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.values,10))+"</a></td>";
											}
										}
										else if(CheckIdPopUpDataCommandObj.isClickAvailable == 'Y')
										{
											if($.trim(CheckIdPopUpDataCommandObj.values) == ''){
												mappedItemRow+="<td class='txt-right "+thArray[i]+"'  style='width:80px'>"+CheckIdPopUpDataCommandObj.values+"</td>";
											}else{
												mappedItemRow+="<td class='txt-right "+thArray[i]+"'  style='width:80px'><a href=\"javascript:showQAChecksClickBack('"+filingId+"','"+CheckIdPopUpDataCommandObj.clickbackCoordinates+"','"+CheckIdPopUpDataCommandObj.uploadId+"');\" class='tablink'>$ "+addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.values,10))+"</a></td>";
											}
										}
										else
										{
											if($.trim(CheckIdPopUpDataCommandObj.values) == ''){
												mappedItemRow+="<td class='txt-right "+thArray[i]+"'  style='width:80px'>"+CheckIdPopUpDataCommandObj.values+"</td>";
											}else{
												mappedItemRow+="<td class='txt-right "+thArray[i]+"'  style='width:80px'>$ "+addThousandsSeparator(parseInt(CheckIdPopUpDataCommandObj.values,10))+"</td>";
											}
										}
									}
								}
								else
								{
									mappedItemRow+="<td style='width:80px' class ='"+thArray[i]+"'></td>";
								}
							}
						}
					}
				});					
			
				$('#popUpHeaderTable'+checkId).append(stmntYearRow+arsValueRow+subTotalRow);
				$('#popUpTable ').html(popUpTableHeaderRow);
				$('#tbleChildpopUpTableTableId'+checkId+' tbody').html(mappedItemRow);
				$('#tbleChildpopUpTableTableId'+checkId+' tbody')
				$('#qaMpChkBox'+checkId).find('ul').html(colManagerHtmlStr);

				var rowCount = $('#tbleChildpopUpTableTableId'+checkId+' tr').length;		
				if(rowCount>7)
				{
					$("#afsCollapse"+checkId).css({'width':'805px', 'max-height':'232px', 'margin-top':'-2px', 'overflow':'auto'});	
				}
				else{
					$("#afsCollapse"+checkId).css({'width':'788px', 'max-height':'240px', 'overflow':'hidden'});	
				}
				//here we set width based on number of rows in scroll table
				$('#diffValueTableID'+checkId).html(diffValueRow);
				$("#subTotalValue").html(addThousandsSeparator(subtotal));
				$('div#loadDiv').unblock({message:"",}); 
				if(qaStatus!='' && qaStatus=='Failure'){
					$(".unmappedWrapper").css("display","block");
				}	
			},
			error:function(data){
				$('#').html('No Data Found');
				
			}
		});		
	}//end loadCls 	
}

function setDataToQaTable(data,checkId,fillingId,section,currentPageNo){
	try {
		if(data.totalRecords>0){
			var htmlString = "";
			var columnCounter =data.colCountValue;
			//Here append new <td> element in table header
			/**Here we set table width dynamically based on number of values column**/
			var length = 835;
			length = length + (columnCounter * 80);
			var totalLength = length+'px';
			$("#QACheckParserOutChildTable").attr("width", totalLength);
			var theadHtmlString="";
			theadHtmlString = theadHtmlString+"<tr class='throw'><th width='60px' align='center' bgcolor='#006995'><strong>SEQ</strong></th>";
			theadHtmlString = theadHtmlString+"<th width='260px' align='center' bgcolor='#006995'><strong>As Reported Label</strong></th>";
			theadHtmlString = theadHtmlString+"<th width='10px' align='center' class='custom-blue-bg'><strong>BU</strong></th>";
			theadHtmlString = theadHtmlString+"<th width='300px' align='center' bgcolor='#006995' style='z-index:2'><strong>Normalized Label</strong></th>";
			theadHtmlString=theadHtmlString+"<th width='50px' align='center' bgcolor='#006995'><strong>Sub Section</strong></th>";

			for(var column=1;column<=columnCounter;column++){
				theadHtmlString = theadHtmlString+"<th width='80px' align='center' class='custom-blue-bg dynamicTdClass'>Value"+column+"</th>";
			}
			theadHtmlString = theadHtmlString+"<td style='display:none'><input type='text' name='totalPages' id='totalPages' value='"+data.totalPages+"'></td>";
			theadHtmlString = theadHtmlString+"</tr>";
			var parserOutputObj;
		
			//Here Create DropDown select box for normItemLable
			var normItemObj;
			console.info("length="+data.listOfNormItemLabels.length);
			for (var i = 0; i < data.poObject.length; i++) {
				parserOutputObj = data.poObject[i];
				normItemDropDown="";
				htmlString = htmlString + "<tr class='poRow'>";
				htmlString = htmlString + "<td style='display:none'><input type='text' name='poId' id='poId' value='"+parserOutputObj.poId+"'></td>";
				htmlString = htmlString	+ "<td align='center' id='childUpdSequence'>"
					+ parserOutputObj.poIndexOrder + "</td>";
				htmlString = htmlString
				+ "<td align='left' id='childupdPoLable' class='wrapAsRepLable'>"
				+ parserOutputObj.poAsRepLabel + "</td>";
				
				if (parserOutputObj.poBreakup === "Y") {
				htmlString = htmlString
							+ "<td align='center' id='childbrekUps'><input type='checkbox' name='upbrekUps1' checked='checked' value='Y' readonly='readonly' onclick='return false;'/></td>";
				} else {
				htmlString = htmlString
							+ "<td align='center' id='childbrekUps'><input type='checkbox' name='upbrekUps1'  value='N' readonly='readonly' onclick='return false;'/></td>";
				}
				
				normItemDropDown = '<select id="NormItem" name="NormLable" class="form-control singleChosen" onchange="saveNormItemLabelToParserOutput(this.value,'+parserOutputObj.poId+')" ><option value="-1">--Select--</option>';
				 for (var normCounter = 0; normCounter < data.listOfNormItemLabels.length; normCounter++) {
					normItemObj=data.listOfNormItemLabels[normCounter];
					normItemDropDown = normItemDropDown+"<option id='"+normItemObj.niItem+"~"+normItemObj.nilLabel+"' value='"+parserOutputObj.poId+"~"+normItemObj.niItem+"~"+normItemObj.nilLabel+"'  title='"+normItemObj.nilLabel+"'>"+normItemObj.labelSection+": "+normItemObj.nilLabel+"</option>";
			 	} ///end normItemList Iteration
				normItemDropDown = normItemDropDown+'</select>';
				
				htmlString = htmlString
				+ "<td align='left' id='childupdNormLable'>"
				+ normItemDropDown + "</td>";
				htmlString = htmlString + "<td align='left' id='parserOutputSubSection"+parserOutputObj.poId+"'>" + parserOutputObj.poSubSection + "</td>";

				for (var counter = 1; counter <= columnCounter; counter++) {
					var isNumaricClass="";
					if(parserOutputObj.poAsRepVal[counter]!=null && parserOutputObj.poAsRepVal[counter]!=undefined)
					{
						if(!$.isNumeric(parserOutputObj.poAsRepVal[counter]))
						{
							if(!checkNumaricRules(parserOutputObj.poAsRepVal[counter]))	
								{
									isNumaricClass="notNumaric";	
								}
						}
					}
					console.info("subsection="+parserOutputObj.poSubSection);
					if(parserOutputObj.poSubSection=='ATTR' || parserOutputObj.poSubSection=='HEADER' )
					{
					htmlString = htmlString	+ "<td align='right' style='max-width:80px; width:80px; word-wrap:break-word;'>";
					}else
					{
					htmlString = htmlString	+ "<td class='"+isNumaricClass+"' align='right' style='max-width:80px; width:80px; word-wrap:break-word;'>";
					}					
					if(	parserOutputObj.poAsRepLabel =='STATEMENT YEAR'){
						htmlString = htmlString+ parserOutputObj.poAsRepVal[counter]+ "</td>";
					}
				else{
					if(isNumaricClass!="")
					{
						htmlString = htmlString+ parserOutputObj.poAsRepVal[counter]+ "</td>";	
					}else{
					if(parserOutputObj.poSubSection!='ATTR' &&  parserOutputObj.poSubSection!='HEADER' ){
						htmlString = htmlString+ "<a href='#' onclick='openPDFDoc(\""+parserOutputObj.encryptedFilingId+ "\",\""+parserOutputObj.uploadId+ "\",\""+parserOutputObj.poId+ "\",\"val" + counter + "\")'>"+formatNumber(parserOutputObj.poAsRepVal[counter])+"</a></td>";	
					}else{
						htmlString = htmlString+ parserOutputObj.poAsRepVal[counter]+ "</td>";								
					}
				    }
			}	
				}//end counter for
				htmlString = htmlString + "</tr>";
			}//end poList for loop 
			
			$('#QACheckParserOutChildTable thead').empty();
			$('#QACheckParserOutChildTable tbody').empty();
			$("#QACheckParserOutChildTableErrorMessage").html("");
			$('.dynamicTdClass').remove(); 
			$('#QACheckParserOutChildTable thead').html(theadHtmlString);
			$('#QACheckParserOutChildTable tbody').html(htmlString);
			$("#QACheckParserOutChildTable").tableHeadFixer();
		    $('.checkNamePopUpPagination').empty();
			$(".singleChosen").chosen({width: "100%"});
			 var totalPages=parseInt(data.totalPages);
			 var totalRecords=parseInt(data.totalRecords);
			 var displayRecords=parseInt(data.displayRecords);
			 var colCountValue=parseInt(data.colCountValue);
			 pagNationQaChecks(totalPages, currentPageNo,checkId,fillingId,section);
			 dispalyRecordsCount(totalRecords,currentPageNo,displayRecords);
			 $("#totalRecordsQa").val(totalRecords);
			 $("#colCountValue").val(colCountValue);
			 $("#displayRecordsQaDiv").show();	 
		}//end currentPageNo==0 condtion
		else{
		$("#QACheckParserOutChildTableErrorMessage").html("No information available.");	
		}
		hideLoading();
		
	}catch (err) {
		$.alert("Error:"+err);
		hideLoading();
	}
}

//pageNation 
function pagNationQaChecks(totalPages,currentPageNo,checkId,fillingId,section){
if(currentPageNo==0){
	currentPageNo++;
}
 $('.checkNamePopUpPagination').off('page');
 $('.checkNamePopUpPagination').bootpag({
       total : totalPages,
      page : currentPageNo,
      maxVisible : 5,
      leaps : true,
      firstLastUse : true,
      wrapClass : 'pagination',
      activeClass : 'active',
      disabledClass : 'disabled',
      nextClass : 'next',
      prevClass : 'prev',
      lastClass : 'last',
      firstClass : 'first'
}).on("page", function(event, num) {
	showNormalizeDataPopup(checkId,fillingId,section,num);
}).find('.pagination');
 
}

function dispalyRecordsCount(totalRecords,currentPageNo,displayRecords){
	if(currentPageNo>0){
		currentPageNo--;
	}
	  if(totalRecords>0 && displayRecords>0 && currentPageNo >=0){
		 var startNum=(currentPageNo*displayRecords)+1;
		 var endNum= (currentPageNo*displayRecords)+displayRecords;
		 if(totalRecords >= endNum){
				$('#pageInfoQa').html("Displaying <b>"+startNum+"</b> to <b>"+endNum +"</b> of "+totalRecords+" records"); 
			}else{
				$('#pageInfoQa').html("Displaying <b>"+startNum+"</b> to <b>"+totalRecords +"</b> of "+totalRecords+" records"); 
			}
	  }	
}

function changeDisplayQaRecords(){
	
	var filingId=encryptedFilingId;
	var section=qaCheckSection;
	var checkIdQa=$("#checkIdQa").val();
	var section=$("#sectionQa").val();
showNormalizeDataPopup(checkIdQa,filingId,section,1);
	
}


function showLoading(){
	$('#loadinglayer').css("display","block");  
}
function hideLoading(){
	$('#loadinglayer').css("display","none");
}

function showHideColMAnager(checkId){
	$("#qaMpChkBox"+checkId).toggle();
}	
function showhideColumn(checkId,col){
	var $tbl = $("#popUpHeaderTable"+checkId);
	var $tb2 = $("#tbleChildpopUpTableTableId"+checkId);
	var $tb3 = $("#diffValueTableID"+checkId);
	var colToHideForTabl = $tbl.find("." +col);
	$(colToHideForTabl).toggle();
	var colToHideForTab2 = $tb2.find("." +col);
	$(colToHideForTab2).toggle();
	var colToHideForTab3 = $tb3.find("." +col);
	$(colToHideForTab3).toggle();
}

function showChildItemsFromQAchecks(nivId,niItem,filingId,encryptedFilingId){
	showChildItems(nivId,niItem,filingId,encryptedFilingId)	
}

function downLoadOriginalFiletoUI(docId){
	downLoadOriginalFile(filingId,docId);
}

function saveNormItemLabelToParserOutput(selectedVal,poId){
	showLoading(poId);
  	var tempArrr =selectedVal.split("~");
	 var niItem =" ";
	 console.log("selectedVal  "+selectedVal);
	 if(tempArrr.length==3){
		 niItem=tempArrr[1];
	 }
	 var documentStatus=$("#docStatus").val();
     var filingId = $('#filingId').val();
  	 var statementFormat = defualtSectionName;
  	 var processData='&niItem=' + encodeURIComponent(niItem) + '&poIdVal= ' + encodeURIComponent(poId) + '&filingId= '+encodeURIComponent(filingId)+'&sectionName='+encodeURIComponent(statementFormat)+'&documentStatus=' + encodeURIComponent(documentStatus);
  	actionUrl="saveNormLable_ParserOutPut.htm";
  	successData=function(data)
  	{	
  		var subSectionOld=$("#parserOutputSubSection"+poId).text();
  		if(subSectionOld==''){
  			$("#parserOutputSubSection"+poId).text(data);
  		}
  		
/*  		var filingId=encryptedFilingId;
  		var section=qaCheckSection;
  		var checkIdQa=$("#checkIdQa").val();
  		var section=$("#sectionQa").val();
  	    showNormalizeDataPopup(checkIdQa,filingId,section,0);*/
  		
  		hideLoading();
  	};
  	errorData=function(data)
  	{
  		hideLoading();
  		$.alert("Problem occurred while updating the normalized label.");
  		
  	};
  	hideLoading();
  	callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
}



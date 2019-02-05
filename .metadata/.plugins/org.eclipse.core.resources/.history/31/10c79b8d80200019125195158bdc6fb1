globaleCaseId=String($('#caseId').val());
var poAsReportedCellValue = "";
var selectedPoIDValue = "";
var selectedColumnName = "";
var selectColumnNumber = 0;
var selectRowNumber = 0;
var currentTableName = "";
var selectedHeaderLabel = "";
var selectedTableLabel = "";
var subsectionLabel = "";
var previousRecordId = "";
var normItemLabelToMapping = "";

function contextMenuDisplayCheckBox(tableName, tdName, menuName,checkBoxName) {
	restoreDrodownCheck(menuName);
	highlightNormDropdown("contextMenu");
	
	$("#" + tableName + " #" + tdName).contextMenu({
		menuSelector : "#" + menuName,
		menuSelected : function($invokedOn, $selectedMenu) {
			var mappingLabel = $selectedMenu.attr("value");
			updateMappingData(mappingLabel, checkBoxName);
		},
		onMenuShow : function($invokedOn) {
			$invokedOn.addClass("success");
		},
		onMenuHide : function($invokedOn) {
			$("#search-criteria").val('');
			$("#search-criteria").trigger("keyup");
			$invokedOn.removeClass("success");
		}
	});
}



function contextMenuDisplayChildCheckBox(tableName, tdName, menuName,
		checkBoxName) {

	restoreDrodownChildCheck(menuName);
	highlightNormDropdown("contextMenu")
	$("#" + tableName + " #" + tdName).contextMenu({
		menuSelector : "#" + menuName,
		menuSelected : function($invokedOn, $selectedMenu) {
			var mappingLabel = $selectedMenu.attr("value");
			updateMappingData(mappingLabel, checkBoxName);
		},
		onMenuShow : function($invokedOn) {
			$invokedOn.addClass("success");
		},
		onMenuHide : function($invokedOn) {
			$("#search-criteriaChild").val('');
			$("#search-criteriaChild").trigger("keyup");
			$invokedOn.removeClass("success");
		}
	});
}



function updateMappingData(mappingLabel, checkBoxName) {

	/* Here we get filing id and docement status */

	var filingId = $("#filingId").val();
	var documentStatus = $("#documentStatus").val();
	var nonEnglishLabelFlag =$('#nonEnglishLabelFlag').val(); 

	var selectedRowLength = $('input[name="' + checkBoxName + '"]:checked').length;
	var selectedRowVal;
	var labelText;
	var niTemSelectedVal="";
	var normLabelArr = mappingLabel.split('~');
	if (normLabelArr.length == 2) {
		labelText = normLabelArr[1];
		niTemSelectedVal= normLabelArr[0];
	} else {
		labelText = "";
		niTemSelectedVal="";
	}

	if (selectedRowLength > 0) {
		var selectedValArray = $(
				'input:checkbox[name="' + checkBoxName + '"]:checked').map(
				function() {
					selectedRowVal = $(this).val();
					//return selectedRowVal + "#" + mappingLabel;
					return selectedRowVal;
				}).toArray();

		if (selectedValArray != "") {
			processData = '&poIdArray='
					+ encodeURIComponent(selectedValArray) + '&fillingId='
					+ encodeURIComponent(filingId) + '&documentStatus='
					+ encodeURIComponent(documentStatus) + '&mappingLabel=' + encodeURIComponent(mappingLabel);
			actionUrl = "update_NormalizedLabelByPOID.htm";
			successData = function(data) {

				$('input:checkbox[name="' + checkBoxName + '"]:checked').map(function() {
							var $row = $(this).closest("tr");
							$("#niItemSuggstive"+$(this).val().replace("child", "")).val(niTemSelectedVal);
							
							if(nonEnglishLabelFlag == 'Y')
								{
									
									$row.find("td:nth-child(6)").text(labelText);
									var subsectiontext=$row.find("td:nth-child(7)").text();
									if(subsectiontext == undefined || subsectiontext == 'undefined' || $.trim(subsectiontext).length == 0){
										$row.find("td:nth-child(7)").text(data);
									}
						   			
								}
							else
								{
									$row.find("td:nth-child(5)").text(labelText);	
									var subsectiontext=$row.find("td:nth-child(6)").text();
									if(subsectiontext == undefined || subsectiontext == 'undefined' || $.trim(subsectiontext).length == 0){
										$row.find("td:nth-child(6)").text(data);
									}
								
								}
							
						});
				$('input:checkbox[name="' + checkBoxName + '"]').prop('checked', false);
				if (checkBoxName === "childPoId") {
					unCheckHeaderChildPoIdCheckBox();
				} else if (checkBoxName === "delPoId") {
					unCheckHeaderPoIdCheckBox();
				}
			}
			errorData = function(data) {
				$.alert("Problem occurred while updating the normalized label.");
				$('input:checkbox[name="' + checkBoxName + '"]').prop('checked', false);
			};
			callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
		}
	} else {
		$.alert("Please select a row to update.");
	}
}

function contextMenuDisplayValue(val, menuName, tableName, isArsPoMapping,arsPoMappingNiItem) {
	restoreDrodown(val, menuName, isArsPoMapping, arsPoMappingNiItem,tableName);
	highlightNormDropdown("celLevelmapping")
	$("#" + tableName + " #" + val).contextMenu({
		menuSelector : "#" + menuName,
		menuSelected : function($invokedOn, $selectedMenu) {
			var mappingLabel = $selectedMenu.attr("value");

			$(".selectedNiLables").css({
				'background' : ''
			});
			$selectedMenu.css({
				'background' : '#0000FF'
			});
			mappingLabel = "-1~" + mappingLabel;
			var niLabelValArray = mappingLabel.split('~');

			if (niLabelValArray.length == 4) {
				$("#search-criteriaval"+tableName).val(niLabelValArray[2]);
				prepareArsStatementRadio(val, mappingLabel);
			}
		},
		onMenuShow : function($invokedOn) {
			$invokedOn.addClass("success");
		},
		onMenuHide : function($invokedOn) {
			$("#search-criteriaval"+tableName).trigger("keyup");
			$invokedOn.removeClass("success");
		}
	});
}

function updateMappingCellData() {
	/*var valuetoSave = ''*/
	var statementYearRadioSelected = $('input[name="statementYearRadio' + selectedColumnName + '"]');
	var arsID = statementYearRadioSelected.filter(':checked').val();
	var nonEnglishLabelFlag =$('#nonEnglishLabelFlag').val();
	if ($.trim(poAsReportedCellValue) === "") {
		$.alert("Selected cell value is empty.");
		return false;
	} else if (!$.isNumeric(arsID)) {
		$.alert("Please select statement year.");
	} else {
		if (currentTableName == "parserOutChildTable") {
			previousRecordId = "child"+selectedPoIDValue;
		}else{
			previousRecordId = selectedPoIDValue;
		}
		if(nonEnglishLabelFlag == 'Y')
			{
				subsectionLabel = $("#" + previousRecordId).find('td:nth-child(7)').text();
			}
		else
			{
				subsectionLabel = $("#" + previousRecordId).find('td:nth-child(6)').text();	
			}
		
		if (subsectionLabel != "HEADER" && previousRecordId != "" && previousRecordId != undefined) {
			while (subsectionLabel != 'HEADER' && previousRecordId != undefined) {
				getpreviousRecord(previousRecordId);
				if(nonEnglishLabelFlag == 'Y')
					{
						subsectionLabel = $("#" + previousRecordId).find('td:nth-child(7)').text()
					}
				else
					{
						subsectionLabel = $("#" + previousRecordId).find('td:nth-child(6)').text()
					}
			}
		}

		if (previousRecordId != "" && previousRecordId != undefined) {
			selectedHeaderLabel = $("#" + previousRecordId + ' #' + selectedColumnName).text().trim();
			selectedTableLabel = $("#" + previousRecordId).find('td:nth-child(3)').text().trim();
		}
		if (selectedHeaderLabel == "" || selectedHeaderLabel == undefined) {
			selectedHeaderLabel = " ";
		}
		if (selectedTableLabel == "" || selectedTableLabel == undefined) {
			selectedTableLabel = " ";
		}

		var tempId = $('#templateId').val();
		var filingID = $('#caseId').val();
	var normItemLabelsDetailsArray =  normItemLabelToMapping.split("~");
	var normItemId = normItemLabelsDetailsArray[1];
			processData = '&selectedPoIDValue=' + encodeURIComponent(selectedPoIDValue) + '&poAsReportedCellValue=' + encodeURIComponent(poAsReportedCellValue) 
						 + '&niItemId=' + encodeURIComponent(normItemId) + '&selectedColumnName=' + encodeURIComponent(selectedColumnName) 
						 + '&arsID=' + encodeURIComponent(arsID)+ '&tempId=' + encodeURIComponent(tempId)+'&filingID=' + encodeURIComponent(filingID)
						 +'&selectedHeaderLabel=' + encodeURIComponent(selectedHeaderLabel)+'&selectedTableLabel=' + encodeURIComponent(selectedTableLabel);
			actionUrl = "update_PoID_AsrsYearVal_Mapping.htm";
			successData = function(data) {
				var rowNum = selectRowNumber + 1;
				var tdId = "";
				if (currentTableName == "parserOutChildTable") {
					$("#child" + selectedPoIDValue).find("#" + selectedColumnName).css("background","rgb(186, 240, 242)");
				} else {
					$("#" + selectedPoIDValue).find("#" + selectedColumnName).css("background","rgb(186, 240, 242)");
				}
				hideLoading();
			}
			errorData = function(data) {
				hideLoading();
				$.alert("Problem occurred while saving mapping record.");

			};
			showLoading();
			callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
		
	}
}



function getCellValue(e, poidVal, cellValue, cellID, menuName, tableName,columnObj, poSubSection) {
	$("#" + menuName).empty();
	$('.customdropdownclass').hide();
	if (e.which == 3 && $.trim(cellValue) != "" && $.trim(cellValue) != undefined && $.trim(cellValue) != "undefined") {
		selectColumnNumber = 0;
		selectRowNumber = 0;
		currentTableName = "";
		poAsReportedCellValue = "";
		selectedPoIDValue = "";
		selectedColumnName = "";
		selectColumnNumber = columnObj.index();
		selectRowNumber = columnObj.parent().index();
		currentTableName = tableName;
		selectedPoIDValue = poidVal;

		if (currentTableName == "parserOutChildTable") {
			   if ($("#child" + selectedPoIDValue + " #" + cellID).children('a').length) {
				   poAsReportedCellValue=$("#child" + selectedPoIDValue).find("#" + cellID + " a").text();
			    } else {
			       poAsReportedCellValue=$("#child" + selectedPoIDValue + " #" + cellID).html();
			    }
		} else {
			 if ($("#" + selectedPoIDValue + " #" + cellID).children('a').length) {
				   poAsReportedCellValue=$("#" + selectedPoIDValue).find("#" + cellID + " a").text();
			    } else {
			       poAsReportedCellValue=$("#" + selectedPoIDValue + " #" + cellID).html();
			    }
		}

		selectedColumnName = cellID;
		var tempPoId = 0;
		var tempcolName = "";
		var paramVal = "";
		var currentStatus = $('#currentStatus').val();
		$.trim(poAsReportedCellValue)
		
		if (currentStatus === "Normalization Failure" || currentStatus === "Normalization Success") {
			if (poSubSection !== "ATTR" && poSubSection !== "HEADER") {
				paramVal = poidVal + "#" + cellID;
				processData = '&paramVal=' + encodeURIComponent(paramVal);
				actionUrl = "getArsPoMappingRecord.htm";
				$("#search-criteriaval"+tableName).val("");
				$('input[name="statementYearRadio' + cellID + '"]').prop("checked", false);
				contextMenuDisplayValue(cellID, menuName, tableName, "N", 0);
				 $("#search-criteriaval"+tableName).focus();
				successData = function(data) {
					contextMenuDisplayValue(cellID, menuName, tableName,data.isArsPoMapping, data.niItem);
					 $("#search-criteriaval"+tableName).focus();
					var mapingValue = data.arsId + "~" + data.niItem + "~" + data.nilLabel + "~" + data.normItemSection;
					 $("#search-criteriaval"+tableName).val(data.nilLabel);
					if (data.arsId !== 0 && data.arsId !== -1) {
						prepareArsStatementRadio(cellID, mapingValue);
						$('input[name="statementYearRadio' + cellID + '"][value=' + data.arsId + ']').prop("checked", true);
						$("#clearMapping").html("<span style='margin-top:-12px; margin-left:-18px'><a href='#' onClick='deleteMapping(\"" + paramVal + "\");'>Clear Mapping</a></span>");
					} else if (data.niItem !== 0) {
						prepareArsStatementRadio(cellID, mapingValue);
					}
					if (data.signVal !== "") {
						$(
								'input[name="changeSign' + cellID + '"][value=' + data.signVal + ']').prop("checked", true);
					}
					if (data.scaleVal !== "") {
						$('#changeScale' + cellID + ' option[value="' + data.scaleVal + '"]').prop('selected', true)
					}
				};
				errorData = function(data) {
					$.alert("Problem occurred while getting the values.");
				};
				callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
			}
		}
	}
}

function showChild(parentPOId) {
	showLoading();
	$("#refPOID").val(parentPOId);
	var parserId = $('#parserId').val(); 
	processData = '&parentPOId=' + encodeURIComponent(parentPOId);
	var nonEnglishLabelFlag =$('#nonEnglishLabelFlag').val(); 
	actionUrl = "getChildPORecords.htm";
	successData = function(data) {
		$('#parserOutChildTable tbody').empty();
		try {
			var htmlString = "";
			var parserOutputObj;
			var columnCounter =$("#childvaluesColumnCount").val();
			for (var i = 0; i < data.poObject.length; i++) {
				parserOutputObj = data.poObject[i];
				var poSubSection = parserOutputObj.poSubSection;
				if(parserOutputObj.poSubSection==null)
					{
						poSubSection ='';
					}
				if (parserOutputObj.isMultipleNiItems === "Y") {
					htmlString = htmlString
							+ "<tr class='poRow multipleSuggestiveMapping "
							+ parserOutputObj.isDuplicate
							+ " "
							+ parserOutputObj.trClass
							+ "' ondblclick='childRowClick($(this))' id='child"
							+ parserOutputObj.poId + "' >";
				} else {
					htmlString = htmlString
							+ "<tr class='poRow "
							+ parserOutputObj.isDuplicate
							+ " "
							+ parserOutputObj.trClass
							+ "' ondblclick='childRowClick($(this))' id='child"
							+ parserOutputObj.poId + "' >";
				}
				/*htmlString = htmlString
						+ "<td id='showChildNormLabel' onmousedown='contextMenuDisplayChildCheckBox(\"parserOutChildTable\",\"showChildNormLabel\",\"childContextMenuUsername\",\"childPoId\"); '> ";*/
				htmlString = htmlString+ "<td id='showChildNormLabel' onmousedown='showContextMenuCheckBoxchild(event);'>";
				htmlString = htmlString
						+ "<input type='hidden' id='niItemSuggstive"+parserOutputObj.poId+"' value='"+parserOutputObj.niItemSuggstive+"'/> <input type='checkbox' name='childPoId' id='childCheckbox' value='"
						+ parserOutputObj.poId
						+ "' onclick='unCheckHeaderChildPoIdCheckBox();'/></td>";
				if (parserId == 6 || parserId == 16) {
					htmlString = htmlString
							+ "<td align='center' style='display: none;' id='childUpdSequence'>"
							+ parserOutputObj.poIndexOrder + "</td>";
				} else {
					htmlString = htmlString
							+ "<td align='center' id='childUpdSequence'>"
							+ parserOutputObj.poIndexOrder + "</td>";
				}
				
				if(parserOutputObj.poAsRepLabel!=null)
				{
				htmlString = htmlString
						+ "<td align='left' id='childupdPoLable'  onmousedown='showContextMenuAsreplabelChild(event)' class='wrapAsRepLable'>"
						+ parserOutputObj.poAsRepLabel + "</td>";
				}
				else
				{
					htmlString = htmlString
					+ "<td align='left' id='childupdPoLable'  onmousedown='showContextMenuAsreplabelChild(event)' class='wrapAsRepLable'>"
					+ "</td>";
				}
				
				if (nonEnglishLabelFlag === 'Y' ) {
					if(parserOutputObj.nonEnglishLable!=null)
						{
							htmlString = htmlString
							+ "<td align='left' id='childnonEnglishLabel' class='wrapAsRepLable'>"
							+ parserOutputObj.nonEnglishLable + "</td>";
						}
					else
						{
							htmlString = htmlString
							+ "<td align='left' id='childnonEnglishLabel' class='wrapAsRepLable'>"
							+ "</td>";
						}

				}
				
				if (parserId == 6 || parserId == 7
						|| parserId == 8 || parserId == 10) {
					if (parserOutputObj.poBreakup === "Y") {
						htmlString = htmlString
								+ "<td align='center' id='childbrekUps' style='display: none;'><input type='checkbox' name='upbrekUps1' checked='checked' value='Y' /></td>";
					} else {
						htmlString = htmlString
								+ "<td align='center' id='childbrekUps' style='display: none;'><input type='checkbox' name='upbrekUps1'  value='N' /></td>";
					}
				} else {
					if (parserOutputObj.poBreakup === "Y") {
						htmlString = htmlString
								+ "<td align='center' id='childbrekUps'><input type='checkbox' name='upbrekUps1' checked='checked' value='Y' readonly='readonly'/></td>";
					} else {
						htmlString = htmlString
								+ "<td align='center' id='childbrekUps'><input type='checkbox' name='upbrekUps1'  value='N' readonly='readonly'/></td>";
					}
				}
				if (parserId == 8 || parserId == 10) {
					htmlString = htmlString
							+ "<td align='left' id='childupdNormLable' style='display: none;'>"
							+ parserOutputObj.nilLabel + "</td>";
				} else {
					htmlString = htmlString
							+ "<td align='left' id='childupdNormLable'>"
							+ parserOutputObj.nilLabel + "</td>";
				}
				if (parserId == 6 || parserId == 7) {
					htmlString = htmlString
							+ "<td align='left' id='childupdAccountNumber'>"
							+ parserOutputObj.poAccountNumber + "</td>";
					htmlString = htmlString
							+ "<td align='center' id='childupdTimePeriod'>"
							+ parserOutputObj.poTimePeriod + "</td>";
					htmlString = htmlString
							+ "<td align='center' id='childupdCustodianName' style='display: none;'>"
							+ parserOutputObj.poCustodianName + "</td>";
				} else if (parserId == 8 || parserId == 10) {
					htmlString = htmlString
							+ "<td align='left' id='childupdSubSection' style='display: none;'>"
							+ poSubSection + "</td>";
				} else {
					htmlString = htmlString
							+ "<td align='left' id='childupdSubSection' >"
							+ poSubSection + "</td>";
				}
				if (parserId == 5) {
					if (parserOutputObj.poSubTotal === "Y") {
						htmlString = htmlString
								+ "<td align='center' id='childsubtotal'>"
								+ parserOutputObj.poSubTotal + "</td>";
					} else {
						htmlString = htmlString
								+ "<td align='center' id='childsubtotal'>&nbsp;</td>";
					}
				}

				/**Dynamic value column functionality*/
				for (var counter = 1; counter <= columnCounter; counter++) {
					var isNumaricClass="";
					if(parserOutputObj.poAsRepVal[counter]!=null && parserOutputObj.poAsRepVal[counter]!=undefined && poSubSection!='ATTR' && poSubSection!='HEADER')
		    		{
				    	if(!$.isNumeric(parserOutputObj.poAsRepVal[counter]))
			    		{
			    			if(!checkNumaricRules(parserOutputObj.poAsRepVal[counter]))	
			    				{
					    		isNumaricClass=" notNumaric";	
			    				}
			    		}
		    		}

					//*if column values is exist then execute below code
					if (parserOutputObj.isPoAsRepValueMapped[counter] === "Y") {
						htmlString = htmlString
								+ "<td  class='"+isNumaricClass+"' style='background:rgb(186, 240, 242)'  align='right' id='childval"
								+ counter
								+ "'  onmousedown='getCellValue(event,\""
								+ parserOutputObj.poId + "\",\""
								+ parserOutputObj.poAsRepVal[counter]
								+ "\",\"childval" + counter
								+ "\",\"childContextMenuVal"
								+ "\",\"parserOutChildTable\",$(this),\""
								+ poSubSection + "\");'>";
					} else if (parserOutputObj.isPoAsRepValueMappedByPeriod[counter] === "Y") {
						htmlString = htmlString
								+ "<td  class='"+isNumaricClass+"' style='background:rgb(186, 240, 0)'  align='right' id='childval"
								+ counter
								+ "'  onmousedown='getCellValue(event,\""
								+ parserOutputObj.poId + "\",\""
								+ parserOutputObj.poAsRepVal[counter]
								+ "\",\"childval" + counter
								+ "\",\"childContextMenuVal"
								+ "\",\"parserOutChildTable\",$(this),\""
								+ poSubSection + "\");'>";
					} else {
						htmlString = htmlString
								+ "<td  class='"+isNumaricClass+"' align='right' id='childval"
								+ counter
								+ "' onmousedown='getCellValue(event,\""
								+ parserOutputObj.poId + "\",\""
								+ parserOutputObj.poAsRepVal[counter]
								+ "\",\"childval" + counter
								+ "\",\"childContextMenuVal"
								+ "\",\"parserOutChildTable\",$(this),\""
								+ poSubSection + "\");'>";
					}
					
					
					var isClickBackExists='N';
			    	if(parserOutputObj.isCoordinateExists!=null && parserOutputObj.isCoordinateExists[counter-1] !=null)
			    		{
			    			isClickBackExists= parserOutputObj.isCoordinateExists[counter-1];
			    		}
			    	
			    	if(isClickBackExists=='Y')
			    		{
				    		htmlString = htmlString
							+ "<a href='#' onclick='openPDFDoc(\""
							+ parserOutputObj.encryptedFilingId
							+ "\",\""+parserOutputObj.uploadId 
							+"\",\"" + parserOutputObj.poId
							+ "\",\"val" + counter + "\");'>";
			    		}
			    	if(parserOutputObj.poAsRepVal!=null && parserOutputObj.poAsRepVal[counter]!=null && parserOutputObj.poAsRepVal[counter]!=undefined){
			    		if($.isNumeric(parserOutputObj.poAsRepVal[counter])){
				    		htmlString = htmlString
							+ formatNumber(parserOutputObj.poAsRepVal[counter]);
				    	}else{
				    		htmlString = htmlString
							+parserOutputObj.poAsRepVal[counter];
				    	}
			    	}else{
		    			htmlString = htmlString + "";
		    		}
			    	
				    	if(isClickBackExists=='Y')
			    		{
			    			htmlString = htmlString
			    			+ "</a></td>";
			    		}
			    	else
			    		{
				    		htmlString = htmlString
			    			+ "</td>";
			    		}
							
				}
				htmlString = htmlString + "</tr>";
			}
			$('#parserOutChildTable tbody').append(htmlString);
			var popcolumnCount = columnCounter;
			var childlength = 835;
			if(nonEnglishLabelFlag == 'Y')
			{
				length = 1080;
			}
			childlength = childlength + (popcolumnCount * 80);
			var totalLengthPopup = childlength+'px';
			$("#parserOutChildTable").attr("width", totalLengthPopup);
			unCheckHeaderChildPoIdCheckBox();
			/*$("#parserOutChildTable").unbind('tableHeadFixer');
			$("#parserOutChildTable").tableHeadFixer({"head" : true, "left" : 6});*/
			$("#parserOutChildTable").tableHeadFixer();
		} catch (err) {
		}
		$("#normalizationPochild").modal('show');
		otherOperations("parserOutChildTable");
		hideLoading();
	}

	errorData = function(data) {
		$.alert("Problem occurred while getting the values.");
	hideLoading();
	};
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
}

function selectionRowTD() {
	var selectedSection = $("#datahead").html();
	if (selectedSection != undefined) {
		if (selectedSection in sectionMap) {
			var selectedArry = sectionMap[selectedSection];
			var arrayLength = selectedArry.length;
			for (var i = 0; i < arrayLength; i++) {
				var selectedColumnIndex = selectedArry[i];
				$.alert($("#myTable").find("th:eq(" + selectedColumnIndex + ")").text());
			}
		}
	}
}


function childRowClick(obj) {
	var nonEnglishLabelFlag =$('#nonEnglishLabelFlag').val(); 
	var parserId = $('#parserId').val(); 
	var poId = $(obj).children('td').find("[name='childPoId']").val();
	var selectNiItemList = $(obj).find("#niItemSuggstive" + poId).val();
	var checkedThisRow = false;
	$("[name='childPoId']").each(function(index, element) {
		if (element.checked) {
			if ($(element).val() == poId) {
				checkedThisRow = true;
				return true;
			}
		}
	});

	if ($(obj).hasClass('updateRow')) {
		$(obj).prev().show();
		$(obj).remove();
	} else {
		var poId = $(obj).children('td').find("[name='childPoId']").val();
		var poLable = $(obj).find("#childupdPoLable").text();
		var nonEnlishLabel = $(obj).find("#childnonEnglishLabel").text();
		var breakUp = "N";
		if ($(obj).children('td').find("[name='upbrekUps1']").is(':checked')) {
			breakUp = "Y";
		}
		var normLable = $(obj).find("#childupdNormLable").text().trim();
		var subSection_val = $(obj).find("#childupdSubSection").text().trim();
		var sequence = $(obj).find("#childUpdSequence").text().trim();
		var accountNumber = $(obj).find("#childupdAccountNumber").text().trim();
		var timePeriod = $(obj).find("#childupdTimePeriod").text().trim();
		var bankSequence = $(obj).find("#childUpdSequence").text().trim();
		var bankcustodianName = $(obj).find("#childupdCustodianName").text().trim();
		var subtotal = $(obj).find("#childsubtotal").text().trim();
		var sel = callFunction(poId, normLable, "Updaterow", "child", "",selectNiItemList);
		var selSubSection = callSubSectionDropDown(poId, subSection_val,"Updaterow");
		var tdLength = $(obj).children('td').length;
		var inputs = '<tr class="updateRow" ondblClick="childRowClick($(this));">';

		if (checkedThisRow) {
			inputs += '<td><input type="checkbox"  checked="checked" name="childPoId" value="'
					+ poId
					+ '" onclick="unCheckHeaderChildPoIdCheckBox();"/></td>';
		} else {
			inputs += '<td><input type="checkbox"  name="childPoId" value="'
					+ poId
					+ '" onclick="unCheckHeaderChildPoIdCheckBox();"/></td>';
		}

		if (parserId == '6' || parserId == '7') {
			inputs += '<td style="display:none" id="childUpdSequence'+poId+'"><input autocomplete="off" type="text" name="updSequence" value="'
					+ bankSequence
					+ '" id="childUpdSequence'
					+ $.trim(poId) + '"/></td>';
		} else {
			inputs += '<td><input type="text" name="updSequence" autocomplete="off" value="'
					+ sequence
					+ '" style="width:100%;" id="childUpdSequence'
					+ $.trim(poId) + '"/></td>';
		}
		inputs += '<td id="childupdPoLable"><input type="hidden" name="updPoId" autocomplete="off" value="'+poId+'"/><input type="text" class="form-control" name="updPoLable" autocomplete="off" value="'
				+ poLable + '" style="width:100%"/></td>';
		if (nonEnglishLabelFlag == 'Y' ) {
			inputs += '<td id="childNonEnlishLabel"><input type="text" name="updNonEnglishLabel" autocomplete="off" value="'
			+ nonEnlishLabel + '" style="width:100%"/></td>';
		}
		if (breakUp == 'Y') {
			if (parserId == '6' || parserId == '7' || parserId == '8' || parserId == '10') {
				inputs += '<td align="center" id="childbrekUps" style="display:none"><input type="checkbox" autocomplete="off" name="upbrekUps1" checked="checked" id="upbrekUps" value="Y" /></td>';
			} else {
				inputs += '<td align="center" id="childbrekUps"><input type="checkbox" name="upbrekUps" autocomplete="off" checked="checked" id="upbrekUps1" value="Y" onclick="updatecheckbox($(this));"/>';
				inputs += '<input type="hidden" name="upbrekUps" value="Y">';
				inputs += '</td>';
			}
		} else {

			if (parserId == '6' || parserId == '7' || parserId == '8'
					|| parserId == '10') {
				inputs += '<td align="center" id="childbrekUps" style="display:none"><input autocomplete="off" type="checkbox" name="upbrekUps1"  id="upbrekUps" /></td>';
			} else {
				inputs += '<td align="center" id="childbrekUps"><input type="checkbox" autocomplete="off" name="upbrekUps1"  id="upbrekUps" value="N" onclick="updatecheckbox($(this));" />';
				inputs += '<input type="hidden" name="upbrekUps" value="N">';
				inputs += '</td>';
			}
		}

		if (parserId == '8' || parserId == '10') {
			inputs += '<td id="childupdNormLable" style="display:none">'
					+ sel + '</td>';
		} else {
			inputs += '<td id="childupdNormLable" >' + sel + '</td>';
		}
		
		if (parserId == '6' || parserId == '7') {
			inputs += '<td id="childupdAccountNumber"><input type="text" autocomplete="off" name="updAccountNumber" value="'+accountNumber+'"/></td>';
			inputs += '<td id="childupdTimePeriod"><input type="text" autocomplete="off" name="updTimePeriod" value="'+timePeriod+'"/></td>';
			inputs += '<td style="display:none" id="childupdCustodianName"><input type="text" autocomplete="off" name="updCustodianName" value="'+bankcustodianName+'"/></td>';
		}
		if (parserId == '8' || parserId == '10') {
			inputs += '<td style="display:none">' + selSubSection + '</td>';
		} else{
			inputs += '<td>' + selSubSection + '</td>';
		}
		if (parserId == '5') {
			inputs += '<td id="childsubtotal"><input type="text" autocomplete="off" name="upSubTotal" id="upSubTotal" value="'
					+ subtotal + '" style="width:100%;"></td>';
		}
		
		var count=dynamicTableColumnCount("parserOutChildTable");
		
		for (var i = count, j = 1; i < tdLength; i++) {
			var obj = $(obj);
			val = getValueFromLink(obj, i);
			val = val.replace(/,/g, "");
			inputs += '<td class="value'+j+'"><input type="text" autocomplete="off" name="updVal'
					+ j++
					+ '" value="'
					+ val
					+ '" style="width:100%;"/></td>';
		}
		
		
		inputs += '</tr>';
		$(obj).css("display", "none");
		$(obj).after(inputs);
		 /*$("#parserOutChildTable").unbind('tableHeadFixer');
		 $("#parserOutChildTable").tableHeadFixer({"head" : true, "left" : 6});*/ 
		 $("#parserOutChildTable").tableHeadFixer();
		addSearchFiltering("selectedNiItem", poId, "child","parserOutChildTable");
		highlightNormDropdown("table");
	}
}


function checkUncheckChildPoIds() {
	if ($('#childHeaderPoIdCheckBox').is(':checked')) {
		$('input:checkbox[name="childPoId"]').prop('checked', true);
	} else {
		$('input:checkbox[name="childPoId"]').prop('checked', false);
	}
}

function unCheckHeaderChildPoIdCheckBox() {
	var checkedAll = true;
	$("[name='childPoId']").each(function(index, element) {
		if (!element.checked) {
			checkedAll = false;
			return checkedAll;
		}
	});
	if (!checkedAll) {
		$('#childHeaderPoIdCheckBox').attr('checked', false);
	} else {
		$('#childHeaderPoIdCheckBox').attr('checked', true);
	}
}

function submitchildForm() {
	//This function used for uncheck checkboxes when click on save button
	$("tr").each(function() {
				if ($(this).css("display") != "none")
					$(this).find('td:first').find('input[type=checkbox]').prop('checked', false);
			});
	var selectedPoId = "";
	var normLabelArryByPoId = "";
	var indexArray = "";
	var i = 0;
	var indexOrder = "";
	$('input[id="childaddSequence"]').each(function() {
				indexOrder = $(this).val();
				normLabelArryByPoId = $("select#selectedNiItem" + indexOrder).val();
				if (normLabelArryByPoId !== null && normLabelArryByPoId !== undefined) {
					if (normLabelArryByPoId.length > 1) {
						indexArray = indexArray + indexOrder + ",";
					}
				} else {
					$('#selectedNiItem' + indexOrder).val(-1)
				}
			});

	$('input[name="updPoId"]').each(
			function() {
				selectedPoId = $(this).val();
				normLabelArryByPoId = $("select#selectedNiItem" + selectedPoId).val();
				if (normLabelArryByPoId !== null
						&& normLabelArryByPoId !== undefined) {
					if (normLabelArryByPoId.length > 1) {
						indexArray = indexArray + $('#childUpdSequence' + selectedPoId).val() + ",";
					}
				}
			});
	if (indexArray !== "") {
		$.alert(indexArray.substring(0, indexArray.length - 1)+ " indexes having multiple normalized Label mapping.");
		hideLoading();
		return false;
	} else {
	showLoading();
		var processData = $('#child-norm-form').serialize();
		actionUrl = "update_child_normalization.htm";
		successData = function(data) {
			hideLoading();
			$.ajaxSetup({
				async : true,
				cache: true
			});
			if (!isNaN(data.trim())) {
				showChild(data.trim());
			}
		};
		errorData = function(data) {
		hideLoading();
		};
		if (processData == '') {
		} else {
			callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
		}
	}
}


function deleteMapping(mappingVal) {
	var processData = '&mappingVal=' + encodeURIComponent(mappingVal);
	actionUrl = "delete_ArsPoMapping.htm";
	successData = function(data) {
		if (currentTableName == "parserOutChildTable") {
			$("#child" + selectedPoIDValue).find("#" + selectedColumnName).css("background", "");
		} else {
			$("#" + selectedPoIDValue).find("#" + selectedColumnName).css("background", "");
		}
	};
	errorData = function(data) {
	};
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
}

function createOrUpdateSignPoMapping(){
	if($.trim(poAsReportedCellValue) === ""){
		$.alert("Selected cell value is empty.");
		return false;
	}
	var selectedSign = $('input[name="changeSign'+selectedColumnName+'"]').filter(':checked').val();
	var filingID=$('#caseId').val();
	var documentStatus=$("#documentStatus").val();
	processData = "&signValue="+encodeURIComponent(selectedSign)+"&columnVal="+encodeURIComponent(poAsReportedCellValue.trim())+"&filingId="+encodeURIComponent(filingID);
	processData=processData+"&poIdVal="+encodeURIComponent(selectedPoIDValue)+"&poColumnName="+encodeURIComponent(selectedColumnName)+"&documentStatus="+encodeURIComponent(documentStatus);
	if(processData !==""){
		actionUrl = "create_Update_Sign_Change_Po_Mapping.htm";
		successData = function(data) {
			if(currentTableName == "parserOutChildTable"){
				var childColVal=poAsReportedCellValue.trim().replace("-", "");
				if(selectedSign === "negetive"){
					$("#child"+selectedPoIDValue).find("#"+selectedColumnName +" a").text("-"+childColVal);
				}else{
					$("#child"+selectedPoIDValue).find("#"+selectedColumnName +" a").text(childColVal);
				}
				$("#child"+selectedPoIDValue).find("#"+selectedColumnName).css("background", "rgb(186, 240, 242)");
				
			}else{
				var colVal=poAsReportedCellValue.trim().replace("-", "");
				if(selectedSign === "negetive"){
					$("#"+selectedPoIDValue).find("#"+selectedColumnName +" a").text("-"+colVal);
				}else{
					$("#"+selectedPoIDValue).find("#"+selectedColumnName +" a").text(colVal);
				}
				$("#"+selectedPoIDValue).find("#"+selectedColumnName).css("background", "rgb(186, 240, 242)")
			}
			
			hideLoading();
		};
		errorData = function(data) {
			hideLoading();
			$.alert("Problem occurred while changing sign.");
		};
		showLoading();
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
	}
}	

function createOrUpdateScaleChangePoMapping()
{
		if($.trim(poAsReportedCellValue) === ""){
			$.alert("Selected cell value is empty.");
			return false;
		}
		var scaleVAlue=$('select[name=changeScale' + selectedColumnName + '] option:selected').val();
		
		var filingID=$('#caseId').val();
		var documentStatus=$("#documentStatus").val();
		processData = "&scaleValue="+encodeURIComponent(scaleVAlue)+"&columnVal="+encodeURIComponent(poAsReportedCellValue.trim())+"&filingId="+encodeURIComponent(filingID);
		processData=processData+"&poIdVal="+encodeURIComponent(selectedPoIDValue)+"&poColumnName="+encodeURIComponent(selectedColumnName)+"&documentStatus="+encodeURIComponent(documentStatus);;
		actionUrl = "create_Update_Scale_Change_Po_Mapping.htm";
		successData = function(data) {
			var colVal=poAsReportedCellValue.trim().replace(/,/g,"");
			var changedVal="";
			if(data!=='N'){
				changedVal=data;
			}else{
				 changedVal=colVal*scaleVAlue;
			}
			
			if(currentTableName == "parserOutChildTable"){
				
				$("#child"+selectedPoIDValue).find("#"+selectedColumnName +" a").text(commaSeparateNumber(changedVal));
				$("#child"+selectedPoIDValue).find("#"+selectedColumnName).css("background", "rgb(186, 240, 242)");
			}else{
				$("#"+selectedPoIDValue).find("#"+selectedColumnName +" a").text(commaSeparateNumber(changedVal));
				$("#"+selectedPoIDValue).find("#"+selectedColumnName).css("background", "rgb(186, 240, 242)")
			}
			hideLoading();
		};
		errorData = function(data) {
			hideLoading();
			$.alert("Problem occurred while changing sign.");
			
		};
		showLoading();
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
}



function addSearchFiltering(selectBoxID,poId,childId,tableName)
	{
		 $('.newselect').multiselect({
	         includeSelectAllOption: false,
	         enableFiltering:true,
			 enableCaseInsensitiveFiltering:true,
			 buttonWidth: 390,
			 maxHeight: 200,
			 onDropdownShown : function(event) {
				 this.$select.parent().find("button.multiselect-clear-filter").click();
				 this.$select.parent().find("input[type='text'].multiselect-search").focus();
				 }
	    });
		 
		 $('.input-group-addon').remove();

		if(poId !== undefined && poId !== null && poId !== ""){
				$('.multiselect-container li a').unbind("click");
				$('.multiselect-container li a').click(function(event){
					var normLabelArryByPoId=$(this).find("input").val();
				    var documentStatus=$("#documentStatus").val();
				    niLabelToSave=normLabelArryByPoId;
				   	var normItemLabelsDetailsArray =  normLabelArryByPoId.split("~");
				   	var niItem = normItemLabelsDetailsArray[0];
				   	var filingId = $('#caseId').val();
				   	var statementFormat = $('#statementFormat').val();
				   	 var processData='&niItem=' + encodeURIComponent(niItem) + '&poIdVal= ' + encodeURIComponent(poId.replace("child", "")) + '&filingId= '+encodeURIComponent(filingId)+'&sectionName='+encodeURIComponent(statementFormat)+'&documentStatus=' + encodeURIComponent(documentStatus);
				   	actionUrl="saveNormLable_ParserOutPut.htm";
				   	successData=function(data)
				   	{
				   		var subsectiontext=$("#"+childId+poId).find("#"+childId+"updSubSection").text();
				   		if(subsectiontext == undefined || subsectiontext == 'undefined' || $.trim(subsectiontext).length == 0){
				   			$("#"+childId+poId).find("#"+childId+"updSubSection").text(data);
				   		}
				   		
				   	};
				   	errorData=function(data)
				   	{
				   		$.alert("Problem occurred while updating the normalized label.");
				   		$("#"+childId+poId).find("#"+childId+"updNormLable").text("");
				   		//hideLoading();
				   	};
				   	
				   	callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
				   	
				   	// For populating value 
				   	var niLabelArr=	niLabelToSave.split("~");
			   		if(niLabelArr.length==2){
			   			var niLabeSelected = niLabelArr[1];
				   		$("#niItemSuggstive"+poId.replace("child", "")).val(niLabelArr[0]);
				   		if(niLabeSelected == null || niLabeSelected == undefined)
				   			{
				   				niLabeSelected = "";					
				   			}
				   		
				   		 $("#"+childId+poId).find("#"+childId+"updNormLable").text(niLabeSelected);
				   		 $("#"+childId+poId).next().remove();
				   		 $("#"+childId+poId).show();
			   		}else{
			   			$("#niItemSuggstive"+poId.replace("child", "")).val(-1);
			   			$("#"+childId+poId).find("#"+childId+"updNormLable").text("");
			   			$("#"+childId+poId).next().remove();
			   			$("#"+childId+poId).show();
			   		}
			   		
				   	// for handling duplicate call
				   	event.stopPropagation();
					event.preventDefault();
				});
			
			
		}
		 jQuery(".multiselect-container>li>a>label > li > a ").css({'font-size':'11px','word-break':'break-all'});
	}	

function getpreviousRecord(recordId)
	{
		previousRecordId = $("#"+recordId).prev('tr').attr('id');
	}
	
function commaSeparateNumber(val)
{
	while (/(\d+)(\d{3})/.test(val.toString())){
      val = val.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2');
    }
    return val;
  }

function numberWithCommas(x) 
	{
	    var parts = x.toString().split(".");
	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    return parts.join(".");
	}

function showPopUp()
{
	$('#popUp1').modal('show');
}

function closePopup() {
	$('#normalizationPochild').modal('hide');
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

function resetValtoBlank() {
	$("input[name=Cellmappingsearchbox]").val("");
}



function dataSetToTable(response,parserID,updatedAllPoId,uFlag,addedIds)
{
	var parserId = $('#parserId').val(); 
	var poidArr=[];
	var poidArrAdd=[];
	var nonEnglishLabelFlag =$('#nonEnglishLabelFlag').val();
	/*var recordType = $("input[type='radio'].radioDD:checked").val();*/
	var recordType="parentOnly";
	if(uFlag==-1 && updatedAllPoId!=null){
		var myArr = updatedAllPoId.toString().split(",").map(Number);
		for(var i=0;i<myArr.length;i++){
			poidArr.push(myArr[i]);
		}
		$('.updateRow').closest('tr').prev().remove();
	}
	//new added poids on ui
	if(addedIds!=null){
		var myArrAdd = addedIds.toString().split(",").map(Number);
		for(var i=0;i<myArrAdd.length;i++){
			poidArrAdd.push(myArrAdd[i]);
		}
	}
	var encryptedFillingId = $('#caseId').val();
	// dyynamic data
	try {
		var arrObj = JSON.parse(response);
		var jsonObj =arrObj["parserList"];
		var arr = JSON.parse(jsonObj);	 
		var parserOutputObj;
		var columnCounter =$("#columnCount").val();
		var j=0;
		for(var i=0; i<arr.length;i++){
			var htmlString = "";
			parserOutputObj = arr[i];
			if (parserOutputObj.isMultipleNiItems === "Y") {
				htmlString = htmlString
						+ "<tr class='poRow multipleSuggestiveMapping "
						+'ref_'+parserOutputObj.refPoId   
						+ parserOutputObj.isDuplicate
						+ " "
						+ parserOutputObj.trClass
						+ "' ondblclick='rowClick($(this))' id='"
						+ parserOutputObj.poId + "' >";
			} else {
				htmlString = htmlString
						+ "<tr class='poRow "
						+ 'ref_'+parserOutputObj.refPoId  
						+ parserOutputObj.isDuplicate
						+ " "
						+ parserOutputObj.trClass
						+ "' ondblclick='rowClick($(this))' id='"
						+ parserOutputObj.poId + "' >";
			}

			/*htmlString = htmlString
					+ "<td id='showNormLabel'>";*/
			htmlString = htmlString
			+ "<td id='showNormLabel' onmousedown='showContextMenuCheckBox(event);'>";
			htmlString = htmlString
					+ "<input type='hidden' id='niItemSuggstive"+parserOutputObj.poId+"' value='"+parserOutputObj.niItemSuggstive+"'/> <input type='checkbox' name='delPoId' id='checkbox' value='"
					+ parserOutputObj.poId
					+ "' onclick='unCheckHeaderPoIdCheckBox();'/></td>";
			if (parserId == 6 || parserId == 7
					|| parserId == 16) {
				htmlString = htmlString
						+ "<td align='center' style='display: none;' id='updSequence'>"
						+ parserOutputObj.poIndexOrder + "</td>";
			} else {
				htmlString = htmlString
						+ "<td align='center' id='updSequence'>"
						+ parserOutputObj.poIndexOrder + "</td>";
			}
			
			if(parserOutputObj.isParent == 'Y')
				{
				
				if(parserOutputObj.isonlyBreakup == 'Y')
					{
					htmlString = htmlString
					+"<td  align='left' title='"+parserOutputObj.nonEnglishLabel+"' id='updPoLable' class='wrapAsRepLable' onmousedown='showContextMenuAsreplabel(event);' >";
					if(recordType=='parentOnly')
					{
						htmlString = htmlString	
						+"<span class='hiddenIcon parentCollapse' sytle='width:10px; margin:0 20px 0 0'><i style='cursor:pointer' class='glyphicon glyphicon-plus clickable' onclick ='expandChild(this,\""+parserOutputObj.poId+"\");' data-toggle='collapse'></i></span>";
					}
					htmlString = htmlString
					+"<span><a href='javascript:void(0)' style='color:#070525; font-weight:bold;' onclick ='showChild(\""+parserOutputObj.poId+"\");'>"+parserOutputObj.poAsRepLabel+"</a></span>";
					+"</td>"
					}
				else
					{
					htmlString = htmlString
					+"<td  align='left' title='"+parserOutputObj.nonEnglishLabel+"' id='updPoLable' class='wrapAsRepLable' onmousedown='showContextMenuAsreplabel(event);' ><a href='javascript:void(0)' "
					+"style='color:#ff5722; font-weight:bold;' onclick ='showChild(\""+parserOutputObj.poId+"\");'>"+parserOutputObj.poAsRepLabel+"</a></td>"
					}
				
				}
			else if(parserOutputObj.isonlyBreakup == 'Y')
				{
				htmlString = htmlString
					+"<td align='left' title='"+parserOutputObj.nonEnglishLabel+"' id='updPoLable'   style='color:#6ea209 !important; font-weight:bold !important;' class='wrapAsRepLable' onmousedown='showContextMenuAsreplabel(event);'>";
					if(recordType=='parentOnly')
						{
							htmlString = htmlString
							+"<span class='hiddenIcon parentCollapse' sytle='width:10px; margin:0 20px 0 0'><i style='cursor:pointer' class='glyphicon glyphicon-plus clickable' onclick ='expandChild(this,\""+parserOutputObj.poId+"\");' data-toggle='collapse'></i></span>";
						}
				htmlString = htmlString
					+ parserOutputObj.poAsRepLabel + "</td>";
				}
			else
				{
				htmlString = htmlString
					+"<td align='left' title='"+parserOutputObj.nonEnglishLabel+"' id='updPoLable'  class='wrapAsRepLable' onmousedown='showContextMenuAsreplabel(event);'>"
					+ parserOutputObj.poAsRepLabel + "</td>";
				}
			if (nonEnglishLabelFlag === 'Y') {
				htmlString = htmlString
				+"<td align='left'  id='nonEnglishLabel' class='wrapAsRepLable NonEnglishLabel'>"
				+ parserOutputObj.nonEnglishLabel + "</td>";
			}

			if (parserId == 6 || parserId == 7 || parserId == 8 || parserId == 10) {
				if (parserOutputObj.poBreakup === "Y") {
					htmlString = htmlString
							+ "<td align='center' id='brekUps' style='display: none;' class='BU'><input type='checkbox' name='upbrekUps1' checked='checked' value='Y' /></td>";
				} else {
					htmlString = htmlString
							+ "<td align='center' id='brekUps' style='display: none;' class='BU'><input type='checkbox' name='upbrekUps1'  value='N' /></td>";
				}
			} else {
				if (parserOutputObj.poBreakup === "Y") {
					htmlString = htmlString
							+ "<td align='center' id='brekUps' class='BU'><input type='checkbox' name='upbrekUps1' checked='checked' value='Y' readonly='readonly'/></td>";
				} else {
					htmlString = htmlString
							+ "<td align='center' id='brekUps' class='BU'><input type='checkbox' name='upbrekUps1'  value='N' readonly='readonly'/></td>";
				}
			}
			
			
			if (parserId == 8 || parserId == 10) {
				htmlString = htmlString
						+ "<td align='left' id='updNormLable' style='display: none;' class='NormalizedLabel'>"
						+ parserOutputObj.normalizedLabel + "</td>";
			} else {
				htmlString = htmlString
						+ "<td align='left' id='updNormLable' class='NormalizedLabel'>"
						+ parserOutputObj.normalizedLabel + "</td>";
			}
			if (parserId == 6 || parserId == 7) {
				htmlString = htmlString
						+ "<td align='left' id='updAccountNumber'  class='AccountNumber'>"
						+ parserOutputObj.poAccountNumber + "</td>";
				htmlString = htmlString
						+ "<td align='center' id='updTimePeriod' class='TimePeriod'>"
						+ parserOutputObj.poTimePeriod + "</td>";
				htmlString = htmlString
						+ "<td align='center' id='updCustodianName' style='display: none;' class='CustodianName'>"
						+ parserOutputObj.poCustodianName + "</td>";
			} else if (parserId == 8 || parserId == 10) {
				htmlString = htmlString
						+ "<td align='left' id='updSubSection' style='display: none;' class='SubSection' >"
						+ parserOutputObj.poSubSection + "</td>";
			} else {
				htmlString = htmlString
						+ "<td align='left' id='updSubSection' class='SubSection'>"
						+ parserOutputObj.poSubSection + "</td>";
			}

			htmlString = htmlString
		       +"<td align='left' id='tdNoteId' class='Note'>"
		       +parserOutputObj.note
		       +"</td>";
			
			if (parserId == 5) {
				if (parserOutputObj.poSubTotal === "Y") {
					htmlString = htmlString
							+ "<td align='center' id='subtotal' class='ST'>"
							+ parserOutputObj.poSubTotal + "</td>";
				} else {
					htmlString = htmlString
							+ "<td align='center' id='subtotal' class='ST'>&nbsp;</td>";
				}
			}

			/**Dynamic value column functionality*/
			for (var counter = 1; counter <= columnCounter; counter++) {
				//*if column values is exist then execute below code
				var isNumaricClass="";
				if(parserOutputObj.poAsRepVal[counter]!=null && parserOutputObj.poAsRepVal[counter]!=undefined && parserOutputObj.poSubSection!='ATTR' && parserOutputObj.poSubSection!='HEADER')
	    		{
			    	if(!$.isNumeric(parserOutputObj.poAsRepVal[counter]))
		    		{
		    			if(!checkNumaricRules(parserOutputObj.poAsRepVal[counter]))	
		    				{
				    		isNumaricClass=" notNumaric";	
		    				}
		    		}
	    		}

				if (parserOutputObj.isPoAsRepValueMapped[counter] === "Y") {
					htmlString = htmlString
							+ "<td  class='value"+counter+isNumaricClass+"' style='background:rgb(186, 240, 242); max-width:80px; width:80px; word-wrap:break-word'  align='right' id='val"
							+ counter
							+ "'  onmousedown='getCellValue(event,\""
							+ parserOutputObj.poId + "\",\""
							+ parserOutputObj.poAsRepVal[counter]
							+ "\",\"val" + counter
							+ "\",\"contextMenuVal1"
							+ "\",\"myTable\",$(this),\""
							+ parserOutputObj.poSubSection + "\");'>";
				} else if (parserOutputObj.isPoAsRepValueMappedByPeriod[counter] === "Y") {
					htmlString = htmlString
							+ "<td class='value"+counter+isNumaricClass+"' style='background:rgb(186, 240, 0); max-width:80px; width:80px; word-wrap:break-word'  align='right' id='val"
							+ counter
							+ "'  onmousedown='getCellValue(event,\""
							+ parserOutputObj.poId + "\",\""
							+ parserOutputObj.poAsRepVal[counter]
							+ "\",\"val" + counter
							+ "\",\"contextMenuVal1"
							+ "\",\"myTable\",$(this),\""
							+ parserOutputObj.poSubSection + "\");'>";
				} else {
					htmlString = htmlString
							+ "<td class='value"+counter+isNumaricClass+"' style='max-width:80px; width:80px; word-wrap:break-word' align='right' id='val"
							+ counter
							+ "' onmousedown='getCellValue(event,\""
							+ parserOutputObj.poId + "\",\""
							+ parserOutputObj.poAsRepVal[counter]
							+ "\",\"val" + counter
							+ "\",\"contextMenuVal1"
							+ "\",\"myTable\",$(this),\""
							+ parserOutputObj.poSubSection + "\");'>";
				}

			    if(parserOutputObj.poAsRepVal[counter]!=null && parserOutputObj.poAsRepVal[counter]!="" && parserOutputObj.poAsRepVal[counter]!= undefined)
			    	{
			    	var isClickBackExists='N';
			    	if(parserOutputObj.isCoordinateExists[counter-1] !=null)
			    		{
			    			isClickBackExists= parserOutputObj.isCoordinateExists[counter-1];
			    		}
			    	
			    	if(isClickBackExists=='Y')
			    		{
				    		htmlString = htmlString
							+ "<a href='#' onclick='openPDFDoc(\""
							+ encryptedFillingId
							+ "\",\""+parserOutputObj.uploadId  
							+"\",\"" + parserOutputObj.poId
							+ "\",\"val" + counter + "\");'>";
			    		}
		
			    	
			    if(parserOutputObj.poAsRepLabel == 'STATEMENT YEAR' || parserOutputObj.poAsRepLabel == 'STATEMENT QUALITY' || parserOutputObj.poSubSection == 'PREV-HEADER' || parserOutputObj.poSubSection == 'HEADER')
			    	{
			    		htmlString = htmlString
			    			+parserOutputObj.poAsRepVal[counter];
				    		
			    	}
			    else
			    	{

			    	if(parserOutputObj.poAsRepVal[counter]!=null && parserOutputObj.poAsRepVal[counter]!=undefined)
			    		{
					    	if($.isNumeric(parserOutputObj.poAsRepVal[counter]))
				    		{
				    		htmlString = htmlString
							+ formatNumber(parserOutputObj.poAsRepVal[counter]);
				    		}
				    	else
				    		{
				    		htmlString = htmlString
							+ parserOutputObj.poAsRepVal[counter];
				    		}
			    		}else{
			    			htmlString = htmlString + "";
			    		}
			    	}
			    
			    	if(isClickBackExists=='Y')
			    		{
			    			htmlString = htmlString
			    			+ "</a></td>";
			    		}
			    	else
			    		{
				    		htmlString = htmlString
			    			+ "</td>";
			    		}
			    }
			}
			htmlString = htmlString + "</tr>";
			   
			/*dynamically append cases 
			 * case 1:uFlag=-1 
			 * case 2:else case added 
			 * case 2:uFlag >1 child 
			 * else update and add new row 
			 */
		
			if(uFlag ==0){	
			    	// select and scroll data
				    $("table#myTable tbody").append(htmlString);
			}else if(uFlag > 1){	
		    	// ref_poid data 
				$('table#myTable #'+uFlag+'').closest('tr').after(htmlString);
				$('table#myTable #'+uFlag+'').addClass('loaded');
				uFlag=parserOutputObj.poId;
		     }else{					
					if(poidArr!=null && poidArr.length>i ){
					// update
						$('table#myTable #'+poidArr[i]+'').replaceWith(htmlString);	
					}else{
					// new added records
						$('table#myTable .addNew'+poidArrAdd[j]+'').replaceWith(htmlString);	
						j++;
					}
				}
		}
		
		$('#myselect').trigger("change");
		addIndex=0;	
	} catch (err) {
	}
}

function calAjaxData(sCount,updatedAllPoId,uFlag,addedAllPoId,addedIds)
{ 
	// load for only  on_ready  and update
	if(sCount==1 || uFlag==-1){
		$.blockUI({ message: '' }); 
	}
var filingId = $('#caseId').val();
var parserID=$('#parserId').val();
var columnCount = $('#columnCount').val();
var statementFormat = $('#statementFormat').val();
var wqId = $('#wqId').val();
var asReportedLable = $('#asReportedLable').val();
/*var recordType = $("input[type='radio'].radioDD:checked").val();*/
var recordType="parentOnly";
var parametersDynamic='fillingId='+encodeURIComponent(filingId)+'&statementFormat='+encodeURIComponent(statementFormat)+'&scrollCount='+encodeURIComponent(sCount)+'&wqId='+encodeURIComponent(wqId)+'&parserId='+encodeURIComponent(parserID)+'&columnCount='+encodeURIComponent(columnCount)+'&updatedAllPoId='+encodeURIComponent(updatedAllPoId)+'&addedAllPoId='+encodeURIComponent(addedAllPoId)+'&recordType='+encodeURIComponent(recordType)+'&asReportedLable='+encodeURIComponent(asReportedLable);
var url='scrollPage_norm.htm';
url=insertParam(url);
$.ajaxSetup({
	cache: true
});
$.ajax({
	 type: "POST",  
	 url: url,
	 data:parametersDynamic,
	 cache: true,
	 async: false,
	 dataType : "html",
	 success: function(response)
	 {			
		 var responseObj = JSON.parse(response);
		var totalRecordsObj =responseObj["totalRecords"];
		totalRecordsObj=parseInt(totalRecordsObj);
		if(totalRecordsObj>0){
			dataSetToTable(response,parserID,updatedAllPoId,uFlag,addedIds);
			otherOperations("myTable");
			bankParserTest(parserID,sCount);			
		}else{
			endCount=true;
			if(sCount==1 && uFlag!=-1){
				//$('#maindiv').html("No Information Available.");
				var tdCount=columnCount+7;
			    $("table#myTable tbody").append("<tr ><td colspan='"+tdCount+"'>No Information Available </td></tr>");
			}
			sCount=1;
	    }
		$.unblockUI();
		//Here we hide column based on user selection
		hideShowColumn();
		//end hide functionality
		$('table#myTable').unblock();
		hideLoading();	
	 }
});



}

function  bankParserTest(parserID,sCount){
	     if(parserID==6 && sCount==1){
	     	  /* Below code used for set Div(Maindiv) height dynamically based parser 
	     	  if parser is bank then decrease div height by 2% (14px)
	     	  */
	        var checkExist = setInterval(function() {
	        	   if ($('div#maindiv  #myTable').length) {
	        	      var divHeight = $("div#maindiv" ).height();
	        	      var heightSub = divHeight - 16;
	        	      $('div#maindiv').attr('style', 'height: '+heightSub+'px !important');
	        	      clearInterval(checkExist);
	        	   }
	        	}, 100);
	        }  	
}


function waitForElement(elementPath, callBack){
	  window.setTimeout(function(){
	    if($(elementPath).length){
	      callBack(elementPath, $(elementPath));
	    }else{
	      waitForElement(elementPath, callBack);
	    }
	  },500)
	}

function updatedViewData(WqId, fillingId, statementFormat, customerId,updatedAllPoId,addedAllPoId,addedIds){
        uFlag=-1;
		if(bankParser){
			searchDiv=1;
			searchDataByFilter(sCount,updatedAllPoId,uFlag,addedAllPoId,addedIds,searchDiv);	
		}else{
			   calAjaxData(sCount,updatedAllPoId,uFlag,addedAllPoId,addedIds);
		}
}

function customViewData(WqId, fillingId, statementFormat, customerId,
		updatedAllPoId) {
	setDataHead(statementFormat);
	//$('#data-div-1').html("Data Loading............");

	showLoading();
	processData = '&statementFormat=' + encodeURIComponent(statementFormat)
			+ '&WqId=' + encodeURIComponent(WqId) + '&fillingId='
			+ encodeURIComponent(fillingId) + "&customerId="
			+ encodeURIComponent(customerId);

	/*
	Here if statementformat(section) is Supplemental Information then call rulesmgnt_supplemental_Info controller
	 */
	actionUrl = "rules_management_statement.htm";

	successData = function(data) {
		$('#data-div-1').html(data);
		hideLoading();
		highLightRows(updatedAllPoId);
	};
	errorData = function(data) {
		$('#data-div-1').html(data);//.show();
		hideLoading();
	};
	retDataType = "html";
	callAjax(processData, successData, errorData, beforeSend, actionUrl,
			reqType, retDataType);
}

/* This function called when checkbox is checked or not */

function updatecheckbox(t) {
    if (t.is(':checked')) {
    	t.next( "[name=upbrekUps]").val('Y');
    } else {
    	t.next( "[name=upbrekUps]").val('N');
    }
}
   

function addcheckbox(t, childId) {
	if (t.is(':checked')) {
		t.next("[name=addbrekUps]").val('Y');
	} else {
		t.next("[name=addbrekUps]").val('N');
	}
	
	/*if (typeof childId === 'undefined' || !childId) {
			if (t.is(':checked')) {
				t.next("[name=addbrekUps]").val('Y');
			} else {
				t.next("[name=addbrekUps]").val('N');
			}
		} else {
			if (t.is(':checked')) {
				t.next("[name=" + childId + "addbrekUps]").val('Y');
			} else {
				t.next("[name=" + childId + "addbrekUps]").val('N');
			}
		}*/
	}


/* This function is used for Residual Mapping(ie if Normalized Label is null then update all null lable by "Cash") for sectionwise */ 
function residualMapping(ni_lable,ni_item){
	 if ($.confirm("Please confirm whether remaining transactions to be mapped as 'Cash' ") == true) {
	var section=$("#statementFormat").val();
	var filingId=$("#filingId").val();
	var wqId = $('#wqId').val();
	var customerId = $('#customerId').val();
	
	var processData="&ni_lable="+encodeURIComponent(ni_lable)+"&ni_item="+encodeURIComponent(ni_item)+"&section="+encodeURIComponent(section)+"&filingId="+encodeURIComponent(filingId);
	actionUrl="update_NormalizedLabelColumn.htm";
	var caseId = $('#caseId').val();
	successData=function(data)
	{
		viewData(wqId,caseId,section,customerId);
	//	hideLoading();
	};
	errorData=function(data)
	{
		viewData(wqId,caseId,section,customerId);
		hideLoading();
	};
	if(processData=='')
	{
	}
	else
	{
		showLoading();
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
	}	
}//end confirm else	
}

	
/* This function is called on custom mapping */ 	
function customMapping(){
var processData=$('#customMappingForm').serialize();
var filingId = $('#caseId').val();
var section=$("#statementFormat").val();
var wqId = $('#wqId').val();
var customerId = $('#customerId').val();
actionUrl="update_CustomMapping.htm";    
successData=function(data)
{
 try{
	 var successflag;
	 var msg;
 result=JSON.parse(data);
$.ajaxSetup({
	 async:false,
	 cache: true
});
if(result.hasOwnProperty('successflag'))
{
	successflag=result['successflag'];
}
if(result.hasOwnProperty('msg'))
{
	msg=result['msg'];
}
if(successflag){ 
$.alert(msg);

$('#popUp1').modal('hide');
viewData(wqId,filingId,section,customerId);
hideLoading();
}else{
	 hideLoading();
}
 }catch(e){
	 hideLoading();
	 $('#popUp1').modal('hide');
 }	
};
errorData=function(data)
{
viewData(wqId,filingId,section,customerId);
hideLoading();
};
showLoading();
callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
}






function checkCheckboxChecked(checkBoxName)
{
	var len = $("[name='"+checkBoxName+"']:checked").length;
	if(len>0)
	return true;
	else 
	return false;
}


/************** Submit Data *******************************/
function submitForm()
{
//This function used for uncheck checkboxes when click on save button
	   $("tr").each(function()
		{
		  if($(this).css("display") != "none")
			  $(this).find('td:first').find('input[type=checkbox]').prop('checked', false);
		}); 
	var selectedPoId="";
	var normLabelArryByPoId="";
	var indexArray="";
	var i=0;
	var indexOrder="";
	var filingId = $('#caseId').val();
	var section=$("#statementFormat").val();
	var wqId = $('#wqId').val();
	var customerId = $('#customerId').val();
	$('input[name="addSequence"]').each(function() {
		indexOrder=$(this).val();
		normLabelArryByPoId=$("select#selectedNiItem"+indexOrder).val();
		if(normLabelArryByPoId !== null && normLabelArryByPoId !== undefined){
			if(normLabelArryByPoId.length>1){
				indexArray =indexArray+indexOrder+",";
			}
		}else{
			$('#selectedNiItem'+indexOrder).val(-1);
		}
	});
	$('input[name="updPoId"]').each(function() {
		selectedPoId=$(this).val();
		normLabelArryByPoId=$("select#selectedNiItem"+selectedPoId).val();
		if(normLabelArryByPoId !== null && normLabelArryByPoId !== undefined){
			if(normLabelArryByPoId.length>1){
				indexArray =indexArray+$('#updSequence'+selectedPoId).val()+",";
			}
		}else{
			$('#selectedNiItem'+selectedPoId).val(-1);
		}
	});
	if(indexArray !==""){
		$.alert(indexArray.substring(0,indexArray.length-1)+" indexes having multiple normalized Label mapping.");
		hideLoading();
		return false;
	}else{
		var processData=$('#norm-form').serialize();
		actionUrl="update_normalization.htm";
		successData=function(data)
		{
			$.ajaxSetup({
				 async:true,
				 cache: true
			});
			hideLoading();
		if(data.deletedFlag==1){
			updatedViewData(wqId,filingId,section,customerId,data.updatedAllPoId,data.addedAllPoId,data.isNewAdded);
		} 
		$('table#myTable .deleteRow').remove();
		};
		errorData=function(data)
		{
			hideLoading();
			viewData(wqId,filingId,section,customerId);
		};
		if(processData=='')
		{
		}
		else
		{
		showLoading();
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
		}
		highlightSelectedColumns();
	}
}

function getValueWithoutLink(obj,column)
{
	var $val1 = $(obj).children('td').eq(column).clone();
	$val1.children('a').remove();
	return $val1.text().trim();
}

function getValueFromLink(obj,column)
{
	var $valtemp = $(obj).children('td').eq(column).clone();
	var tmpText="";
	if($valtemp.children('a').length > 0){
		tmpText = $valtemp.children('a').text();
	}else{
		tmpText=$valtemp.text().trim()
	}
	
	
	return tmpText.trim();
}

function unCheckHeaderPoIdCheckBox()
{
	 var checkedAll = true;
	 $("[name='delPoId']").each(function(index,element){
	 if(!element.checked){
		 checkedAll=false;
		 return checkedAll;
	 }
	 });
	 if(!checkedAll){
		 $('#headerPoIdCheckBox').attr('checked',false);
	 }else{
		 $('#headerPoIdCheckBox').attr('checked',true);
	 }
}

function checkUncheckPoIds(){
	if($('#headerPoIdCheckBox').is(':checked')){
		$('input:checkbox[name="delPoId"]').prop('checked',true);
	}else{
		$('input:checkbox[name="delPoId"]').prop('checked',false);
	}
 }




function rowClick(obj)
{
	var nonEnglishLabelFlag = $('#nonEnglishLabelFlag').val();
	var parserId = $('#parserId').val();
	var poId=$(obj).children('td').find("[name='delPoId']").val();
	var checkedThisRow=false;
	$("[name='delPoId']").each(function(index,element){
		 if(element.checked){
			 if($(element).val()==poId){
				 checkedThisRow=true;
				 return true;
			 }
		 	}
		 }); 
	
	if($(obj).hasClass('updateRow'))
	{
		$(obj).prev().show();
		$(obj).remove();
	}
	else
  {
	var poId=$(obj).children('td').find("[name='delPoId']").val();
 	var poLable = $(obj).find("#updPoLable").text(); 

 	var breakUp="N";
 	 if($(obj).children('td').find("[name='upbrekUps1']").is(':checked')){
 		breakUp="Y"; 
 	 }
 	 var nonEnglishLabel =$(obj).find("#nonEnglishLabel").text(); 
 	var selectNiItemList= $(obj).find("#niItemSuggstive"+poId).val();
	var normLable = $(obj).find("#updNormLable").text().trim(); 	
	var subSection_val = $(obj).find("#updSubSection").text().trim();
	var sequence = $(obj).find("#updSequence").text().trim(); 
	var accountNumber = $(obj).find("#updAccountNumber").text().trim(); 
	var timePeriod = $(obj).find("#updTimePeriod").text().trim(); 
	var bankSequence = $(obj).find("#updSequence").text().trim(); 
	var bankcustodianName = $(obj).find("#updCustodianName").text().trim(); 
	var subtotal=$(obj).find("#subtotal").text().trim();
	var noteNumber = $(obj).find("#tdNoteId").text().trim(); 
	var sel= callFunction(poId,normLable,"Updaterow","","",selectNiItemList);
	var selSubSection=callSubSectionDropDown(poId,subSection_val,"Updaterow");
					var tdLength=$(obj).children('td').length;
					var inputs='<tr class="updateRow" ondblClick="rowClick($(this));" id="'+poId+'">';
					if(checkedThisRow){
						inputs+='<td><input type="checkbox"  checked="checked" name="delPoId" class="form-control" value="'+poId+'" onclick="unCheckHeaderPoIdCheckBox();" style="width:100%;"/></td>';	
					}else{
						inputs+='<td><input type="checkbox"  name="delPoId" value="'+poId+'" class="form-control" onclick="unCheckHeaderPoIdCheckBox();" style="width:100%;"/></td>';
					}
					
					if(parserId == '6'){
						inputs+='<td style="display:none" id="updSequence"><input autocomplete="off" type="text" name="updSequence" class="form-control custom-pad-seq" value="'+bankSequence+'" id="updSequence'+$.trim(poId)+'" style="width:100%; padding:4px 5px !important"/></td>';
					}else{
						inputs+='<td><input type="text" name="updSequence" autocomplete="off" value="'+sequence+'"class="form-control custom-pad-seq"  id="updSequence'+$.trim(poId)+'" style="width:100%; padding:4px 5px !important"/></td>';
					}
					inputs+='<td id="updPoLable" ><input type="hidden" name="updPoId"  class="form-control" autocomplete="off" value="'+poId+'"/><input type="text" class="form-control" name="updPoLable" autocomplete="off" value="'+poLable+'" style="width:100%;"/></td>';
					if(nonEnglishLabelFlag == 'Y'){
						inputs+='<td id="updPoLable"><input type="text" name="updNonEnglishLabel" class="form-control" autocomplete="off" value="'+nonEnglishLabel+'" style="width:100%;"/></td>';
					}
					if(breakUp=='Y')
					{
						 if(parserId == '6')
						 {
							 inputs+='<td align="center" id="brekUps" style="display:none"><input type="checkbox" class="form-control" autocomplete="off" name="upbrekUps1" checked="checked" id="upbrekUps" value="Y" style="width:100%;"/></td>';
						 }
					else{
							inputs+='<td align="center" id="brekUps"><input type="checkbox" class="form-control" name="upbrekUps" autocomplete="off" checked="checked" id="upbrekUps1" value="Y" onclick="updatecheckbox($(this)); style="width:100%;""/>';
							inputs+='<input type="hidden" name="upbrekUps" value="Y">';
							inputs+='</td>';		 
						 }
					}
					else
					{
						if(parserId == '6')
						{
							inputs+='<td align="center" id="brekUps" style="display:none"><input autocomplete="off" class="form-control" type="checkbox" name="upbrekUps1"  id="upbrekUps" style="width:100%;"/></td>';
						}
						else
						{
							inputs+='<td align="center" id="brekUps"><input type="checkbox" class="form-control" autocomplete="off" name="upbrekUps1"  id="upbrekUps" value="N" onclick="updatecheckbox($(this));" style="width:100%;"/>';	
							inputs+='<input type="hidden" class="form-control" name="upbrekUps" value="N">';
							inputs+='</td>';	
						}
					}
					
	
					inputs+='<td id="updNormLable" width="310px" style="z-index:-9999">'+sel+'</td>';
					
					if(parserId == '6'){
						inputs+='<td id="updAccountNumber"><input type="text" class="form-control" autocomplete="off" name="updAccountNumber" value="'+accountNumber+'" style="width:100%;"/></td>';
						inputs+='<td id="updTimePeriod"><input type="text" class="form-control" autocomplete="off" name="updTimePeriod" value="'+timePeriod+'" style="width:100%;"/></td>';
						inputs+='<td style="display:none" id="updCustodianName"><input type="text" autocomplete="off" name="updCustodianName" value="'+bankcustodianName+'" style="width:100%;"/></td>';
					}
					var startCount =dynamicTableColumnCount("myTable");
					if(parserId != '6'){
					inputs+='<td width="90px;">'+selSubSection+'</td>';
					}
					inputs+='<td><input type="text" class="form-control" name="updNote" id="updNote"  value="'+noteNumber+'" style="width:100%;"/></td>';
					for(var i=startCount,j=1;i<tdLength;i++)
					{
						var obj=$(obj);
						val=getValueFromLink(obj,i);
						if(checkNumber(generateNumberForUS(val)))
						{
							val=val.replace(/,/g, "");			
						}
						inputs+='<td class="value'+j+'"><input type="text" class="form-control" autocomplete="off" name="updVal'+ j++ +'" value="'+val+'" style="width:100%;"/></td>';
					}
					//if(nonEnglishLabelFlag == 'Y'){}else{}
					inputs+='</tr>';
					$(obj).css("display", "none");
					$(obj).after(inputs);
					addSearchFiltering("selectedNiItem",poId,"","myTable");
					highlightNormDropdown("table");
	}
	hideShowColumn();
}

var refPoidVal=-1;

/************** Add New Row *****************/
function addRow(isChild,dpr)
{
	var nonEnglishLabelFlag = $('#nonEnglishLabelFlag').val();
	var checkBoxName ="delPoId";
	var tableName ="myTable";
	var childId="";
	var count =0;
	addIndex = parseInt(addIndex)+1;
	if(isChild === "Y"){
		checkBoxName="childPoId";
		tableName="parserOutChildTable";
		childId="child";	
	}
	/**
	 * Here we get table column count based on table name;
	 */
	var count=dynamicTableColumnCount(tableName);
	
	var parserId = $('#parserId').val(); 
	var len = $("[name='"+checkBoxName+"']:checked").length;
	var checkElements = document.getElementsByName(checkBoxName);
	if(len>0)
	{
		var v=1;
		var $this;
		for(var i=0; checkElements[i]; i++)
		{
		  if(checkElements[i].checked)
		  {
			  var alreadyExistsItems = new Array();
			  $('#'+tableName+' tbody tr td:nth-child(2)').each( function(){
			     alreadyExistsItems.push( $(this).text() );       
			  });
			  var newlyAddedItems = new Array();
			  $('#'+tableName+' tbody tr td:nth-child(3) input').each( function(){
			     newlyAddedItems.push( $(this).val() );       
			  });
			   $this = $(checkElements[i]);
			   
			   if($this.hasClass('deleteRow'));
			   else
			   {
				   var poId=Math.floor(Math.random()*11);
					var tdLength=$this.parents('tr').children('td').length;
						if (typeof $this.parents("tr").find('input[name="isNewAdded"]').val() !== "undefined") {
						tdLength=tdLength-1;
					}	
					var seq=$this.parents('tr').children('td').eq(1).text();
					var textSeq=$this.parents("tr").find('input[name="addSequence"]').val();
					var item = $this.parents('tr').find(".hiddenIcon").html();
					if($(item).hasClass("glyphicon-plus"))
						{
							$.alert("Please expand the child records before adding new row.");
							return false;
						}			
					 var adPoLabelVal='';
					 var addNonEnglishLabel='';
		        	 var normLable='';
		        	 var adubrk1='';
		        	 var subSection_val='';
		        	 var selSubSection='';
		        	 var adNoteVal='';
		        	 var  adpId = $this.parents("tr").attr('id');
		        	 adpId = adpId.replace("child", "");
		         	adpId = parseInt(adpId);
		         	 var parent_poid='' //this used for dublicate rows inserting  by parent po_id
		         	  if(textSeq=='' || typeof textSeq === 'undefined'){
						textSeq=$this.parents("tr").find('input[name="updSequence"]').val();
				   		}
						if(seq==''){
							seq=textSeq;	
						}
						var tmpSeq = parseInt(seq)+1;
		       	     if(dpr=="N"){
		       	    	 var selectNiItemList= $("#niItemSuggstive"+adpId).val();
		       	    	 sel= callFunction(poId,normLable,"Addrow",childId,tmpSeq,"");
				       	 selSubSection=callSubSectionDropDown(poId,subSection_val,"Addrow");
				       	}
				       	if(dpr=="D"){
		        		  if(adpId > 0 && dpr=="D"){
		        			  var selectNiItemList= $("#niItemSuggstive"+adpId).val();
		        			  adPoLabelVal=$this.parents('tr').children('td#'+childId+'updPoLable').text(); 
		        			  addNonEnglishLabel=$this.parents('tr').children('td#'+childId+'nonEnglishLabel').text(); 
						    normLable=$this.parents('tr').children('td#'+childId+'updNormLable').text(); 
						    adubrk1=$this.parents('tr').children('td').find("[name='upbrekUps1']").is(':checked');  
						    sel= callFunction(poId,normLable,"Addrow",childId,tmpSeq,selectNiItemList);
						    subSection_val=$this.parents('tr').children('td#'+childId+'updSubSection').text();  
						 	selSubSection=callSubSectionDropDown(poId,subSection_val,"Addrow");
						    adNoteVal=$this.parents('tr').children('td#'+childId+'tdNoteId').text().trim(); 
						    parent_poid=adpId;
			        	}else{	
			        		//dublicate id insertion Logic
			        		 parent_poid=$this.parents("tr").find('input[name="addParentPo_Id"]').val();
			        		 if(adpId=="-1"){
			 					parent_poid=parent_poid;
			 				}else{
			 					parent_poid=adpId;
			 				}
			        		adPoLabelVal=$this.parents('tr').children('td').find('input[name="addPoLable"]').val();
			        		 addNonEnglishLabel==$this.parents('tr').children('td').find('input[name="addNonEnglishLabel"]').val(); 
			        	  normLable=$this.parents('tr').children('td').find('select[name="addNormLable"]  option:selected').text(); 
			        	  var normLabelArr=normLable.split(':');
			        	  if(normLabelArr.length>1){
			        		  normLabelArr=normLabelArr[1];
			        		  normLabelArr=normLabelArr.trim();
			        	  }else{
			        		  normLabelArr='';
			        	  }
			        	 sel= callFunction(poId,normLabelArr,"Addrow",childId,tmpSeq,"");
			        	    adubrk1=$this.parents('tr').children('td').find("[name='addbrekUps1']").is(':checked');  
			        	    subSection_val=$this.parents('tr').children('td').find('select[name="addSubSection"]  option:selected').text(); 
			        	    selSubSection=callSubSectionDropDown(poId,subSection_val,"Addrow");
			        	    adNoteVal=$this.parents('tr').children('td').find('input[name="addNote"]').val();
			        	}
			       }
					
					if((jQuery.inArray(tmpSeq.toString(), alreadyExistsItems) != -1) || (jQuery.inArray(tmpSeq.toString(), newlyAddedItems) != -1))
						{
							$.alert("You can not add the record in this location.");
							return false;
						}
					else
						{			
				//addParentPo_Id used for dublicate parentId insert	
				if(dpr=="N"){
					var inputs='<tr id="0" class="addNew'+addIndex+'">';
					inputs+='<td  class="addedNew" style="display:none"><input type="hidden" class="form-control" name="isNewAdded" value="'+addIndex+'"/></td>';
					}else{
					var inputs='<tr id="-1" class="addNew'+addIndex+'">';
					inputs+='<td  class="addedNew" style="display:none"><input type="hidden" class="form-control" name="isNewAdded" value="'+addIndex+'"/></td>';
					
				}
				if(isChild === "Y"){
						inputs+='<td><input type="checkbox" name="childPoId" value="0" class="form-control" onclick="unCheckHeaderChildPoIdCheckBox();" style="width:100%;"/>';
							 if(dpr=="N")
								{
									inputs+='<input type="hidden" class="form-control" name="isDublicate" value="N"/>';
									inputs+='<input type="hidden" class="form-control" name="addParentPo_Id" id="parentPo_Id" value="'+parent_poid+'"/>';
								}
							else
								{
									inputs+='<input type="hidden" class="form-control" name="isDublicate" value="Y"/>';
									inputs+='<input type="hidden" class="form-control" name="addParentPo_Id" id="parentPo_Id" value="'+parent_poid+'" />';
								} 
							inputs+='</td>';
					}else{
						inputs+='<td><input type="checkbox" class="form-control" name="delPoId" value="0" onclick="unCheckHeaderPoIdCheckBox();" style="width:100%;"/>';	
						if(dpr=="N")
						{
							inputs+='<input type="hidden" class="form-control" name="isDublicate" value="N"/>';
							inputs+='<input type="hidden" class="form-control" name="addParentPo_Id" id="parentPo_Id" value="'+parent_poid+'" />';
						}
					else
						{
							inputs+='<input type="hidden" class="form-control" name="isDublicate" value="Y"/>';
							inputs+='<input type="hidden" class="form-control" name="addParentPo_Id" id="parentPo_Id" value="'+parent_poid+'" />';
						} 
						inputs+='</td>';
					}
					
					if(parserId == '6'){
						var seq=$this.parents("tr").find("#"+childId+"updSequence").text().trim(); 
						if(seq==''){
						 seq=$this.parents("tr").find('input[name="updSequence"]').val();
						}
						inputs+='<td style="display:none" id="'+childId+'addSequence"><input  type="text" class="form-control" name="addSequence" id="'+childId+'addSequence" value="'+(++seq)+'" style="width:100%;"/></td>';
					}else{
						inputs+='<td><input type="text" class="form-control" name="addSequence" value="'+(++seq)+'" id="'+childId+'addSequence" style="width:100%;"/></td>';
					}
           if(dpr=="N"){	
					inputs+='<td id="'+childId+'updPoLable"><input type="text" class="form-control" name="addPoLable" value="" style="width:100%;"/></td>';
           }else{
          	 inputs+='<td id="'+childId+'updPoLable"><input type="text" class="form-control" name="addPoLable" value="'+adPoLabelVal+'" style="width:100%;"/></td>';
           }
           if(nonEnglishLabelFlag == 'Y'){
        	   if(dpr=="N"){
        		   inputs+='<td id="'+childId+'updNonEnglishLable" class="NonEnglishLabel"><input type="text" class="form-control" name="addNonEnglishLabel" value="" style="width:100%;"/></td>';
        	   }else{
        		   inputs+='<td id="'+childId+'updNonEnglishLable" class="NonEnglishLabel"><input type="text" class="form-control" name="addNonEnglishLabel" value="'+addNonEnglishLabel+'" style="width:100%;"/></td>';
        	   }
           }
           refPoidVal=-1;
           if($this.parents("tr").find('input[name="upbrekUps1"]').is(':checked')){
        	 //refPoidVal =$this.parents("tr").attr('id');  
        	 getParentPoId($this.parents("tr").prev('tr'),"upbrekUps1",childId);
           }else{
        	   refPoidVal =$this.parents("tr").attr('id');
           }
           if(refPoidVal==null || refPoidVal==undefined)
        	   {
        	   	refPoidVal=-1;
        	   }
		    if(parserId == '6'){	
				if(!adubrk1){
						inputs+='<td align="center" id="'+childId+'brekUps" style="display:none" class="BU"><input type="checkbox" class="form-control" name="addbrekUps" value="N" style="width:100%;"/>';
						inputs+='<input type="hidden" name="addbrekUpsRefPoid" value="'+refPoidVal+'"/></td>';
					}else{
						inputs+='<td align="center" id="'+childId+'brekUps" style="display:none" class="BU"><input type="checkbox" class="form-control" checked="checked"  name="addbrekUps" value="Y" style="width:100%;"/>';
						inputs+='<input type="hidden" name="addbrekUpsRefPoid" value="'+refPoidVal+'"/></td>';
					}
					}else{
						if(!adubrk1){
							
							inputs+='<td align="center" id="'+childId+'brekUps" class="BU">';
							if(isChild === "Y"){
							inputs+='<input type="checkbox" class="form-control" name="addbrekUps1" value="N" onclick="addcheckbox($(this),\''+childId+'\');" style="width:100%;" />';
							}else{
							inputs+='<input type="checkbox" class="form-control" name="addbrekUps1" value="N" onclick="addcheckbox($(this),\''+childId+'\');" style="width:100%;"/>';
							}
							inputs+='<input type="hidden" class="form-control" name="addbrekUps" value="N">';
							inputs+='<input type="hidden"  class="form-control" name="addbrekUpsRefPoid" value="'+refPoidVal+'"/></td>';
							}else{
								inputs+='<td align="center" id="'+childId+'brekUps" class="BU">';
								if(isChild === "Y"){
								inputs+='<input type="checkbox" class="form-control" name="addbrekUps1" value="Y"  checked="checked" onclick="addcheckbox($(this),\''+childId+'\');" style="width:100%;"/>';
								}else{
								inputs+='<input type="checkbox" class="form-control" name="addbrekUps1" value="Y"  checked="checked" onclick="addcheckbox($(this),\''+childId+'\');" style="width:100%;"/>';
								}
								inputs+='<input type="hidden" class="form-control" name="addbrekUps" value="Y" style="width:100%;">';
								inputs+='<input type="hidden" class="form-control" name="addbrekUpsRefPoid" value="'+refPoidVal+'"/></td>';						
						}	
					}
					/*Hide Normalized Label column for parser AP File parser(8)*/

						inputs+='<td id="'+childId+'updNormLable" class="NormalizedLabel">'+sel+'</td>';
					if(parserId == '6'){
						var parent_accountNumber = $this.parents("tr").find("#"+childId+"updAccountNumber").text().trim();
					
						if(parent_accountNumber==''){
						 parent_accountNumber=$this.parents("tr").find('input[name="updAccountNumber"]').val();
						}
						if(typeof parent_accountNumber == 'undefined'){
							parent_accountNumber='';	
						}
						
						var parent_timePeriod = $this.parents("tr").find("#"+childId+"updTimePeriod").text().trim(); 
						
						if(parent_timePeriod=='' || typeof parent_timePeriod == 'undefined') {
						 parent_timePeriod=$this.parents("tr").find('input[name="updTimePeriod"]').val();
						}
						if(typeof parent_timePeriod == 'undefined'){
							parent_timePeriod='';	
						}
						
						var parent_custodianName = $this.parents("tr").find("#"+childId+"updCustodianName").text().trim();
						if(parent_custodianName==''){
							parent_custodianName=$this.parents("tr").find('input[name="updCustodianName"]').val();
						}
						if(typeof parent_custodianName == 'undefined'){
							parent_custodianName='';	
						}
						
						inputs+='<td id="'+childId+'updAccountNumber" class="AccountNumber"><input type="text" class="form-control" name="addAccountNumber" value="'+parent_accountNumber+'" style="width:100%;"/></td>';
						inputs+='<td id="'+childId+'updTimePeriod" class="TimePeriod"><input type="text" class="form-control" name="addTimePeriod" value="'+parent_timePeriod+'" style="width:100%;"/></td>';
						if(parserId == '6'){
							if(isChild !== "Y"){
								inputs+='<td class="Note"><input type="text" name="addNote" value="" style="width:100%;"/></td>';
							}
									
							}
						inputs+='<td style="display:none" id="'+childId+'updCustodianName" class="CustodianName"><input type="text" class="form-control" name="addCustodianName" value="'+parent_custodianName+'"  style="width:100%"/></td>';
/*						if(nonEnglishLabelFlag == 'Y'){
							count=10;
						}else{
							count=9;
						}
*/						for(var s=count,j=1;s<tdLength;s++)
						{
							if(dpr=="D"){
							var vals=$this.parents('tr').children('td').eq(s).text();
							inputs+='<td class="value'+j+'"><input type="text" class="form-control" name="addVal'+ j++ +'" value="'+vals+'" style="width:100%;"/></td>';
							}else{
							inputs+='<td class="value'+j+'"><input type="text" class="form-control" name="addVal'+ j++ +'" value="" style="width:100%;"/></td>';
							}
						}
					}else{
						
							inputs+='<td class="SubSection">'+selSubSection+'</td>';

						
						/*Show page number for the parser Bank and pdf based parser,Dealer form parser*/
						//if(parserId == '11' || parserId == '18'){
							if(isChild !== "Y"){
								if(dpr=="N"){
								inputs+='<td class="Note"><input type="text" class="form-control" name="addNote" id ="addNote" value="" style="width:100%;"/></td>';
								}else{
									inputs+='<td class="Note"><input type="text"  class="form-control" name="addNote" id ="addNote" value="'+adNoteVal+'" style="width:100%;"/></td>';	
								}
								}
						//}
							 for(var s=count,j=1;s<tdLength;s++)
							  {
										var vals='';
										if(dpr=="D"){
										if(adpId>0){	
										 vals=$this.parents('tr').children('td').eq(s).text().trim();
										}else{
											vals=$this.parents('tr').children('td').find('input[name="addVal'+j+'"]').val();
										}
										}
										inputs+='<td class="value'+j+'"><input type="text" class="form-control" name="addVal'+ j++ +'" value="'+vals+'" style="width:100%;"/></td>';
							 }
					}
					inputs+='</tr>';
					$this.parents('tr').after(inputs);
					$this.attr('checked', false);
					if(isChild === "Y"){
						unCheckHeaderChildPoIdCheckBox();
					}
					addSearchFiltering("selectedNiItem","",childId);
/*					if(tableName == 'parserOutChildTable')
					{
						$("#parserOutChildTable").unbind('tableHeadFixer');
						$("#parserOutChildTable").tableHeadFixer({"head" : true, "left" : 6});	
					}*/	
						
					}
				 }
			}
			v=i;
		}//end checked for
		//Here we hide column based on existing column manager list
		hideShowColumn();
		
  }
	else
	{
		$.alert('Select Row');
	}  
}




/************** Undo Delete Row *****************/
function undoDeleteRow()
{
	$('.deleteRow').show();
	$('.deleteRow td:nth-child(1)>input').prop('checked',false);
    $('.poRow').removeClass('deleteRow');
	
}

/************** Delete Row *****************/
function deleteRow(checkBoxName)
{
	var checkElements = document.getElementsByName(checkBoxName);
	if(checkCheckboxChecked(checkBoxName))
	{
	 for(var i=0; checkElements[i]; ++i)
	 {
	  
		 if(checkElements[i].checked)
		  {
			  var $this = $(checkElements[i]);
			   //code strat  for delete parent child records deleting....
			   var trId = $this.parents('tr').attr('id'); 
			   
			  if(trId == '0' || trId == '-1'){
				  $this.parents('tr').remove();	
			  }else {
					var trClasses = $this.parents('tr:first').attr('class');
					var dyna = trClasses.split(" ");
					if (dyna.length > 0) {
						for (var j = 0; j < dyna.length; j++) {
							if (dyna[j] == 'ref_-1' || dyna[j] == 'ref_0') {
								var hideclass = "ref_" + trId;
								$("." + hideclass).css("display", "none");
								$("." + hideclass).find('td:first input:checkbox').attr('checked', true);
							}
						}
					}
					 //delete row issue
					 // $this.attr('checked', false);
					  $this.parents('tr').addClass('deleteRow');
					  $this.parents('tr').hide();	
				}
			   /*code end */
			 	  
			   }
	  }
	}
	else
	{
		$.alert('Select Row');
	 }
	
}

function insertGlobalLevelDir(val)
{
	$('#searchTypeText').val(val);
	var checkElements = document.getElementsByName('delPoId');
	if(checkCheckboxChecked("delPoId"))
	{
	 for(var i=0; checkElements[i]; ++i)
	 {
		  if(checkElements[i].checked)
		  {
			   var $this = $(checkElements[i]);
		  }
	  }
	}else
	  {
		$.alert('Select Row');
		return false;
	  }
 submitGlobalLevelDir();
}

function submitGlobalLevelDir()
{
	var tempId = $('#templateId').val();
	var processData=$('#norm-form').serialize()+'&templateId='+encodeURIComponent(tempId);
	actionUrl="insertGlobelLevelData.htm";
	successData=function(data)
	{
		hideLoading();
	};
	errorData=function(data)
	{
		hideLoading();
	};
	if(processData=='')
	{
	}
	else
	{
		showLoading();
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
	}
}


function setColumnHeaderForNonEmptyFirstRow(){
	$('#myTable tr:eq(1)').each(function(){
		var first = $(this).find("td:eq(5)").html();
		var myFirstSubString = first.substring(first.lastIndexOf("/")+1);
		var second = $(this).find("td:eq(6)").html();		
		var mySecondSubString = second.substring(second.lastIndexOf("/")+1);
		var third = $(this).find("td:eq(7)").html(); 
		var myThirdSubString = third.substring(third.lastIndexOf("/")+1);
		var fourth = $(this).find("td:eq(8)").html();
		var myFourthSubString = fourth.substring(fourth.lastIndexOf("/")+1);		
		var opt3='';
		opt3 = opt3.replace(/,/g, "");
		//remove , from string
		$("#firstYearSpanId").html(myFirstSubString.replace(/,/g, ""));		
	    $("#secondYearSpanId").html(mySecondSubString.replace(/,/g, ""));
	    $("#thirdYearSpanId").html(myThirdSubString.replace(/,/g, ""));
	    $("#fourthYearSpanId").html(myFourthSubString.replace(/,/g, ""));
		});
}

function setColumnHeaderForEmptyFirstRow(){
$('#myTable tr:eq(2)').each(function() {
    var first = $(this).find("td:eq(5)").html();        
    var second = $(this).find("td:eq(6)").html();    
    var third = $(this).find("td:eq(7)").html();    
    var fourth = $(this).find("td:eq(8)").html();    
    $("#firstYearSpanId").html(first.replace(/,/g, ""));
    $("#secondYearSpanId").html(second.replace(/,/g, ""));
    $("#thirdYearSpanId").html(third.replace(/,/g, ""));
    $("#fourthYearSpanId").html(fourth.replace(/,/g, ""));
});
}


$('a[target^="_new"]').click(function(e) {
	   window.open(this.href, 'newwindow', 'width=900, height=700, top=300, left=350,scrollbars=yes, resizable=yes');
	   return false;
	});


$(".emptyTable").click(function() {
	$('#parserOutChildTable tbody').empty();
});

String.prototype.contains = function(it) {
	return this.indexOf(it) != -1;
};






$("#1ColumnId, #2ColumnId, #3ColumnId, #4ColumnId, #5ColumnId, #6ColumnId, #7ColumnId, #8ColumnId").click(
		function() {
			var selectedSection = $("#datahead").html();
			if (selectedSection in sectionMap) {
				slectedIndexArr = sectionMap[selectedSection];
			} else {
				var slectedIndexArr = [];
			}

			var $this = $(this);
			var index = $this.index();
			if ($this.closest("table").find("tr").find(
					"td:eq(" + index + ")").hasClass('selectedTD')) {
				$this.closest("table").find("tr").find(
						"td:eq(" + index + ")").removeClass(
						'selectedTD');
				slectedIndexArr = jQuery.grep(slectedIndexArr,
						function(value) {
							return value != index;
						});
			} else {
				$this.closest("table").find("tr").find(
						"td:eq(" + index + ")").addClass(
						'selectedTD');
				if (slectedIndexArr.indexOf(index) == -1) {
					slectedIndexArr.push(index);
				}
			}

			sectionMap[selectedSection] = slectedIndexArr;
		});



function otherOperations(tableName)
{
	 var count = 0; 
	 var alphabates = /[a-z]/i;
	 var numaric = /[0-9]/i;
	 var valColStart =6;
	 var nonEnglishLabelFlag =$('#nonEnglishLabelFlag').val();
		if(tableName == 'myTable' )
		{
			valColStart =7;	
		}
		
		if(nonEnglishLabelFlag == 'Y')
			{
				valColStart = valColStart+1;
			}
	 
	 $("#"+tableName+"").find("tr").each(function () 
		{
	     if(count==0)
	     {
	       count++;
	     }
	     else
	     {
	    	 var asRepLabelText =($(this).find('td:nth-child(3)')).text();
	    	 if(asRepLabelText.toLowerCase() == 'balancing figures')
			  {
			    $(this).closest('tr').addClass('highlight');
			  }
	    	 
	    	 var subsection = "";
	    	 if(nonEnglishLabelFlag == 'Y')
	 			{
	    		 	subsection = ($(this).find('td:nth-child(7)')).text();
	 			}
	    	 else
	    		 {
	    		 	subsection = ($(this).find('td:nth-child(6)')).text();
	    		 }
			  if(subsection == 'HEADER')
			  {
			    $(this).closest('tr').addClass('highlight');
			  }
	    	
			  var columnCounter =$("#columnCount").val();
			  for (var counter = 1; counter <= columnCounter; counter++) 
			  {
				  
				  var child = valColStart+counter;
			       var $value = ($(this).find('td:nth-child('+child+')'));
			       var textValue = $value.text();
			       if(textValue!='' && subsection !='HEADER'&& textValue.match(alphabates))
			       {
			         if(textValue.match(numaric))
			        	 {
			        	 var subsection = ($(this).find('td:nth-child(3)')).css("font-weight","bold");
			        	 }
			       }
			  }
	     }
		}); 
	$('.multipleSuggestiveMapping').children('td, th').css('background-color','#baf0f2');
}

function parentFixHeader()
{
	$("#myTable").tableHeadFixer({"head" : true, "left" : 7}); 
}

function highlightNormDropdown(dropdownType)
{
	if(dropdownType == 'table' )
		{
			$('.headerClass').find('label').addClass('boldText');
			$('.basicTextFont').find('label').addClass('basicTextFont');
		}
	else
		{
			$('.headerClass').find('a').addClass('boldText');
			$('.basicTextFont').find('a').addClass('basicTextFont');	
		}
}

function contextMenuDisplayChildAsRepLabel(tableName, tdName, menuName,
		checkBoxName) {
	restoreDrodownChildAsRepLabel(menuName);
	highlightNormDropdown("contextMenu")
	$("#" + tableName + " #" + tdName).contextMenu({
		menuSelector : "#" + menuName,
		menuSelected : function($invokedOn, $selectedMenu) {
			var mappingLabel = $selectedMenu.attr("value");
			updateMappingAsRepLabel(mappingLabel, checkBoxName);
		},
		onMenuShow : function($invokedOn) {
			$invokedOn.addClass("success");
		},
		onMenuHide : function($invokedOn) {
			$("#search-criteriaChildAsRepLabel").val('');
			$("#search-criteriaChildAsRepLabel").trigger("keyup");
			$invokedOn.removeClass("success");
		}
	});
}


function contextMenuAsRepLabel(tableName, tdName, menuName,checkBoxName) {
	restoreDrodownCheckLabel(menuName);
	highlightNormDropdown("contextMenu")
	$("#" + tableName + " #" + tdName).contextMenu({
		menuSelector : "#" + menuName,
		menuSelected : function($invokedOn, $selectedMenu) {
			var mappingLabel = $selectedMenu.attr("value");
			updateMappingAsRepLabel(mappingLabel, checkBoxName);
		},
		onMenuShow : function($invokedOn) {
			$invokedOn.addClass("success");
		},
		onMenuHide : function($invokedOn) {
			$("#search-criteriaAsRepLabel").val('');
			$("#search-criteriaAsRepLabel").trigger("keyup");
			$invokedOn.removeClass("success");
		}
	});
}

function updateMappingAsRepLabel(mappingLabel, checkBoxName){
	$('#normalizationPochild').modal('hide');
	var caseId = $('#caseId').val();
	var wqId = $('#wqId').val();
	var customerId = $('#customerId').val();	
	var fillingId = $("#filingId").val();
	var asRepLable_Poid = '';
	var asRepLableSection= '';
	var section=$("#statementFormat").val();
	var selectedRowLength = $('input[name="' + checkBoxName + '"]:checked').length;
	var normLabelArr = mappingLabel.split('~');
	if (normLabelArr.length == 2) {
		asRepLable_Poid= normLabelArr[0];
		asRepLableSection= normLabelArr[1];
	}
	if (selectedRowLength > 0) {
		var selectedValArray = $(
				'input:checkbox[name="' + checkBoxName + '"]:checked').map(
				function() {
					selectedRowVal = $(this).val();
					return selectedRowVal;
				}).toArray();
		if (selectedValArray != "") {
			processData = '&poIdArray='
					+ encodeURIComponent(selectedValArray) + '&fillingId='
					+ encodeURIComponent(fillingId)+ '&asRepLable_PoId='
					+ encodeURIComponent(asRepLable_Poid)+ '&asRepLableSection='
					+ encodeURIComponent(asRepLableSection);
			actionUrl = "update_asRepLabelByPoId.htm";
			successData = function(data) {
				viewData(wqId,caseId,section,customerId);
			}
			errorData = function(data) {
				$.alert("Problem occurred while updating the normalized label.");
				$('input:checkbox[name="' + checkBoxName + '"]').prop('checked', false);
			};
			callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
		}
	}	else{
		$.alert("Please select a row to update");
		}
	
}


function showContextMenuCheckBox(e){
	if (e.which == 3 ) {
		$("#contextMenuUsername").empty();
		contextMenuDisplayCheckBox("myTable","showNormLabel","contextMenuUsername","delPoId");
		$("#contextMenuUsername").delay(500).fadeIn(function() {
			$("#search-criteria").focus();
			
		});
		
		
	}
}
function showContextMenuCheckBoxchild(e){
	if (e.which == 3 ) {
		$("#childContextMenuUsername").empty();
		contextMenuDisplayChildCheckBox("parserOutChildTable","showChildNormLabel","childContextMenuUsername","childPoId");
		$("#childContextMenuUsername").delay(500).fadeIn(function() {
			$("#search-criteriaChild").focus();
			
		});
		
		
	}
}	

function showContextMenuAsreplabel(e){
	var section=$("#statementFormat").val();
	if (e.which == 3  && section =='SUPPL') {	
		$("#contextMenuAsRepLabel").empty();
		 contextMenuAsRepLabel("myTable","updPoLable","contextMenuAsRepLabel","delPoId");
		$("#contextMenuAsRepLabel").delay(500).fadeIn(function() {
			$("#search-criteriaAsRepLabel").focus();
			
		});
		
	}	
}

function showContextMenuAsreplabelChild(e){
	if (e.which == 3 ) {
		$("#childContextMenuAsRepLabel").empty();
		contextMenuDisplayChildAsRepLabel("parserOutChildTable","childupdPoLable","childContextMenuAsRepLabel","childPoId");
		$("#childContextMenuAsRepLabel").delay(500).fadeIn(function() {
			$("#search-criteriaChildAsRepLabel").focus();
			
		});
		
	}	
}

function searchDataByFilter(sCount,updatedAllPoId,uFlag,addedAllPoId,addedIds,searchDiv)
{
	//on ready empty
	accountNumber='';
	timePeriod='';
	custodianName='';
	// load for only  on_ready  and update 
	if(sCount==1 || uFlag==-1){
		$.blockUI({ message: '' }); 
	}
	if(searchDiv!=0){
		accountNumber = $("#accountNumber option:selected").val();
		accountNumber =checkUndefined(accountNumber);
		timePeriod = $("#timePeriod option:selected").val();
		timePeriod =checkUndefined(timePeriod);
		custodianName = $("#custodianName option:selected").val();
		custodianName =checkUndefined(custodianName);
		if (custodianName != '') {
			specialChar = '&';
			if (custodianName.indexOf(specialChar) > -1) {
				custodianName = custodianName.replace(/&/g, '|');
			}
		}

	}

var filingId = $('#caseId').val();
var parserID=$('#parserId').val();
var columnCount = $('#columnCount').val();
var statementFormat = $('#statementFormat').val();
var wqId = $('#wqId').val();
var url='searchDataByFilter.htm';
var parametersDynamic='fillingId='+filingId+'&statementFormat='+statementFormat+'&scrollCount='+sCount+'&wqId='+wqId+'&parserId='+parserID+'&columnCount='+columnCount+ '&accountNumber='+accountNumber+'&timePeriod='+timePeriod+'&custodianName='+custodianName+'&updatedAllPoId='+updatedAllPoId+'&addedAllPoId='+addedAllPoId;
//$.alert("parametersDynamic"+parametersDynamic);
url=insertParam(url);
$.ajaxSetup({
	cache: true
});
	$.ajax({
		 type: "POST",  
		 url: url,
		 cache: true,
		 async: false,
		 data:parametersDynamic,
		 dataType : "html",
		 success: function(response)
		 {	
			var responseObj = JSON.parse(response);
			var totalRecordsObj =responseObj["totalRecords"];
			if(totalRecordsObj>0){
			dataSetToTable(response,parserID,updatedAllPoId,uFlag,addedIds);
			otherOperations("myTable");
			}else{
			endCount=true;
			if(sCount==1 && uFlag!=-1){
				   if(searchDiv == 0) {				
					$('#maindiv').html("No Information Available.");
					} else {
					$("table#myTable tbody").append("<tr><td colspan='8' style='border:0px'>No Information Available</td></tr>");
					}
				}
			}
			$.unblockUI(); 
			hideShowColumn();
			$('table#myTable').unblock();
			hideLoading();		
		}
	});
}

function getParentPoId($this,brekUpsName,childId)
{
	if($this.find('input[name="'+brekUpsName+'"]').is(':checked')){
		getParentPoId($this.prev('tr'),brekUpsName,childId);
	}else{
		refPoidVal= $this.attr('id');
		return false;
	}
	
	
}
//bankparser custom search

function searchResult(){
	//set default values
	endCount=false;
	sCount=1;
	uFlag=0;
	searchDiv=1;
	updatedPoidsStr='';
	addedNewPoidsStr='';
	addedIds='';
	$("table#myTable tbody").empty();
	 var divScroll = $("#maindiv").scrollTop();
	$('table#myTable').block({message:"",});
	searchDataByFilter(sCount,updatedPoidsStr,uFlag,addedNewPoidsStr,addedIds,searchDiv);
}

function hideShowColumn(){
	console.info("in hideShowColumn function");
	//var $chk = $("#grpChkBox input:checkbox");
	var $tbl = $("#myTable");

	console.info("unchecked checkbox array:"+checkBoxArray);
	for (var i = 0; i < checkBoxArray.length; i++)
	{
	$("input[name='"+checkBoxArray[i]+"']:checkbox").prop('checked', false)
	console.info("name:"+checkBoxArray[i]);
	$("." +checkBoxArray[i]).hide();
	}

	}//end function


//test undefined for search fields
	function checkUndefined(searchVal) {
		if (typeof(searchVal)  == 'undefined' || typeof(searchVal)==undefined) {
			return '';
		}
		return searchVal;
	}
	
	function dynamicTableColumnCount(tableName){
		
		var length;
		var colNames =new Array();
		$( "#"+tableName+" thead tr th" ).each(function(index ) {
			colNames.push($(this).text());
		});
		length = colNames.length;
		var colCount=colNames.length;
		while(length--) {
			if(colNames[length].indexOf("Value")!=-1){
				console.info("true="+colNames[length]);
				colCount=colCount-1;
			}
		}
		return colCount;
	}
	
	function expandChild(thisObject,parentPoId)
	{
		//corrent parentPoid
		var uFlag=parentPoId;
		var addedIds=null;
		var updatedAllPoId=null;
		var filingId = $('#caseId').val();
		var parserID=$('#parserId').val();
		var columnCount = $('#columnCount').val();
		var statementFormat = $('#statementFormat').val();
		var asReportedLable = $('#asReportedLable').val();
		processData = 'fillingId='+filingId+'&poId='+ encodeURIComponent(parentPoId)+'&poSection='+ encodeURIComponent(statementFormat)+'&columnCount='+columnCount+'&parserId='+parserID+'&asReportedLable='+asReportedLable;
		actionUrl = "getChlidRecordByRefPoId.htm";
		url=insertParam(actionUrl);
		var loadedCls=$('table#myTable #'+uFlag+'').hasClass("loaded");
		var signPlus = $(thisObject).hasClass("glyphicon-plus");
		if(signPlus)
			{
			     $(thisObject).removeClass('glyphicon-plus');
				$(thisObject).addClass('glyphicon-minus');
				$('.ref_'+uFlag).addClass("expandRowClass");
				$('.ref_'+uFlag).show();
			}
		else
			{
				$(thisObject).removeClass('glyphicon-minus');
				$(thisObject).addClass('glyphicon-plus');
				$('.ref_'+uFlag).addClass("collapseRowClass");
				$('.ref_'+uFlag).hide();
			}	
		var flagSing=$('table#myTable #'+uFlag+'').hasClass('parentExpand');
		if(flagSing){
			$('table#myTable #'+uFlag+'').removeClass('parentExpand');
			$('table#myTable #'+uFlag+'').addClass('parentCollapse');
		}
		else{
			$('table#myTable #'+uFlag+'').removeClass('parentCollapse');
			$('table#myTable #'+uFlag+'').addClass('parentExpand');
		}
		if(!loadedCls){
			showLoading();
			$.ajaxSetup({
				cache: true
			});
			$.ajax({
				 type: "POST",  
				 url: url,
				 data:processData,
				 cache: true,
				 async: true,
				 dataType : "html",
				 success: function(response)
				 {			
					var responseObj = JSON.parse(response);
					var totalRecordsObj =responseObj["totalRecords"];
					totalRecordsObj=parseInt(totalRecordsObj);
					if(totalRecordsObj>0){
						dataSetToTable(response,parserID,updatedAllPoId,uFlag,addedIds);
					hideLoading();	
				 }
				 }
			});		
		}
	
		
	}
	
	
	
	function searchReporedLable(){
		endCount=false; 
		 sCount=1;
	     updatedAllPoId=null;
		 uFlag=0;
		 addedAllPoId=null;
		 addedIds=null;		
		$("table#myTable tbody").empty();
		 var divScroll = $("#maindiv").scrollTop();
		$('table#myTable').block({message:"",});
		calAjaxData(sCount,updatedAllPoId,uFlag,addedAllPoId,addedIds)
	}
	

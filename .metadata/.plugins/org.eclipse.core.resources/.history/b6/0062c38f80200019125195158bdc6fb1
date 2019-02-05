var isDynamicMessgeLoaded=true;
$.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
	var str=options.url;
	var vars = str.split("?");
	if(isDynamicMessgeLoaded){
		if(vars[0]=="show-table.htm"||options.url=="getFormData.htm"){
			getDynamicMsg();
			isDynamicMessgeLoaded=false;
		}
	}
});
//$(document.ready).
var dynamicMsg;
//form validation Error Message.
var commanRequiredkey = 'commanRequired';
var requirednumericKey='requiredNumeric';
var validTextKey='validText';
var validAlphanumericKey="validAlphanumeric";
var validEmailKey="validEmail";
var validMobileKey="validMobile";
var validPhoneKey="validPhone";
var validRegularExpressionKey="validRegexp";

//Range search Message.
var rangeSearchFieldRequierdAlert="rangeSearchFieldRequierdAlert";
var rangeSearchValidDateAlert="rangeSearchValidDateAlert";
var rangeSearchValidNumberAlert="rangeSearchValidNumberAlert";

//search Alert Message.
var searchErrorAlertKey="searchErrorAlert";//done
var searchCriteriaAlertKey="searchCriteriaAlert";//done
var refreshingErrorAlertKey="refreshingErrorAlert";//done

//form & Table Alert Message.
var savingDataErrorAlert="savingDataErrorAlert";//done
var validationFailErrorAlert="validationFailErrorAlert";//done
var dataSaveSuccessAlert="dataSaveSuccessAlert";//done
var undoDeleteErrorAlert="undoDeleteErrorAlert";//done
var undoDeleteSuccessAlert="undoDeleteSuccessAlert";//done
var pageSizeErrorAlert="pageSizeErrorAlert";//done
var deletingRecordErrorAlert="deletingRecordErrorAlert";//done
var ExpandsubtableErrorAlert="ExpandsubtableErrorAlert"; //done
var loadingPageErrorAlert="loadingPageErrorAlert";//done

//Graph component alert
var graphPageLoaderrorAlert="graphPageLoaderrorAlert";
var graphNoDataFoundAlert="graphNoDataFoundAlert";

function checkChild(thisObj) {
	var index = $(thisObj).attr('tabindex');
	var checkedVal = $("#checkedValue_"+index).val();
	var unCheckedVal = $("#unchecKedValue_"+index).val();
	if (thisObj.checked) { // check select status
		$('.uicChkBox_'+index).each(function() { // loop through each checkbox
			this.checked = true; // select all checkboxes with class "chkbox"
			this.value = checkedVal; 
		});
		$('.uicChkHidden_'+index).val(checkedVal);
	} else {
		$('.uicChkBox'+index).each(function() { // loop through each checkbox
			this.checked = false; // deselect all checkboxes with class
			this.value = unCheckedVal; 
		});
		$('.uicChkHidden_'+index).val(unCheckedVal);
	}
}

/*
function checkOrUnCheck(thisObj){
	var index = $(thisObj).attr('tabindex');
	var checkedVal = $("#checkedValue_"+index).val();
	var unCheckedVal = $("#unchecKedValue_"+index).val();
	var id = $(thisObj).attr('id');
	id = id.replace("uicChkBox_","");
	if(thisObj.checked){
		//Yogi : unable to capture checkBox status at first instance it gives undefined
		checkedVal=checkedVal!=undefined ?checkedVal:'Y';
		thisObj.value = checkedVal;
		$("#uicChkHidden_"+id).val(checkedVal);
	}
	else{
		thisObj.value = unCheckedVal;
		$("#uicChkHidden_"+id).val(unCheckedVal);
	}
}*/

function clearAllSearchFields(tableId) {
	$("#dynamicSearch" + tableId).find('.dynamicSearchElement').each(
			function(index, element) {
				var elmnt = $(element);
				if (elmnt.is('input')) {
					if(elmnt[0].type=='checkbox' || elmnt[0].type=='radio'){
						elmnt[0].checked=false;
					}else{
						var defSelectVal = elmnt.attr("defSelectVal");
						elmnt.val('');
						if (typeof defSelectVal != 'undefined') {
							elmnt.val(defSelectVal);
						}
					}
				} else if (elmnt.is('select')) {
					elmnt.val('');
					$(this).find('option').each(function() {
						var defSelectVal = $(this).attr("defSelectVal");
						if (typeof defSelectVal != 'undefined') {
							elmnt.val(defSelectVal);
							return false;
						}
					});
				}
				//Clear all error div of previous round.
				$(this).css("border-color", "");
				$("#dynamicSearch" + tableId+" .UicErrorMsg").empty();
			});
	return false;
}

function validateSearchForm(componentId) {
	var retVal = false;
	$("#"+componentId).find('.dynamicSearchElement').each(function(index, element) {
		var elmnt = $(element);
		if (elmnt.val() !== '' && elmnt.val() !== 'select') {
			retVal = true;
		}
	});
	return retVal;
}

function validateRangeSearch(componentId) {
	//alert("entered range search.");
	var retVal = true;
	var name = "";
	var startVal = "";
	var endVal = "";
	var rangeSearchFieldRequierdAlertLoc = getDynamicMsgValue(rangeSearchFieldRequierdAlert);
	$("#"+componentId).find('.rangeSearchElement').each(function(index, element) {
		
		var elmnt = $(element);
		name = elmnt.attr("name").split(":")[0];
		
		if ((index % 2) === 0) {
			startVal = "";
			endVal = "";
		}
		if (name.indexOf("start") !== -1)
			startVal = elmnt.val();

		if (name.indexOf("end") !== -1)
			endVal = elmnt.val();

		if (startVal !== "" && endVal !== "") {
		//	alert("Inside for "+name );
			if (name.indexOf("endDate") !== -1 || name.indexOf("end:date") !== -1) {
				retVal = rangeCheck(startVal, endVal, "date");
			} else if (name.indexOf("endNumber") !== -1 || name.indexOf("end:number") !== -1) {
				retVal = rangeCheck(startVal, endVal, "number");
			}

		} else if ((index % 2) !== 0 && (startVal !== "" || endVal !== "")) {

			//alert('Start and end fields should be populate');
			$.alert({
			    title: 'Confirm!',
			    content: rangeSearchFieldRequierdAlertLoc,
			    confirmButtonClass: 'UicPrimaryBtn',
			    closeIcon: true,
			    columnClass: 'col-md-4 col-md-offset-4',
			});
			retVal = false;
		}
	});

	return retVal;
}

function rangeCheck(startVal, endVal, type) {
	//alert("rangeCheck:startVal="+startVal+" || endVal="+endVal+" ||type="+type);
	var rangeSearchValidDateAlertLoc = getDynamicMsgValue(rangeSearchValidDateAlert);
    var rangeSearchValidNumberAlertLoc = getDynamicMsgValue(rangeSearchValidNumberAlert);
	var retVal = true;
	if (type === 'date') {
		//start date
		var dateTimeParts = startVal.split(" ");
		var dateParts = dateTimeParts[0].split('-');
		var startDate = '';
		if(dateTimeParts.length==2){
			 var timeParts = dateTimeParts[1].split(':');
			 startDate = new Date(dateParts[2], parseInt(dateParts[1], 10) - 1, dateParts[0], timeParts[0], timeParts[1]);
		}else{
			 startDate = new Date(dateParts[2], parseInt(dateParts[1], 10) - 1, dateParts[0]);
		}
	   //end date
		var dateTimeParts = endVal.split(" ");
		var dateParts = dateTimeParts[0].split('-');
		var endDate = '';
		if(dateTimeParts.length==2){
			 var timeParts = dateTimeParts[1].split(':');
			 endDate = new Date(dateParts[2], parseInt(dateParts[1], 10) - 1, dateParts[0], timeParts[0], timeParts[1]);
		}else{
			 endDate = new Date(dateParts[2], parseInt(dateParts[1], 10) - 1, dateParts[0]);
		}

	//	alert("rangeCheck:startVal="+startDate+" || endVal="+endDate+" ||type="+type);
		if (startDate > endDate) {
			//alert("Start date must be less than end date.");
			$.alert({
	  		    title: 'Confirm!',
	  		    content: rangeSearchValidDateAlertLoc,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
			retVal = false;
		}
	} else if (type === 'number') {
		var startNumber = parseInt(startVal);
		var endNumber = parseInt(endVal);
		if (startNumber > endNumber) {
			//alert("Start number must be less than end number.");
			$.alert({
	  		    title: 'Confirm!',
	  		    content: rangeSearchValidNumberAlertLoc,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
			retVal = false;
		}
	}
	return retVal;
}

function ajaxCallOfUIC(container, url){
	var loadingPageErrorAlertLoc = getDynamicMsgValue(loadingPageErrorAlert);
	$('#uic_Loading').show();
	jQuery.ajax({
		url : url,
		type : 'POST',
		cache : false,
		error : function(error) {
			$('#uic_Loading').hide();
			console.log("An error occurred while loading page "+error);
			//alert('An error occurred while loading page, please try again.');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: loadingPageErrorAlertLoc,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
		},
		success : function(html) {
			$('#uic_Loading').hide();
			$('#'+container+"Container").html('');
			$('#'+container+"Container").html(html);
			hideshowColumns();
		}
	});

}

function saveData(tableId) {

	var isDummy_ = $('#isDummy_' + tableId).val();
	if (isDummy_ == 'true') {
		$("#" + tableId + "0").val("I");
	}
	var dataChanged = false;
	$(".isDirty_"+tableId).each(function(){
		if($(this).val() == 'Y' || $(this).val() == 'I'){
			dataChanged = true;
		  }
	});
	if(dataChanged == false){
		$.alert({
  		    title: 'Confirm!',
  		    content: "No changes found in the table",
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
  		});
		return;
	}

	var context = $("#uic_context").val();
	var requestToken = $('#requestToken').val();
	var url = context + "/saveTableContent.htm?requestToken="+requestToken;

	//Special handling for multi-dropdown elements.
	$("#"+tableId+" .uicMultiDropDown").each(function(){
		  var arr = $(this).val();
		  if(arr!=null && arr!=""){
			  var value = "";
			  for(var i=0;i<arr.length;i++){
				  if(i>0) {
					  value = value + ","; 
				    }
				  value = value + arr[i];
			  }
	
			//alert("Replace:"+value);
			var id = $(this).attr("id");
			if($("#"+id+" option[value='"+value+"']").length == 0){ //indicates the given value doesn't exist as option. Need to create one and then assign. 
				$("#"+id).append("<option value='"+value+"'>"+value+"_temp</option>");
			}
			$(this).val(value);
		}
	});
	
	var postData = $("#editableTbl" + tableId).serializeArray();
	var isValidData = validateEditData(tableId, "Table");
	var savingDataErrorAlertLoc = getDynamicMsgValue(savingDataErrorAlert);
	var validationFailErrorAlertLoc = getDynamicMsgValue(validationFailErrorAlert);
	var dataSaveSuccessAlertLoc = getDynamicMsgValue(dataSaveSuccessAlert);
	if (isValidData) {
		$('#uic_Loading').show();
		jQuery.ajax({
			url : url,
			cache : false,
			type : 'POST',
			data : postData,
			error : function(error) {
				//For all multi-Dropdown, remove the temp option created during save processing, if it exist.
				cleanMultiDropdowns(tableId); //Clean multi dropdowns for temp values created during the save process.
				$('#uic_Loading').hide();
				console.log("Error while saving table component data "+ error);
				//alert('An error occurred while saving data, please try again.');
				$.alert({
		  		    title: 'Confirm!',
		  		    content: savingDataErrorAlertLoc,
		  		    confirmButtonClass: 'UicPrimaryBtn',
		  		    closeIcon: true,
		  		    columnClass: 'col-md-4 col-md-offset-4',
		  		});
			},
			success : function(response) {
				//For all multi-Dropdown, remove the temp option created during save processing, if it exist.
				cleanMultiDropdowns(tableId); //Clean multi dropdowns for temp values created during the save process.
				//Hide the loading div.
				$('#uic_Loading').hide();
				//Added handling to accommodate alerting user for DB validation failures on table rows.
				if(response.indexOf("IsUpdated=false")>=0 && response.length<16){
						//alert('An error occurred while saving data, please try again.');
					$.alert({
			  		    title: 'Confirm!',
			  		    content: savingDataErrorAlertLoc,
			  		    confirmButtonClass: 'UicPrimaryBtn',
			  		    closeIcon: true,
			  		    columnClass: 'col-md-4 col-md-offset-4',
			  		});
				}
				else if(response.indexOf("IsUpdated=")>=0 && response.length>16){ // Indicates validation error message exist in response message.
					//alert('Validation failed for one or more rows. Please check and re-try.');
					$.alert({
			  		    title: 'Confirm!',
			  		    content: validationFailErrorAlertLoc,
			  		    confirmButtonClass: 'UicPrimaryBtn',
			  		    closeIcon: true,
			  		    columnClass: 'col-md-4 col-md-offset-4',
			  		});
					//Indicates it consists of validation failure messages.
					//Extract and show the validation message as error.
					var errMessgJsonStr = response.substring(response.indexOf(";")+1);
					var errMessgArr = $.parseJSON(errMessgJsonStr);
					var errRowNoArr = [];
					for(var i=0; i<errMessgArr.length;i++){
						var rowNo = errMessgArr[i].rowNo;
						var errMesg = errMessgArr[i].errorMessage;
						errMesg = errMesg.replace(/\n/g, "<br />"); // Replacing new lines with HTML breaks.
						//alert(errMesg);//displayMessage("DBValidation ERROR: "+errMesg);
						$.alert({
						    title: 'Confirm!',
						    content: errMesg, //'Please Enter Valid Input',
						    confirmButtonClass: 'UicPrimaryBtn',
						    closeIcon: true,
						    columnClass: 'col-md-6 col-md-offset-3',
						});
						$("#row_"+tableId+"_"+rowNo).addClass("UicErrorMsgTable");
						errRowNoArr.push(rowNo);
					}
					
					
					//Get list of existing editableRows. Check for validation error entries and toggle accordingly.
					$('#'+tableId).find(".editableRow").each(function(){
						var index = $(this).attr('tabindex');
						if($.inArray(index, errRowNoArr)==-1){ // value of -1 indicates that the given rowNo is not part of validation failures. Hence should be toggled back.
							// Applicable to both editable modes.
							$(this).removeClass("UicErrorMsgTable"); //Removing error class.
							$(this).removeClass("editableRow"); //Removing editable class.
							//Set dirty status to 'N'.
							$("#isDirty_"+tableId+"_"+index).val('N');
							//Unbind delete row event
							if($(this).find('.uic_Delete').length>0)
								$(this).find('.uic_Delete').prop("onclick", null);
							
							var editableFlag = $('#'+tableId+"_editableDataFlag").val().toLowerCase();
							if(editableFlag.indexOf("ondoubleclick")>=0){ // Toggle case for OnDoubleClick edit mode.
								if($(this).find("[accesskey=in]").length>0){
									//Get all TD values for accessKey='in' and put it into elements with accesskey='read'. This is done so as to update elements with the latest values. Else it results in getting back the previous values.
									$(this).find("td").each(function(){
										var tdClass = $(this).attr("class");
										if(tdClass.indexOf("uic_ExpandTD") >=0 || tdClass.indexOf("identifierTD") >=0 
												|| tdClass.indexOf("uic_Delete_row") >=0){
											//Ignore these TDs.
											return;
										}
										//In each TD, find the div with accesskey='in'. Get its children to get the actual input element's value.
										
										var inVal = $(this).find("[accesskey=in]").children().get(0).value;
										//Set this value to the span in the div with accesskey='read'.
										if($(this).find("[accesskey=read]").children().length>0){
											$(this).find("[accesskey=read]").children().get(0).textContent = inVal;
										}else{
											$(this).find("[accesskey=read]").text(inVal);
										}
									});
									changeToEditableRow(this); //Toggle editable rows to normal form.
								}
							}
						}
					});
				}else{
					//alert('Data Saved Successfully.');
					$.alert({
			  		    title: 'Confirm!',
			  		    content: dataSaveSuccessAlertLoc,
			  		    confirmButtonClass: 'UicPrimaryBtn',
			  		    closeIcon: true,
			  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
			  		});
					var containerId = $("#ContainerId_"+tableId).val();
					$('#' + containerId + 'Container').html('');
					$('#' + containerId + 'Container').html(response);
				}
			}
		});
	}

}

/**
 * This method removes the temp option created on multidropdown for persistence and sets the matching values to select mode.
 * @param tableId
 */
function cleanMultiDropdowns(tableId){
	//For all multi-Dropdown, remove the temp option created during save processing, if it exist.
	$("#"+tableId+" .uicMultiDropDown").each(function(){
		if($(this).text().endsWith("_temp")){
			//Indicates added temporary option exists. We need to remove this option from the select.
			var selectedValue = $(this).val()[0];
			$(this).find('[value="'+selectedValue+'"]').remove();
			$(this).find("option").each(function(){
				var optionVal = $.trim($(this).val());
				if(optionVal!="" && selectedValue.indexOf(optionVal)>=0){
					$(this).prop("selected",true);
				}
			});
		}
		
	});
}

function undoDelete(tableId) {
	var postData = $("#editableTbl" + tableId).serializeArray();
	var context = $("#uic_context").val();
	var requestToken = $('#requestToken').val();
	var url = context+"/undoDelete.htm?requestToken=" + requestToken;
	var undoDeleteErrorAlertLoc = getDynamicMsgValue(undoDeleteErrorAlert);
	var undoDeleteSuccessAlertLoc = getDynamicMsgValue(undoDeleteSuccessAlert);
	
	$('#uic_Loading').show();
	jQuery.ajax({
		url : url,
		cache : false,
		type : 'POST',
		data : postData,
		error : function(error) {
			$('#uic_Loading').hide();
			console.log("Error while Undo delete of table component data " + error);
			//alert('An error occurred while Undo delete, please try again.');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: undoDeleteErrorAlertLoc,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
		},
		success : function(html) {
			$('#uic_Loading').hide();
			//alert('Undo delete successfully');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: undoDeleteSuccessAlertLoc,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
			var containerId = $("#ContainerId_"+tableId).val();
			$('#' + containerId + 'Container').html('');
			$('#' + containerId + 'Container').html(html);
		}
	});
}

function addItemsToArray(items, array) {
	$.each(items, function() {
		array.push(this);
	});
}

function downloadTableExcel(tableId) {
	var context = $("#uic_context").val();
	var requestToken = $('#requestToken').val();
	var url = context+"/exportDataSheet.htm?tableIds="+tableId+"&requestToken="+requestToken;
	$.fileDownload(url).fail(function() {
		//alert('File download failed');
		$.alert({
		    title: 'Confirm!',
		    content: 'File download failed',
		    confirmButtonClass: 'UicPrimaryBtn',
		    closeIcon: true,
		    columnClass: 'col-md-4 col-md-offset-4',
		});
	});
}

function setPageSize(pSize, tabId, containerId) {

	var pagableURL = $("#setPageSizebleURL" + tabId).val();
	pagableURL = pagableURL + "&tablePageSize=" + pSize;
	$('#uic_Loading').show();
	$.ajax({
		url : pagableURL,
		type : 'POST',
		error : function(error) {
			$('#uic_Loading').hide();
			console.log('An error occurred while changing page size '+error);
			//alert('An error occurred while changing page size, please try again.');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: 'An error occurred while changing page size, please try again.',
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
		},
		success : function(html) {
			$('#uic_Loading').hide();
			$("#" + containerId + "Container").html('');
			$("#" + containerId + "Container").html(html);
			hideshowColumns();
		}
	});

}

function uicCommonAjaxCall(url, postData, destId){
	var undoDeleteErrorAlertLoc = getDynamicMsgValue(undoDeleteErrorAlert);
	$('#uic_Loading').show();
	jQuery.ajax({
		url : url,
		cache : false,
		type : 'POST',
		data : postData,
		async : false,
		error : function(error) {
			$('#uic_Loading').hide();
			console.log("Error while Undo delete of table component data " + error);
			//alert('An error occurred while Undo delete, please try again.');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: undoDeleteErrorAlertLoc,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
		},
		success : function(html) {
			$('#uic_Loading').hide();

			$('#'+destId).html('');
			$('#'+destId).html(html);
			return true;
		}
	});
}

function addRow(tableId) {
	var table = document.getElementById(tableId);
	var rowCount = table.rows.length;
	var hdrLevel = parseInt($("#hdrLevels_" + tableId).val());
	var isEditable = false;
	var isDelete = false;
	var curRowNo = 0;
	
	var fisrstRowclass = '';
	if(rowCount == (hdrLevel+1)) {
		fisrstRowclass = table.rows[hdrLevel].getAttribute('class');
	}
	if(fisrstRowclass == 'uicNoDataFoundTR'){
		var postData = {tableId : tableId};
		var context = $("#uic_context").val();
		var url = context+"/addRowOrRecordForTable.htm";
		var destId = "uicTableBody_"+tableId;
		uicCommonAjaxCall(url, postData, destId);
		isEditable = true;
		
	}else {
	var totalPosition = $("#totalPosition_" + tableId).val();
	if(totalPosition!='' && totalPosition.toLowerCase()=='bottom'){
		rowCount = rowCount - 1;
	}
	var random = Math.floor(Math.random() * 10000);
	var hiddenId = tableId + random;

	var row = table.insertRow(rowCount);
	var prevRowId = table.rows[rowCount-1].getAttribute('id');
	var prevRowCss = table.rows[rowCount-1].getAttribute('class');
	var addRowCss = "even editableRow";
	if(prevRowCss!=null && prevRowCss.indexOf("even") > -1)
		addRowCss = "odd editableRow";

	var prevRowNo = parseInt(prevRowId.substring(prevRowId.lastIndexOf("_")+1, prevRowId.length));
		curRowNo = prevRowNo + 1;
	var prevRowNoLength = (prevRowNo+"").length;

	var addRowId = prevRowId.substring(0, prevRowId.length - prevRowNoLength) + curRowNo;
	row.setAttribute('id', addRowId);
	row.setAttribute('class', addRowCss);
	row.setAttribute('accessKey', 'in');
	row.setAttribute('tabindex', curRowNo);
	
	var rowAccessKey = $("#"+prevRowId).attr('accesskey');
	if(rowAccessKey=='read')
		isEditable = true;

	var colCount = table.rows[hdrLevel].cells.length;
	var newcell = "";
	var childernCount = "";
	var i = 0;
	for (i = 0; i < colCount; i++) {

		newcell = row.insertCell(i);
		newcell.setAttribute('class',table.rows[hdrLevel].cells[i].getAttribute('class'));
		newcell.setAttribute('style',table.rows[hdrLevel].cells[i].getAttribute('style'));
		newcell.innerHTML = table.rows[rowCount-1].cells[i].innerHTML;

		childernCount = newcell.childNodes.length;
		var cellId = "";

		for ( var j = 0; j < childernCount; j++) {

			var childNode = newcell.childNodes[j];
			var tagName = childNode.tagName;
			var nodeName = childNode.nodeName;
			if(nodeName=='#text'){
				if($.trim(childNode.data)!=''){
					childNode.data='';
				}
				continue;
			}
			if (tagName == 'INPUT' || tagName == 'SELECT') {

				cellId = childNode.getAttribute('id')+"";
				cellId = cellId.substring(0, cellId.length-prevRowNoLength);
				cellId = cellId + curRowNo;
				childNode.setAttribute('id', cellId);
				childNode.setAttribute('value','');

				var attrName = childNode.getAttribute('name')+"";
				if(attrName=='isDirty')
					childNode.setAttribute('value','I');

			}else if (tagName == 'SPAN') {

				var spanChildCount = childNode.childNodes.length;
				for ( var k = 0; k < spanChildCount; k++) {
					var spanChildNode = childNode.childNodes[k];
					var nodeName = spanChildNode.nodeName;
					if(nodeName=='#text'){
						if($.trim(spanChildNode.data)!=''){
							spanChildNode.data='';
						}
						continue;
					}
					if(spanChildNode == 'javascript:void(0);' && spanChildNode.getAttribute('class') == "uic_Delete"){
						spanChildNode.setAttribute('onclick','javascript:deleteAddedRows(this, \''+hiddenId+'\');');
						isDelete = true;
					}
					else{
						var cls = childNode.getAttribute('class')+"";
						cls = cls.substring(0, cls.length-prevRowNoLength);
						cls = cls + curRowNo;
						childNode.setAttribute('class', cls);
						childNode.innerHTML="";
					}
				}
			}else if (tagName == 'DIV') {
				var divChildCount = childNode.childNodes.length;
				for ( var k = 0; k < divChildCount; k++) {
					var divChildNode = childNode.childNodes[k];
					var nodeName = divChildNode.nodeName;
					if(nodeName=='#text'){
						if($.trim(divChildNode.data)!=''){
							divChildNode.data='';
						}
						continue;
					}
					if(divChildNode != undefined && divChildNode.tagName =='DIV'){// Special Handling for SumoSelect.
						var childClassName = divChildNode.getAttribute('class')+"";
						if(childClassName.indexOf('SumoSelect') >= 0){ 
							divChildNode = divChildNode.firstChild;
						//	alert("Entered Special: "+firstChild.getAttribute('id')+"");
						}
					}

					var cls = childNode.getAttribute('class')+"";
					cls = cls.substring(0, cls.length-prevRowNoLength);
					cls = cls + curRowNo;
					childNode.setAttribute('class', cls);

					if(childNode.getAttribute('accesskey') == 'in'){
						cellId = divChildNode.getAttribute('id')+"";
						cellId = cellId.substring(0, cellId.length-prevRowNoLength);
						cellId = cellId + curRowNo;
						
						divChildNode.setAttribute('id', cellId);
						divChildNode.setAttribute('value','');
						
						if(divChildNode.tagName == 'SELECT'){
							//alert("Entered select for id:"+cellId +"::"+firstChild.multiple);
							if(divChildNode.options[divChildNode.selectedIndex]!=null ||
									divChildNode.options[divChildNode.selectedIndex]!=undefined)
								divChildNode.options[divChildNode.selectedIndex].removeAttribute('selected','');
							divChildNode.setAttribute('value','');
							if(divChildNode.multiple){ //If multiselect Dropdown, use below to reset all selections.
								$('#'+cellId+ " option:selected").removeAttr("selected");
							}
						}
					}
				}
			}
		}
	}
	if(!isDelete){
		newcell = row.insertCell(i);
		newcell.innerHTML = '<span><a class="uic_Delete" href="javascript:void(0)" onclick="javascript:deleteAddedRows(this, \''+ hiddenId + '\');"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></span>';
	}
	}
	if(isEditable){
		var id = tableId+'_'+curRowNo;
		changeToEditableRowById(id);
		//Add 'editableRow' class to the row.
		var rowId = 'row_'+tableId+'_'+curRowNo;
		$("#"+rowId).addClass("editableRow");
	}

	var addedRows = parseInt($("#addedRows_"+tableId).val());
	$("#addedRows_"+tableId).val(++addedRows);
	$("#" + tableId + "_saveButton").removeAttr('disabled');
	initializeDateTimePicker(tableId, "Table");
	$(".UicColorPicker").colorpicker();
	if($('.AdminUITableLayout').length>0){ //Special handling for Admin UI. Calling post load css.
		adminUICSSChanges(tableId);
	}
}


function changeToEditableRow(thisObj) {
	var tableId = $(thisObj).closest('table').attr('id');
	var index = $(thisObj).attr('tabindex');
	var isEditableRow = $(thisObj).attr('accesskey');
	if(isEditableRow=="read"){
		//converting into editable mode.
		$(thisObj).attr('accesskey', 'in');
		var isModified = $("#isModified_"+tableId+"_"+index).val();
		if(isModified=='Y'){
			$("#isDirty_"+tableId+"_"+index).val("Y");
			$(thisObj).addClass("editableRow");
		}
	}
	else{ //converting into non-editable mode.
		$(thisObj).attr('accesskey', 'read');
		//Remove error flags when row converts to non-editable mode.
		$(thisObj).removeClass("editableRow");
		$(thisObj).removeClass("UicErrorMsgTable");
		//Set dirty flag to 'N' as well, otherwise it causes non-editable rows changes (ones that were modified by the user earlier), to be saved into DB.
		$("#isDirty_"+tableId+"_"+index).val("N"); 
	}
	
	var id = tableId+'_'+index;
	changeToEditableRowById(id);
}

function changeToEditableRowById(id) {
	$('.in_'+id).toggle();
	$('.hrf_'+id).toggle();
	$('.q_'+id).toggle();
	$('.a_'+id).toggle();
	$('.ml_'+id).toggle();
	$('.sn_'+id).toggle();
}

function deleteRow(thisObj, tableId, url, containerId, isScroll) {
	//var flag = confirm("Do you want to delete this row ?");
	
	//if (flag) {
	$.confirm({
		title: 'Confirm!',
	    content: "Do you want to delete this row ?",
	    confirmButtonClass: 'UicPrimaryBtn',
		closeIcon: true,
		columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
	    confirm: function() {
		$('#uic_Loading').show();
		$.ajax({
			url : url,
			async : false,
			cache : false,
			type : 'POST',
			error : function(error) {
				$('#uic_Loading').hide();
				console.log("An error occurred while deleting a record "
						+ error);
				var deletingRecordErrorAlertLoc = getDynamicMsgValue(deletingRecordErrorAlert);
				//alert('An error occurred while deleting a record, please try again.');
				$.alert({
		  		    title: 'Confirm!',
		  		    content: deletingRecordErrorAlertLoc,
		  		    confirmButtonClass: 'UicPrimaryBtn',
		  		    closeIcon: true,
		  		    columnClass: 'col-md-4 col-md-offset-4',
		  		});
			},
			success : function(response) {
				$('#uic_Loading').hide();
				if(isScroll == 'true'){
					if(response == 'true' || response)
						$(thisObj).closest('tr').remove();
					else
						//alert('An error occurred while deleting a record, please try again.');
					$.alert({
			  		    title: 'Confirm!',
			  		    content: 'An error occurred while deleting a record, please try again.',
			  		    confirmButtonClass: 'UicPrimaryBtn',
			  		    closeIcon: true,
			  		    columnClass: 'col-md-4 col-md-offset-4',
			  		});
				}else{
					$('#' + containerId + 'Container').html('');
					$('#' + containerId + 'Container').html(response);	
				}
				$("#" + tableId + "_undoDeleteButton").removeAttr('disabled');
			}
		});
	}
	});
}

function deleteAddedRows(thisObj, hiddenId) {
	//var flag = confirm("Do you want to delete this row ?");
	$.confirm({
		title: 'Confirm!',
	    content: "Do you want to delete this row ?",
	    confirmButtonClass: 'UicPrimaryBtn',
		closeIcon: true,
		columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
	    confirm: function() {
	//if(flag){
		if(hiddenId != undefined){
			$(".addedIdentifier" + hiddenId).remove();
			var addedRows = parseInt($("#addedRows_"+tableId).val());
			$("#addedRows_"+tableId).val(--addedRows);
			var isDataEdited = $("#isDataEdited_"+tableId).val();
			if(addedRows==0 && isDataEdited == 'N')
				$("#" + tableId + "_saveButton").attr('disabled','disabled');
		}
		var hdrLevel = parseInt($("#hdrLevels_" + tableId).val());
		var table = document.getElementById(tableId);
		var columnSize = table.rows[hdrLevel].cells.length;
		var rowSize = table.rows.length;
		if(rowSize == (hdrLevel+1)){
			var msg = $("#noDataFoundMsg_"+tableId).val();
			var noDataFound = "<tr class='uicNoDataFoundTR'><td id='noDataFoundTd_'"+tableId+" colspan='"+columnSize+"'>" +
					"<span class='uicNoDataFoundSpan'>"+msg+"</span></td></tr>";
			$("#uicTableBody_"+tableId).html(noDataFound);
		}
		$(thisObj).closest('tr').remove();
	}
	});
}

function expandRow(thisObj, tableId, rowIndex, subTableUrl) {
	var expandSubtableErrorAlert=getDynamicMsgValue(ExpandsubtableErrorAlert);
	$('#uic_Loading').show();
	$.ajax({
		url : subTableUrl,
		type : 'POST',
		error : function(error) {
			$('#uic_Loading').hide();
			console.log('An error occurred while expand subTable ' +error);
			//alert('An error occurred while expand subTable, please try again.');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: expandSubtableErrorAlert,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
		},
		success : function(html) {
			$('#uic_Loading').hide();
			var hdrLevel = $("#hdrLevels_" + tableId).val();
			var table = document.getElementById(tableId);
			columnSize = table.rows[hdrLevel].cells.length;
			var parentRow = $(thisObj).parent().parent().parent();
			parentRow.after('<tr><td class="over" colspan="'
					+ (columnSize - 0) + '">' + html + '</td></tr>');

			var parentTableId = $('#parentTableId').val();
			var uniqId = parseInt($("#addIndex_" + parentTableId).val());
			var expclpsId = $(thisObj).parent().attr('id');

			if (tableId != parentTableId) {
				var random = Math.floor(Math.random() * 10000) + ""
				+ Math.floor(Math.random() * 10000);
				$("#" + expclpsId).attr("id","expandOrCollapse" + tableId + rowIndex + uniqId + random);
				expclpsId = "expandOrCollapse" + tableId + rowIndex	+ uniqId + random;
			} else {
				$("#addIndex_" + tableId).val(uniqId + 1);
			}

			var innerHtml = '<a href="javascript:void(0)" onclick="javascript:collapseRow(this, \''	+ tableId + '\',' + rowIndex + ',\'' + expclpsId + '\',\'' + subTableUrl + '\');" '
			+'class="UicCollapseTable">'
			+'</a>';
			document.getElementById(expclpsId).innerHTML = innerHtml;
			
		}
	});
}

function collapseRow(thisObj, tableId, rowIndex, expclpsId, subTableUrl) {

	$(thisObj).closest('tr').next().remove();
	var innerHtml = '<a href="javascript:void(0)" class="UicExpandTable" '
		+'onclick="javascript:expandRow(this, \'' + tableId + '\',' + rowIndex + ',\'' + subTableUrl + '\');">'
		+'</a>';
	document.getElementById(expclpsId).innerHTML = innerHtml;

}

function getDataOnScroll(tableId) {
	
	var divScrollID = "uicTableParentDiv_" + tableId;
	var pageNo = parseInt($("#page").val());
	var pageSize = $("#pageSize" + tableId).val();
	var totalRecords = $("#totalRecords" + tableId).val();
	//var customParams = $("#customParams" + tableId).val();

	$contentLoadTriggered = false;
	$("." + divScrollID ).scroll(function() {
		if ($("." + divScrollID ).scrollTop() >= 
			($("#" + tableId).height() - $("." + divScrollID).height()) && 
			$contentLoadTriggered == false) {
			pageNo = parseInt(pageNo) + 1;
			$contentLoadTriggered = true;
			var context = $("#uic_context").val();
			if(totalRecords > (pageNo-1)*(pageSize)){
				$('#uic_Loading').show();
				$.ajax({
					url : context+"/getScrollTablePage.htm",
					cache : false,
					type : 'POST',
					data : {
						tableIds : tableId,
						page : pageNo,
						pageSize : pageSize,
						totalRecords : totalRecords,
					},
					error : function(data) {
						var searchRefreshMsg=getDynamicMsgValue(refreshingErrorAlertKey);
						$('#uic_Loading').hide();
						console.log("Error in dynamic search component on refresh event "+ data);
						//alert('An error occurred while refreshing, please try again.');
						$.alert({
				  		    title: 'Confirm!',
				  		    content: searchRefreshMsg,
				  		    confirmButtonClass: 'UicPrimaryBtn',
				  		    closeIcon: true,
				  		    columnClass: 'col-md-4 col-md-offset-4',
				  		});
					},
					success : function(data) {

						var theHtml = $(data).filter('#UicScrollDiv' + tableId).html();
						$("#scrollRowdiv" + tableId).append(theHtml);

						$("#scrollRowdiv" + tableId).find("#scrollTableId"+ tableId	+ " >tbody tr").each(
								function() {
									var str = "";
									var trObj = $(this).html();
									var tag = document.getElementById($(this).attr('id'));
									var atts = tag.attributes;
									if(atts!=null && atts!='' && atts!='undefined'){
										for (var i = 0, n = atts.length; i < n; i++){
										      var att = atts[i];
										      str = str+" "+att.nodeName+"='"+att.nodeValue+"'";
										   }
									}
									newRow = "<tr"+str+">" + trObj + "</tr>";
									$('#'+ tableId + ' > tbody > tr:last').after(newRow);
								});
						changeEventHandler(tableId);
						$("#scrollRowdiv" + tableId).empty();

						$contentLoadTriggered = false;
						initializeDateTimePicker();
						$('#uic_Loading').hide();
					}
				});
			}
		}
	});
}

function changeDartyRowStatus(tableId, index) {
	$("#" + tableId + index).val("Y");
}

var errorElementArr = []; // Array to hold elements that have errored. This is done so as to ensure non-removal of error styling in case the next validation passes.
/**
 * Main UI validator method. All UI validations are defined  and executed here.
 * @param componentId
 * @param componentType
 * @returns {Boolean}
 */
function validateEditData(componentId, componentType) {
	localStorage.setItem('alerted','no');
	// alert("started validation.....");
	errorElementArr = []; // resetting the error element array.

	var requiredFlag = true;
	var validFlag = true;
	var pattern;
	var errorMessage = "";
	
	var finder;
	if(componentType.toLowerCase()=="table"){
		finder = '.editableRow .required';
	}else{
		finder = '.required';
	}
	$('#'+componentId).find(finder).each(function() {
		var elementId = $(this).attr("id");
		if ($(this).val() == null || $(this).val() == '') {
			//errorMessage = "Please enter a value.";
			errorMessage=getDynamicMsgValue(commanRequiredkey);
			errorCaseStyle(this, elementId, componentId, componentType, errorMessage);
			requiredFlag = false;
			return;//return requiredFlag;
		} else {
			nonErrorCaseStyle(this, elementId, componentId, componentType, errorMessage);
		}

	});

	if (requiredFlag) {
		
		//Text --Allows all the keys to enter (0-9, A-Z, a-z, Space, Special Symbols)
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .text';
		}else{
			finder = '.text';
		}
		$('#'+componentId).find(finder).each(function() {
			pattern =  /^[\w\s\-,.:;`!@#$%*?|=()+^&\[\]\<\>\/\\]*$/i;
			//errorMessage = "Please enter valid text.";
			errorMessage=getDynamicMsgValue(validTextKey);
			var tempFlag = evaluatePattern(this, pattern, errorMessage, componentId, componentType);
			if(validFlag!=false){
				validFlag = tempFlag;
			}
			return;//return validFlag;
		});
		

		//Numeric-- Allows 0-9, Symbols(+&-), Comma(,), Dot(.). Minimum 1 and Maximum 5 decimal places allowed.
		//Ex 123, +123, 123.90, -123.90
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .numeric';
		}else{
			finder = '.numeric';
		}
		$('#'+componentId).find(finder).each(function() {
			pattern = /^[-+]?([0-9]+[,])*[0-9]+(.[0-9]{1,5})?$/g;
			//errorMessage = "Please enter a valid numeric value.";
			errorMessage=getDynamicMsgValue(requirednumericKey);
			var tempFlag = evaluatePattern(this, pattern, errorMessage, componentId, componentType);
			if(validFlag!=false){
				validFlag = tempFlag;
			}
			return;//return validFlag;
			});
		
		//AlphaNumeric -- Allows 0-9, A-Z
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .alphanumeric';
		}else{
			finder = '.alphanumeric';
		}
		$('#'+componentId).find(finder).each(function() {
			pattern = /^[0-9a-zA-Z]+$/g;
			//errorMessage = "Please enter a valid alpha numeric value.";
			errorMessage=getDynamicMsgValue(validAlphanumericKey);
			var tempFlag = evaluatePattern(this, pattern, errorMessage, componentId, componentType);
			if(validFlag!=false){
				validFlag = tempFlag;
			}
			return;//return validFlag;
		});

		// Email -- Allows 0-9,A-Z, Symbols(-,_,@,.)
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .email';
		}else{
			finder = '.email';
		}
		$('#'+componentId).find(finder).each(function() {
			pattern =/^([A-Z0-9.'_%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4})?$/i;
			//errorMessage = "Please enter a valid email.";
			errorMessage=getDynamicMsgValue(validEmailKey);
			var tempFlag = evaluatePattern(this, pattern, errorMessage, componentId, componentType);
			if(validFlag!=false){
				validFlag = tempFlag;
			}
			return;//return validFlag;
		});

		// Mobile -- Allows 0-9, Only 10 digits excluding country code. Should start with non-zero number.
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .mobile';
		}else{
			finder = '.mobile';
		}
		$('#'+componentId).find(finder).each(function() {
			pattern = /^[1-9]{1}[0-9]{9}$/;
			//errorMessage = "Please enter valid mobile number.";
			errorMessage=getDynamicMsgValue(validMobileKey);
			var tempFlag = evaluatePattern(this, pattern, errorMessage, componentId, componentType);
			if(validFlag!=false){
				validFlag = tempFlag;
			}
			return;//return validFlag;
		});
		
		// Phone -- Allows 0-9, Symbol(-), Only 11 digits including STD code. zero allowed as first number.
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .phone';
		}else{
			finder = '.phone';
		}
		$('#'+componentId).find(finder).each(function() {
			pattern = /^[0-9]{11}$/;
			//errorMessage = "Please enter valid phone number.";
			errorMessage=getDynamicMsgValue(validPhoneKey);
			var tempFlag = evaluatePattern(this, pattern, errorMessage, componentId, componentType);
			if(validFlag!=false){
				validFlag = tempFlag;
			}
			return;//return validFlag;
		});

		// Custom -- Uses user given regex for validation check.
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .custom';
		}else{
			finder = '.custom';
		}
		$('#'+componentId).find(finder).each(function() {
			var elementId = $(this).attr("id");
			var regex;
			if(componentType.toLowerCase()=="table"){
				var cellName = $(this).attr("name"); // This would get the column no.
				regex = $("#REGEX_"+cellName).val();
			}else{
				regex = $("#REGEX_"+elementId).val();
			}
			//errorMessage = "Given value does not match the regex set.";
			errorMessage=getDynamicMsgValue(validRegularExpressionKey);
			
			var properties = "g"; //default global.
			if(regex.indexOf("/")>=0){
				var start = regex.indexOf("/")+1;
				var end = regex.lastIndexOf("/");
				if(end < regex.length){
					properties = regex.substring(end+1, regex.length);
				}
				regex = regex.substring(start,end);
			}
			pattern = new RegExp(regex, properties);  
			
			var tempFlag = evaluatePattern(this, pattern, errorMessage, componentId, componentType);
			if(validFlag!=false){
				validFlag = tempFlag;
			}
			return;//return validFlag;
		});
		
		//MIN validation
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .min';
		}else{
			finder = '.min';
		}
		$('#'+componentId).find(finder).each(function() {
			var value = $(this).val();
			var elementId = $(this).attr("id");
			if (value != null && value != "" && value != "null") {
				var minLength;
				if(componentType.toLowerCase()=="table"){
					var cellName = $(this).attr("name"); // This would get the column no.
					minLength = $("#MIN_"+cellName).val();
				}else{
					minLength = $("#MIN_"+elementId).val();
				}
				var valueLength = value.length;
				
				if (minLength > valueLength) {
					errorMessage = "Please enter at least "+minLength+" characters.";
					errorCaseStyle(this, elementId, componentId, componentType, errorMessage);
					validFlag = false;
				} else {
					nonErrorCaseStyle(this, elementId, componentId, componentType, errorMessage);
				}
			}
			return;//return validFlag;
		});
	
		//MAX validation
		if(componentType.toLowerCase()=="table"){
			finder = '.editableRow .max';
		}else{
			finder = '.max';
		}
		$('#'+componentId).find(finder).each(function() {
			var value = $(this).val();
			var elementId = $(this).attr("id");
			if (value != null && value != "" && value != "null") {
				var maxLength;
				if(componentType.toLowerCase()=="table"){
					var cellName = $(this).attr("name"); // This would get the column no.
					maxLength = $("#MAX_"+cellName).val();
				}else{
					maxLength = $("#MAX_"+elementId).val();
				}
				var valueLength = value.length;
				
				if (maxLength < valueLength) {
					errorMessage = "Please enter less than "+maxLength+" characters.";
					errorCaseStyle(this, elementId, componentId, componentType, errorMessage);
					validFlag = false;
				} else {
					nonErrorCaseStyle(this, elementId, componentId, componentType, errorMessage);
				}
			}
			return;//return validFlag;
		});

	} else {
		validFlag = false;
	}

	return validFlag;

}

/**
 * This function shall evaluate the given value against the pattern and set error message where required. It also returns the valid flag(True if pattern matches, False otherwise).
 * @param pattern
 * @param value
 * @param errorMessage
 */
function evaluatePattern(caller, pattern, errorMessage, componentId, componentType){
	localStorage.setItem('alerted','no');
	var validFlag=true;
	var value = $(caller).val();
	var elementId = $(caller).attr("id");
	
	if( value!="" && !pattern.test(value)){
		errorCaseStyle(caller, elementId, componentId, componentType, errorMessage);
		validFlag = false;
	} else {
		nonErrorCaseStyle(caller, elementId, componentId, componentType, errorMessage);
	}
	return validFlag;
}

/**
 * This function applies error styling to the given element.
 * @param elementId
 * @param componentType
 * @param errorMessage
 */
function errorCaseStyle(caller, elementId, componentId, componentType, errorMessage){
	$(caller).css("border-color", "red");
	if(componentType.toLowerCase()=="form" || componentType.toLowerCase()=="search"){
		if($('#'+componentId).find("#errorMessage_" + elementId)!=null)
			$('#'+componentId).find("#errorMessage_" + elementId).text(errorMessage);
	}else{
		//alert(elementId+"--"+errorMessage);
		//alert(errorMessage);
		var alerted = localStorage.getItem('alerted') || '';
		
	    if(alerted != 'yes') {
			$.alert({
	  		    title: 'Confirm!',
	  		    content: errorMessage,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
			localStorage.setItem('alerted','yes');	
		}
	}
	if($.inArray(componentId+"_"+elementId, errorElementArr)==-1){
		errorElementArr.push(componentId+"_"+elementId);
	}
	cleanMultiDropdowns(componentId); //Clean multi dropdowns for temp values created during the save process.
}

/**
 * This function applies non-error styling to the given element.
 * @param elementId
 * @param componentType
 * @param errorMessage
 */
function nonErrorCaseStyle(caller, elementId, componentId, componentType, errorMessage){
	if($.inArray(componentId+"_"+elementId, errorElementArr)!=-1){
		return; // Ignore non-error styling the element, if the element is errored due to some other validation failure.
	}
	$(caller).css("border-color", "#ccc");
	if(componentType.toLowerCase()=="form" || componentType.toLowerCase()=="search"){
		if($('#'+componentId).find("#errorMessage_" + elementId)!=null)
			$('#'+componentId).find("#errorMessage_" + elementId).text("");
	}
}

function openHref(url) {
	location.href = url;
}


function uicEditTableCaption(tableId) {
	$('.uicTableCaption_'+tableId).toggle();
}

function uicUpdateTableCaption(thisObj, msgKey, tableId) {

	var msgValue = thisObj.value;
	var result = updateUICMsg(msgKey, msgValue);//method in commonComponents.js
	if (result == 'Y') {
		//alert("Text changed successfully.");
		$.alert({
  		    title: 'Confirm!',
  		    content: 'Text changed successfully.',
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4',
  		});
		$("#uic_tbl_caption_h2_"+tableId).html(msgValue);
	} else {
		//alert('An error occurred while changing Text.');
		$.alert({
  		    title: 'Confirm!',
  		    content: 'An error occurred while changing text.',
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4',
  		});
	}
}

function uicEditColumnHeader(elmId) {
	$('.uicColHdr_'+elmId).toggle();
}

function uicUpdateColumnHdr(thisObj, msgKey, elmId) {

	var msgValue = thisObj.value;
	var result = updateUICMsg(msgKey, msgValue);//method in commonComponents.js
	if (result == 'Y') {
		//alert("Text changed successfully.");
		$.alert({
  		    title: 'Confirm!',
  		    content: 'Text changed successfully.',
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4',
  		});
		$("#uicColHdrSpan_"+elmId).html(msgValue);
	} else {
		//alert('An error occurred while changing Text.');
		$.alert({
  		    title: 'Confirm!',
  		    content: 'An error occurred while changing text.',
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4',
  		});
	}
}

function showHideColumns(colNo, tableId, elmId, thisObj) {
	
	var selectedColumns = $("input[type=checkbox]:checked").length;
	if (selectedColumns > 0) {
		var displayFlag = 'N';
		if (thisObj.checked) {
			displayFlag = 'Y';
		}
		var context = $("#uic_context").val();
		$('#uic_Loading').show();
		$.ajax({
			url : context+"/updateShowHideColumn.htm",
			type : 'POST',
			data : {
				requestToken : $('#requestToken').val(),
				tableId : tableId,
				elmId : elmId,
				displayFlag : displayFlag
			},
			error : function(data) {
				$('#uic_Loading').hide();
				//alert('An error occurred while Show/Hide column.');
				$.alert({
		  		    title: 'Confirm!',
		  		    content: 'An error occurred while Show/Hide column.',
		  		    confirmButtonClass: 'UicPrimaryBtn',
		  		    closeIcon: true,
		  		    columnClass: 'col-md-4 col-md-offset-4',
		  		});
				$(thisObj).prop('checked', true);
			},
			success : function(response) {
				$('#uic_Loading').hide();
				if (displayFlag == 'Y') {
					if (elmId == -1)
						$(".showhideExpand_" + tableId).show();
					else {
						$(".hideCol_" + tableId + "_" + elmId).show();
					}
				} else {
					if (elmId == -1)
						$(".showhideExpand_" + tableId).hide();
					else {
						$(".hideCol_" + tableId + "_" + elmId).hide();
					}
				}
			}
		});
	} else {
		//alert("Atleast one selected column is required");
		$.alert({
  		    title: 'Confirm!',
  		    content: 'Atleast one selected column is required',
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4',
  		});
		$(thisObj).prop('checked', true);
		return false;
	}

	function stripSpecialChars(value) {
		var paramValue = value;
		paramValue = paramValue.replace(/</gi, "&#60;");
		paramValue = paramValue.replace(/>/gi, "&#62;");
		paramValue = paramValue.replace(/!/gi, "&#33;");
		paramValue = paramValue.replace(/'/gi, "&#39;");
		paramValue = paramValue.replace(/\//gi, "&#47;");
		return paramValue;
	}
}

function saveForm(id) {
	var isValidData = validateEditData(id, "Form");
	if (isValidData) {
		$("#" + id)();
	}
}


function callSearchAutoComplete(thisObj, url){
	
	$(thisObj).keypress(function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
		}
	});

	$(thisObj).autocomplete({
		source : url,
		autoFocus : true,
		minLength : 1,
		search : function(event, ui){
			$(".autocomplete").addClass("spiningWheel");
		},
		response :function(event, ui){
			$(".autocomplete").removeClass("spiningWheel");
		}
	}); 
}

function searchData(tableId) {
	
	var postData = $("#dynamicSearch" + tableId).serializeArray();
	var formURL = $("#dynamicSearch" + tableId).attr("action");
	var searchCritriaMsg=getDynamicMsgValue(searchCriteriaAlertKey);
	var searchErrorMsg=getDynamicMsgValue(searchErrorAlertKey);
	if (validateSearchForm("dynamicSearch"+tableId)) {
		if (validateRangeSearch("dynamicSearch"+tableId)) {
			$('#uic_Loading').show();
			$.ajax({
				url : formURL,
				cache : false,
				type : 'POST',
				data : postData,
				error : function(error) {
					$('#uic_Loading').hide();
					console.log("Error in dynamic search component on search event "+ error);
					//alert('An error occurred while searching, please try again.');
					$.alert({
			  		    title: 'Confirm!',
			  		    content: searchErrorMsg,
			  		    confirmButtonClass: 'UicPrimaryBtn',
			  		    closeIcon: true,
			  		    columnClass: 'col-md-4 col-md-offset-4',
			  		});
				},
				success : function(html) {
					$('#uic_Loading').hide();
					var containerId = $("#ContainerId_"+tableId).val();
					$('#' + containerId + 'Container').html('');
					$('#' + containerId + 'Container').html(html);
					hideshowColumns();
				}
			});
		}
	} else {
		//alert('Please enter search criteria.');
		$.alert({
  		    title: 'Confirm!',
  		    content: searchCritriaMsg,
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4',
  		});
	}
}


function resetData(tableId, url) {
	
	var paramObj = {};
	var searchRefreshMsg=getDynamicMsgValue(refreshingErrorAlertKey);
	paramObj["tableIds"] = tableId;
	paramObj["isRefresh"] = "true";
	paramObj["requestToken"] = $('#requestToken').val();
	$('#uic_Loading').show();
	$.ajax({
		url : url,
		cache : false,
		type : 'POST',
		data : paramObj,
		error : function(data) {
			$('#uic_Loading').hide();
			console.log("Error in dynamic search component on reset event "+ data);
			//alert('An error occurred while refreshing, please try again.');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: searchRefreshMsg,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
		},
		success : function(data) {
			$('#uic_Loading').hide();
			var containerId = $("#ContainerId_"+tableId).val();
			$('#' + containerId + 'Container').html('');
			$('#' + containerId + 'Container').html(data);
			clearAllSearchFields(tableId);
			hideshowColumns();

		}
	});
}

function openDatepicker(thisObj) {
	$(thisObj).datepicker();
}

function tableCollapseExpands(tableId) {	
		if ($('#uiIconChangeId_' + tableId).hasClass("glyphicon-chevron-up")) {	
		$('#uiIconChangeId_' + tableId).removeClass("glyphicon-chevron-up");
		$('#uiIconChangeId_' + tableId).addClass("glyphicon-chevron-down");
		$("#accordianMainDiv_" + tableId).hide();
		$("#showHideFuncDiv_" + tableId).hide();
		
	} else if ($('#uiIconChangeId_' + tableId).hasClass("glyphicon-chevron-down")) {

		$('#uiIconChangeId_' + tableId).removeClass("glyphicon-chevron-down");
		$('#uiIconChangeId_' + tableId).addClass("glyphicon-chevron-up");
		$("#accordianMainDiv_" + tableId).show();
		$("#showHideFuncDiv_" + tableId).show();
	}
}


function doSearchReset(componentId, url) {
	
	$("#searchScreenId").val($("#screenId").val());
	var postData = $("#dynamicSearch" + componentId).serializeArray();
	var searchRefreshMsg=getDynamicMsgValue(refreshingErrorAlertKey);
	
	$.ajax({
		url : url,
		cache : false,
		type : 'POST',
		data : postData,
		dataType: "json",
		error : function(data) {
			console.log("Error in dynamic search component on reset event "+ data);
			//alert('An error occurred while refreshing, please try again.');
			$.alert({
	  		    title: 'Confirm!',
	  		    content: searchRefreshMsg,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
		},
		success : function(data) {
			clearAllSearchFields(componentId);
			loadComponents(data);
		}
	});
}


function doSearchData(componentId) {
	$("#searchScreenId").val($("#screenId").val());
	var postData = $("#dynamicSearch" + componentId).serializeArray();
	var formURL = $("#dynamicSearch" + componentId).attr("action");
	var searchCritriaMsg=getDynamicMsgValue(searchCriteriaAlertKey);
	var searchErrorMsg=getDynamicMsgValue(searchErrorAlertKey);
	
	var compMainId = "uicSearchCompMainDiv_"+componentId;
	if (validateSearchForm(compMainId)) {
		if (validateRangeSearch(compMainId)  && validateEditData(compMainId, "Search")) {
			$.ajax({
				url : formURL,
				cache : false,
				type : 'POST',
				data : postData,
				dataType: "json",
				error : function(error) {
					$('#uic_Loading').hide();
					console.log("Error in dynamic search component on search event "+ error);
					//alert('An error occurred while searching, please try again.');
					$.alert({
			  		    title: 'Confirm!',
			  		    content: searchErrorMsg,
			  		    confirmButtonClass: 'UicPrimaryBtn',
			  		    closeIcon: true,
			  		    columnClass: 'col-md-4 col-md-offset-4',
			  		});
				},
				success : function(data) {
					loadComponents(data);
				}
			});
		}
	} else {
		//alert('Please enter search criteria.');
		$.alert({
  		    title: 'Confirm!',
  		    content: searchCritriaMsg,
  		    confirmButtonClass: 'UicPrimaryBtn',
  		    closeIcon: true,
  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
  		});
	}
}

function validateNumeric(){
	var retVal=true;
	// numeric with sign and with or without decimal point Ex 123, +123,
	// 123.90, -123.90
	$('.numeric').each(function() {

		var numericWithSignCheck = /^[-+]?[0-9]+(.[0-9][0-9])?$/;
		var numVal = $(this).val();
		var statusNum = numericWithSignCheck.test(numVal);
		if (!statusNum && numVal != '') {
			if(retVal==true)
				//alert("Please enter valid numetic with or without Sign(+ or -) only.");
				$.alert({
		  		    title: 'Confirm!',
		  		    content: "Please enter valid numetic with or without Sign(+ or -) only.",
		  		    confirmButtonClass: 'UicPrimaryBtn',
		  		    closeIcon: true,
		  		    columnClass: 'col-md-4 col-md-offset-4',
		  		});
				
			$(this).css("border-color", "red");
			retVal = false;
		} else {
			$(this).css("border-color", "grey");
		}
	});
	return retVal;
}

function uicShowDatePicker(thisObj){
	$(thisObj).datepicker({dateFormat : 'dd-mm-yy'});
	$(thisObj).datepicker('show');
}

function defaultDoSearch(caller){
	var componentId = $(caller).parents("form").find("#searchCompId").val();
	doSearchData(componentId);
}

function defaultSearchReset(caller){
	var componentId = $(caller).parents("form").find("#searchCompId").val();
	var searchResetUrl = $(caller).parents("form").find("#searchResetUrl").val();
	 doSearchReset(componentId, searchResetUrl);
}

function defaultTableAddRow(caller){
	var tableId = $(caller).parents("form").find("#tableId").val();
	addRow(tableId);
}

function defaultTableSaveData(caller){
	var tableId = $(caller).parents("form").find("#tableId").val();
	saveData(tableId);
} 

function defaultTableUndoDelete(caller){
	var tableId = $(caller).parents("form").find("#tableId").val();
	undoDelete(tableId);
}

function searchCollapseExpands(componentId){
	if ($('#uiIconChangeIdSearch_'+componentId).hasClass("glyphicon-chevron-up")) {	
		$('#uiIconChangeIdSearch_'+componentId).removeClass("glyphicon-chevron-up");
		$('#uiIconChangeIdSearch_'+componentId).addClass("glyphicon-chevron-down");
		$('#uic_search_'+componentId).hide();
	} else if ($('#uiIconChangeIdSearch_'+componentId).hasClass("glyphicon-chevron-down")) {
		$('#uiIconChangeIdSearch_'+componentId).removeClass("glyphicon-chevron-down");
		$('#uiIconChangeIdSearch_'+componentId).addClass("glyphicon-chevron-up");
		$('#uic_search_'+componentId).show();
	}
}

function getDynamicMsg(){
	
    $.ajax({
    	type: "POST",
        url: "getDynamicAlert.htm", 
        async : false,
        success : function(responseData) {
        	dynamicMsg=jQuery.parseJSON(responseData);
        },
        error : function(error) {
        	//alert("data not present ."+ msgKey + error);
        	$.alert({
	  		    title: 'Confirm!',
	  		    content: "Data not present ."+ msgKey + error,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
        }
 	});
}

function getDynamicMsgValue(msgKey){
	var msg = "";
	if(msgKey != undefined && msgKey != ''){
		try{
			if(dynamicMsg == undefined || dynamicMsg == ''){
				getDynamicMsg();
			}
			msg = dynamicMsg[msgKey];
		}catch(err){
			console.log("Error message not defined for :"+msgKey);
		}
	}
	return msg;
}
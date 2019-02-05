$(function () {
try {
	$(".UicColorPicker").colorpicker();
} catch(error) {
	console.log('Colorpicker not initialized.')
}
	
	 /* $(".datepicker").datepicker({
		  	format: 'dd-M-yyyy',
	        autoclose: true, 
	        todayHighlight: true
	  }).datepicker('update', new Date());;*/
	  
	});


$(document).ready(function() {
	reloadCaptcha();
	$(".caps").keypress(function(event) {
		if (event.keyCode == 20) {
			//alert('caps on');
			$.alert({
			    title: 'Confirm!',
			    content: 'Caps On',
			    confirmButtonClass: 'UicPrimaryBtn',
			    closeIcon: true,
			    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
			});
		}
	});

	var groupVisibilityArr = $('.uic_customwell');
	var dataMap = $("#dataMap").val();
	if(dataMap!=null && $.trim(dataMap)!="")
		groupVisibilityArr = jQuery.parseJSON(dataMap);
	if (groupVisibilityArr != null && groupVisibilityArr != "null") {
		for ( var i = 0; i < groupVisibilityArr.length; i++) {
			var strArr = groupVisibilityArr[i].split(' ');
			if (strArr[1] == 'hide') {
				$('#groupData_' + i).hide();
			} else {
				$('#groupData_' + i).show();
			}
		}
	}
});


function showErrorMessage(dataMap){
	var dataMapJson = $.parseJSON(dataMap);
	var errorMap = dataMapJson.errorMap;
	var errorMapArray = errorMap.myArrayList;
	if(errorMapArray != null && errorMapArray != 'null'){
      	for ( var i = 0; i < errorMapArray.length; i++) {
      		var paramName = errorMapArray[i].map.paramName;
       		paramName = "#errorMessage_"+paramName;
       		var errorMessage = errorMapArray[i].map.errorMessage;
       		$(paramName).text(errorMessage);
		}
	} 
}

/*function callDatepicker(pattern) {
	$('#datePicker').datepicker({
		format : pattern,
		autoclose : true
	}).datepicker("setDate", "0");
}*/

function unloadPopupBox() { // TO Unload the Popupbox
	$('#popup_box').fadeOut("slow");
	$("#container").css({ // this is just for style
		"opacity" : "1"
	});
}

function loadPopupBox() {
	$('#popup_box').fadeIn("slow");// To Load the Popupbox
	$("#container").css({ // this is just for style
		"opacity" : "0.3"
	});
}

function callGuideMeMessage(message) {
	$('#message').html(message);
	loadPopupBox();
}

function previousFormComponent(formId){
	callFormComponent(formId, 'previous');
}

function addFormComponent(formId){
	callFormComponent(formId, 'addrecord');
}

function nextFormComponent(formId){
	callFormComponent(formId, 'next');
}

function saveFormComponent(formId){
	
	 var val= callFormComponent(formId, 'save');
	// alert("val :"+val);
	 return val;
	
}

function callFormComponent(id, buttonAction) {
	
	$("#"+id).find("#buttonAction").val(buttonAction);

	var formSubmitType = $("#formSubmitType_"+id).val();
	var isModifiedData = true;
	var formId = $("#"+id).find("#formId").val();
	
	//Clear all error div of previous round.
	$("#"+id+" .UicErrorMsg").empty();
	
	if ($('#actionType_'+id).val() == "update") {		
		isModifiedData = isUpdatedElements(id);		
	}
	
	if (!isModifiedData) {
		//alert("There is no changes in the form, to update");
		$.alert({
		    title: 'Confirm!',
		    content: 'There is no changes in the form, to update',
		    confirmButtonClass: 'UicPrimaryBtn',
		    closeIcon: true,
		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
		});
	} else {
		var isValidData = validateEditData(id, "Form");
		//alert("isValidData "+isValidData);
		
	if (isValidData) {
			//alert("formSubmitType "+formSubmitType);
			var formData = $('#'+id).serializeArray();
			var formActionURL = $('#'+id).attr("action");
			
			var isServerValidationPass = runServerValidations(formData, id);
			//alert(isServerValidationPass);
			if(isServerValidationPass){ //Passed DB Validation.
				var embeddedAction = $("#embeddedAction_"+formId).val();
				if (embeddedAction == true || embeddedAction == 'true') {
				
					$.ajax({
						method : "post",
						url : formActionURL,
						data : formData,
						error : function(error) {
							console.log("Error while saving form component : "+ formId + error);
							//alert("Error while saving form component : "+ formId );
							$.alert({
							    title: 'Confirm!',
							    content: "An error occurred while saving form component : "+ formId ,
							    confirmButtonClass: 'UicPrimaryBtn',
							    closeIcon: true,
							    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
							});
						},
						success : function(data) {
							//alert("form action performed succesfully...");
							$.alert({
							    title: 'Confirm!',
							    content: 'form action performed succesfully...',
							    confirmButtonClass: 'UicPrimaryBtn',
							    closeIcon: true,
							    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
							});
							
							callEmbeddedForm(id);
						}
					}); 
				}else{
					if (formSubmitType == 'Traditional' || formSubmitType == undefined || formSubmitType == 'undefined') {
						//alert("called Traditional.");
						$('#'+id).submit();
					} else {
						//alert("called Ajax");
						//Using FormData object here. Simple serialized array doesn't work fine with file elements.  
						var formAjax = $('#'+id)[0]; 
						var formDataAjax = new FormData(formAjax);
				      $.ajax({
				    	  	type: "POST",
							url : formActionURL,
							data : formDataAjax,
							dataType: "json",
							contentType: false,
							processData: false,
							async: false,
							cache : false,
							error : function(error) {
								console.log("Error while saving form component : "+ formId + error.responseText);
								//alert("Error while saving form component : "+ formId );
								$.alert({
						  		    title: 'Confirm!',
						  		    content: "An error occurred while saving form component : "+ formId,
						  		    confirmButtonClass: 'UicPrimaryBtn',
						  		    closeIcon: true,
						  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
						  		});
							},
							success : function(data) {
									//alert("Successful Save.");
									$.alert({
							  		    title: 'Confirm!',
							  		    content: 'Successful Save.',
							  		    confirmButtonClass: 'UicPrimaryBtn',
							  		    closeIcon: true,
							  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
							  		});
									if($('.AdminUITableLayout').length>0){ //Special handling for Admin UI. Calling post load css.
										var saveMessage='';
										if(id=="tableComponentDataQueryForm" && data.ElementCreationErrorMsg!=null){
											saveMessage = data.ElementCreationErrorMsg[0]; //Setting message for error display on Admin UI.
										}
										applyPostSaveChangesForForm(id, saveMessage);
									}
									
									//alert(data.formId[0]+":::"+data.action[0]);
									//alert("data.isUpdate:"+data.isUpdate+ " :: "+data.isUpdate[0]);
									if(data.isUpdate!=null && data.isUpdate[0]){
										return;// Return back as no processing needed.
									}else{
										resetForm(id); // Reset all inputs except in case of update call.
									}
									if(data.action[0].toLowerCase() == 'save' && data.forward!=null && data.forward[0]) {
										var forwardURL = data.forwardUrl[0];
										$(location).attr('href',forwardURL);
									}else if(data.forward!=null && data.forward[0]){// Indicates forward is true. Will result in ajax loading of the new form.
										//load form via Ajax with formId as parameter.
										var forwardURL = data.forwardUrl[0];
										var forwardFormId = data.formId[0];
									//	alert("action:"+data.action[0] +" || forwardURL:"+forwardURL +" || forwardFormId:"+forwardFormId);
										forwardTo(forwardURL, forwardFormId, null, formId);
									}else if(data.action[0].toLowerCase() == 'save' && data.forward == null){										
										$.ajax({
											type: "POST",
											url: 'getFormData.htm',
											data : {formId:formId},
											success: function(data){
												$('#contentDiv_'+formId).html('');
												$('#contentDiv_'+formId).html(data);												
												$('#contentDiv_'+formId).attr("id","contentDiv_"+formId);
												
											}			  
										});
									}
							}
						});
				     }
				}
			}else{
				$.alert({
				    title: 'Confirm!',
				    content: "validation failed!",
				    confirmButtonClass: 'UicPrimaryBtn',
				    closeIcon: true,
				    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
				});
			}
			
		}
	}
	return; 
}

function runServerValidations(formData){
	var status = false;
	$.ajax({
		method : "post",
		url : "serverSideValidation.htm",
		data : formData,
		dataType: "json",
	    async : false,
		error : function(error) {
			console.log("Error while running validaiton for form component : "+ formId + error);
			//alert("Error while running validaiton for form component : "+ formId );
			$.alert({
	  		    title: 'Confirm!',
	  		    content: 'Error while running validation for form component : '+ formId,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
	  		});
		},
		success : function(data) {
			if (data.result.toLowerCase() == 'error') {
				showErrorMessageByAjax(data.errorMap);
				status = false;
			}else{
				status = true;
				$(".UicErrorMsg").empty();
			}
		}
	});
	return status;
}

/**
 * This method calls the passed forward Url and helps load the form onto the UI.
 * @param forwardUrl
 * @param forwardFormId
 * @param paramMap
 * @param destFormId
 */
function forwardTo(forwardURL, forwardFormId, paramMap, destFormId) {

	$.ajax({
		method : "post",
		url : forwardURL,
		data : {formId:forwardFormId},
	    async : false,
		error : function(error) {
			console.log("Error while loading form component : "+ forwardFormId + error);
			//alert("Error while loading form component : "+ forwardFormId );
			$.alert({
	  		    title: 'Confirm!',
	  		    content: 'Error while loading form component : '+ forwardFormId,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
	  		});
		},
		success : function(data) {
			$('#contentDiv_'+destFormId).html('');
			$('#contentDiv_'+destFormId).html(data);
			//Change the contentDiv id to reflect the actual new one.
			$('#contentDiv_'+destFormId).attr("id","contentDiv_"+forwardFormId);
		}
		});
	
}

/**
 * This method helps extracting error message from the input errorArray and assign them to respective elements.
 * @param errorMapArray
 */
function showErrorMessageByAjax(errorMap){
	//Clear all error div of previous round.
	$(".UicErrorMsg").empty();
	//Iterate and assign new error message.
	$.each(errorMap, function(paramName, errorMessage) {
	    var errParamName = "#errorMessage_"+paramName;
   		$(errParamName).text(errorMessage);
	});
}

function callAutoComplete(queryName, elementId, formID) {

	var inputTextVal = $('#' + elementId).val();

	$("#" + elementId).keypress(function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
		}
	});

	$.ajax({
		method : "post",
		url : "formAutoComplete.htm",
		data : {
			requestToken : $('#requestToken').val(),
			queryName : queryName,
			inputTextVal : inputTextVal,
			formId : formID
		},
		error : function(error) {
			console.log("Error while calling autocomplete on form component : "+ formID + error);
			//alert("Error while calling autocomplete on form component : "+ formID + error);
			$.alert({
	  		    title: 'Confirm!',
	  		    content: "An error occurred while calling autocomplete on form component : "+ formID + error,
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
	  		});
		},
		success : function(data) {
			
			var dataSource = jQuery.parseJSON(data);
			if (dataSource.length > 0) {
				$("#" + elementId).autocomplete({
					source : dataSource,
					minLength : 1
				});
			} else {
				$("#" + elementId).autocomplete({
					source : [ 'No Results Found' ]
				});
			}
		}
	});
}

function formAccordian(AccordianId, mainDivHide, actionid) {
	if ($('#' + AccordianId).hasClass("glyphicon-chevron-up")) {
		$('#' + AccordianId).removeClass("glyphicon-chevron-up");
		$('#' + AccordianId).addClass("glyphicon-chevron-down");
		$("." + mainDivHide).hide();
		$("." + actionid).hide();
	} else if ($('#' + AccordianId).hasClass("glyphicon-chevron-down")) {
		$('#' + AccordianId).removeClass("glyphicon-chevron-down");
		$('#' + AccordianId).addClass("glyphicon-chevron-up");
		$("." + mainDivHide).show();
		$("." + actionid).show();
	}
}

function formGroupAccordian(AccordianId, mainDivHide, actionid) {
	var groupId = mainDivHide;
	groupId = "#groupID_" + groupId;
	if ($('#' + AccordianId).hasClass("glyphicon-chevron-up")) {
		$('#' + AccordianId).removeClass("glyphicon-chevron-up");
		$('#' + AccordianId).addClass("glyphicon-chevron-down");
		$(groupId).hide();
		$("." + actionid).hide();
	} else if ($('#' + AccordianId).hasClass("glyphicon-chevron-down")) {
		$('#' + AccordianId).removeClass("glyphicon-chevron-down");
		$('#' + AccordianId).addClass("glyphicon-chevron-up");
		$(groupId).show();
		$("." + actionid).show();
	}
}

/*function init() {
	$("#TxtStrtDate").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 1,
	});
}
window.setTimeout("init()", 1200);*/

function callflashElementDispaly(thisEle, flashElementId, flashElementCondition) {
	var eleValue = thisEle.value;
	var id = thisEle.id;
	// alert(eleValue+"--"+id+"--"+flashElementCondition+"--"+flashElementId);
	var flashElementConditionJson = jQuery.parseJSON(flashElementCondition);
	for ( var j = 0; j < flashElementConditionJson.length; j++) {
		var conditionMap = flashElementConditionJson[j];
		var condition = conditionMap['condtion'];
		var flashElement = conditionMap['flsahElement'];
		condition = condition.replace(new RegExp(id, "g"), eleValue);
		condition = eval(condition);
		if (condition) {
			// alert(condition);
			if (flashElement.indexOf("~") > -1) {
				var strArr = flashElement.split("~");
				for ( var i = 0; i < strArr.length; i++) {
					flashElement = strArr[i];
					flashElement = "#FlashElmnt_" + flashElement;
					$(flashElement).removeClass("hideFlashDiv");
				}
			} else {
				flashElement = "#FlashElmnt_" + flashElement;
				$(flashElement).removeClass("hideFlashDiv");
			}
		} else {
			if (flashElement.indexOf("~") > -1) {
				var strArr = flashElement.split("~");
				for ( var i = 0; i < strArr.length; i++) {
					flashElement = strArr[i];
					flashElement = "#FlashElmnt_" + flashElement;
					$(flashElement).addClass("hideFlashDiv");
				}
			} else {
				flashElement = "#FlashElmnt_" + flashElement;
				$(flashElement).addClass("hideFlashDiv");
			}
		}
	}
}

function reloadCaptcha() {
	jQuery(".captcha").attr(
			"src",
			jQuery(".captcha").attr("src") + "?force="
					+ new Date().getMilliseconds());
	return false;
}

function isUpdatedElements(id) {

	var status = false;
	var x = document.getElementById(id);
	var textN = "";
	var textV = "";
	var i;
	var tempJsonData = {};
	var jsonData = {};
	for (i = 0; i < x.length; i++) {

		textN = x.elements[i].name;
		
		if (textN.lastIndexOf('DummyValue##', 0) === 0) {
			textV = ((x.elements[i].value).split("~"))[1];
			var tempField = textN.slice(12);
			tempJsonData[tempField] = textV;

		} else if ((textN.indexOf(".") > -1) == true) {
			var resArray = textN.split(".");
			if (resArray.length = 5) {
				textV = x.elements[i].value;
				var field = resArray[2];
				var type = resArray[3];
				if (type.lastIndexOf('checkbox', 0) === 0 || type.lastIndexOf('radio', 0) === 0/*startsWith('radio')*/) {
					var checkedValue = null;
					var inputElements = document.getElementsByName(textN);
					for ( var k = 0; inputElements[k]; ++k) {
						if (inputElements[k].checked) {
							checkedValue = inputElements[k].value;
							break;
						}
					}
					jsonData[field] = checkedValue;

				} else {
					jsonData[field] = textV;
				}

			}
		}
	}
	for ( var p in tempJsonData) {
		if (tempJsonData.hasOwnProperty(p)) {
			var valueOr = jsonData[p];
			var valueTemp = tempJsonData[p];

			if (valueOr !== valueTemp) {
				status = true;
				return status;
			}
		}
	}

	return status;

}

function showObject(obj) {
	  var result = "";
	  for (var p in obj) {
	    if( obj.hasOwnProperty(p) ) {
	      result += p + " , " + obj[p] + "\n";	      
	    } 
	  }              
	  return result;
	}

// slider 

function syncSliderValue(x) {
	var idEle = $(x).attr('id');
	var valEle = $('#'+idEle).val();
	$('#dataSliderId_'+idEle).val(valEle);
}

function eventActionDemo_off() {
	  //alert("event Action Demo");
	  $.alert({
		    title: 'Confirm!',
		    content: 'Event Action Demo',
		    confirmButtonClass: 'UicPrimaryBtn',
		    closeIcon: true,
		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
		});
}

function callEmbeddedForm(id){
	var formId = $("#"+id).find("#formId").val();
	var embeddedTableCompIds = $("#embeddedTableCompIds_"+formId).val();
	var embeddedTableCompIdsArr = embeddedTableCompIds.split("##");
	for ( var em = 0; em < embeddedTableCompIdsArr.length; em++) {
		tableId = embeddedTableCompIdsArr[em];
		saveData(tableId);
	}
}

function defaultGetPreviousForm(caller){
	var formId = $(caller).parents("form").find("#form_id").val();
	callFormComponent(formId, 'previous');
}

function defaultAddFormRecord(caller){
	var formId = $(caller).parents("form").find("#form_id").val();
	callFormComponent(formId, 'addrecord');
}

function defaultGetNextForm(caller){
	var formId = $(caller).parents("form").find("#form_id").val();
	callFormComponent(formId, 'next');
}

function defaultSaveForm(caller){
	var formId = $(caller).parents("form").find("#form_id").val();
	callFormComponent(formId, 'save');
}

function resetForm(formId){
	//alert("reset Called.");
	$("#"+formId).find(':input:not([readonly]):not([disabled]):not([type="hidden"])').val('');
	$("#"+formId).find('input:checkbox, input:radio').removeAttr('checked');
	//$("#"+formId).find('input:radio').removeAttr('checked');
	//Clear all error div of previous round.
	$("#"+formId+" .UicErrorMsg").empty();
	$("#"+formId).find(':input:not([readonly]):not([disabled]):not([type="hidden"])').each(function(){
		$(this).css("border-color", "");
	});
}

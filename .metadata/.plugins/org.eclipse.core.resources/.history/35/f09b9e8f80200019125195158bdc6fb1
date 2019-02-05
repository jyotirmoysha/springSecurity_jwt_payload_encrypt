/**
 * Method to execute OpenUrl action for events.
 * Opens the given URL, with parameter evaluation in the given window location.
 * @param windowLoc
 * @param actionURL
 * @param componentId
 * @param caller
 * @param paramLstStr
 */
function openUrl(windowLoc,actionURL, componentId, caller, paramLstStr){

	if($.trim(paramLstStr)!=""){
		var paramLst = paramLstStr.split(",");
		var firstLoop=true;
		for(var i=0;i<paramLst.length;i++){
			var param = $.trim(paramLst[i]);
			var value = getValue(param, caller, componentId);
		
			if(firstLoop){
				actionURL = actionURL+"?"+param+"="+value;
			}else{
				actionURL = actionURL+"&"+param+"="+value;
			}
			firstLoop=false;
		}
	}
	
	if(windowLoc=="SameWindow"){
		//Open the given URL in same window.
		//location.href = actionURL;
		window.open(actionURL,"_self");
	}else if(windowLoc=="TabWindow"){
		//Open the given URL in a new window tab.
		window.open(actionURL);
	}else if(windowLoc=="NewWindow"){
		//Open the given URL in a new pop-up window.
		var NWin = window.open(actionURL, '', 'height=600,width=1000');
	     if (window.focus) 
	     {
	       NWin.focus();
	     }
	}
}

/**
 * Method to execute OpenScreen action for events.
 * Opens the given screen in the given window location reference. 
 * It also evaluates the given param list and passes it as request map to the server.
 * @param windowLoc
 * @param screenId
 * @param componentId
 * @param caller
 * @param paramLstStr
 */
function openScreen(windowLoc, screenName, componentId, caller, paramLstStr){
	
	var formTarget = "_self"; //default open the new screen in same window.
	var randNo = Math.floor((Math.random() * 100) + 1);
	if(windowLoc=="TabWindow"){
		//Open the given screen in a new window tab.
		formTarget = "_blank";
	}else if(windowLoc=="NewWindow"){
		//Open the given screen in a new pop-up window.
		formTarget='newActionWindow_'+randNo;
		var NWin = window.open('', formTarget, 'height=600,width=1000');
	     if (window.focus) 
	     {
	       NWin.focus();
	     }
	}
	
	/*var context = $("#uic_context").val();
	var requestToken = $('#requestToken').val();
	var actionUrl = context + "/showScreen.htm"; */
	var actionUrl = "showScreen.htm";
	//alert(actionUrl);
	var $form = $("<form id='actionForm' action='"+actionUrl+"' method='POST' target='"+formTarget+"'></form>");
	$form.append("<input type='hidden' id='scrName' name='scrName' value='"+screenName+"' />");
	
	if($.trim(paramLstStr)!=""){
		var paramLst = paramLstStr.split(",");
		for(var i=0;i<paramLst.length;i++){
			var param = $.trim(paramLst[i]);

			var value = getValue(param, caller, componentId);
			
			$form.append("<input type='hidden' id='"+param+"' name='"+param+"' value='"+value+"' />");
		}
	}
	
    $form.submit();
}

/**
 * This method helps get the value for the given parameters from screen components and elements.
 * Supports evaluating parameter by Id and '.in.' params(by class) for forms, search and table components. 
 * For table, it assumes the current row for relative operation and value fetching.
 * @param param
 * @param caller
 * @param componentId
 * @returns {String}
 */
function getValue(param, caller, componentId){
	var value="";
	//Doesn't support evaluation of checkbox and radio elements.
	if($("#"+param).length==1){ // Fetch by Id.
		value = $("#"+param).val();
	}else if($("."+param).length==1){ // For .in. params -- Fetch by class.
		value = $("."+param).val();
	}else if($("."+componentId+"_"+param).length==1){ // For .in. params -- Fetch by class.
		value = $("."+componentId+"_"+param).val();
	}else if($(".start_"+param).length==1 ){ // Check for range element values --Indicates range element - start input
		value = $(".start_"+param).val();
		param = "start:"+param;
	}else if($(".end_"+param).length==1){ // Check for range element values --Indicates range element - end input
		value = $(".end_"+param).val();
		param = "end:"+param;
	}else {// For Table row columns. 
		if($(caller).parents("tr").length>0){
			var rowId = $(caller).parents("tr").attr("id");
			if(rowId==null)
				return null; //Ignore the attribute and continue. --Indicates some error or missed cases.
			var lastUnderScore = rowId.lastIndexOf("_");
			if(lastUnderScore>0)
				rowId = rowId.substring(lastUnderScore+1, rowId.length);
		//	alert("rowid:"+rowId);
			if($("."+componentId+"_"+param+"_"+rowId).length==1){
				value = $("."+componentId+"_"+param+"_"+rowId).val();
				if(value==null || value==""){
					value = $("."+componentId+"_"+param+"_"+rowId).text();
				}
				//alert("value:"+value);
			}else if($("."+param+"_"+rowId).length==1){ // For .in. params on table.
				value = $("."+param+"_"+rowId).val();
				if(value==null || value==""){
					value = $("."+param+"_"+rowId).text();
				}
				//alert("value:"+value);
			}
		}
	}
	
	return value;
}

function displayMessage(message){
    /*$('.commonMesgBody').html(message);
    $('.commonMesgBox').modal('show');*/
    $.alert({
        title: 'Message',
        content: message,
        confirmButtonClass: 'UicPrimaryBtn',
        closeIcon: true,
        columnClass: 'col-md-4 col-md-offset-4',
    });
}

//Temporary methods.
function testDBParam(param1, param2){
	//alert("Param 1="+param1+" || Param 2="+param2);
	$.alert({
	    title: 'Confirm!',
	    content: 'Param 1='+param1+' || Param 2='+param2,
	    confirmButtonClass: 'UicPrimaryBtn',
	    closeIcon: true,
	    columnClass: 'col-md-4 col-md-offset-4',
	});
}
function testUIParam(param1){
	var val = $("."+param1).val();
	//alert("Test 2:"+ val);
	$.alert({
	    title: 'Confirm!',
	    content: "Test 2:"+ val,
	    confirmButtonClass: 'UicPrimaryBtn',
	    closeIcon: true,
	    columnClass: 'col-md-4 col-md-offset-4',
	});
}	
function testCombo(paramUI, paramDB, caller){
	var valUI = $("."+paramUI).val();
	//alert("UI Param:"+valUI+"--DB Param:"+paramDB+"--callerObj:"+caller);
	$.alert({
	    title: 'Confirm!',
	    content: "UI Param:"+valUI+"--DB Param:"+paramDB+"--callerObj:"+caller,
	    confirmButtonClass: 'UicPrimaryBtn',
	    closeIcon: true,
	    columnClass: 'col-md-4 col-md-offset-4',
	});
}
function onSelectChange(caller){
	//alert("Selected value: " + $(caller).val() );
	$.alert({
	    title: 'Confirm!',
	    content: "Selected value: " + $(caller).val(),
	    confirmButtonClass: 'UicPrimaryBtn',
	    closeIcon: true,
	    columnClass: 'col-md-4 col-md-offset-4',
	});
}
/**
 * Below method is a temporary method created for calling direct form submit. 
 * @param caller
 */
function callUserSubmitAction(caller){
	$(caller).parents("form").submit();
}

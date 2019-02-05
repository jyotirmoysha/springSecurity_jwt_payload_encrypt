	var messageKeyGlo = "";
	var beforeEdit = "";
	var elmGlo = "";	
	function updateCaptions(elm) {
		var td = elm.parentNode;
		var updateMessage = elm.value;
		td.removeChild(elm);
		td.innerHTML = updateMessage;
		if (beforeEdit != updateMessage) {
			var result = updateUICMsg(messageKeyGlo, updateMessage);
			if (result == 'Y'){
				//alert("Text changed successfully.");
				$.alert({
				    title: 'Confirm!',
				    content: 'Text changed successfully.',
				    confirmButtonClass: 'UicPrimaryBtn',
				    closeIcon: true,
				    columnClass: 'col-md-4 col-md-offset-4',
				});
			}
			else{
				//alert('An error occurred while changing Text.');
				$.alert({
				    title: 'Confirm!',
				    content: 'An error occurred while changing text.',
				    confirmButtonClass: 'UicPrimaryBtn',
				    closeIcon: true,
				    columnClass: 'col-md-4 col-md-offset-4',
				});
			}
		}else{
			smaeCaptionConform();
		}
	}
	
	function smaeCaptionConform() {
		var cnf = confirm("Do you want to continue with same caption!");
		if (cnf == false) {
			editCaption(elmGlo, messageKeyGlo);
		} 
	}

	function editCaption(elm, messageKey,token) {		
		elmGlo = elm;
	    if (elm.getElementsByTagName('input').length > 0) return;
	    messageKeyGlo = messageKey;
	    var value = elm.innerHTML;
	    beforeEdit = value;
	    elm.innerHTML = '';
	    var input = document.createElement('input');
	    input.setAttribute('type', 'text');
	    input.setAttribute('value', value);
	    input.setAttribute('class', "rightTxt");
	    input.setAttribute('onBlur', 'updateCaptions(this)');
	    elm.appendChild(input);
	    input.focus();
	}
	
	function updateUICMsg(msgKey, msgValue) {
		$('#uic_Loading').show();
		//var context = $("#uic_context").val();
		var result = 'N';
		$.ajax({
			url : "updateUICMsg.htm",
			type : 'POST',
			data : {
				requestToken : $('#requestToken').val(),
				msgKey : msgKey,
				msgValue : msgValue
			},
			async : false,
			error : function(response) {
				$('#uic_Loading').hide();
				//alert('An error occurred while changing Text.');
				$.alert({
				    title: 'Confirm!',
				    content: 'An error occurred while changing text.',
				    confirmButtonClass: 'UicPrimaryBtn',
				    closeIcon: true,
				    columnClass: 'col-md-4 col-md-offset-4',
				});
			},
			success : function(response) {
				$('#uic_Loading').hide();
				result = response;
			}
		});
		return result;//returns Y or N;
	}
	
	function showTable(tableId, paramMap, destinationDiv) {
		
		if(paramMap==null)
			paramMap = {};
		paramMap["requestToken"] = $('#requestToken').val();
		paramMap["tableIds"] = tableId; 

		$.ajax({
			type: "POST",
			url: 'show-table.htm',
			data: paramMap,
			success: function(data){
				$('#component_ScrnLayoutId_'+destinationDiv).html('');
				$('#component_ScrnLayoutId_'+destinationDiv).html(data);
			}			  
		});
	}

	function showForm(formId, paramMap, destinationDiv) {
		if(paramMap==null)
			paramMap = {};
		paramMap["requestToken"] = $('#requestToken').val();
		paramMap["formId"] = formId; 
		
		$.ajax({
			type: "POST",
			url: 'getFormData.htm',
			data: paramMap,
			success: function(data){
				$('#component_ScrnLayoutId_'+destinationDiv).html('');
				$('#component_ScrnLayoutId_'+destinationDiv).html(data);
			}			  
		});
	}

	function showChart(chartId, paramMap, destinationDiv) {

		if(paramMap==null)
			paramMap = {};
		paramMap["requestToken"] = $('#requestToken').val();
		paramMap["tableIds"] = chartId; 

		$.ajax({
			type: "POST",
			url: 'showChart.htm',
			data: paramMap,
			success: function(data){
				$('#component_ScrnLayoutId_'+destinationDiv).html('');
				$('#component_ScrnLayoutId_'+destinationDiv).html(data);
			}			  
		});
	}

	function showSearch(sCompId, paramMap, destinationDiv){
			//alert(sCompId);	
		if(paramMap==null)
			paramMap = {};
		paramMap["requestToken"] = $('#requestToken').val();
		paramMap["componentId"] = sCompId; 

		$.ajax({
			type: "POST",
			url: 'searchComp.htm',
			async:   false,
			data: paramMap,
			success: function(data){
				$('#component_ScrnLayoutId_'+destinationDiv).html('');
				$('#component_ScrnLayoutId_'+destinationDiv).html(data);
			}			  
		});
	}

	function openScreenLayout(slIdStr, scrIdStr, screenId, hyperLink){		
		
		if(hyperLink != null && hyperLink != '' && hyperLink != 'null'){
			//alert("hyperLink :"+hyperLink);			
			$.ajax({
				url : hyperLink,				
				data : { 
					requestToken : $('#requestToken').val()					
				},
				error : function(data) {
					console.log("Error in Screen component on open ScreenLayout event"+ data);
					//alert('An error occurred while opening ScreenLayout even, please try again.');
					$.alert({
					    title: 'Confirm!',
					    content: 'An error occurred while opening screenlayout, please try again.',
					    confirmButtonClass: 'UicPrimaryBtn',
					    closeIcon: true,
					    columnClass: 'col-md-4 col-md-offset-4',
					});
				},
				success : function(data) {
					$('#tab-content_'+scrIdStr).html('');
					$('#tab-content_'+scrIdStr).html(data);
				}
			});
			
			
		}else{
			var postData = {};
			if($("#layoutForm_" + scrIdStr).length==0){
				postData["slId"] = slIdStr;
				postData["screenId"] = screenId;
			}else{
				$("#layoutForm_" + scrIdStr).find("#slId").val(slIdStr);
				$("#layoutForm_" + scrIdStr).find("#screenId").val(screenId);
				postData = $("#layoutForm_" + scrIdStr).serializeArray();
			}
		
		$.ajax({
			url : "showScreenLayout.htm",
			cache : true,
			type : 'POST',
			data : postData,
			error : function(data) {
				console.log("Error in Screen component on open ScreenLayout event"+ data);
				//alert('An error occurred while opening ScreenLayout even, please try again.');
				$.alert({
				    title: 'Confirm!',
				    content: 'An error occurred while opening screenlayout, please try again.',
				    confirmButtonClass: 'UicPrimaryBtn',
				    closeIcon: true,
				    columnClass: 'col-md-4 col-md-offset-4',
				});
			},
			success : function(data) {
				$('#tab-content_'+scrIdStr).html('');
				$('#tab-content_'+scrIdStr).html(data);
			}
		});
		}
	}
	
	function displayScreenLayout(slIdStr, scrName){
			
		$.post('showScreen.htm',{
			scrName : scrName
		}, function(data){
			$('#mainContent').html(data);
		});	
	}
	
	function loadComponents(list){
		
		$.each(list, function(index, componentDetails) {
			
			var compnentType = componentDetails.componentType.toLowerCase();
			var componentId = componentDetails.componentId;
			var destId = componentDetails.uniqueScrLayoutId;
			var paramMap = componentDetails.paramMap;
			if(compnentType=='table')
				showTable(componentId, paramMap, destId);
			else if(compnentType=='graph')
				showChart(componentId, paramMap, destId);
			else if(compnentType=='form')
				showForm(componentId, paramMap, destId);
			else if(compnentType=='search')
				showSearch(componentId, paramMap, destId);
		});
	}
	
	function componentExpandOrCollapse(thisObj, slId){
		if ($(thisObj).hasClass("uic_collapse")) {

			$(thisObj).removeClass("uic_collapse");
			$(thisObj).addClass("uic_expand");
			$("#component_ScrnLayoutId_" + slId).hide();
		} else if ($(thisObj).hasClass("uic_expand")) {

			$(thisObj).removeClass("uic_expand");
			$(thisObj).addClass("uic_collapse");
			$("#component_ScrnLayoutId_" + slId).show();
		}
	}
	
	function layoutExpandOrCollapse(thisObj, slId){
		
		if ($(thisObj).hasClass("glyphicon-chevron-up")) {

			$(thisObj).removeClass("glyphicon-chevron-up");
			$(thisObj).addClass("glyphicon-chevron-down");
			$("#main_ScrnLayoutId_" + slId).hide();
		} else if ($(thisObj).hasClass("glyphicon-chevron-down")) {

			$(thisObj).removeClass("glyphicon-chevron-down");
			$(thisObj).addClass("glyphicon-chevron-up");
			$("#main_ScrnLayoutId_" + slId).show();
		}
	}
	
	var sessionTk="";
	function getSessionToken(){	
		$.post({
			method : "post",			
			url : "getSessionToken.htm",
			success: function(data){
				sessionTk = jQuery.parseJSON(data);
				sessionTk = sessionTk.sessionToken;
				var tokenArray = document.getElementsByName("requestToken");
				for (i = 0; i < tokenArray.length; i++) {
					tokenArray[i].value = sessionTk ;
				}
			}
		});
		return sessionTk;
	}
	
	/*$.ajaxSetup({
		async:   false,
        data: {
            gameID: "SF"
        }
    });*/
	
	function closeTopTab(){
		document.getElementById("topul").style.visibility='hidden';
	}
	
	function closeBottomTab(){
		document.getElementById("bottomui").style.visibility='hidden';
	}
	
	function initializeDateTimePicker(tableId, componentType){
		//alert("tableId:"+tableId);
		$('#'+tableId+' .uicDateTimePicker').each(function(){
			var uiDateTimePattern = getProcessesDatePattern(tableId, this, componentType);
			$(this).datetimepicker({
				dayOfWeekStart : 1,
				lang:'en',	
				format: uiDateTimePattern,
				step:5
			});
		});
		
		$('#'+tableId+' .uicDatePicker').each(function(){
			var uiDateTimePattern = getProcessesDatePattern(tableId, this, componentType);
			$(this).datetimepicker({
				dayOfWeekStart : 1,
				lang:'en',
				format: uiDateTimePattern,
				timepicker: false,
			});

		});
	}
	
	function getProcessesDatePattern(tableId, caller, componentType){
		//var pattern = "dd-MM-YYYY hh:mm:ss";
		//	var pattern = "MM/dd/YYYY hh:mm:ss";
		var elementName = "";
		if(componentType.toLowerCase()=="table"){
			elementName = $(caller).attr('name');
		}else if(componentType.toLowerCase()=="form"){
			elementName = $(caller).attr('id');
		}
		
		var pattern = $("#"+tableId).find("#dateFormat_"+elementName).val();
		//alert("pattern for "+elementName+" :"+ pattern);
		var patternArray = pattern.split(" ");
		var javaDatePattern = patternArray[0];
		var javaTimePattern = "";
		//alert(patternArray.length);
		if(patternArray.length > 1){
			javaTimePattern = patternArray[1];
		}

		var uiDateTimePattern = "";
		if(/*javaDatePattern.includes("MMM")*/javaDatePattern.indexOf("MMM")>=0){
			uiDateTimePattern = javaDatePattern.replace(/dd/i,"d").replace("MMM","M").replace(/(yyyy|yy)/i,"Y");
		}else{
			uiDateTimePattern = javaDatePattern.replace(/dd/i,"d").replace("MM","m").replace(/(yyyy|yy)/i,"Y");
		}

		if(javaTimePattern != ""){
		uiDateTimePattern = uiDateTimePattern + " " + javaTimePattern.replace(/hh/i,"H").replace("mm","i").replace(/ss/i,"00");
		}
		//alert(uiDateTimePattern);
		return uiDateTimePattern;
	}
	
	function initializeDateTimePickerForSearch(tableId){
		try {
			$('#'+tableId+' .uicDatePicker').datetimepicker({
				dayOfWeekStart : 1,
				lang:'en',
				format:'d-m-Y',
				timepicker: false,
			});
			
			$('#'+tableId+' .uicDateTimePicker').datetimepicker({
				dayOfWeekStart : 1,
				lang:'en',	
				format:'d-m-Y H:i:00',
				formatTime: 'H:i:00',
				step:5
			});			
		} catch(err) {
			console.log("Datetime picker not initialized in search component"+err);
		}
	}
	
	/* UIC Capability to view documents (Open PDF, txt, etc.) Start*/

	function showFile(filePath, contextPath, destId){
	  //  var destDiv = 'openDocDiv';
	    var fileExt = 'pdf';
	    if (filePath != null && filePath != '') {
	    	if (filePath.toLowerCase().endsWith('.pdf')) {
	    		fileExt = 'pdf';
			}else if (filePath.toLowerCase().endsWith('.html')) {
				fileExt = 'html';
			}else if (filePath.toLowerCase().endsWith('.xlsx')) {
				fileExt = 'xlsx';
			}else if (filePath.toLowerCase().endsWith(".xls")) {
				fileExt = 'xls';
			}else if (filePath.toLowerCase().endsWith('.xlsm')) {
				fileExt = 'xlsm';
			}else if (filePath.toLowerCase().endsWith('.csv')) {
				fileExt = 'csv';
			}else if (filePath.toLowerCase().endsWith('.txt')) {
				fileExt = 'txt';
			}/* else if (filePath.toLowerCase().endsWith('.jpg')) {
				fileExt = 'jpg';
			} */
			openDocument(destId, filePath, fileExt, contextPath);
	    }
			  
	}

	function openDocument(destDiv, filePath, fileExt, contextPath){
		// alert(" filePath :"+filePath+' contextPath : '+contextPath);
		$('#'+destDiv).html('');
		  
		 if('pdf' == fileExt){		
			 var processGriddocurl = contextPath+"/fileShow.htm?filePath="+filePath+"&fileExt="+fileExt+"#page=1&zoom=100,0,1";		 
			 var docFrame= "<iframe title='sample' name='processDocView' id='processDocView' width='100%' height='360px' src='js/pdfjs/web/viewer.html?file="+processGriddocurl+"' frameborder='0'></iframe>";
			 $('#'+destDiv).html(docFrame);
			  
		 }else{
			 var processGriddocurl = 'fileShow.htm?filePath='+filePath+'&fileExt='+fileExt;
			 var processDoc = "<iframe title='test' width='100%' height='0px' src='"+processGriddocurl+"' frameborder='0' id='ifrm'></iframe>";
			 $('#'+destDiv).html(processDoc);
		 }

	}
	/* UIC Capability to view documents (Open PDF, txt, etc.) End*/
	/* Displaying Emails (Open / Read Email) Start */
	function openEmail(emailDetailPath, destId) {
		   // alert(" emailDetailPath :"+emailDetailPath);
		    var url = "readEmail.htm";
		    if (emailDetailPath != null && emailDetailPath != '') {
			    var data = {
			        "emailDetailPath": emailDetailPath
			    };
			    ajaxCallWithPostData(url, data, destId);
		    }
		  
		}

		function ajaxCallWithPostData(url, data, destDiv) {
		    jQuery.ajax({
		        url: url,
		        type: 'POST',
		        cache: true,
		        data: data,
		        error: function(error) {
		            //alert('An error occurred while loading page, please try again.');
		        	$.alert({
			  		    title: 'Confirm!',
			  		    content: 'An error occurred while loading page, please try again.',
			  		    confirmButtonClass: 'UicPrimaryBtn',
			  		    closeIcon: true,
			  		    columnClass: 'col-md-4 col-md-offset-4',
			  		});
		        },
		        success: function(html) {
		        // alert(html);
		            $('#' + destDiv).html('');
		            $('#' + destDiv).html(html);

		        }
		    });
		}
		
		function downloadFile(){
			var fileID = $('#fileID').val();
			window.location.href = "fileDownload.htm?fileId="+fileID;
		}
		
		function downloadAttachement(absFilePath){
            //alert(absFilePath);
            if(absFilePath=='' || absFilePath==null){
                //alert("No file Found");
            	$.alert({
		  		    title: 'Confirm!',
		  		    content: 'No file found',
		  		    confirmButtonClass: 'UicPrimaryBtn',
		  		    closeIcon: true,
		  		    columnClass: 'col-md-4 col-md-offset-4',
		  		});
                return;
            }
            var url = "fileDownload.htm?absFilePath="+absFilePath;
            location.href = url;
		}
		
		//Component Caption changes
		function updateComponentCaption(msgKey, componentId){
			var msgValue = $("#uicComponentHdrText_"+componentId).val();
			var result = updateUICMsg(msgKey, msgValue);//method in commonComponents.js
			if (result == 'Y') {
				$.alert({
		  		    title: 'Confirm!',
		  		    content: 'Caption changed successfully.',
		  		    confirmButtonClass: 'UicPrimaryBtn',
		  		    closeIcon: true,
		  		    columnClass: 'col-md-4 col-md-offset-4 uicAlertPopup',
		  		});
				$(".uicComponentHdrSpan_"+componentId).html(msgValue);
				toggleComponentCaption(componentId);
			} 
		}
		
		function expandOrCollapseComponent(thisObj, componentId){
			if ($(thisObj).hasClass("glyphicon-chevron-up")) {

				$(thisObj).removeClass("glyphicon-chevron-up");
				$(thisObj).addClass("glyphicon-chevron-down");
				$(".uicComponentMainDataDiv_" + componentId).hide();
			} else if ($(thisObj).hasClass("glyphicon-chevron-down")) {

				$(thisObj).removeClass("glyphicon-chevron-down");
				$(thisObj).addClass("glyphicon-chevron-up");
				$(".uicComponentMainDataDiv_" + componentId).show();
			}
		}
		/* Displaying Emails (Open / Read Email) End */
		
		function toggleComponentCaption(componentId){
			$('.uicToggelHdrText_'+componentId).toggle();
		}
		
		function resetComponentCaption(componentId){
			var oldText = $(".uicComponentHdrSpan_"+componentId).text();
			$("#uicComponentHdrText_"+componentId).val(oldText);
			toggleComponentCaption(componentId);
		}
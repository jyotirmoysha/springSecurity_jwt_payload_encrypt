var loginTime ;
var sectionMap = {};
var USERID;
var USERACCESS;
$(document).ready(function()
		{
	        USERID=$('#userId').val();
	 		USERACCESS=$('#userAccess').val();
	 		loginTime= $('#creationTime').val();
            callWorkQue();
		});

var urlAdmin="";
 setInterval(function() {
    var timeOnSite = new Date() - loginTime;
    var secondsTotal = timeOnSite / 1000;
    var hours = Math.floor(secondsTotal / 3600);
    var minutes = Math.floor(secondsTotal / 60) % 3600;
    minutes=minutes%60;
    var seconds = Math.floor(secondsTotal)  % 60;
    document.getElementById('counter').innerHTML = hours + ":" + minutes + ":" + seconds;
}, 1000); 

 
 function calShowAdminPanal(UserGId)
 {
	 var parametersDynamic="";
	 var tableVal="userDetailsForAdmin";
	 urlAdmin=insertParam("showAdminPanel.htm");
	 parametersDynamic="tableIds="+tableVal+"&userGroupId="+UserGId;
	 ajaxCallforAll(urlAdmin,parametersDynamic);
	 menuActive('workQueueLink');
}
 
 

 function callWorkQue(){
 	$('#uic_DynamicSearchButton_workQueue').removeClass('btn-primary').addClass('btn-info');
 	showLoading();
 	var userIdDec = $('#userIdDec').val();
 	var userGroupIdDec = $('#userGroupIdDec').val();
 	var goldenSetGroup=$('#goldenSetGroup').val();
 	var tableId = 'workQueue';
	$.ajaxSetup({
		cache: true
	});
 	$.ajax({
 		url : "show-table.htm",
 		cache : true,
 		type : 'POST',
 	    data : {tableIds : tableId, userId : userIdDec, userGroupId : userGroupIdDec,goldenSetGroup : goldenSetGroup}, 
 		success : function(data) {
 			hideLoading();
 			$('#uic_Table').html('');
 			$('#uic_Table').html(data);
 			hideshowColumns();
			$("#"+tableId+"SearchElementsContainer .UicTblCaptionH2").append("<span class='search-icon'><span class='glyphicon glyphicon-search' style='padding:0 5px 0 5px'></span></span><span>&nbsp;Custom Search</span>");
 			$('#uiIconChangeIdSearch_'+tableId).addClass("glyphicon-chevron-down");
 			$('#uiIconChangeIdSearch_'+tableId).removeClass("glyphicon-chevron-up");
 			$('#uic_DynamicSearchButton_workQueue').addClass("btn-info");
 			$('#uic_search_'+tableId).hide();
 			$('#'+tableId+'Container').css('padding-top','2px');
 			$('#uic_SearchElementDiv_workQueue_10 option:contains(Select)').remove();
 			$('#uic_SearchElementDiv_workQueue_11 option:contains(Select)').remove();
 			$('#uic_SearchElementDiv_workQueue_13 option:contains(Select)').remove();
 			$('#uic_SearchElementDiv_workQueue_14 option:contains(Select)').remove();
 			$('#uic_SearchElementDiv_workQueue_15 option:contains(Select)').remove();
			$('#uic_SearchElement_workQueue_10').multiselect({
							  buttonWidth: '100%',
							  maxHeight: 100,
							   includeSelectAllOption: true
							});  

			$('#uic_SearchElement_workQueue_11').multiselect({
				  buttonWidth: '100%',
				  maxHeight: 100,
				   includeSelectAllOption: true
				}); 
			
			$('#uic_SearchElement_workQueue_13').multiselect({
				buttonWidth: '100%',
				maxHeight: 100,
				   includeSelectAllOption: true
			});
			
			$('#uic_SearchElement_workQueue_14').multiselect({
				buttonWidth: '100%',
				maxHeight: 100,
				 includeSelectAllOption: true
			});
			
			$('#uic_SearchElement_workQueue_15').multiselect({
				buttonWidth: '100%',
				maxHeight: 100,
				   includeSelectAllOption: true
			});
			
			$(".multiselect-selected-text").css('float', 'left')
			$(".caret").css('float', 'right');
	        $(".caret").css('margin', '8px 0');
	        
	        $("#uic_DynamicSearchButton_workQueue").click(function(){
				$('#myModal').modal('hide');	
			});
	        $("#uic_DynamicResetButton_workQueue").click(function(){
				$('#myModal').modal('hide');	
			});
								
 			$( document ).ajaxComplete(function( event, request, settings ) {
 				var responseText = request.responseText;
 				if(responseText.indexOf("dynamicTableContainer"+tableId) >= 0){
 					bindChageEvenets();
 				}
 			}); 
 			var rowCount = $('#workqueue tr').length -1;
 			if (rowCount < 20) {
 				$("#uicParentDiv_workQueue").css("height", "59% !important");
 			}
		     if ($("#dealerNameSearch").val() == 'Y') {
					$('#uic_SearchElementDiv_workQueue_5').show();
			 } 	
		    
		     
 		}
 	});
 }
 /**
  * This function called after 50 seconds we need to check following condtions
  1:if current page is dashboard page then call ajax function
 */	
/* var counter=0;
  Here we get pagename from appheader.jsp page where we set latest value in session 
  autorefresh=setInterval(function() {
 	var table_Id = $('#tableName').val() ;
 	if ($('#workQueue').length){
 		counter++;
 		if(counter==58){
 			window.location.href = "logout.htm"; 
 		}else{
 		var url = $("#uicPagableURL_"+table_Id).val();
 		if ($('#workQueue').length){
 			autoRefresh(table_Id);
 		}
 	}
 	}else{
 		counter=0;
 	} 
 }, 50000);*/   

 function bindChageEvenets(){
	/* form control class removed to resolve UIC table border issue */
	$('.uicDropDown_workQueue_20').removeClass("form-control");	
	$('.uicDropDown_workQueue_21').removeClass("form-control");
	$('.uicDropDown_workQueue_22').removeClass("form-control"); 
 	var makerId=0;
 	var checkerId=0;
 if (parseInt(USERACCESS)== 1 || parseInt(USERACCESS)==2 ){
 		$('.uicDropDown_workQueue_20').prop('disabled', false);
 		$('.uicDropDown_workQueue_21').prop('disabled', false);
 		$('.uicDropDown_workQueue_22').prop('disabled', false);
 	}else{
 		$('.uicDropDown_workQueue_20').prop('disabled', 'disabled');
 		$('.uicDropDown_workQueue_21').prop('disabled', 'disabled');
 		$('.uicDropDown_workQueue_22').prop('disabled', 'disabled');
 }

 $('#uic_DynamicResetButton_workQueue').click(function(){
 	$("option:selected").removeAttr("selected");
 	$('#uic_SearchElementDiv_workQueue_10 option:contains(Select)').remove();
 	$('#uic_SearchElementDiv_workQueue_11 option:contains(Select)').remove();
 	$('#uic_SearchElementDiv_workQueue_13 option:contains(Select)').remove();
 	$('#uic_SearchElementDiv_workQueue_14 option:contains(Select)').remove();
 	$('#uic_SearchElementDiv_workQueue_15 option:contains(Select)').remove();
 	$("#uic_SearchElement_workQueue_10").multiselect('refresh'); 
 	$("#uic_SearchElement_workQueue_11").multiselect('refresh'); 
 	$("#uic_SearchElement_workQueue_13").multiselect('refresh'); 
 	$("#uic_SearchElement_workQueue_14").multiselect('refresh'); 
 	$("#uic_SearchElement_workQueue_15").multiselect('refresh'); 
  }); 

 /* This function assign a new maker*/
 $(".uicDropDown_workQueue_20").change(function(){
 	showLoading();
 	var filingId=$(this).closest('tr').find("td:nth-child(4)").text().trim();
 	if(filingId!=null && filingId!='')
 		{
 		makerId=$(this).val();
 	 	var parametersDynamic="filingId="+encodeURIComponent(filingId)+"&userId="+encodeURIComponent(makerId)+"&makerOrChecker=MAKER";
 	 	var tokenizedURL= insertParam("assignMakerChecker.htm");
		$.ajaxSetup({
			cache: true
		});
 	 	 $.ajax({
 	 			type : "POST",
 	 			url : tokenizedURL,
 	 			data:parametersDynamic,
 	 			success : function(data) {
 	 			}
 	 	 });
 		}
 	else
 		{
		 $.alert("Please assign the roles once the Case Id has been generated.");
 		}

 	 hideLoading();
 	});

 /* This function assign a new checker1 */
 $(".uicDropDown_workQueue_21").change(function(){
 	showLoading();
 	var filingId=$(this).closest('tr').find("td:nth-child(4)").text().trim();
 	
 	if(filingId!=null && filingId!='')
		{
 		
 		checkerId=$($(this)).val();
	 	 var parametersDynamic="filingId="+encodeURIComponent(filingId)+"&userId="+encodeURIComponent(checkerId)+"&makerOrChecker=CHECKER";
	 	 var tokenizedURL= insertParam("assignMakerChecker.htm");
			$.ajaxSetup({
				cache: true
			});
	 	 $.ajax({
	 			type : "POST",
	 			url : tokenizedURL,
	 			data: parametersDynamic,
	 			success : function(data) {
	 			}
	 	 }); 
		}
	else
		{	 
		 $.alert("Please assign the roles once the Case Id has been generated."); 
		}
 			hideLoading();
 	});	
 	
 /* This function assign a new checker2 */
 $(".uicDropDown_workQueue_22").change(function(){
 	showLoading();
 	var filingId=$(this).closest('tr').find("td:nth-child(4)").text().trim();
 	if(filingId!=null && filingId!='')
		{
 		
 		checkerId=$($(this)).val();
	 	var  parametersDynamic="filingId="+encodeURIComponent(filingId)+"&userId="+encodeURIComponent(checkerId)+"&makerOrChecker=CHECKER2";
	 	 var tokenizedURL= insertParam("assignMakerChecker.htm");
			$.ajaxSetup({
				cache: true
			});
	 	 $.ajax({
	 			type : "POST",
	 			url : tokenizedURL,
	 			data:parametersDynamic,
	 			success : function(data) {
	 			}
	 	 }); 
		}
	else
		{
		 $.alert("Please assign the roles once the Case Id has been generated.");
		}
 			hideLoading();
 	});	
 }//bindChageEvenets()
 
 var autoRefreshAllowed= 1;
 function autoRefresh(tabId) 
 {
	 if(autoRefreshAllowed == 1){
	 	var cpage= $(".currentPage").text(); 
	 	    cpage = parseInt(cpage)
	 	var pagableURL = $("#setPageSizebleURL" + tabId).val();
	 	 if(cpage > 1){
	 		 pagableURL = pagableURL + "&page="+cpage;
	 	 }
	 	if(pagableURL!=null && pagableURL!=undefined)
	 	{
		 	$('#uic_Loading').show();
			$.ajaxSetup({
				cache: true
			});
		 	$.ajax({
		 		url : pagableURL,
		 		type : 'POST',
		 		error : function(error) {
		 			$('#uic_Loading').hide();
		 			window.location.href = "logout.htm"; 
		 		},
		 		success : function(html) {
		 			$('#uic_Loading').hide();
		 			$("#" + tableId + "Container").html('');
		 			$("#" + tableId + "Container").html(html);
		 			hideshowColumns();
		 		}
		 	});
	   }
	 }//if
 }
 

 
 function setAutoCompleteList() {
var transactionId = $("#transactionId").val();
console.info("transactionId="+transactionId);
if (transactionId.trim().length >= 1) {
	processData = '&transactionId='+ encodeURIComponent(transactionId);
	actionUrl = "getTransactionAutoComplete.htm";
	successData = function(data) {
		setAutoCompleteData(data.transactionList);
	};
	errorData = function(data) {
		$.alert("error" + data);
	};
	callAjaxGet(processData, successData, errorData, beforeSend,
			actionUrl, reqType, retDataType);
 }

	}
 function setAutoCompleteData(data) {
	 var availableTags =data; 
		$("#transactionId").empty();
		$("#transactionId").autocomplete({
			source: availableTags,
			minLength : 1,
			select: function(event, ui) {
			    $( "#transactionId").val(ui.item.label);
			     return false;
			     },
		});
}
 
function  hideshowColumns(){
	 if($("#bachProcessFlag").val() != 'Y') {
    	$('.uicAlignShowHideColumns div.checkbox:nth-child(1), .uicAlignShowHideColumns div.checkbox:nth-child(2)').hide();
    	$('.batchCheckBoxCls').hide();
    	$('.transactionIdCls').hide();
		$('#uic_SearchElementDiv_workQueue_0').hide();
	 	$('#uic_SearchElementDiv_workQueue_5').hide();
	 } 
}
 
 
 function isNumber( input ) {
	    return !isNaN( input );
	} 

function submitBatchId(){
	 var chekedLen= $('.uicChkBox_workQueue_0:checkbox:checked').length; 
	 var transactionId = $("#transactionId").val();
	 var tranIdnAry = transactionId.split("."); 
	 var caseIds = [];
	 if(chekedLen == 0){
	   $.alert('Please select at least one checkBox.');	 
	  return false;
	 }
	 if(transactionId.trim()==""){
			$.alert("Please enter transactionId.");
			return false;
	 }	
	 if(tranIdnAry.length > 1){
			$.alert("Please enter validNumber.");
			return false;
	 }	
		
	//number Validation
	 if (isNumber(transactionId)) {
			$(".uicChkBox_workQueue_0:checked").each(function() {
				var filingId=$(this).val();
			     caseIds.push(filingId);
			});
			UpdateTransactioIds(caseIds);
		}else{
			$.alert("Please enter validNumber.");
			return false;
		}
}

function UpdateTransactioIds(caseIds){
	 
	var transactionId = $("#transactionId").val();
	if(caseIds.length > 0){
	//update Call
		processData = '&transactionId='+ encodeURIComponent(transactionId)+'&caseIds[]='+ caseIds;
		actionUrl = "updateBatchId.htm";
		successData = function(data) {
			if(data!=''){
				$.alert(data);
			}else{
				$(".checkAllWq").prop("checked", false);
				$(".uicChkBox_workQueue_0:checked").each(function() {
					var filingId=$(this).closest('td').next().text(transactionId);
					$(this).prop("checked", false);
				     caseIds.push(filingId);
				});
				$('#batchAssociationId').modal('hide');
			}
		};
		errorData = function(data) {
			$.alert("error" + data);
		};
		callAjax(processData, successData, errorData, beforeSend,
				actionUrl, reqType, retDataType);	
	}else{
		 $.alert('Please select at least one checkBox.');	
	}
} 



 

function uicSelectAll(ele) {
	 var checkboxes = document.getElementsByClassName('uicChkBox_workQueue_0');
    if (ele.checked) {
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox') {
                checkboxes[i].checked = true;
            }
        }
    } else {
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox') {
                checkboxes[i].checked = false;
            }
        }
    }
}

function checkOrUnCheck(thisObj){
	var flag='N'; 
	$(".uicChkBox_workQueue_0").each(function() {
		if(this.checked){
			flag='Y';
	    }else{
	    	flag='N';
	    	$(".checkAllWq").prop("checked", false);
	    	return false;
	    }
	});
	if(flag=='Y'){
		    $(".checkAllWq").prop("checked", true);
	}
}

function showWorkQueue(){
	     workQueueDivShow();
	     $(".navbar-nav li").each(function(n) {
	        $(this).removeClass("active");
	     }) 
	     $("#workQueueLink").addClass('active'); 
	 	 $(".UicTblCaptionH2").css('width', '100%'); 
	 	 $(".UicShowScroll ").css('height', '59%');
	 	resetVariabels();
}

function showMenuHeader(){
	var showWelcomeMenuStr = '';
	var bachProcessFlag=$("#bachProcessFlag").val();
	showWelcomeMenuStr = 
	showWelcomeMenuStr+'<ul class="nav navbar-nav">'+
                        '<li id="overallPortfolioLink"><a href="javascript:void(0)" onclick="showWorkQueue();" class="wq overall"> <span>Overall  Portfolio </span></a></li>'+
						'<li id="workQueueLink" class="active"><a href="javascript:void(0)" onclick="showWorkQueue();" class="wq workque"><span class="fa fa-home mar-rt5" style="font-size:18px"></span>Work Queue</a></li>';
		              if(bachProcessFlag!='' &&  bachProcessFlag=='Y'){	
    showWelcomeMenuStr=
    showWelcomeMenuStr+'<li id="btn_BatchProcessing" > <a href="javascript:void(0)"  onclick="setLocationHref(\'showBatchProcessing.htm\')" class="tpl"><span class="fa fa-database mar-rt5" style="font-size:18px"></span>Batch Processing</a></li>';
		}
	showWelcomeMenuStr=
	showWelcomeMenuStr+'<li id="myPortfolioLink"><a href="javascript:void(0)" class="port"> <span>My Portfolio </span></a></li>'+
						'<li id="uploadDocumentLink"> <a href="javascript:void(0)" onclick="setLocationHref( \'documentUpload.htm\',this.parentNode.id);" class="du"><span class="fa fa-upload mar-rt5" style="font-size:18px"></span>Upload Document</a></li>'+ 
						'<li id="normalizationTemplateLink"> <a href="javascript:void(0)"  onclick="setLocationHref(\'normalizationTemplate.htm\', this.parentNode.id)" class="tpl"><span class="fa fa-newspaper-o mar-rt5" style="font-size:18px"></span>Normalization Template</a></li>'+
						'<li id="normalizationRulesLink"> <a href="javascript:void(0)" onclick="setLocationHref(\'uploadTemplet.htm\', this.parentNode.id)" class="rules"><span class="fa fa-tasks mar-rt5" style="font-size:18px"></span>Normalization Rules</a></li>'+
						/*'<li id="reportsLink"> <a  href="javascript:void(0)" onclick="setLocationHref(\'report.htm\', this.parentNode.id)"  class="reprt"><span class="fa fa-file-text mar-rt5" style="font-size:18px"></span>Reports</a></li>'+*/
						'</ul>';
	$(".dynamicMenu").empty();
	$(".dynamicMenu").append(showWelcomeMenuStr);
	}

function showWorkQueue(){
	relaseLockUser();
	var table_Id = $('#tableName').val();   
	$('.rmDiv').remove();
	$(".uicTableDiv").show();
	showMenuHeader();
	autoRefresh(table_Id);  
	checkBoxArray=[];
	resetVariabels();
}


function relaseLockUser(){
    processData = '';
    actionUrl = "releaseLockUser.htm";
    successData = function(data) {
   		//$.alert(data);
    };
    errorData = function(data) {
          $.alert("error in releaseLockUser" + data);
    };
    callAjax(processData, successData, errorData, beforeSend,
                actionUrl, reqType, retDataType);
}


 
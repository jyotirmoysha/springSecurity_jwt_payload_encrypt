<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/appCSS/${applicationScope['cssType']}/admin_${applicationScope['cssType']}.css?value=${applicationScope['version']}" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="css/commonCSS/custom-styles.css?value=${applicationScope['version']}" />
<link href="js/tostr/jquery-confirm.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="js/choosen/chosen.min.css" />
<link rel="stylesheet" type="text/css" href="js/choosen/chosen.css" />
<script src="js/choosen/chosen.jquery.min.js"></script>
<script src="js/choosen/chosen.jquery.js"></script> 
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
<script>
$(document).ready(function(){  
	showUserTable();
	
	$('#firstName').keyup(function () { 
	    this.value = this.value.replace(/[^a-zA-Z0-9_]/g,'');
	});
	
	$('#lastName').keyup(function () { 
	    this.value = this.value.replace(/[^a-zA-Z0-9_]/g,'');
	});
	
    $("#lastName").blur(function(){
    	var firstName = $('#firstName').val();
    	var lastName = $('#lastName').val();
    	var myModalLabel = $('#myModalLabel').html();
    	if(myModalLabel=='Add User'){
    	$('#login').val(firstName+"."+lastName);
    	}
    	
    	
    });
    
    $( "#btnMymodal" ).click(function() {
    	 $("#myModalLabel").html("Add User");
    	 resetPopup();
    	 $("#savebuttonId").attr("onclick","addNewUser()");
    	 $("#statusrowId").hide();
    	 
    });
    
//  showTable("manageusergroup");
 //showAuditTrailDiv("auditTrailDiv");
//showReleaseLockDiv("releaseLockDiv");
  					  
    
});


function showUserTable(){
	showLoading();
	var userGroupId = '${userGroupId}';
/* 	if(userGroupId == null || userGroupId == undefined || userGroupId == '%' || userGroupId == ''){
		userGroupId = '%';
	} */
	$.ajaxSetup({
		cache: true
	});
	var tableId = '${tableId}';
	$.ajax({
		url : "show-table.htm",
		cache : true,
		type : 'POST',
		cache: true,
	     data : {tableIds : tableId, userGroupId : userGroupId}, 
		success : function(data) {
			hideLoading();
			$('#manageuser').html('');
			$('#manageuser').html(data);
			
			$("#"+tableId+"SearchElementsContainer .UicTblCaptionH2").append("<span>&nbsp;Custom Search</span>");
			$('#uiIconChangeIdSearch_'+tableId).addClass("glyphicon-chevron-down");
			$('#uiIconChangeIdSearch_'+tableId).removeClass("glyphicon-chevron-up");
			$('#uic_search_'+tableId).hide();
			$('#'+tableId+'Container').css('padding-top','2px');
			$('#uic_DynamicSearchButton_userDetailsForAdmin').addClass("btn-info");
		}
	});
} 
/*
 * This function used for add and update user
 */
 
	function addNewUser() {
	 showLoading();
	 $("#error-list").empty();
		actionUrl = "addNewUser.htm";
		var processData = $('#addUserForm').serialize();
		successData = function(data) {
			result = JSON.parse(data);
			/***** check result success *********************/

			$.ajaxSetup({
				async : false,
				cache: true
			});
			var timeStamp = result['currentTimeStamp'];
			$('#currentTimeStamp').val(timeStamp);
			if (result.hasOwnProperty('errorList')) {
				
				/* Here we split string by comma */
				var errorList=result['errorList'];
				var addUserFlag=result['addUserFlag'];
				if(errorList){
				var myarray = errorList.toString().split(',');
				 for(var i = 0; i < myarray.length; i++)
				{
					 $("#error-list").append('<li>'+myarray[i]+'</li>');
				}
				 $("#error-list").css("color", "red");
			}
		   }
			
			if (result.hasOwnProperty('addUserFlag')) {
				 if(result['addUserFlag']){
					 $.alert("New User Added Successfully.");
					 showTable1('manageuser');
				 }else{
					 if (result.hasOwnProperty('logout')) 
						 {
						 	if(result['logout'])
						 	{
						 		 window.location.href = "login.htm?error=7";
						 	}
						 }
					 else
						 {
						 $("#error-list").append('<li>Operation Failed, Due to Error in Process</li>'); 
						 $("#error-list").show();	 
						 }
				 }
			} 
				
			hideLoading();
		};

		errorData = function(data) {

			$.alert(data);
			hideLoading();

		};
		if (processData == '') {
			console.info("data is empty");
			hideLoading();
			$.alert("No Data Available");
			
		} else {

			callAjax(processData, successData, errorData, beforeSend,
					actionUrl, reqType, retDataType);

		}

	}
	
	
	function AddNewUserView() {
		$("#myModal_6").show();
		$("#myModal_6").addClass("in");
		$("#email").attr("readonly", false); 
		showLoading();
		resetPopup();
		$("#statusrowId").show();
		$("#myModalLabel").html("Add User");
		$("#savebuttonId").attr("onclick","addNewUser()");
		 $('#usersGroupName').empty();
		 var userAccessId=$('#userAccessId').val();
		 if(userAccessId=='1'){
			     $('#userAccess').append($('<option>', { value : "" }).text("NO"));
				  $('#userAccess').append($('<option>', { value : 1 }).text("YES"));
		 }else{
			  $('#userAccess').append($('<option>', { value : "" }).text("NO"));	
			  $("#userAccess").prop("disabled",true); 
		 }
		 var userGroupOptions = ${groupListJSON};
		 var userGroupOptionList='<option value="">-- select --</option> ';
		 $.each(userGroupOptions, function( index, userGroup ) {
			 if(userGroup.flag !='D')
				 {
					 userGroupOptionList = userGroupOptionList +' <option value="'+userGroup.usersGroupId+'~'+userGroup.usersGroupName+'">'+userGroup.usersGroupName+'</option>';	 
				 }
			});
		 $("#usersGroupName").html(userGroupOptionList); 
		 hideLoading();
	}
	
	
	
	function eidtUserDetails(userid, xyd) {
		$("#myModal_6").show();
		$("#myModal_6").addClass("in");
			$("#email").attr("readonly", true);
		showLoading();
		 resetPopup();
		 $("#statusrowId").show();
		$("#myModalLabel").html("Edit User");
		$("#savebuttonId").attr("onclick","saveEditUser()");

	     actionUrl = "showEditUser.htm";
		 var processData = "&userId="+encodeURIComponent(userid);
		 successData = function(data) {
				result = JSON.parse(data);
				/***** check result success *********************/  
		 	 $("#userId").val(result['userId']);
			 $("#firstName").val(result['firstName']);
			 $("#lastName").val(result['lastName']);
			 $("#login").val(result['login']);
			 $("#email").val(result['email']);
		//	 $('#email').prop('readonly', true);
/* 			 $('#emaildropdown').prop('readonly', true);
			 $("#emaildropdown").val("@"+result['emaildropdown']); */
			 var userAccess=result['userAccess'];
			 var loginUserAccess='${userAccess}';
			 $('#userAccess').empty();
			if(loginUserAccess=='1' && userAccess=='1'){
				$('#userAccess').append($('<option>', { value : userAccess }).text("YES"));
				 $("#userAccess").val(1);
				  $("#userAccess").prop("disabled",true); 
			}else{
				if(loginUserAccess=='1'){
					$("#userAccess").prop("disabled",false);		
				}else{
					$("#userAccess").prop("disabled",true);	
				}
				$('#userAccess').append($('<option>', { value : 2 }).text("YES"));
				  $('#userAccess').append($('<option>', { value : "" }).text("NO"));
				  $("#userAccess").val(userAccess);
			}
			
			//Here set edited usergroup 

			 $('#usersGroupName').empty();
			 var userGroupOptions = ${groupListJSON};
			 var userGroupOptionList='<option value="">-- select --</option> ';
			 $.each(userGroupOptions, function( index, userGroup ) {
				 userGroupOptionList = userGroupOptionList +' <option value="'+userGroup.usersGroupId+'~'+userGroup.usersGroupName+'">'+userGroup.usersGroupName+'</option>';
				});
			 $("#usersGroupName").html(userGroupOptionList); 
			 $("#usersGroupName").val(result['userGroupId']);
		    
			 if(result['flag']=='Active'){
				 $("input[name=flag][value='Active']").prop("checked",true);
			 }else{
				 $("input[name=flag][value='InActive']").prop("checked",true);
			 }
		hideLoading();
			 
		};

		errorData = function(data) {

			$.alert(data);
			hideLoading();

		};
		    
			callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
	}
	
	function saveEditUser(){
		showLoading();
	 $("#error-list").empty();
	 $("#userAccess").prop("disabled",false);	
	var  actionUrl = "saveEditUser.htm";
	var processData = $('#addUserForm').serialize();
	successData = function(data) {
		result = JSON.parse(data);
		/***** check result success *********************/  
		$.ajaxSetup({
			async : false,
			cache: true
		});

		if (result.hasOwnProperty('errorList')) {
			
			/* Here we split string by comma */
			var errorList=result['errorList'];
			var addUserFlag=result['addUserFlag'];
			if(errorList){
			var myarray = errorList.toString().split(',');
			 for(var i = 0; i < myarray.length; i++)
			{
				 $("#error-list").append('<li>'+myarray[i]+'</li>');
			}
		}
	   }
		
		if (result.hasOwnProperty('flag')) {
			 if(result['flag']){
				 $.alert("User modified Successfully");
				 refreshUserTable("userDetailsForAdmin");
				 $("#cancelbutton").click(); 
					 $('#firstName').val('');
			    	 $('#lastName').val('');
			    	 $('#login').val('');
			    	 $('#email').val('');
			    	 $('#usersGroupName').val('');
			    	 $('#userAccess').val('');
			    	 $("#error-list").show();
			 }else{
				 $("#error-list").append('<li>Operation Failed, Due to Error in Process</li>'); 
				 $("#error-list").show();
			 }
		} 
			 hideLoading();
      };
      errorData = function(data) {
			$.alert(data);
			hideLoading();
		};
		    
	 callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
	}
	

	function showUserAuditReportDiv(divid){
		showLoading();
		
		actionUrl = "showUserAuditReport.htm";
		successData = function(data) {
			hideLoading();
			$('#userAuditReportDiv').html(data);
			
		};
		errorData = function(data) {
			hideLoading();
			$('#userAuditReportDiv').html(data);//.show();
			
		};
		console.info("--------Value Validated-------");
		retDataType = "html";
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
	}
	
	
	function showTable(divid){
		 showLoading();
		actionUrl = "showUserGroup.htm";
		successData = function(data) {
			hideLoading();
			$('#manageusergroup').html(data);
		};
		errorData = function(data) {
			hideLoading();
			$('#'+manageusergroup).html(data);//.show();
			
		};
		console.info("--------Value Validated-------");
		retDataType = "html";
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
		
	
	}
	
	function showAuditTrailDiv(divid){
		 showLoading();
	
		actionUrl = "showAuditTrail.htm";
		successData = function(data) {
			hideLoading();
			$('#auditTrailDiv').html(data);
			
		};
		errorData = function(data) {
			hideLoading();
			$('#auditTrailDiv').html(data);//.show();
			
		};
		console.info("--------Value Validated-------");
		retDataType = "html";
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
	}
	function showReleaseLockDiv(divid){
		 showLoading();
	
		actionUrl = "showReleaseLock.htm";
		successData = function(data) {
		hideLoading();
		$('#releaseLockDiv').html(data);
		};
		errorData = function(data) {
			hideLoading();
			$('#releaseLockDiv').html(data);//.show();
		};
		console.info("--------Value Validated-------");
		retDataType = "html";
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
	}
	
	
	function showTable1(divid){
		if(divid=="manageusergroup"){
			  showTable(divid);
			$("#btnMymodal").hide();
		}else if(divid=="auditTrailDiv"){
			showAuditTrailDiv(divid);
			$("#btnMymodal").hide();
		}else if(divid=="releaseLockDiv"){
			 showReleaseLockDiv(divid);
			$('#btnMymodal').hide();	
		}else if(divid=="userAuditReportDiv"){
		 showUserAuditReportDiv(divid);
		$('#btnMymodal').hide();	
		}
		else if(divid=="admintemplateDiv"){
			showTemplateDiv(divid);
			$('#btnMymodal').hide();	
			}
		else if(divid=="adminComponentDiv"){
			showComponentDiv(divid,"USERGROUP");
			$('#btnMymodal').hide();	
			}
		else if(divid=="adminRageFeaturesDiv"){
			showRageFeaturesDiv(divid);
			$('#btnMymodal').hide();	
		}else if(divid=="parserSectionMappingDiv"){
			showParserSectionMappingDiv(divid);
			$('#btnMymodal').hide();	
		}else if(divid=="goldenCasefeatureMappingDiv"){
			showGoldenCaseFeaturesMappingDiv(divid);
			$('#btnMymodal').hide();	
		}
		else if(divid=="extractionDataRulesDiv"){
			showExtractionDataRulesDiv(divid);
			$('#btnMymodal').hide();	
		}
		else{
			//$('#btnMymodal').show();
			calShowAdminPanal('${userGroupId}');
		}
		$('.userguide').hide();
		$('#'+divid).show();
		$('.navigation').removeClass('active');
		$('.'+divid).addClass('active');
	}
	/* This function used for delete user account */
	function removeUserDetails(userId) {
		 $.confirm({
			    title: 'Confirm!',
			    content: 'Are you sure you want to delete the user account?',
			    buttons: {
			        confirm: function () {
			/* code start*/
			 showLoading();
			$("#error-list").empty();
			var actionUrl = "deleteUser.htm";
			var processData = "&userId=" + encodeURIComponent(userId);
			successData = function(data) {
				$.ajaxSetup({
					async : false,
					cache: true
				});
				result = JSON.parse(data);
				
				if (result) {
				  $.alert("User deleted Successfully");
				   refreshUserTable("userDetailsForAdmin");
					
				}else{
					$.alert("User deleted Failed");
				}
				hideLoading();
			};
			errorData = function(data) {
				$.alert(data);
				hideLoading();
			};
			callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);	
			/* code end*/	       	
			        },
			        cancel: function () {
			        }
			    }
			});
	}
	function releaseLock(userId) {
		$("#error-list").empty();
		var actionUrl = "releaseUserSession.htm";
		var processData = "&userId=" + encodeURIComponent(userId);
		successData = function(data) {
			$.ajaxSetup({
				async : false,
				cache: true
			});
			$.alert(data);
			

			hideLoading();
		};
		errorData = function(data) {
			$.alert(data);
			hideLoading();
		};
		callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
	}
	function resetPopup() {
		$("#error-list").empty();
		$('#userId').val('0');
		$('#firstName').val('');
		$('#lastName').val('');
		$('#login').val('');
		$('#email').val('');
		$('#usersGroupName').val('');
		$('#userAccess').val('');
	}
	
	function showTemplateDiv(divid){
		    showLoading();
			actionUrl = "adminTemplate.htm";
			successData = function(data) {
			hideLoading();
			$('#admintemplateDiv').html(data);
			};
			errorData = function(data) {
				hideLoading();
				$('#admintemplateDiv').html(data);//.show();
			};
			console.info("--------adminTemplate-------");
			retDataType = "html";
			callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 	
	}
	
	function showComponentDiv(divid,type){
	    showLoading();
	    processData="type="+type;
		actionUrl = "adminComponentAssocation.htm";
		successData = function(data) {
		hideLoading();
		$('#adminComponentDiv').html(data);
		};
		errorData = function(data) {
		hideLoading();
		$('#adminComponentDiv').html(data);//.show();
		};
		console.info("--------adminTemplate-------");
		retDataType = "html";
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 	
}

	
function refreshUserTable(tableId)
{
	var cpage= $(".currentPage").text(); 
	    cpage = parseInt(cpage)
	var pagableURL = $("#setPageSizebleURL" + tableId).val();
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
 		cache: true,
 		error : function(error) {
 			$('#uic_Loading').hide();
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
 			$("#" + tableId + "Container").html('');
 			$("#" + tableId + "Container").html(html);
 		}
 	});
}
}

function showRageFeaturesDiv(tableId){
	    showLoading();
		var userGroupId = '${userGroupId}';
	    actionUrl = "adminRageFeatures.htm";
		processData = "&userGroupId="+encodeURIComponent(userGroupId);
		successData = function(data) {
		hideLoading();
		$('#adminRageFeaturesDiv').html(data);
		};
		errorData = function(data) {
			hideLoading();
			$('#adminRageFeaturesDiv').html(data);//.show();
		};
		console.info("--------adminRageFeaturesDiv-------");
		retDataType = "html";
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 	
}

function showGoldenCaseFeaturesMappingDiv(tableId)
{
	showLoading();
    actionUrl = "showGoldenCaseFeatures.htm";
	successData = function(data) {
	hideLoading();
	$('#goldenCasefeatureMappingDiv').html(data);
	};
	errorData = function(data) {
		hideLoading();
		$('#featureCaseMappingDiv').html(data);//.show();
	};
	console.info("--------adminRageFeaturesDiv-------");
	retDataType = "html";
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 	
}

function showFeatureCaseMappingDiv(tableId)
{
	showLoading();
	var userGroupId = '${userGroupId}';
    actionUrl = "feature_case_mapping.htm";
	processData = "&userGroupId="+encodeURIComponent(userGroupId);
	successData = function(data) {
	hideLoading();
	$('#featureCaseMappingDiv').html(data);
	};
	errorData = function(data) {
		hideLoading();
		$('#featureCaseMappingDiv').html(data);//.show();
	};
	console.info("--------adminRageFeaturesDiv-------");
	retDataType = "html";
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 	
}


function showParserSectionMappingDiv(tableId)
{
    showLoading();
	var userGroupId = '${userGroupId}';
    actionUrl = "showPaprserSectionMapping.htm";
	processData = "&userGroupId="+encodeURIComponent(userGroupId);
	successData = function(data) {
	hideLoading();
	$('#parserSectionMappingDiv').html(data);
	};
	errorData = function(data) {
		hideLoading();
		$('#parserSectionMappingDiv').html(data);//.show();
	};
	console.info("--------adminRageFeaturesDiv-------");
	retDataType = "html";
	callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 	
}


function showExtractionDataRulesDiv(){
	 showLoading();
	    actionUrl = "showExtractionDataRules.htm";
		processData = '';
		successData = function(data) {
		hideLoading();
		$('#extractionDataRulesDiv').html(data);
		};
		errorData = function(data) {
			hideLoading();
			$('#extractionDataRulesDiv').html(data);//.show();
		};
		console.info("--------extractionDataRulesDiv-------");
		retDataType = "html";
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
}


</script>
<style>
/* body{overflow:auto !important} */
.jconfirm-box.jconfirm-hilight-shake.jconfirm-type-default.jconfirm-type-animated{margin-top:200px !important; left:110px}
.modal-body{padding:20px 20px 0 20px}
.modal-footer{margin-top:-17px !important}
.jumbotron{width:100% !important;}
.table.uic_dynamictable td{text-align:center !important}
</style>
	<div id="loadinglayer"></div>
	
	<div class="modal fade" id="myModal_6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false" style="padding-top:64px">
		<div class="modal-dialog" role="document" style="width: 36%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#myModal_6').hide();">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add User</h4>
				</div>
				<div class="modal-body">
					<ul id="error-list" style="display: block; color: #ff0000; list-style: none; text-align:center; font-weight:bold; margin: 0px auto 20px 30px;">

					</ul>
					<form name="addUserForm" id="addUserForm" autocomplete="off">
					
						<table width="100%" cellpadding="0" cellspacing="0" border="0" id="userformtable" name="userformtable newTable">
							<input type="hidden" id="currentTimeStamp" name="currentTimeStamp" value="${CurrentTimeStamp}">
							<input type="hidden" name="userId" id="userId" value="0" />
							<input type="hidden"  id="userAccessId" value="${userAccess}" />

							<tr>
								<td class="new-color">First Name :<span class="mandate-filds">*</span></td>
								<td><input type="text" class="input" name="firstName" id="firstName" /></td>
							</tr>

							<tr>
								<td class="new-color">Last Name:<span class="mandate-filds">*</span></td>
								<td><input type="text" class="input" name="lastName" id="lastName" /></td>
							</tr>
							<tr>
								<td class="new-color">User Name :<span class="mandate-filds">*</span></td>
								<td><input type="text" class="input" name="login" id="login"  /></td>
							</tr>

							<tr>
								<td class="new-color">Email ID:<span class="mandate-filds">*</span></td>
								<td><input class="input" type="email" name="email" id="email" class="input" >
								</td>
							</tr>
							<tr>
								<td class="new-color">User Group:<span class="mandate-filds">*</span></td>
								<td><select name="usersGroupName" id="usersGroupName" class="input">
										<c:if test="${not empty groupList}">
											<option value="">-- select --</option>
											<c:forEach items="${groupList}" var="userGroup">
												<c:if test="${userGroup.flag != 'D'}">
													<option value="${userGroup.usersGroupId}~${userGroup.usersGroupName}">${userGroup.usersGroupName}</option>
												</c:if>
											</c:forEach>
										</c:if>
								</select></td>
							</tr>
		
							<tr>
								<td class="new-color">Group Admin:</td>
								<td><select name="userAccess" id="userAccess" name="userAccess"   class="input">
								</select></td>
							</tr>
							<tr id="statusrowId">
								<td class="new-color">Status:</td>
								<td>
								<label><input type="radio" name="flag" id="flag" value="Active" checked="checked" style="margin:3px 5px 0 0">Active</label> 
								<label><input type="radio" name="flag" id="flag" value="InActive" style="margin:3px 5px 0 5px">InActive</label>
								</td>
							</tr>
							<tr>
								<td colspan="2"><p style="font-size:9px; color:#a59c9c; margin-top:6px"><span class="mandate-filds" style="margin:0 5px 0 0">*</span>First Name, Last Name contains "A-Z a-z 0-9 _" charaters only.</p></td>
							</tr>
						</table>
					</form>
				</div><!-- modal-body -->
			
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="return addNewUser()" id="savebuttonId">Save</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelbutton" onclick="$('#myModal_6').hide();">Cancel</button>
				</div>
			</div><!-- modal-content -->
		</div>
	</div>

	<div style="height:25px"></div>
	<div class="container-fluid mar-top78 rmDiv">
		<div class="row">
			<div class="col-md-3">
			<div class="panel panel-default custom-wdt260">
				<div class="panel-body" style="min-height:480px; padding:0px !important">
					<div class="left-panel">
				<ul>
				<c:choose>
 			  	<c:when test="${user.userAccess eq 1}">
				<li><a href="javascript:void(0);" onclick="showTable1('manageuser');" class="manageuser navigation active">Add/Manage Users</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('manageusergroup');" class="manageusergroup navigation">Add/Manage User Groups</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('auditTrailDiv');" class="auditTrailDiv navigation">Audit Trail</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('releaseLockDiv');" class="releaseLockDiv navigation">Release Lock</a></li>
				<!-- <li><a href="javascript:void(0);" onclick="showTable1('userAuditReportDiv');" class="userAuditReportDiv navigation">User Audit Report</a></li> -->
				<li><a href="javascript:void(0);" onclick="showTable1('admintemplateDiv');" class="admintemplateDiv navigation">Add Template</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('adminComponentDiv');" class="adminComponentDiv navigation">Component Association</a></li>
		        <li><a href="javascript:void(0);" onclick="showTable1('adminRageFeaturesDiv');" class="adminRageFeaturesDiv navigation">Rage Features</a></li>
		        <li><a href="javascript:void(0);" onclick="showTable1('parserSectionMappingDiv');" class="parserSectionMappingDiv navigation">Parser Section Mapping</a></li>
		        <li><a href="javascript:void(0);" onclick="showTable1('goldenCasefeatureMappingDiv');" class="goldenCasefeatureMappingDiv navigation">Golden Case Features</a></li>
		     	 <li><a href="javascript:void(0);" onclick="showTable1('extractionDataRulesDiv');" class="extractionDataRulesDiv navigation">Extraction Data Rules</a></li>
		        </c:when>
 			  	<c:when test="${user.userAccess eq 2}">
              	<li><a href="javascript:void(0);" onclick="showTable1('manageuser');" class="manageuser navigation active">Add/Manage Users</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('manageusergroup');" class="manageusergroup navigation">Add/Manage User Groups</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('auditTrailDiv');" class="auditTrailDiv navigation">Audit Trail</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('releaseLockDiv');" class="releaseLockDiv navigation">Release Lock</a></li>
				<!-- <li><a href="javascript:void(0);" onclick="showTable1('userAuditReportDiv');" class="userAuditReportDiv navigation">User Audit Report</a></li> -->
				<li><a href="javascript:void(0);" onclick="showTable1('admintemplateDiv');" class="admintemplateDiv navigation">Add Template</a></li>
				<li><a href="javascript:void(0);" onclick="showTable1('adminComponentDiv');" class="adminComponentDiv navigation">Component Association</a></li>
              	<li><a href="javascript:void(0);" onclick="showTable1('adminRageFeaturesDiv');" class="adminRageFeaturesDiv navigation">Rage Features</a></li>
              	<li><a href="javascript:void(0);" onclick="showTable1('parserSectionMappingDiv');" class="parserSectionMappingDiv navigation">Parser Section Mapping</a></li>
                <li><a href="javascript:void(0);" onclick="showTable1('goldenCasefeatureMappingDiv');" class="goldenCasefeatureMappingDiv navigation">Golden Case Features</a></li>
              	 <li><a href="javascript:void(0);" onclick="showTable1('extractionDataRulesDiv');" class="extractionDataRulesDiv navigation">Extraction Data Rules</a></li>
              	</c:when>
            	
  			</c:choose>
			</ul>
		</div>
		</div>
		</div>
		</div><!--- col-md-3 -->
		
		<div class="wrap-userbtn" style="margin:-13px 0 0 -10px !important; z-index:1"><button id="btnMymodal" type="button" style="padding:4px 8px !important"  class="btn btn-primary add-user" data-toggle="modal" onclick="return AddNewUserView();" id="btn">Add New User</button></div>
		<div class="col-md-9">
			<div class="row">
			
				<div class="userguide-right-panel">
		
		<div id="manageuser" class="userguide" style="display:block">
		</div>
			<div id="manageusergroup" class="userguide" style="display:none"></div>
			<div id="auditTrailDiv" class="userguide" style="display:none"></div>
			<div id="releaseLockDiv" class="userguide" style="display:none"></div>
			<div id="userAuditReportDiv" class="userguide" style="display:none"></div>
			<div id="admintemplateDiv" class="userguide" style="display:none"></div>
			<div id="adminComponentDiv" class="userguide" style="display:none"></div>
			<div id="adminRageFeaturesDiv" class="userguide" style="display:none"></div>
			<div id="parserSectionMappingDiv" class="userguide" style="display:none"></div>
			<div id="goldenCasefeatureMappingDiv" class="userguide" style="display:none"></div>
			<div id="extractionDataRulesDiv" class="userguide" style="display:none"></div>
			
	</div>
  </div>
			
			</div><!--- row -->
	</div><!--- col-md-9 -->
		
		
		</div><!-- row -->
	</div><!-- container-fluid -->
  
		<%-- <footer style="position: fixed; bottom: 0px;">
			<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp"></jsp:include></div>
		</footer> --%>

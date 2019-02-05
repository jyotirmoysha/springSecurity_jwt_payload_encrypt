<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>LiveSpread</title>
<script type="text/javascript">
$(function() {
	$(".manageuserTable tbody tr:odd").css("background-color", "#f4f4f4");
	$(".manageuserTable tbody tr:even").css("background-color", "#ffffff");	
	jQuery(".chosen").chosen({width: "100%"});
	jQuery(".chosenPnames").chosen({width: "100%"});
	jQuery(".chosenPnames").chosen({"disable_search": true});
	
});
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();

$(document).ready(function(){
	$('#groupNameDb').keyup(function () { 
	    this.value = this.value.replace(/[^a-zA-Z0-9_-\s]/g,'');
	});
});


function submitGroups(){
	var finalPid=$(".tempC").val();
/*     var selMulti = $.map($("#ch-select option:selected"), function (el, i) {
         return $(el).text();
     });    
    var finalParserNames=selMulti.join(", "); */
	var groupName1 =$("#groupNameDb").val();
	var groupName = groupName1.toUpperCase();
	var beforeGname1 =$("#groupNameOld").val();
	var beforeGname = beforeGname1.toUpperCase();
	var groupId=$("#groupIdVal").val();
	var userId =$("#userIdVal").val(); 
	var UserGroupflag;
	   if($('#UserGroupflag').is(':checked')){
		   UserGroupflag='A';
	   } else{
		   UserGroupflag='D';
	   }

	console.info("UserGroupflag="+UserGroupflag);

	if((userId.trim()) =="undefined" || (userId.trim())==""){
		$.alert("userId  not empty");
		return false;
	}
   if((groupName.trim()) =="undefined" || (groupName.trim())==""){
	   $.alert("GroupName not empty");
		return false;	
	} 
   if((groupId.trim()) =="undefined" || (groupId.trim())==""){
	   $.alert("groupId not empty");
		return false;	
	}
	else{
		 var url = "updatingORAddGroupName.htm";
		 var parametersDynamic="finalPid="+encodeURIComponent(finalPid)+"&userId="+encodeURIComponent(userId.trim())+"&groupId="+encodeURIComponent(groupId)+"&groupName="+encodeURIComponent(groupName)+"&beforeGname="+encodeURIComponent(beforeGname)+"&flag="+encodeURIComponent(UserGroupflag);
	var urlAdmin=insertParam(url);
		 showLoading();
			$.ajaxSetup({
				cache: true
			});
		$.ajax({
			 type: "POST",  
			   url: urlAdmin,
			   data:parametersDynamic,
			   cache: true,
			 success: function(data){
		     result = JSON.parse(data);
		     var result = JSON.parse(data); 
	           console.log('success msg::'+result);
			   $.alert(result.userGrpMsg);
				 hideLoading();
				 showTable("manageusergroup");
				 $("#btnMymodal").hide();
			},error: function(data) {
				$.alert("error");
				hideLoading();
			}	
		}); 
	
	}
}

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
	
function editGroups(x){
	if(x==0){
		$("#myModalLabelId").html("Add User Group");
		$('#groupUser').modal('show');
		$("#groupNameDb").val("");
		$("#groupNameOld").val("");
		$(".tempC").val("");
		$(".tempC").trigger("chosen:updated");
		$("#groupIdVal").val(x);
	}else{
	$('#groupUser').modal('show');
	$("#myModalLabelId").html("Update User Group");
	var dynaparserIds=$("#dynamicPId_"+x).val().toString();
	
	var flag=$("#flag_"+x).val();
	var editName=$("#groupName_"+x).val();
	
	console.info("flag="+flag);
	
	if(flag=='A'){
	$("input[name=UserGroupflag][value='A']").prop("checked",true);
	}else{
	 $("input[name=UserGroupflag][value='D']").prop("checked",true);
	}
	
	var arrset = JSON.parse(dynaparserIds);
	$(".tempC").val(arrset);
	$(".tempC").trigger("chosen:updated");
	$("#groupIdVal").val(x);
	}
	
	$("#groupNameDb").val(editName);
	$("#groupNameOld").val(editName);
}

function removeGid(removingGId, NameofGroup){
	var userId =$("#userIdVal").val(); 
	if((removingGId.trim()) =="undefined" || (removingGId.trim())=="" || (removingGId.trim())=="0"){
		$.alert("GroupId not empty/zero");
		return false;
	}
	if((userId.trim()) =="undefined" || (userId.trim())=="" || (userId.trim())=="0"){
		$.alert("userId not empty/zero");
		return false;
	}else{
		$.confirm({
		    title: 'Confirm',
		    content: 'Please conform if you want to remove '+ NameofGroup +'?',
		    buttons: 
		    {		
		    confirm: function(){
				  var url = "removingGroupId.htm";
				  var parametersDynamic="removegroupId="+encodeURIComponent(removingGId.trim())+"&userId="+encodeURIComponent(userId.trim())+"&NameofGroup="+encodeURIComponent(NameofGroup.trim());
					var urlAdmin=insertParam(url);
						 showLoading();
							$.ajaxSetup({
								cache: true
							});
						$.ajax({
							 type: "POST",  
							   url: urlAdmin,
							   data:parametersDynamic,
							   cache: true,
							 success: function(data){
								 $.alert(data);
								 hideLoading();
								 showTable("manageusergroup");
								 $("#btnMymodal").hide();
							},error: function(data) {
								$.alert("error");
								hideLoading();
							}	
						});
		   	 		},
				cancel: function () {}
		    }
		});
	}
}

</script>
<style type="text/css">
body{margin:0px; padding:0px;}
.jconfirm.jconfirm-white .jconfirm-box, .jconfirm.jconfirm-light .jconfirm-box{margin:200px 0 0 50px !important}
.chosen-container-multi .chosen-choices {overflow:auto !important; max-height:150px !important; min-height:auto !important}
</style>
</head>
<body>

<!-- Button trigger modal -->


<!-- Modal -->
<div id="loadinglayer"></div>

<div class="modal fade" id="groupUser" tabindex="-1" role="dialog" aria-labelledby="groupUserLabel" data-backdrop="static" data-keyboard="false" style="padding-top:100px">
  <div class="modal-dialog" role="document" style="width:38%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabelId">User Group Details</h4>
      </div>
      <div class="modal-body" style="padding-bottom:60px">
       <table width="100%" cellpadding="0" cellspacing="0" border="0" class="newTable">
			<tr>
			<td valign="top"><label>User Group Name :</label></td>
			<td><input type="text" class="input" id="groupNameDb" style="width:300px !important; margin:0 10px 10px 0"/><input type="hidden" class="input" id="groupNameOld" /></td>
			</tr>
			<tr>
			<td valign="top"> <label>Add Parser Names:</label></td>
			<td>
				<select class="chosen tempC" multiple="true" id="ch-select" selected="selected" style="width: 400px; margin:0 0 0 10px">
				<c:forEach items="${ParserNames}" var="ParserNames" varStatus="status">
				<option value="${ParserNames.key}">${ParserNames.value}</option>
				</c:forEach>
				</select>
			</td>
			</tr>
 <tr>
 
 <td valign="top"> <label>Status:</label></td>
 <td><label><input type="radio" name="UserGroupflag" id="UserGroupflag" value="A" checked="checked" style="margin: 3px 5px 0 0">Active</label>
<label><input type="radio" name="UserGroupflag" id="UserGroupflag" value="D" style="margin: 3px 5px 0 5px">InActive</label>
</td>
</tr>
					</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitGroups()">Submit</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
        
      </div>
    </div>
  </div>
</div>

	<c:if test="${user.userAccess eq 1}">
	<button type="button" class="btn btn-primary add-user mar-top10"  onclick="editGroups('0');"> Add Group</button>
	</c:if>
	<div class="mngTable" style="height:400px; overflow:auto">
	<table width="100%" cellpadding="5" cellspacing="0" border="0" class="manageuserTable newTable datatable-new table table-bordered">
	<thead>
		<tr>
<!-- 		<th>Group Id</th> -->
			 <th>Group Name</th>
			 <th>Document Processing Type</th>
			 <th>Created Date</th>
			  <th>Status</th>
			 <th style="text-align:center !important">Edit</th>
			 <th style="text-align:center !important">Remove</th>
		</tr>	 
		</thead>

	<c:forEach items="${listOfGroup}" var="groupDetails" varStatus="loop">
		<c:set var="groupId" value="${groupDetails.key}" />
		<c:set var="groupInfo" value="${groupDetails.value}" />
		
			<tbody>
				<tr>
					<%-- <td  align="left" ><c:out value="${groupId}" /></td> --%>
					<td align="left" ><c:out value="${groupInfo.user_Group_Name}" /><input type="hidden" id="groupName_${groupInfo.user_Group_Id}" value="${groupInfo.user_Group_Name}" /> <input type="hidden" id="beforeGroupName_${groupInfo.user_Group_Id}" value="${groupInfo.user_Group_Name}" /></td>
					<td  align="left" ><select style="width:150px" class="chosenPnames">
							<c:set var="parserNameList" value="${groupInfo.parserName}" />
							<c:set var="parserIdList" value="${groupInfo.parseId}" />
						<!-- 	<option value="0">Select</option> -->
							<c:forEach items="${parserNameList}" var="parserName" varStatus="count">
								<option value="${parserIdList[count.index]}">${parserName}</option>
							</c:forEach>
					</select>
					</td>
					<td  align="left">${groupInfo.createDate}</td>
					<td  align="left"><c:out value="${groupInfo.flag eq 'D' ? 'INACTIVE': 'ACTIVE'}"/></td>
					<input type="hidden" id="flag_${groupInfo.user_Group_Id}" value="${groupInfo.flag}" />
					<td align="center" ><input type="image" src="images/icon-edit.png" width="28px" height="28px" data-toggle="tooltip" title="Edit" style="border:none !important" onclick="editGroups('${groupInfo.user_Group_Id}');" /><input type="hidden" id="dynamicPId_${groupInfo.user_Group_Id}" value="${parserIdList}" /></td>
					<td align="center" ><input type="image"  src="images/icon-recycle.png" width="28px" height="28px" data-toggle="tooltip" title="Remove" style="border:none !important" onclick="removeGid('${groupInfo.user_Group_Id}','${groupInfo.user_Group_Name}');" /></td>
				</tr>
			</tbody>
		
	</c:forEach>
	
	</table>
	</div>
	<input type="hidden" id="groupIdVal" value="${parserIdList}" />
	<input type="hidden" id="userIdVal" value="${user.userId}" />
</body>
</html> 
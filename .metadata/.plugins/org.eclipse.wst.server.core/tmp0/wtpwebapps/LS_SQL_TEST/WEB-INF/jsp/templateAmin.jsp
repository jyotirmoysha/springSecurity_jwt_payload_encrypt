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
	jQuery(".chosenTnames").chosen({width: "100%"});
	jQuery(".chosenTnames").chosen({"disable_search": true});
	
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



function submitTemplates(){
	var finalTid=$(".tempT").val();
	var groupName =$("#groupNameDB").val();
	var groupName = groupName.toUpperCase();
	var groupId=$("#groupIdVal").val();
	var userId =$("#userIdVal").val(); 
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
		 var url = "updatingORremovingTemplates.htm";
		 var parametersTokenVal="finalTid="+encodeURIComponent(finalTid)+"&userId="+encodeURIComponent(userId.trim())+"&groupId="+encodeURIComponent(groupId)+"&groupName="+encodeURIComponent(groupName);
	var urlAdmin=insertParam(url);
	$.ajaxSetup({
		cache: true
	});
		 showLoading();
		$.ajax({
			 type: "POST",  
			   url: urlAdmin,
			   data:parametersTokenVal,
			   cache: true,
			 success: function(data){
				 $.alert(data);
				 hideLoading();
				 showTable1('admintemplateDiv');
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
	var editName=$("#groupName_"+x).val();
	$("#groupIdVal").val(x);
	console.info("group id="+x);
	
	$('#templateUser').modal('show');
	var dynaTemplateIds=$("#dynamicTId_"+x).val().toString();
	console.info("Grp name="+editName);
	$("#groupNameOld").val(editName);
	$("#groupNameDB").val(editName);
	
	console.info("dynaTemplateIds="+dynaTemplateIds);
	if(dynaTemplateIds!=''){
	var arrset = JSON.parse(dynaTemplateIds);
	$(".tempT").val(arrset);
	$(".tempT").trigger("chosen:updated");
	}
	$("#groupIdVal").val(x);
	
}

</script>
<style type="text/css">
.chosen-container-multi .chosen-choices {overflow:auto !important; max-height:150px !important; min-height:auto !important}
</style>
</head>
<body>

<!-- Button trigger modal -->
<!-- Modal -->
<div id="loadinglayer"></div>
	<div class="modal fade" id="templateUser" tabindex="-1" role="dialog"
		aria-labelledby="groupTemplateLabel" data-backdrop="static"
		data-keyboard="false" style="padding-top: 100px">
		<div class="modal-dialog" role="document" style="width: 38%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myTemplateLabelId">Update User Group Templates</h4>
				</div>
				<div class="modal-body" style="padding-bottom:110px">
					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						class="newTable">
						<tr>
							<td valign="top" width="130px"><label>User Group Name :</label></td>
							<td><input type="text" class="input" id="groupNameDB"
								style="width: 100% !important; margin: 0 10px 10px 0" name="groupNameDb" readonly="readonly"/>
								<input type="hidden" class="input" id="groupNameOld" /></td>
						</tr>
						<tr>
							<td valign="top" width="130px"><label>Add Template Names:</label></td>
							<td><select class="chosen tempT" multiple="true"
								id="ch-select" selected="selected"
								style="width: 400px; margin: 0 0 0 10px">
									<c:forEach items="${templateNames}" var="templateNames"
										varStatus="status">
										<option value="${templateNames.key}">${templateNames.value}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="submitTemplates()">Submit</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>

				</div>
			</div>
		</div>
	</div>

	<div class="mngTable" style="height:477px; overflow:auto">
	<table width="100%" cellpadding="5" cellspacing="0" border="0" class="manageuserTable newTable datatable-new table table-bordered">
	<thead>
		<tr>
<!-- 		<th>Group Id</th> -->
			 <th>Group Name</th>
			 <th>Template Type</th>
			 <th>Created Date</th>
			 <th style="text-align:center !important">Edit</th>
		</tr>	 
		</thead>
	
	<c:forEach items="${listOfTemplatebyGroupIds}" var="templateDetails" varStatus="loop">
		<c:set var="groupId" value="${templateDetails.key}" />
		<c:set var="groupInfo" value="${templateDetails.value}" />
		
			<tbody>
				<tr>
					<%-- <td  align="left" ><c:out value="${groupId}" /></td> --%>
					<td align="left" ><c:out value="${groupInfo.user_Group_Name}" /><input type="hidden" id="groupName_${groupInfo.user_Group_Id}" value="${groupInfo.user_Group_Name}" /> <input type="hidden" id="beforeGroupName_${groupInfo.user_Group_Id}" value="${groupInfo.user_Group_Name}" /></td>
					<td  align="left" ><select style="width:100%" class="chosenTnames">
							<c:set var="templateNamesList" value="${groupInfo.templateName}" />
							<c:set var="templateIdList" value="${groupInfo.templateId}" />
						<!-- 	<option value="0">Select</option> -->
							<c:forEach items="${templateNamesList}" var="templateName" varStatus="count">
								<option value="${templateIdList[count.index]}">${templateNamesList[count.index]}</option>
							</c:forEach>
					</select>
					</td>
					<td  align="left">${groupInfo.createDate}</td>
					<td align="center" ><input type="image" src="images/icon-edit.png" width="28px" height="28px" data-toggle="tooltip" title="Edit" style="border:none !important" onclick="editGroups('${groupInfo.user_Group_Id}');" /><input type="hidden" id="dynamicTId_${groupInfo.user_Group_Id}" value="${templateIdList}" /></td>
				</tr>
			</tbody>
		
	</c:forEach>
	
	</table>
	</div>
	
	<input type="hidden" id="groupIdVal" value="${groupId}" />
	<input type="hidden" id="userIdVal" value="${user.userId}" />
</body>
</html> 
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
	jQuery(".chosenFnames").chosen({width: "100%"});
	jQuery(".chosenFnames").chosen({"disable_search": true});
	
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



function submitFeatures(){
	var finalFid=$(".tempF").val();
	var groupName =$("#userGroupNameDb").val();
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
		 var url = "updatingORremovingFeatures.htm";
		 var parametersTokenVal="finalFid="+encodeURIComponent(finalFid)+"&userId="+encodeURIComponent(userId.trim())+"&groupId="+encodeURIComponent(groupId)+"&groupName="+encodeURIComponent(groupName);
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
				 //$.alert(data);
				 $.alert(data);
				 hideLoading();
				  showTable1('adminRageFeaturesDiv');
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
	
function editFeaturesGroups(x){
	$('#LsFeature').modal('show');
	var dynaFeaturesIds=$("#dynamicFId_"+x).val().toString();
	var editName=$("#groupName_"+x).val().toUpperCase();
	$("#userGroupNameDb").val(editName);
	$("#groupNameOld").val(editName);
	var arrset = JSON.parse(dynaFeaturesIds);
	$(".tempF").val(arrset);
	$(".tempF").trigger("chosen:updated");
	$("#groupIdVal").val(x);
}

</script>

</head>
<body>

<!-- Button trigger modal -->
<!-- Modal -->
<div id="loadinglayer"></div>
	<div class="modal fade" id="LsFeature" tabindex="-1" role="dialog"
		aria-labelledby="groupFeaturesLabel" data-backdrop="static"
		data-keyboard="false" style="padding-top: 98px">
		<div class="modal-dialog" role="document" style="width: 50%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myFeaturesLabelId">Update User Group Features</h4>
				</div>
				<div class="modal-body mb-custom-pad-new custom-height">
					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						class="newTable">
						<tr>
							<td valign="top" width="130px"><label>User Group Name :</label></td>
							<td><input type="text" class="input" id="userGroupNameDb"
								style="width: 100% !important; margin: 0 10px 10px 0" readonly="readonly"/>
								<input type="hidden" class="input" id="groupNameOld" /></td>
						</tr>
						<tr>
							<td valign="top"><label>Add Features Names:</label></td>
							<td><select class="chosen tempF" multiple="true"
								id="ch-select" selected="selected"
								style="width: 400px; margin: 0 0 0 10px">
									<c:forEach items="${featureList}" var="featureNames"
										varStatus="status">
										<option value="${featureNames.key}">${featureNames.value}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="submitFeatures()">Submit</button>
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
			 <th class="th-bdr">Group Name</th>
			 <th class="th-bdr">Feature Names</th>
			 <th style="text-align:center !important" class="th-bdr">Edit</th>
		</tr>	 
		</thead>

	<c:forEach items="${listOfFeaturesbyGroupIds}" var="featureDetails" varStatus="loop">
		<c:set var="groupId" value="${featureDetails.key}" />
		<c:set var="groupInfo" value="${featureDetails.value}" />
		
			<tbody>
				<tr>
					<%-- <td  align="left" ><c:out value="${groupId}" /></td> --%>
					<td align="left" >  <c:out value="${groupInfo.userGroupName.toUpperCase()}" /><input type="hidden" id="groupName_${groupInfo.userGroupId}" value="${groupInfo.userGroupName}" /> <input type="hidden" id="beforeGroupName_${groupInfo.userGroupId}" value="${groupInfo.userGroupName}" /></td>
					<td  align="left" ><select style="width:150px" class="chosenFnames">
							<c:set var="featuresNamesList" value="${groupInfo.featureNames}" />
							<c:set var="featureList" value="${groupInfo.featureIds}" />
						<!-- 	<option value="0">Select</option> -->
							<c:forEach items="${featuresNamesList}" var="featureName" varStatus="count">
								<option value="${featuresNamesList[count.index]}">${featuresNamesList[count.index]}</option>
							</c:forEach>
					</select>
					</td>
					<td align="center" ><input type="image" src="images/icon-edit.png" width="28px" height="28px" data-toggle="tooltip" title="Edit" style="border:none !important" onclick="editFeaturesGroups('${groupInfo.userGroupId}');" /><input type="hidden" id="dynamicFId_${groupInfo.userGroupId}" value="${featureList}" /></td>
				</tr>
			</tbody>
		
	</c:forEach>
	
	</table>
	</div>
	<input type="hidden" id="groupIdVal" value="${featureList}" />
	<input type="hidden" id="userIdVal" value="${user.userId}" />
</body>
</html> 
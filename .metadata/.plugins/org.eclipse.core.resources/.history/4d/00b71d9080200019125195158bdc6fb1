<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="js/common.js?value=${applicationScope['version']}"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
	$(".manageuserTable tbody tr:odd").css("background-color", "#f4f4f4");
	$(".manageuserTable tbody tr:even").css("background-color", "#ffffff");	
	
	$("#mngTable").show();
	$("#mngTable1").hide();
	
	$("#rdbGroup").click(function(){
	$("#mngTable").show();
	$("#mngTable1").hide();
	
	
	});
	
	$("#rdbTemplate").click(function(){
	$("#mngTable").hide();
	$("#mngTable1").show();
	});
	
	$(".chosen").chosen({width: "500px"});
	$(".chosenTnames").chosen({width: "500px"});
	$(".chosenTnames").chosen({"disable_search": true});
	console.info("type="+'${type}');
	if('${type}'=='TEMPLATE'){
    $("#rdbTemplate").attr("checked", true).trigger("click");
	}else{
	$("#rdbGroup").attr("checked", true).trigger("click");		
	}
		
	});
	
function editComponentScreen(userGroupId){
	$('#componentPopup').modal('show');
	var componentIds=$("#inputFieldId"+userGroupId).val();
	var componentIdsArray=componentIds.split(',');
	console.info("componentIdsArray5="+componentIdsArray);
	$("#userGroupId").val(userGroupId);
	var array = JSON.parse("[" + componentIds + "]");
	$(".selectDropdownClass").val(array);
	$(".selectDropdownClass").trigger("chosen:updated");
}
 function editTemplateComponentScreen(templateId){
	$('#TemplatecomponentPopup').modal('show');
	//var templateComponentIds=$("#templateInputFieldId"+templateId).val();
	var templateComponentIdsArray = new Array();
	$("input[id=templateInputFieldId"+templateId+"]").each(function() {
		 if($.trim(this.value)!='') {
		templateComponentIdsArray.push($(this).val());	
		}
	});
	console.info("templateComponentIdsArray="+templateComponentIdsArray);
	//var templateComponentIdsArray=templateComponentIds;
	console.info("length="+templateComponentIdsArray.length);
	$("#templateId").val(templateId);
	if(templateComponentIdsArray.length > 0){   
	var templArray = JSON.parse("[" + templateComponentIdsArray + "]");
	console.info("templArray="+templArray);
	$(".TemplateCompChoosen").val(templArray);
	$(".TemplateCompChoosen").trigger("chosen:updated");
	}else{
	$(".TemplateCompChoosen").val('');
	$(".TemplateCompChoosen").trigger("chosen:updated");
	}
	
} 

function submitTemplatecomponentForm(groupType){
	console.info("in submitTemplatecomponentForm");
	var id="";
	var selectedValuesArray=[];
	
	if(groupType==="TemplateBased"){
	 var TemplateScreenCounter=$("#TemplateScreenCounter").val();
	 var selectedValues =$("#TemplateScreenCounter-"+i).chosen().val()
	 for(var i=1;i<=TemplateScreenCounter;i++){
	 var selectedValues=$("#TemplateCompChoosen-"+i).chosen().val();
	 console.info("selectedValues="+selectedValues);
	 selectedValuesArray.push(selectedValues);
	 }
	 id=$("#templateId").val();
	}else if(groupType==="UserGroupBased"){
	 var GroupScreenCounter=$("#GroupScreenCounter").val();
	 for(var i=1;i<=GroupScreenCounter;i++){
       var selectedValues=$("#ch-select-"+i).chosen().val();
       console.info("selectedValues="+selectedValues);
       selectedValuesArray.push(selectedValues);
		}
	 console.info("selectedValuesArray="+selectedValuesArray);
     	id =$("#userGroupId").val();
	}
	 console.info("selectedValues values="+selectedValuesArray);
	var actionUrl="updateTemplateScreenComponent.htm";
	var processData="id="+id+"&selectedValues="+selectedValuesArray+"&groupType="+groupType;
	successData=function(data)
	{
		$.ajaxSetup({
			 async:true,
			 cache: true
		});
		
	 hideLoading();
	  if(data){
		 if(groupType==="UserGroupBased"){
		  $.alert("Component assigned successfully.")
		  $('#componentPopup').modal('hide');
		  showComponentDiv("adminComponentDiv","USERGROUP");
		 }else if(groupType==="TemplateBased"){
		  $.alert("Template assigned successfully.")
		  $("#TemplatecomponentPopup").modal('hide');
		  showComponentDiv("adminComponentDiv","TEMPLATE");
		 }
		
		 $('.modal-backdrop').hide();
	   }else{
		   $.alert("Failed..");
	   }
	 
	};
	errorData=function(data)
	{
		hideLoading();
	};
	if(selectedValues=='')
	{
	$.alert("Please select data");
	}
	else
	{
	showLoading();
	callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
	} 
}
</script>

<style>

</style>
</head>
<body>

<div class="modal fade" id="componentPopup" tabindex="-1" role="dialog" aria-labelledby="groupTemplateLabel" data-backdrop="static" data-keyboard="false" style="padding-top: 100px">
		<div class="modal-dialog" role="document" style="width: 51%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myTemplateLabelId">Update Page Input Field</h4>
				</div>
				<div class="modal-body" style="padding:20px 20px 80px 20px">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="tblstyle newTable">
						<thead>
							<tr>
								<th style="text-align:left; width:30%">Page Name</th>
								<th style="text-align:left;">Input Field Name</th>
							</tr>
						</thead>
						<tbody>
						
						<input type="hidden" id="userGroupId" name="userGroupId" value="" />
					   <c:set var="GroupScreenCounter" value="0"/>
						<c:forEach var="screenData" items="${screenDataMap}">
						<c:if test="${fn:contains(userGrpCompList,screenData.key)}">
						<c:set var="GroupScreenCounter" value="${GroupScreenCounter+1}"/>
						  	<tr>
								<td>${screenData.key}</td>
								<td>
						          <select name="userGroupDropdown" class="chosen selectDropdownClass" multiple="true" id="ch-select-${GroupScreenCounter}" selected="selected" style="margin: 0 0 0 10px">
							       <c:forEach items="${screenData.value}" var="applicationScreenComponents" varStatus="loop">
							       <c:if test="${applicationScreenComponents.groupType eq 'USERGROUP'}">
							       <option value="${applicationScreenComponents.screenId}">${applicationScreenComponents.componentName}</option>
							       </c:if>
							       </c:forEach>
								   </select>
								</td>
							</tr>
							</c:if>
						 </c:forEach>
						<input type="hidden" id="GroupScreenCounter" value="${GroupScreenCounter}"/>	
						
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="submitTemplatecomponentForm('UserGroupBased');">Submit</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>

				</div>
			</div>
		</div>
	</div>
	
	  <div class="modal fade" id="TemplatecomponentPopup" tabindex="-1" role="dialog" aria-labelledby="groupTemplateLabel" data-backdrop="static" data-keyboard="false" style="padding-top: 100px">
		<div class="modal-dialog" role="document" style="width: 48%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myTemplateLabelId">Update Input Field By Template Name </h4>
				</div>
				<div class="modal-body" style="padding:20px 20px 80px 20px">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="tblstyle newTable">
						<thead>
							<tr>
								<th style="text-align:left; width:30%">Page Name</th>
								<th style="text-align:left;">Input Field Name</th>
							</tr>
						</thead>
						<tbody>
						<input type="hidden" id="templateId" name="templateId" value="" />
						 <c:set var="TemplateScreenCounter"  value="0"/>
						 <c:forEach var="screenData" items="${screenDataMap}">
						 <c:if test="${fn:contains(templateCompList,screenData.key)}">
						  <c:set var="TemplateScreenCounter" value="${TemplateScreenCounter+1}"/>
						 	<tr>
								<td>${screenData.key}</td>
								<td>
						          <select name="TemplateCompChoosen" class="chosen TemplateCompChoosen" multiple="true" id="TemplateCompChoosen-${TemplateScreenCounter}" selected="selected" style="margin: 0 0 0 10px">
						           <c:forEach items="${screenData.value}" var="applicationScreenComponents" varStatus="loop">
							        <c:if test="${applicationScreenComponents.groupType eq 'TEMPLATE'}">
							       <option value="${applicationScreenComponents.screenId}">${applicationScreenComponents.componentName}</option>
							       </c:if>
							       </c:forEach>
								   </select>
								</td>
							</tr>
							 </c:if> 
							</c:forEach>
							<input type="hidden" id="TemplateScreenCounter" value="${TemplateScreenCounter}"/>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="submitTemplatecomponentForm('TemplateBased');">Submit</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>

				</div>
			</div>
		</div>
	</div> 
 



<div style="border:1px solid #ccc; background:#fff;  margin-top:0px; padding:6px 0 5px 10px;">
	<input type="radio" name="group" id="rdbGroup" checked="checked"  value="1" style="margin:8px 5px 0 0" /><label for="r1">By User Group</label>
	<input type="radio" name="group" id="rdbTemplate" style="margin:8px 5px 0 20px"/><label>By Normalization Template</label>
</div>
<div id="mngTable" style="height:410px; overflow:auto; display:none">
<table width="100%" cellpadding="5" cellspacing="0" border="0" id="tblGroup" class="manageuserTable newTable datatable-new table table-bordered" >
<thead>
	<tr>
		 <th width="35%">User Group Name</th>
		 <th width="35%">Assigned Page Input Field</th>
		 <th style="text-align:center !important; width:10%">Edit</th>
	</tr>	 
</thead>
	<tbody>

		
 <c:forEach var="userGroupEntry" items="${userGroupDetails}">
	<tr>
		<td align="left">${userGroupEntry.key}</td>
		
		<td align="left">
		   <c:set var="selectedComponentList"  value=""/>
		   <c:set var="tempScreenName"  value=""/>
		   <div>
		  
		   <c:forEach var="screenEntry" items="${screenListDetails}" varStatus="loop">
		   <c:if test="${screenEntry.groupType eq 'USERGROUP' }">
		   
		   <c:if test="${tempScreenName ne screenEntry.screenName}">
		  	<c:if test="${loop.index ne 0}">
		  	</br>
		  	</c:if>
		   <b>${screenEntry.screenName}</b> :
		   <c:set var="tempScreenName" value="${screenEntry.screenName}"/>
		   </c:if>
		  
		   <c:forEach var="mappingEntry" items="${mappingDetails}">
		   <c:if test="${(mappingEntry.screenId eq screenEntry.screenId) && (mappingEntry.usersGroupId eq userGroupEntry.value) }">
		   ${screenEntry.componentName}
		    <c:if test="${!loop.last}">,</c:if>
		   <c:choose>
		    <c:when test="${!empty selectedComponentList}">
		    <c:set var="selectedComponentList" value="${selectedComponentList},${mappingEntry.screenId}" />
		   </c:when>
		   <c:otherwise>
		    <c:set var="selectedComponentList" value="${mappingEntry.screenId}" />
		   </c:otherwise>
		    </c:choose>
		   </c:if>
		   </c:forEach>
		    
		   </c:if>
		   </c:forEach>
		   </div>
		  <input type="hidden" name="inputFieldId" id="inputFieldId${userGroupEntry.value}" value="${selectedComponentList}"/>
	   </td>
	   
	    <td align="center"><input type="image" onclick="editComponentScreen(${userGroupEntry.value});" src="images/icon-edit.png"  data-toggle = "modal"  width="28px" height="28px" data-toggle="tooltip" title="Edit" style="border:none !important" />
	    </td>
	   </tr>
       </c:forEach>
   </tbody>
</table>
</div>

<div id="mngTable1" style="height:425px; overflow:auto; display:none">
 <table width="100%" cellpadding="5" cellspacing="0" border="0" id="tblTemplate" class="manageuserTable newTable datatable-new table table-bordered">
<thead>
	<tr>
		 <th width="35%">Template Name</th>
		 <th width="35%">Assigned Page Input Field</th>
		 <th style="text-align:center !important; width:10%">Edit</th>
	</tr>	 
</thead>
	<tbody>
	
	<c:forEach var="templateObj" items="${templateList}">
		<tr>
			<td align="left">${templateObj.value}</td>
		<c:set var="selectedTemplateComponentList"  value=""/>	
		<c:set var="templateTempName" value=""/>
		<td align="left">
		 <div>
		<c:forEach var="screenEntry" items="${screenListDetails}">
	     <c:if test="${screenEntry.groupType eq 'TEMPLATE'}">
		  
		    <c:if test="${templateTempName ne screenEntry.screenName}">
		   <b>${screenEntry.screenName}</b> :
		   <c:set var="templateTempName" value="${screenEntry.screenName}"/>
		   </c:if>
		    
		  <c:forEach var="mappingEntry" items="${mappingDetails}">
		   <c:if test="${(mappingEntry.screenId eq screenEntry.screenId) && (mappingEntry.templateId eq templateObj.key) }">
		     ${screenEntry.componentName},
		   <c:choose>
		    <c:when test="${!empty selectedComponentList}">
		    <c:set var="selectedTemplateComponentList" value="${selectedComponentList},${mappingEntry.screenId}" />
		   </c:when>
		   <c:otherwise>
		    <c:set var="selectedTemplateComponentList" value="${mappingEntry.screenId}" />
		   </c:otherwise>
		    </c:choose>
		    
		   </c:if>
		   </c:forEach>
		   <input type="hidden" name="templateInputFieldId" id="templateInputFieldId${templateObj.key}" value="${selectedTemplateComponentList}"/>
		 </c:if>
	   	</c:forEach>
	   	</div><!-- End second column div -->
	    <td align="center"><input type="image" onclick="editTemplateComponentScreen(${templateObj.key});" src="images/icon-edit.png"  data-toggle = "modal"  width="28px" height="28px" data-toggle="tooltip" title="Edit" style="border:none !important" />
	    </td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div> 
</body>
</html>
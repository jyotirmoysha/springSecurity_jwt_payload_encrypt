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
<script>
$(function() {
	$(".parserSectionTable").tableHeadFixer();
	$(".parserSectionTable tbody tr:odd").css("background-color", "#f4f4f4");
	$(".parserSectionTable tbody tr:even").css("background-color", "#ffffff");	
	jQuery(".chosen").chosen({width: "100%"});
	jQuery(".chosenSectionClass").chosen({width: "100%"});
	jQuery(".chosenSectionClass").chosen({"disable_search": true});
	
});

function editParserSectionMapping(parserID)
{
	
	$('#parserSectionDiv').modal('show');
	$("#myModalLabelId").html("Update Parser Section");
	var dynaparserIds=$("#dynamicPId_"+parserID).val().toString();
	
	var editedParserName=$("#parserName_"+parserID).val();
	
	var arrset = JSON.parse(dynaparserIds);
	$(".selectedSectionClass").val(arrset);
	$(".selectedSectionClass").trigger("chosen:updated");
	$("#parserId").val(parserID);
	$("#parserNameDb").val(editedParserName);
	$("#parserNameOld").val(editedParserName);
}
function submitParserSectionMapping(){
	var finalSectionId=$(".selectedSectionClass").val();
	if(finalSectionId==null){
		finalSectionId="";
	}
		
	console.info("section:"+finalSectionId);
	var parserId=$("#parserId").val();

	
	var url = "editParserSectionMapping.htm";
   var parametersDynamic="finalSectionId="+encodeURIComponent(finalSectionId)+"&parserId="+encodeURIComponent(parserId);
	var urlAdmin=insertParam(url);
	$.ajaxSetup({
		cache: true
	});
		 showLoading();
		$.ajax({
			 type: "POST",  
			   url: urlAdmin,
			   data:parametersDynamic,
			   cache: true,
			 success: function(data){
		     result = JSON.parse(data);
		     var result = JSON.parse(data); 
				if(result){
				$.alert("Parser Wise section mapping updated successfuly.");
				}else{
				$.alert("failed");
				}
				 hideLoading();
				 showParserSectionMappingDiv("parserSectionMappingDiv");
				 $("#btnMymodal").hide();
			},error: function(data) {
				$.alert("error");
				hideLoading();
			}	
		}); 
	
	
}
</script>
<style type="text/css">
body{margin:0px; padding:0px;}
.jconfirm.jconfirm-white .jconfirm-box, .jconfirm.jconfirm-light .jconfirm-box{margin:200px 0 0 50px !important}
.chosen-container-multi .chosen-choices {overflow:auto !important; max-height:150px !important; min-height:auto !important}
#parserSectionDiv .chosen-container{width:310px !important;}
.parserSectionTable tbody tr td{padding:3px 6px 4px 6px !important}
</style>
</head>
<body>

<!-- Button trigger modal -->


<!-- Modal -->
<div id="loadinglayer"></div>

<div class="modal fade" id="parserSectionDiv" tabindex="-1" role="dialog" aria-labelledby="parserSectionDivLabel" data-backdrop="static" data-keyboard="false" style="padding-top:100px">
  <div class="modal-dialog" role="document" style="width:38%">
    <div class="modal-content">
      <div class="modal-header" style="padding:6px 12px 6px 12px !important">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top:9px !important"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabelId">Parser Section Mapping</h4>
      </div>
      <div class="modal-body" style="padding:20px 0px 100px 20px !important">
       <table width="100%" cellpadding="0" cellspacing="0" border="0" class="newTable">
			<tr>
			<td valign="top" width="30%"><label>Parser Name :</label></td>
			<td><input type="text" class="input" id="parserNameDb" readonly="readonly"  style="width:310px !important; margin:0 10px 10px 0"/><input type="hidden" class="input" id="parserNameOld" /></td>
			</tr>
			<tr>
			<td valign="top"> <label>Add Section Names:</label></td>
			<td>
				<select class="chosen selectedSectionClass" multiple="true" id="ch-select" selected="selected" style="width: 400px; margin:0 0 0 10px">
				<c:forEach items="${sectionList}" var="sectionList" varStatus="status">
				<option value="${sectionList.key}">${sectionList.value}</option>
				</c:forEach>
				</select>
			</td>
			</tr>

	  </table>
	  <input type="hidden" name="parserId" id="parserId"/> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitParserSectionMapping()">Submit</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
        
      </div>
    </div>
  </div>
</div>

	<div class="mngTable" style="height:480px; overflow:auto">
	<table width="100%" cellpadding="5" cellspacing="0" border="0" class="parserSectionTable newTable datatable-new table table-bordered">
	<thead>
		<tr>
<!-- 		<th>Group Id</th> -->
			 <th width="30%">Parser Name</th>
			 <th style="z-index:1">Section Names</th>
			 <th width="10%">Edit</th>
			 
		</tr>	 
		</thead>

	<c:forEach items="${parserSectionMapping}" var="parserSectionMapping" varStatus="loop">
		<c:set var="parserId" value="${parserSectionMapping.key}" />
		<c:set var="parserInfo" value="${parserSectionMapping.value}" />
		
			<tbody>
				<tr>
					<%-- <td  align="left" ><c:out value="${groupId}" /></td> --%>
					<td align="left" ><c:out value="${parserInfo.parser_name}" /><input type="hidden" id="parserName_${parserInfo.parserId}" value="${parserInfo.parser_name}" /> <input type="hidden" id="beforeParserName_${parserInfo.parserId}" value="${parserInfo.parser_name}" /></td>
					<td  align="left" ><select style="width:150px" class="chosenSectionClass">
							<c:set var="sectionNameList" value="${parserInfo.sectionName}" />
							<c:set var="sectionIdList" value="${parserInfo.sectionId}" />
						
							<c:forEach items="${sectionNameList}" var="sectionName" varStatus="count">
								<option value="${sectionIdList[count.index]}">${sectionName}</option>
							</c:forEach>
					</select>
					</td>
					<td align="center" ><input type="image" src="images/icon-edit.png" width="28px" height="28px" data-toggle="tooltip" title="Edit" style="border:none !important" onclick="editParserSectionMapping('${parserInfo.parserId}');" /><input type="hidden" id="dynamicPId_${parserInfo.parserId}" value="${sectionIdList}" /></td>
				</tr>
			</tbody>
		
	</c:forEach>
	
	</table>
	</div>
</body>
</html> 
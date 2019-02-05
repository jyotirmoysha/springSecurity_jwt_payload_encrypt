<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/rules_pdf_basedparser_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css">
<link rel="stylesheet" type="text/css" href="css/jquery.multiselect.css" />
<script type="text/javascript" src="js/jquery.multiselect.js"></script>
<script>
function viewGlobalMetadata(){
	showLoading();
    processData='&displayRecords=50';
	actionUrl="viewGlobalDataPopUp.htm";
	successData=function(data)
	{
	$('#viewGlobalPopUpId').html(data);
	hideLoading();
	};
	errorData=function(data)
	{
		$.alert("Fail");
		hideLoading();
	};
	console.info("--------Value Validated-------");
	retDataType="html";
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);		
}



function editRowClick(obj)
{
if($(obj).hasClass('updateRow'))
{
	$(obj).prev().show();
	$(obj).remove();
}else{
var extractionRuleId=$(obj).children('td').find("[id='checkbox']").val();
var sectionId = $(obj).find("#sectionId").text().trim();
var templateSectionMappingId = $(obj).find("#templateSectionMappingId").text().trim();
var sectionName = $(obj).find("#sectionName").text().trim(); 
var pageNumber = $(obj).find("#pageNumber").text().trim(); 
var concept = $(obj).find("#concept").text().trim(); 


/**Here row table id means section**/
var sectionTemp=$(obj).closest('table').attr('id');
var sectionArr = sectionTemp.split('Table');
var sectionName=sectionArr[0];
var inputs='<tr class="updateRow" ondblClick="editRowClick($(this));" id="'+extractionRuleId+'">';
inputs+='<input type="hidden" name="itrSection" value="'+sectionName+'" />';
inputs += '<input type="hidden" name="extractionRuleId" value="'+extractionRuleId+'" />';
inputs+='<td><input type="checkbox"  name="checkbox" id="checkbox" name="extracttionCheckbox" value="'+extractionRuleId+'"/></td>';	
inputs+='<td style="display: none;"><input type="hidden" class="form-control" name="sectionId" readonly autocomplete="off" value="'+templateSectionMappingId+'" /></td>';
inputs+='<td><input type="text" class="form-control" name="templateSectionMappingId" readonly autocomplete="off" value="'+templateSectionMappingId+'" /></td>';
inputs+='<td><input type="text" class="form-control" name="sectionName" readonly autocomplete="off" value="'+sectionName+'" class="wdt-96" /></td>';
inputs+='<td><input type="number" class="form-control pageNumber" name="pageNumber" autocomplete="off" value="'+pageNumber+'" /></td>';
inputs+='<td><input type="text" class="form-control concept" name="concept" autocomplete="off" value="'+concept+'" class="wdt-96" /></td>';
inputs+='</tr>';
$(obj).css("display", "none");
$(obj).after(inputs);

}//end else
}//end function

function checkCheckboxChecked(checkBoxName)
{
	var len = $("[name='"+checkBoxName+"']:checked").length;
	if(len>0)
	return true;
	else 
	return false;
}

function addRowTable(section,sectionId)
{
var sectionName=section;
var templateSectionMappingId=$('#'+section+'Table').attr('tablesectionid');
var rowCount = $('#'+section+' tr').length;
var inputs = '<tr class="addRow">';
var inputs = '<tr class="addRow">';
inputs += '<input type="hidden" name="itrsection" value="'+section+'" />';
inputs += '<input type="hidden" name="extractionRuleId" value="0" />';
inputs += '<td><input type="checkbox" name="checkbox" id="checkbox" value="0"/></td>';
inputs += '<td style="display: none;"><input type="hidden" class="form-control" name="sectionId" autocomplete="off" readonly value="'+templateSectionMappingId+'" /></td>';
inputs += '<td><input type="text" class="form-control" name="templateSectionMappingId" autocomplete="off" readonly value="'+templateSectionMappingId+'" /></td>';
inputs += '<td><input type="text" class="form-control" name="sectionName" autocomplete="off" readonly value="'+sectionName+'" class="wdt-96" /></td>';
inputs += '<td><input type="number" class="form-control pageNumber" name="pageNumber" autocomplete="off" value="" /></td>';
inputs += '<td><input type="text" class="form-control concept" name="concept" autocomplete="off" value="" class="wdt-96" /></td>';
inputs += '</tr>';
$('#'+section+'Table tr:last').after(inputs);
}


/**
 * This function used for Update Rules at Global Level in LS_PDF_EXTRACTION_METADATA  
 *
 */
 function updateRulesAtGlobalLevel(){
		var checkedCheckboxArray = new Array();
		$("input[name='extracttionCheckbox']").each(function() {
			if ($(this).prop("checked") == true) {
				var i = $(this).closest('tr').find('td input:first').val();
				checkedCheckboxArray.push(i);
			} 
			});
	
	 if(checkedCheckboxArray!=0) {
	var processData= "&checkboxArray="+encodeURIComponent(checkedCheckboxArray);
   actionUrl = "updateRulesAtGlobalLevel.htm";
    successData = function(data) {
		$.alert(data);
	try {
		$.ajaxSetup({
			async : false,
			cache: true
		});
		hideLoading();

	} catch (e) {
		hideLoading();
		$.alert("Error:" + e);
	}
};
	
showLoading();
callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
 }//end if
 else{
	 $.alert("Please select at least one row");
 }
 }

</script>
<style>
body{overflow:hidden !important}
#MetaDataModal{padding-top:97px !important}
</style>
<c:if test="${not empty msg}">
<script>
$.alert('${msg}');
</script>
</c:if>

<div style="height:410px; overflow:auto; padding-bottom:0px"> 
<c:forEach items="${itrExtractionRulesMap}" var="dataMapByTableId">
<div class="custom-margin">
<c:choose>
<c:when test="${dataMapByTableId.key == '1' || dataMapByTableId.key == '2'}">
<c:set var="dataMapBySection" value="${dataMapByTableId.value}"/>

<c:forEach items="${dataMapBySection}" var ="sectionWiseMap">
<!-- Here we get map Like Map<'IS',ListObject> -->

<table width="100%" border="0" cellspacing="0" cellpadding="10" class="newTable"  id="">
  <tr>
    <td width="100%" class="white-strip">
    <strong><c:out value="${sectionNameIdMap[sectionWiseMap.key].sectionDescription}"/></strong>
    <span class="pull-right"><a  href="Javascript:void('0');" onclick="addRowTable('${sectionWiseMap.key}','${sectionNameIdMap[sectionWiseMap.key].sectionId}');" ><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a></span>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5" class="newtable"  id="${sectionWiseMap.key}Table" tablesectionid="${sectionNameIdMap[sectionWiseMap.key].templateSectionMappingId}">
  <tr class="throw row-bg">
    <td width="2%" lign="center" class="bg-blue-new"></td>
    <td width="13%" class="bg-blue-new"><strong>SECTION ID</strong></td>
    <td width="23%" align="left" class="bg-blue-new"><strong>SECTION</strong></td>
    <td width="11%" align="left" class="bg-blue-new"><strong>PAGE NUMBER</strong></td>
    <td width="25%" align="left" class="bg-blue-new"><strong>CONCEPT</strong></td>     
  </tr>
  
  
<c:forEach items="${sectionWiseMap.value}" var="dataList">
  <tr class='even' ondblClick="editRowClick($(this));">
  <td><input type="checkbox" id="checkbox" name="extracttionCheckbox" class="checkbox" value="${dataList.extractionRuleId}"></td>
  
  <td id="sectionId" style="display: none;">
  ${fn:trim(dataList.sectionId)}
  </td>
  
  <td id="templateSectionMappingId">
  ${fn:trim(dataList.templateSectionMappingId)}
  </td>
  
  <td id="sectionName">
  ${fn:trim(dataList.sectionName)}
  </td>
  
  <td id="pageNumber">
  ${fn:trim(dataList.pageNumber)}
  </td>
  
  <td id="concept">
  <c:if test="${dataList.concept.trim() ne 'null'}">
  ${dataList.concept}
  </c:if>
  </td>
  </tr>

</c:forEach>
  
</table>
</c:forEach>

</c:when>

</c:choose>
</div>
</c:forEach><!-- end table wise map -->
</div>


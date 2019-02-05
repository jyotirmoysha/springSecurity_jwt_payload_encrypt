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

function showCustomConfigPoupUp(filingId)
{
showLoading();
processData="fillingId="+filingId;
actionUrl="custom_configuration.htm";
successData=function(data)
{
$('#customeConfigPoupId').html(data);
hideLoading();
$('#custom_config').modal('show');
};
errorData=function(data)
{
	//$.alert("Fail="+data);
	hideLoading();
};
console.info("--------Value Validated-------");
retDataType="html";
callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);

}


function editRowClick(obj,tableNumber)
{
if($(obj).hasClass('updateRow'))
{
	$(obj).prev().show();
	$(obj).remove();
}else{
var pemPid=$(obj).children('td').find("[id='checkbox']").val();

console.info("pem id="+pemPid);
var pemBeginPageNo = $(obj).find("#pemBeginPageNo").text().trim(); 	
var pemBeginKeyword = $(obj).find("#pemBeginKeyword").text().trim(); 
var pemendPageNo = $(obj).find("#pemendPageNo").text().trim(); 
var pemendKeyword = $(obj).find("#pemendKeyword").text().trim(); 
var pemRowSegmentationType = $(obj).find("#pemRowSegmentationType").text().trim(); 
var pemColumnNumberToSplit = $(obj).find("#pemColumnNumberToSplit").text().trim();
var pemeValueOrder=$(obj).find("[id='pemeValueOrder']").val();
console.info("pemRowSegmentationType="+pemRowSegmentationType);
if(tableNumber==='2')
{
	console.info("in 2");
var topic=$(obj).find("#topic").text().trim();
var extractionType=$(obj).find("#extractionType").text().trim();
var extractionArea=$(obj).find("#extractionArea").text().trim();
var rank=$(obj).find("#rank").text().trim();

}

/**Here row table id means section**/
var sectionTemp=$(obj).closest('table').attr('id');
var sectionArr = sectionTemp.split('Table');
var section=sectionArr[0];
console.info("section="+section);
var inputs='<tr class="updateRow" ondblClick="editRowClick($(this),'+tableNumber+');" id="'+pemPid+'">';
inputs+='<input type="hidden" name="section" value="'+section+'" />';
inputs += '<input type="hidden" name="tableNumber" value="'+tableNumber+'" />';
inputs+='<input type="hidden" name="pemeValueOrder" value="'+pemeValueOrder+'" />';
inputs += '<input type="hidden" name="pemPid" value="'+pemPid+'" />';
inputs+='<td><input type="checkbox"  name="checkbox" id="checkbox" name="extracttionCheckbox" value="'+pemPid+'"/></td>';	
inputs+='<td><input type="number" class="form-control" name="pemBeginPageNo" autocomplete="off" value="'+pemBeginPageNo+'" /></td>';
inputs+='<td><input type="text" class="form-control" name="pemBeginKeyword" autocomplete="off" value="'+pemBeginKeyword+'" class="wdt-96" /></td>';
inputs+='<td><input type="number" class="form-control" name="pemendPageNo" autocomplete="off" value="'+pemendPageNo+'" /></td>';
inputs+='<td><input type="text" class="form-control" name="pemendKeyword" autocomplete="off" value="'+pemendKeyword+'" class="wdt-96" /></td>';
inputs+='<td><select id="pemRowSegmentationType" class="form-control" name="pemRowSegmentationType" class="wdt-96">';

inputs+='<option value="">Select</option>';
if(pemRowSegmentationType==='ONE_LINE_ONE_ROW' || pemRowSegmentationType==='one_line_one_row')
{
inputs+='<option selected = "selected">ONE_LINE_ONE_ROW</option>';
inputs+='<option>ONE_PARA_ONE_ROW</option>';
}else if(pemRowSegmentationType==='ONE_PARA_ONE_ROW')
{
inputs+='<option selected = "selected">ONE_LINE_ONE_ROW</option>';
inputs+='<option>ONE_PARA_ONE_ROW</option>';
}else
{
inputs+='<option>ONE_LINE_ONE_ROW</option>';
inputs+='<option>ONE_PARA_ONE_ROW</option>';
}

inputs+='</select></td>';

inputs+='<td><input type="text"  name="pemColumnNumberToSplit" autocomplete="off" value="'+pemColumnNumberToSplit+'" class="wdt-96 form-control" /></td>';

if(tableNumber==='2' || tableNumber=='2')
{
	console.info("in 2 if");
	inputs +='<td>'+createTopicDropDown()+'</td>';
	inputs +='<td>'+createExtractionTypeDropDown()+'</td>';
	inputs +='<td>'+createExtractionArea()+'</td>';
	inputs +='<td><input id="rank" type="number" class="wdt-96 form-control" name="rank" value="'+rank+'"></td>';

}

inputs+='</tr>';
$(obj).css("display", "none");
$(obj).after(inputs);
//here we set selected value in withrespective dropdown
	if(topic!='')
	{
		console.info("value="+topic);
		var newOption = $('<option value="'+topic+'" selected>'+topic+'</option>');
		$('[name=topic]').append(newOption);

	}
	if(extractionType!=''){
	$('[name=extractionType]').val(extractionType);
	}
	if(extractionArea!=''){
	$('[name=extractionArea]').val(extractionArea);
	} 

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

function addRowTable(section,tableNumber)
{

var pemeValueOrder;
var rowCount = $('#'+section+' tr').length;
pemeValueOrder=rowCount;
var pemTableIdArrayID = new Array();
$("input[id=pemTableId]").each(function() {
	if($(this).val()!=''){
	pemTableIdArrayID.push($(this).val());
	}
});
var maxTableId=1;
if (pemTableIdArrayID.length >0)
{
maxTableId = Math.max.apply(Math,pemTableIdArrayID);
maxTableId=maxTableId+1;
}

var inputs = '<tr class="addRow">';

var inputs = '<tr class="addRow" ondblClick="editRowClick($(this),'+tableNumber+');">';
inputs += '<input type="hidden" name="tableNumber" value="'+tableNumber+'" />';
inputs += '<input type="hidden" name="section" value="'+section+'" />';
inputs += '<input type="hidden" name="pemeValueOrder" value="'+pemeValueOrder+'" />';
inputs += '<input type="hidden" name="pemPid" value="0" />';
inputs += '<input type="hidden" name="pemTableId" id="pemTableId" value="'+maxTableId+'" />';
inputs += '<td><input type="checkbox" name="checkbox" id="checkbox" value="0"/></td>';
inputs += '<td><input type="number" class="form-control" name="pemBeginPageNo" autocomplete="off" value="" /></td>';
inputs += '<td><input type="text" class="form-control" name="pemBeginKeyword" autocomplete="off" value="" class="wdt-96" /></td>';
inputs += '<td><input type="number" class="form-control" name="pemendPageNo" autocomplete="off" value="" /></td>';
inputs += '<td><input type="text" class="form-control" name="pemendKeyword" autocomplete="off" value="" class="wdt-96" /></td>';
inputs += '<td><select id="pemRowSegmentationType" name="pemRowSegmentationType" class="wdt-96 form-control">';
inputs += '<option value="">Select</option>';
inputs += '<option>ONE_LINE_ONE_ROW</option>';
inputs += '<option>ONE_PARA_ONE_ROW</option>';
inputs += '</select></td>';
inputs += '<td><input type="text" name="pemColumnNumberToSplit" class="form-control" autocomplete="off" value="" class="wdt-96"/></td>';
if(tableNumber==='2' || tableNumber=='2')
{
inputs +='<td>'+createTopicDropDown()+'</td>';
inputs +='<td>'+createExtractionTypeDropDown()+'</td>';
inputs +='<td>'+createExtractionArea()+'</td>';
inputs +='<td><input id="rank" type="number" class="wdt-96 form-control" name="rank" value=""></td>';
}
inputs += '</tr>';
$('#'+section+'Table tr:last').after(inputs);
}

function createExtractionArea()
{
var inputs="";
inputs+='<select id="extractionArea" name="extractionArea" class="wdt-96">';
inputs+='<option value="">Select</option>';
inputs+='<option value="Paragraph">Paragraph</option>';
inputs+='<option value="Table"}>Table</option>';
inputs+='</select>';
return inputs;

}
function createExtractionTypeDropDown()
{
var inputs="";
inputs +='<select id="extractionType" name="extractionType" class="wdt-96">';
inputs +='<option value="">Select</option>';
inputs +='<option value="Details">Details</option>';
inputs +='<option value="Address">Address</option>';
inputs +='</select>';
return inputs;
	
}

function createTopicDropDown()
{
var inputs="";
	inputs += '<select id="topic" name="topic" class="wdt-96">';
	inputs +='<option value="">Select</option>';
	inputs +='<option value="AVGBS">Average Balance Sheet</option>';
	inputs +='<option value="BSSEG">Business Segment</option>';
	inputs +='<option value="BUSSD">Business Description</option>';
	inputs +='<option value="DIOF">Director/Officers</option>';
	inputs +='<option value="GEO">Geographic</option>';
	inputs +='<option value="HR">Company Information</option>';
	inputs +='<option value="SHP">Shareholding Pattern</option>';
	inputs +='</select>';
	
	
	return inputs;
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
callAjax(processData, successData, errorData, beforeSend, actionUrl,
		reqType, retDataType);
 
 }//end if
 else{
 	$.alert("Please select at least one row");
 }
 }

</script>
<style>
body{overflow:hidden !important}
#MetaDataModal{padding-top:97px !important}
@media screen and (min-width: 1360px) and (min-height: 637px){
#parser-wrapper{height:413px; overflow:auto; padding-bottom:0px}
}

@media screen and (min-width: 1360px) and (min-height: 662px){
#parser-wrapper{height:443px; overflow:auto; padding-bottom:0px}
}
</style>
<c:if test="${not empty msg}">
<script>
$.alert('${msg}');
</script>
</c:if>

<div id="parser-wrapper"> 
<c:forEach items="${extractor_rule_list_map}" var="dataMapByTableId">
<div class="custom-margin">
<c:choose>
<c:when test="${dataMapByTableId.key == '1' || dataMapByTableId.key == '2'}">
<c:set var="dataMapBySection" value="${dataMapByTableId.value}"/>

<c:forEach items="${dataMapBySection}" var ="sectionWiseMap">
<!-- Here we get map Like Map<'IS',ListObject> -->

<table width="100%" border="0" cellspacing="0" cellpadding="10" class="newTable"  id="">
  <tr>
    <td width="100%" class="white-strip">
    <strong><c:out value="${sectionWiseMap.key}"/> Identification</strong>
    <span class="pull-right"><a  href="Javascript:void('0');" onclick="addRowTable('${sectionWiseMap.key}','${dataMapByTableId.key}');" ><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a></span>
    </td>
   
       
   
 
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5" class="newtable"  id="${sectionWiseMap.key}Table" >
  <tr class="throw row-bg">
    <td width="2%" lign="center" class="bg-blue-new"></td>
    <td width="13%" class="bg-blue-new"><strong>BEGIN PAGE NUMBER</strong></td>
    <td width="23%" align="left" class="bg-blue-new"><strong>BEGIN CONCEPT</strong></td>
    <td width="11%" align="left" class="bg-blue-new"><strong>END PAGE NUMBER</strong></td>
    <td width="25%" align="left" class="bg-blue-new"><strong>END CONCEPT</strong></td>
    <td width="13%" align="left" class="bg-blue-new"><strong>ROW TYPE</strong></td>
    <td width="12%" align="left" class="bg-blue-new"><strong>COLUMN TO SPLIT</strong></td>
    
    <c:if test="${dataMapByTableId.key == '2'}">
    <td align="left" class="bg-blue-new"><strong>TOPIC</strong></td>
    <td align="left" class="bg-blue-new"><strong>EXTRACTION TYPE</strong></td>
    <td align="left" class="bg-blue-new"><strong>EXTRACTION AREA</strong></td>
    <td align="left" class="bg-blue-new"><strong>RANK</strong></td>
    </c:if>
     
  </tr>
  
  
<c:forEach items="${sectionWiseMap.value}" var="dataList">
  <tr class='even' ondblClick="editRowClick($(this),'${dataMapByTableId.key}');">
  <input type="hidden" id="pemeValueOrder" value="${dataList.pemeValueOrder}"/>
  <input type="hidden" id="pemTableId" value="${dataList.pemTableId}"/>
  <td><input type="checkbox" id="checkbox" name="extracttionCheckbox" class="checkbox" value="${dataList.pemPid}"></td>
  <td id="pemBeginPageNo">
  ${fn:trim(dataList.pemBeginPageNo)}

  </td>
  <td id="pemBeginKeyword">
  <c:if test="${dataList.pemBeginKeyword.trim() ne 'null'}">
  ${dataList.pemBeginKeyword}
  </c:if>
  </td>
  <td id="pemendPageNo">

  ${fn:trim(dataList.pemendPageNo)}

  </td>
  <td id="pemendKeyword">
   <c:if test="${dataList.pemendKeyword.trim() ne 'null'}">
  ${dataList.pemendKeyword}
   </c:if>
  </td>
  <td id="pemRowSegmentationType">
  <c:if test="${fn:trim(dataList.pemRowSegmentationType) ne 'null'}">
  ${fn:trim(fn:toLowerCase(dataList.pemRowSegmentationType))}
  </c:if>
  </td>
  <td id="pemColumnNumberToSplit">${fn:trim(dataList.pemColumnNumberToSplit)}</td>
  
   <c:if test="${dataMapByTableId.key == '2'}">
   <td id="topic">
   <c:if test="${dataList.topic ne 'null'}">
   <c:choose>
    <c:when test="${dataList.topic eq 'AVGBS' }">Average Balance Sheet</c:when>
   <c:when test="${dataList.topic eq 'BSSEG' }">Business Segment</c:when>
    <c:when test="${dataList.topic eq 'BUSSD' }">Business Description</c:when>
    <c:when test="${dataList.topic eq 'DIOF' }">Director/Officers</c:when>
     <c:when test="${dataList.topic eq 'GEO' }">Geographic</c:when>
     <c:when test="${dataList.topic eq 'HR' }">Company Information</c:when>
    <c:when test="${dataList.topic eq 'SHP' }">Shareholding Pattern</c:when>
   <c:otherwise>${fn:trim(dataList.topic)}</c:otherwise>
   </c:choose>
   </c:if>
   </td>   <td id="extractionType">
   <c:if test="${dataList.extractionType.trim() ne 'null'}">
  	 ${fn:trim(dataList.extractionType)}
   </c:if>
   </td>
   <td id="extractionArea">
   <c:if test="${dataList.extractionArea.trim() ne 'null'}">
   ${fn:trim(dataList.extractionArea)}
   </c:if>
   </td>
   <td id="rank">

   ${fn:trim(dataList.rank)}

   </td>
   </c:if>
  </tr>

</c:forEach>
  
</table>
</c:forEach>

</c:when>

</c:choose>
</div>
</c:forEach><!-- end table wise map -->
</div>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
<script src="js/jquery.darktooltip.js"></script>

<style type="text/css" >
/* .modal-header {
	padding:15px;
	border-bottom:1px solid #e5e5e5;
	min-height:16.42857143px;
	background: #005d95;
	border-top-left-radius:5px;
	border-top-right-radius:5px;
} */
</style>
           

<c:choose>
<c:when test="${not empty templateIdIndustryName}">
<c:forEach items="${templateIdIndustryName}" var="nameId" varStatus="loop">
<script>
$("#selectedValueForNormalizedTemplateId").html('<c:out value='${nameId.nilIndustry}'/>');
</script>
</c:forEach>
</c:when>
</c:choose>
<script>
$('#Status').val("${currentStatus}");
</script>

	<!-- if parser is bank parser and section =Deposits then show  Custom Mapping and  Residual Mapping  -->
<c:if test="${sessionParserId eq '6' && statementFormat eq 'Deposits'}">
<script>
$('#residualMappingId').show();
$('#residualMapping').show();
</script>
</c:if>
<c:choose>
	<c:when test="${poAsRepVal1 eq '17' && caseId eq '1syq61SJFhECLn7Lhy5zDg_EEEE_'}">
	
		<script>
		document.getElementById('Status').selectedIndex = '7';
		</script>
	</c:when>

</c:choose>
<!-- 
This div is used for Custom Mapping Pop up
 -->
<form name="customMappingForm" id="customMappingForm">
<input type="hidden" name="encryptedFillingId" value="<c:out value='${caseId}'/>"/>
<input type="hidden" name="section" value="<c:out value='${statementFormat}'/>"/>
<div class="modal fade" id="popUp1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
     <div class="modal-content">
       <div class="modal-header" style="padding:8px;">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         <h4 class="modal-title" id="myModalLabel" style="color:#005d95; font-size:14px; font-weight:bold;"><div id="popupheader" style="color:#005d95;">Custom Mapping</div></h4>
       </div>
       <div class="modal-body">       
       		   		
       		<table id="popUpTable" width="100%" border="0" cellspacing="1" cellpadding="5" style="border-collapse: separate; border-spacing: 1px;" bgcolor="#ebebeb" id="myTable" class="tblstyle1">
			<tr>
			<td style="background:#6dbcbf;  border:none !important;"><label style="color:#fff;">As Reported Label</label></td>
			<td style="background:#6dbcbf;  border:none !important;"><label style="color:#fff;">Normalized Label</label></td>
			</tr>
			<tr>
			<td width="50%"><input type="text" name="custMapAsRepLabel" id="custMapAsRepLabel" value="" style="width:250px;"/></td>
			<td width="50%"><select name="custMapNormItem" id="custMapNormItem" class="customMapping" style="width:250px;">
			 <option value="">Select</option>  
			<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
		 		<option value="${NormItemLabel.niItem}~${NormItemLabel.nilLabel}">${NormItemLabel.nilLabel}</option> 
			</c:forEach>
			</select>
			</td>
			</tr>
			<tr>
			<td><input type="text" name="custMapAsRepLabel" id="custMapAsRepLabel" value="" style="width:250px;"/></td>
			<td><select name="custMapNormItem" id="custMapNormItem" class="customMapping" style="width:250px;">
			 <option value="">Select</option>  
			<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
		 		<option value="${NormItemLabel.niItem}~${NormItemLabel.nilLabel}">${NormItemLabel.nilLabel}</option> 
			</c:forEach>
			</select>
			</td>
			</tr>
			<tr>
			<td><input type="text" name="custMapAsRepLabel" id="custMapAsRepLabel" value="" style="width:250px;"/></td>
			<td><select name="custMapNormItem" id="custMapNormItem" class="customMapping" style="width:250px;">
			 <option value="">Select</option>  
			<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
		 		<option value="${NormItemLabel.niItem}~${NormItemLabel.nilLabel}">${NormItemLabel.nilLabel}</option> 
			</c:forEach>
			</select>
			</td>
			</tr>
			<!-- <tr>
			<td style="background:#fff"></td><td align="right" style="background:#fff"></td>
			</tr> -->
			</table>
			<div style="height:auto; width:100%; overflow:hiddden; text-align:right; margin-top:15px;"><input type="button" class="btn btn-info" name="custmap_button" id="custmap_button" value="Update" onclick="customMapping();" style="padding:"/></div>
			
       </div>           
     </div>
   </div>
 </div>
 </form>
 <!-- End pop up -->

				
<c:if test="${not empty normalizeDataList}">
<div style="margin-bottom:10px;">


<form id="norm-form">
<input type="hidden" name="encryptedFillingId" value="<c:out value='${caseId}'/>"/>
<input type="hidden" name="statementType" value="<c:out value='${statementFormat}'/>"/>
<input type="hidden" name="encryptedWqId" value="<c:out value='${wqId}'/>"/>
<input type="hidden" name="searchype" id="searchTypeText" value=""/>


 <c:forEach items="${distinctSubSectionList}" var="distinctSubSectionList" varStatus="loop">
    <div style="color: #005d95; font-size: 15px; font-weight:normal; margin: 0 0 0 ; padding:15px 0 5px;" ><c:out value="${distinctSubSectionList}" /></div>
   
 <table width="100%" border="0" cellspacing="1" cellpadding="5"  style="border-collapse: separate;  border-spacing:1px;" bgcolor="#ebebeb" id="myTable" class="tblstyle1">
 <tr class="throw">
    <td width="2%" bgcolor="#6dbcbf">&nbsp;</td>
   
    <td width="2%" align="center" bgcolor="#6dbcbf" ><strong>SEQ</strong></td>
    <td width="25%" align="center" bgcolor="#6dbcbf"><strong>As Reported Label</strong></td>
    <td width="2%" align="center" bgcolor="#6dbcbf"><strong>BU</strong></td>
    <td width="16%" align="center" bgcolor="#6dbcbf"><strong>Normalized Label</strong></td>
     <td width="10%" align="center" bgcolor="#6dbcbf" ><strong>Sub Section</strong></td> 
      <!-- Page Number column view only for bank parser and pdf based parser -->
      <c:if test="${parserId eq '6' || parserId eq '11'}">
         <td width="3%" align="center" bgcolor="#6dbcbf"><!-- <strong>Click-back</strong> --></td>
      </c:if>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="firstColumnId"><strong>Value1</strong></td>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="secondColumnId"><strong>Value2</strong></td>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="thirdsColumnId"><strong>Value3</strong></td>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="fourthColumnId"><strong>Value4</strong></td>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="fifthColumnId"><strong>Value5</strong></td>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="sixthColumnId"><strong>Value6</strong></td>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="seventhColumnId"><strong>Value7</strong></td>
    <td width="10%" align="center" bgcolor="#6dbcbf" id="eightsColumnId"><strong>Value8</strong></td>
  
  </tr>
  <c:if test="${addStatementButton eq true}">
        <tr>
	     <td colspan="14" ><a href="javascript:void(0);" onclick="showStmntlblhs(this,'${loop.index}')" class="show-stmnt-attr" value="${loop.index+1}">Statement Attributes </a></td>
	   </tr>
  </c:if>
  <c:forEach items="${normalizeDataList}" var="normalizeDataList">
   <c:if test="${normalizeDataList.poSubSection eq distinctSubSectionList }">
   
   <tr class="${normalizeDataList.rowClass}_${loop.index} poRow"  ondblclick="rowClick($(this))">
    <td><input type="checkbox" name="delPoId" id="checkbox" value="${normalizeDataList.poId}">
      </td>
      <td align="center" id="updSequence">${normalizeDataList.poIndexOrder}</td>
      <%-- <td align="left" id="updPoLable">${normalizeDataList.poAsRepLabel}</td> --%>
     <td align="left" title="${normalizeDataList.nonEnglishLabel}" id="updPoLable">${normalizeDataList.poAsRepLabel}</td>
     <input type="hidden" name="nonEnglishLabel" id="nonEnglishLabel" value="${normalizeDataList.nonEnglishLabel}"/>
     
     <c:choose>
         <c:when test="${normalizeDataList.poBreakup eq 'Y'}">
    	      <td align="center" id="brekUps"><input type="checkbox" name="upbrekUps" checked="checked" /></td>
          </c:when>
         <c:otherwise>
    	        <td align="center" id="brekUps"><input type="checkbox" name="upbrekUps" value="N" /></td>
         </c:otherwise>
     </c:choose>
     
     
     
       
    <td align="left" id="updNormLable">${normalizeDataList.normalizedLabel}</td>

        
     <td align="left" id="updSubSection">${normalizeDataList.poSubSection}</td> 
  	 
      
       <!-- Page Number column view only for bank parser and pdf based parser,W8 form ,Dealer form -->
      <c:if test="${parserId eq '6' || parserId eq '11' || parserId eq '14' || parserId eq '15' || parserId eq '17' || parserId eq '18' || parserId eq '16'}">
       <td align="left" id="tdPageNoId">
       <c:if test="${not empty normalizeDataList }">
       <a href="openPdfFile.htm?filingId=${caseId}&uploadId=${normalizeDataList.uploadId}#page=${normalizeDataList.pageNo}" target="_blank">[-]</a>
       </c:if>
        <input type="hidden" id="pageNo" name="pageNo" value="${normalizeDataList.pageNo}" />
       </td>
      </c:if> 
    
    
    
    <td align="right">
    <c:catch var ="catchException">
    <!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
     ${normalizeDataList.poAsRepVal1}
    </c:when>
    <c:otherwise>
   	<fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal1}" />
    </c:otherwise>
    </c:choose>
 
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal1}
	</c:if>
    	
  	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 1 }">
    			
    			<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
    <td align="right" >
    	<c:catch var ="catchException">
    	<!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
    	${normalizeDataList.poAsRepVal2}
    </c:when>
    <c:otherwise>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal2}" />
    	
    </c:otherwise>
    </c:choose>
   	
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal2}
	</c:if>
    	
    	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 2 }">
    			
    			<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
    <td align="right">
    	<c:catch var ="catchException">
   	<!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
    ${normalizeDataList.poAsRepVal3}	
    </c:when>
    <c:otherwise>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal3}" />
    </c:otherwise>
    </c:choose>
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal3}
	</c:if>
    	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 3 }">
    			<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
     <td align="right">
    	
    	<c:catch var ="catchException">
   	<!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
    	${normalizeDataList.poAsRepVal4}
    </c:when>
    <c:otherwise>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal4}" />
    </c:otherwise>
    </c:choose>
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal4}
	</c:if>
    	
    	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 4 }">
    		<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
    <td align="right">
    	
    	<c:catch var ="catchException">
   	<!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
    	${normalizeDataList.poAsRepVal5}
    </c:when>
    <c:otherwise>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal5}" />
    	
    </c:otherwise>
    </c:choose>
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal5}
	</c:if>
    	
    	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 5 }">
    			<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
    <td align="right">
    	
    	<c:catch var ="catchException">
   	<!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
   		${normalizeDataList.poAsRepVal6}
    </c:when>
    <c:otherwise>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal6}" />
    
    </c:otherwise>
    </c:choose>
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal6}
	</c:if>
    	
    	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 6 }">
    			<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
    <td align="right">
    	
    	<c:catch var ="catchException">
   	<!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
    	${normalizeDataList.poAsRepVal7}
    </c:when>
    <c:otherwise>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal7}" />
    	
    </c:otherwise>
    </c:choose>
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal7}
	</c:if>
    	
    	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 7 }">
    	<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
    <td align="right">
    	
    	<c:catch var ="catchException">
   	<!-- This condition used for if label is STATEMENT YEAR then dont apply number format -->
    <c:choose>
    <c:when test="${normalizeDataList.poAsRepLabel eq 'STATEMENT YEAR' || normalizeDataList.poAsRepLabel eq 'STATEMENT QUALITY' || normalizeDataList.poAsRepLabel eq 'STATEMENT DATE' || normalizeDataList.poAsRepLabel eq 'STATEMENT PERIOD'}">
    		${normalizeDataList.poAsRepVal8}
    </c:when>
    <c:otherwise>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${normalizeDataList.poAsRepVal8}" />
    
    </c:otherwise>
    </c:choose>
	</c:catch>

	<c:if test = "${catchException != null}">
  		${normalizeDataList.poAsRepVal8}
	</c:if>
    	
    	<c:set var="anchorList" value="${normalizeDataList.poanchors}"/>
    	<c:forEach items="${anchorList}" var="poAnchor" varStatus="status">
    		<c:if test="${poAnchor.paColumn eq 8 }">
    			<a href="javascript:void(0)" onclick="showAnchorFile('${customerId}','${wqId}','${caseId}','${poAnchor.paAnchor}')">[-]</a>
    		</c:if>
    	</c:forEach>
    </td>
    
  </tr>
  </c:if>
</c:forEach>
</table>
</c:forEach>




</form>
  </div>
<%-- //${normalizeDataList} --%>
</c:if>
<c:if test="${empty normalizeDataList}">
No Information Available.
</c:if>
<script>
/* $(document).ready( function(){
	
	$('.imgbtns').darkTooltip( {gravity:'south'});
	
}); */

//var row= $('#myTable tr:eq(1)').html();
//alert("row is : "+row);
//if(($("#myTable").find("tr:eq(1):empty"))){
	//var col= $('#row td:eq(1)').html();	
	$('#myTable tr:eq(1)').each(function(){
	 if(($('td:contains("Statement")',$(this)).length)){			
		 //alert("First row is empty");	
		 //setColumnHeaderForEmptyFirstRow();
		 	
	}else{	
		//alert("First row is not empty");
		//setColumnHeaderForNonEmptyFirstRow();
	}
	});
	

function setColumnHeaderForNonEmptyFirstRow(){
	//alert("Inside setColumnHeaderforNonEmptyFirstRow");
	$('#myTable tr:eq(1)').each(function(){
		var first = $(this).find("td:eq(5)").html();

		var myFirstSubString = first.substring(first.lastIndexOf("/")+1);
		var second = $(this).find("td:eq(6)").html();		
		var mySecondSubString = second.substring(second.lastIndexOf("/")+1);
		var third = $(this).find("td:eq(7)").html(); 
		var myThirdSubString = third.substring(third.lastIndexOf("/")+1);
		var fourth = $(this).find("td:eq(8)").html();
		var myFourthSubString = fourth.substring(fourth.lastIndexOf("/")+1);		
		var opt3='';
		opt3 = opt3.replace(/,/g, "");
		//remove , from string
		$("#firstYearSpanId").html(myFirstSubString.replace(/,/g, ""));		
	    $("#secondYearSpanId").html(mySecondSubString.replace(/,/g, ""));
	    $("#thirdYearSpanId").html(myThirdSubString.replace(/,/g, ""));
	    $("#fourthYearSpanId").html(myFourthSubString.replace(/,/g, ""));
		});
}

function setColumnHeaderForEmptyFirstRow(){
$('#myTable tr:eq(2)').each(function() {
	//alert("Inside setColumnHeader");
	
    var first = $(this).find("td:eq(5)").html();        
    console.info(first);
    var second = $(this).find("td:eq(6)").html();    
    var third = $(this).find("td:eq(7)").html();    
    var fourth = $(this).find("td:eq(8)").html();    
    
    $("#firstYearSpanId").html(first.replace(/,/g, ""));
    $("#secondYearSpanId").html(second.replace(/,/g, ""));
    $("#thirdYearSpanId").html(third.replace(/,/g, ""));
    $("#fourthYearSpanId").html(fourth.replace(/,/g, ""));
    
});

}
  
  /************** Undo Delete Row *****************/
  function undoDeleteRow()
  {
	$('.deleteRow').attr('checked', false);
	$('.deleteRow').parents('tr').show();
  }
 
  /************** Delete Row *****************/
  function deleteRow()
  {
	var checkElements = document.getElementsByName('delPoId');
	if(checkCheckboxChecked())
	{
	 for(var i=0; checkElements[i]; ++i)
	 {
	     if(checkElements[i].checked)
		  {
			   var $this = $(checkElements[i]);
			  // alert($(checkElements[i]));
			   $this.addClass('deleteRow');
			   $this.parents('tr').css("display", "none");
			   
		  }
	  }
	}
	else
	{
		$.alert('Select Row');
	 }
	
  }
  
  function insertGlobalLevelDir(val)
  {
	  $('#searchTypeText').val(val);
  
	var checkElements = document.getElementsByName('delPoId');
	if(checkCheckboxChecked())
	{
	 for(var i=0; checkElements[i]; ++i)
	 {
		  if(checkElements[i].checked)
		  {
			   var $this = $(checkElements[i]);
			  //$this.addClass('deleteRow');
			  
		  }
	  }
	}else
	  {
		$.alert('Select Row');
		return false;
	  }
   submitGlobalLevelDir();
 }
  
  function submitGlobalLevelDir()
  {
	  
  

	var tempId =  '<c:out value="${templateId}"/>';
	
	var processData=$('#norm-form').serialize()+"&templateId="+encodeURIComponent(tempId);
	
	actionUrl="insertGlobelLevelData.htm";
	successData=function(data)
	{
		//alert(data);
		hideLoading();
	};
	errorData=function(data)
	{
		//alert(data);
		hideLoading();
		
	};
	if(processData=='')
	{
		console.info("data is empty");
		$.alert("No Data Available");
	}
	else
	{
		showLoading();
		console.info(processData);
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
		
	}
	
  }
  
  
  
  /************** Add New Row *****************/
  function addRow()
  {
	  
	var parserId = '<c:out value = "${parserId}"/>';
    var checkElements = document.getElementsByName('delPoId');
	if(checkCheckboxChecked())
	{
		var v=1;
		var $this;
		for(var i=0; checkElements[i]; i++)
		{
		  if(checkElements[i].checked)
		  {
			  
			  
			  
			  console.info("row added:"+i);
			   $this = $(checkElements[i]);
			   
			   if($this.hasClass('deleteRow'));
			   else
			   {
				
				   var poId=Math.floor(Math.random()*11);
				   var normLable="";
				   var subSection_val="";
					 subSection_val = $this.parents("tr").find("#updSubSection").text().trim();
					 
					 
				   	var sel= callFunction(poId,normLable,"Addrow");
				   	
				 	var selSubSection=callSubSectionDropDown(poId,subSection_val,"Addrow");
		        	console.info(i+"inner");
					var tdLength=$this.parents('tr').children('td').length;
					
				    var seq=$this.parents('tr').children('td').eq(1).text(); 
				  
					var textSeq=$this.parents("tr").find('input[name="addSequence"]').val();
				
					if(textSeq=='' || typeof textSeq === 'undefined'){
					textSeq=$this.parents("tr").find('input[name="updSequence"]').val();
			   		}
			   
					if(seq==''){
						seq=textSeq;	
					}
					
					
					var seq=$this.parents('tr').children('td').eq(1).text(); 
					  
					var textSeq=$this.parents("tr").find('input[name="addSequence"]').val();
			 		
					if(textSeq=='' || typeof textSeq === 'undefined'){
					textSeq=$this.parents("tr").find('input[name="updSequence"]').val();
			   		}
			   
					if(seq==''){
						seq=textSeq;	
					}
					
					
					console.info("td count:"+tdLength+"seq:"+seq);
					var inputs='<tr>';
					
					
					inputs+='<td><input type="checkbox" name="delPoId" value="0"/></td>';	
					
					if(parserId == '6' || parserId == '7' || parserId == '16' ){
						var seq=$this.parents("tr").find("#updSequence").text().trim(); 
						if(seq==''){
						 seq=$this.parents("tr").find('input[name="updSequence"]').val();
						}
						inputs+='<td style="display:none" id="updSequence"><input type="text" name="addSequence" value="'+(++seq)+'"  /></td>';
					}else{
						inputs+='<td><input type="text" name="addSequence" value="'+(++seq)+'" id="addsequence" style="width:100%;"/></td>';
					}
					
					
					
					inputs+='<td id="updPoLable"><input type="text" name="addPoLable" value=""/></td>';
					
					if(parserId == '6' || parserId == '7' ){
					inputs+='<td align="center" id="brekUps" style="display:none"><input type="checkbox" name="addbrekUps"/></td>';
					}else{
					inputs+='<td align="center" id="brekUps"><input type="checkbox" name="addbrekUps"/></td>';	
					}
					
					inputs+='<td id="updNormLable">'+sel+'</td>';
					
					if(parserId == '6' || parserId == '7' ){
						
					
						var parent_accountNumber = $this.parents("tr").find("#updAccountNumber").text().trim();
						if(parent_accountNumber==''){
						 parent_accountNumber=$this.parents("tr").find('input[name="updAccountNumber"]').val();
						}
						
						var parent_timePeriod = $this.parents("tr").find("#updTimePeriod").text().trim(); 
						if(parent_timePeriod==''){
						 parent_timePeriod=$this.parents("tr").find('input[name="updTimePeriod"]').val();
						}
						
						var parent_custodianName = $this.parents("tr").find("#updCustodianName").text().trim();
						if(parent_custodianName==''){
							parent_custodianName=$this.parents("tr").find('input[name="updCustodianName"]').val();
						}
						
						inputs+='<td id="updAccountNumber"><input type="text" name="addAccountNumber" value="'+parent_accountNumber+'"/></td>';
						inputs+='<td id="updTimePeriod"><input type="text" name="addTimePeriod" value="'+parent_timePeriod+'"/></td>';
						if(parserId == '6' || parserId == '16'){
							
							inputs+='<td><input type="text" name="pageNo" id="pageNo" value="[-]" readonly=true style="width:100%;"></td>';		
						}
						inputs+='<td style="display:none" id="updCustodianName"><input type="text" name="addCustodianName" value="'+parent_custodianName+'"  /></td>';
						for(var s=8,j=1;s<tdLength;s++)
						{
							inputs+='<td><input type="text" name="addVal'+ j++ +'" value="" style="width:100%;"/></td>';
						}
					}else{
						
						inputs+='<td>'+selSubSection+'</td>';
						
						if(parserId == '11' || parserId == '14' || parserId == '15' || parserId == '17' || parserId == '18'){
							
							inputs+='<td><input type="text" name="pageNo" id="pageNo" value="[-]" readonly=true style="width:100%;" ></td>';		
						}
						
						if(parserId == '6' || parserId == '11' || parserId == '14' || parserId == '15' || parserId == '17' || parserId == '18' || parserId == '16'){
							for(var s=7,j=1;s<tdLength;s++)
							{
								inputs+='<td><input type="text" name="addVal'+ j++ +'" value="" style="width:100%;"/></td>';
							}

						}
						else{
							for(var s=6,j=1;s<tdLength;s++)
							{
								inputs+='<td><input type="text" name="addVal'+ j++ +'" value="" style="width:100%;"/></td>';
							}

						}
					}
					
					
					
					inputs+='</tr>';
					$this.parents('tr').after(inputs);
					$this.attr('checked', false);
				 }
			}
			v=i;
		}
		console.info("checkbox:"+(v+1));
    }
	else
	{
		$.alert('Select Row');
	}  
 } 
 
 function rowClick(obj)
 {
	 var parserId = '<c:out value = "${parserId}"/>';
	 
	console.info('poRow called click');
	
	if($(obj).hasClass('updateRow'))
	{
		$(obj).prev().show();
		$(obj).remove();
	}
	else
   {
	console.info('updateRow');
	var poId=$(obj).children('td').find("[name='delPoId']").val();
	/*Get value from td id(<td id="updPoLable">aa</td>*/
			
	
  	var poLable = $(obj).find("#updPoLable").text().trim(); 
	
  	var breakUp = $(obj).find("#upbrekUps").text().trim();
  	
  	
	var normLable = $(obj).find("#updNormLable").text().trim(); 
	
	var subSection_val = $(obj).find("#updSubSection").text().trim();
	
	var sequence = $(obj).find("#updSequence").text().trim(); 
	
	var accountNumber = $(obj).find("#updAccountNumber").text().trim(); 
	
	var timePeriod = $(obj).find("#updTimePeriod").text().trim(); 
	
	var bankSequence = $(obj).find("#updSequence").text().trim(); 
	
	var bankcustodianName = $(obj).find("#updCustodianName").text().trim(); 
	
	
	
	
	 
	
	var sel= callFunction(poId,normLable,"Updaterow");
	
	
	var selSubSection=callSubSectionDropDown(poId,subSection_val,"Updaterow");
	
					var tdLength=$(obj).children('td').length;
					console.info("td count:"+tdLength);
					var inputs='<tr class="updateRow" ondblClick="rowClick($(this));">';
					inputs+='<td><input type="checkbox"  name="delPoId" value="'+poId+'"/></td>';
					
					if(parserId == '6' || parserId == '7' ){
						inputs+='<td style="display:none" id="updSequence"><input type="text" name="updSequence" value="'+bankSequence+'"/></td>';
					}else{
						inputs+='<td><input type="text" name="updSequence" value="'+sequence+'" style="width:100%;"/></td>';
					}
					inputs+='<td id="updPoLable"><input type="hidden" name="updPoId" value="'+poId+'"/><input type="text" name="updPoLable" autocomplete="off" value="'+poLable+'" style="width:250px"/></td>';
					
					

					
					if(breakUp=='Y'){
					 if(parserId == '6' || parserId == '7' ){
					inputs+='<td align="center" id="brekUps" style="display:none"><input type="checkbox" name="upbrekUps" checked="checked" id="upbrekUps"/></td>';
					 }else{
					inputs+='<td align="center" id="brekUps"><input type="checkbox" name="upbrekUps" checked="checked" id="upbrekUps"/></td>';		 
					 }
					}else{
							
					if(parserId == '6' || parserId == '7' ){
					inputs+='<td align="center" id="brekUps" style="display:none"><input type="checkbox" name="upbrekUps" value="'+breakUp+'" id="upbrekUps" /></td>';
					}else{
					inputs+='<td align="center" id="brekUps"><input type="checkbox" name="upbrekUps" value="'+breakUp+'" id="upbrekUps" /></td>';	
					}
					}
					
					inputs+='<td id="updNormLable" >'+sel+'</td>';
					
					if(parserId == '6' || parserId=='7'){
						inputs+='<td id="updAccountNumber"><input type="text" name="updAccountNumber" value="'+accountNumber+'"/></td>';
						inputs+='<td id="updTimePeriod"><input type="text" name="updTimePeriod" value="'+timePeriod+'"/></td>';
						
						inputs+='<td style="display:none" id="updCustodianName"><input type="text" name="updCustodianName" value="'+bankcustodianName+'"/></td>';
						for(var i=8,j=1;i<tdLength;i++)
						{
							var obj=$(obj);
							val=getValueWithoutLink(obj,i);
							val=val.replace(/,/g, "");
							inputs+='<td><input type="text" name="updVal'+ j++ +'" value="'+val+'" style="width:100%;"/></td>';
						}
						
					}else{
						
						inputs+='<td>'+selSubSection+'</td>';
						
						/* if parser is 6 means bank parser and parser id is 11 means PDF Based Parser then show page number column  */
						if(parserId == '6' || parserId == '11'){
							var pageNo=$(obj).children('td').find("[name='pageNo']").val();
							
							inputs+='<td><input type="hidden" autocomplete="off" name="pageNo" id="pageNo" value="'+pageNo+'"/>[-]</td>';
						}
						
					
						for(var i=7,j=1;i<tdLength;i++)
						{
							var obj=$(obj);
							val=getValueWithoutLink(obj,i);
							val=val.replace(/,/g, "");
							inputs+='<td><input type="text" name="updVal'+ j++ +'" value="'+val+'" style="width:100%;"/></td>';
						}
					}
					
					
					inputs+='</tr>';
					$(obj).css("display", "none");
					$(obj).after(inputs);
	}
	console.info(poId);
 
 }
  
  function getValueWithoutLink(obj,column)
  {
	var $val1 = $(obj).children('td').eq(column).clone();
	$val1.children('a').remove();
	console.info($val1.text().trim());
	return $val1.text().trim();
  }
  
  /************** Submit Data *******************************/
  function submitForm()
  {

//This function used for uncheck checkboxes when click on save button
	   $("tr").each(function()
		{
		  if($(this).css("display") != "none")
			  $(this).find('input[type=checkbox]').prop('checked', false);
		}); 
	  

	var processData=$('#norm-form').serialize();

	actionUrl="update_normalization.htm";
	successData=function(data)
	{
		//alert(data);
		hideLoading();
		viewData('${wqId}','${caseId}',"${statementFormat}","${customerId}");
	};
	errorData=function(data)
	{
		//alert(data);
		hideLoading();
		viewData('${wqId}','${caseId}',"${statementFormat}","${customerId}");
	};
	if(processData=='')
	{
		console.info("data is empty");
		alert("No Data Available");
	}
	else
	{
	showLoading();
	console.info(processData);
	callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
		
	}
	
  }
  
  /************** Check CheckBox checked or Not *****************/
  function checkCheckboxChecked()
  {
	var len = $("[name='delPoId']:checked").length;
	if(len)
	return true;
	else 
	return false;
  }
  
  function callFunction(poId,normLable,operation){
	  
	  var sel ="";  
	  
	  if(operation == "Addrow"){
		  sel = '<select id='+poId+' name="addNormLable" class="changeValue"><option>--Select--</option>';  
	  }else  if(operation == "Updaterow"){

		  if(poId=='59041'){
		  sel = '<select id='+poId+' name="updNormLable" class="changeValue"><option value="00~Development Rate">Development Rate</option>';  
		  }else{
		  sel = '<select id='+poId+' name="updNormLable" class="changeValue" style="width:160px"><option>--Select--</option>';
		  }
	  }
	  
		<c:forEach items="${listOfNormItemLabels}" var="NormItemLabel" varStatus="status">
				var currentLabel1 =  '<c:out value="${NormItemLabel.nilLabel}"/>';
				//replacing &amp with & 
				var currentLabel = currentLabel1.replace(/&amp;/g, '&');
	
				if(currentLabel == normLable ){
					sel = sel+"<option selected = 'selected' value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\">${NormItemLabel.nilLabel}</option>";
				}else{
				 
				 sel = sel+"<option value=\"${NormItemLabel.niItem}~${NormItemLabel.nilLabel}\">${NormItemLabel.nilLabel}</option>"; 
				
				}
		</c:forEach>
		sel = sel+'</select>';
	
		return sel;
  }
  
  
function callSubSectionDropDown(poId,subSection_val,operation){
	  
	  var subsection_dropdown ="";  
  
	  if(operation == "Addrow"){
		  subsection_dropdown  = '<select id='+poId+' name="addSubSection" class="changeValue" style="width:100%; padding:4px;"><option value="">--Select--</option>';  
	  }else  if(operation == "Updaterow"){
		 subsection_dropdown = '<select id='+poId+' name="updSubSection" class="changeValue" style="width:100%; padding:4px;"><option value="">--Select--</option>';
	  }
	  var subsectionflag="false";

		console.info("subSection_val="+subSection_val);
		
		<c:forEach items="${subSectionList}" var="subSectionList" varStatus="status">
				var currentLabel =  '<c:out value="${subSectionList.subSection}"/>';
				if(currentLabel == subSection_val ){
					subsection_dropdown = subsection_dropdown+'<option selected = "selected" value="${subSectionList.subSection}">${subSectionList.subSection}</option>';
					subsectionflag="true";
				}else{
					subsection_dropdown = subsection_dropdown+'<option value="${subSectionList.subSection}">${subSectionList.subSection}</option>';
				}
		</c:forEach>
		
		console.info("subsectionflag="+subsectionflag);
		if(subsectionflag!="true"){
		subsection_dropdown = subsection_dropdown+'<option selected = "selected" value="'+subSection_val+'">'+subSection_val+'</option>';
		}
		subsection_dropdown = subsection_dropdown+'</select>';
		
		return subsection_dropdown;
  }
  
  $('a[target^="_new"]').click(function(e) {
	   window.open(this.href, 'newwindow', 'width=900, height=700, top=300, left=350,scrollbars=yes, resizable=yes');
	   return false;
	});
  
  

	/* This function is used for Residual Mapping(ie if Normalized Label is null then update all null lable by "Cash") for sectionwise */ 
	function residualMapping(ni_lable,ni_item){
		 if ($.confirm("Please confirm whether remaining transactions to be mapped as 'Cash' ") == true) {
			 
		var section=$("#statementFormat").val();
		var filingId=$("#filingId").val();
		
		var processData="&ni_lable="+encodeURIComponent(ni_lable)+"&ni_item="+encodeURIComponent(ni_item)+"&section="+encodeURIComponent(section)+"&filingId="+encodeURIComponent(filingId);
		actionUrl="update_NormalizedLabelColumn.htm";
		successData=function(data)
		{
			$.alert(data);
			hideLoading();
		};
		errorData=function(data)
		{
			$.alert(data);
			viewData('${wqId}','${caseId}',"${statementFormat}","${customerId}");
			hideLoading();
		};
		if(processData=='')
		{
			console.info("data is empty");
			$.alert("No Data Available");
		}
		else
		{
			showLoading();
			console.info(processData);
			callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
			
		}	
		
}//end confirm else	
}
    	function showPopUp(){
		$('#popUp1').modal('show');
		}
    	
   /* This function is called on custom mapping */ 	
 function customMapping(){
var processData=$('#customMappingForm').serialize();
actionUrl="update_CustomMapping.htm";    
successData=function(data)
{
	$.alert(data);
	hideLoading();
	$('#popUp1').modal('hide');
	viewData('${wqId}','${caseId}',"${statementFormat}","${customerId}");
};
errorData=function(data)
{
	$.alert(data);
	viewData('${wqId}','${caseId}',"${statementFormat}","${customerId}");
	hideLoading();
};

showLoading();
console.info(processData);
callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);

	   
}
  </script>





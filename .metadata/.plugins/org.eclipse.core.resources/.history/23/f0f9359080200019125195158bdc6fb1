 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/rules_pdf_basedparser_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css">
 <style>
	.newtable tr td{color:#333 !important}
	 input{color:#333 !important}
	 select{color:#333 !important; padding:4px} 
 </style>

<script>
$(function(){
	/* Here we hide Rules applied and delete button for bank parser on rules_management_extraction.jsp */
	 $("#RulesAppliedButton").hide();
	 $("#DeleteButton").hide();
	 
	
	$(".col_icon_down").click(function(){
		$(this).parent().parent().next().toggle();
		$(this).toggleClass("col_icon_up");
	});
	
});
function addTableRow(jQtable){

	
	var cName = $(jQtable).find('tr:last').attr('class');
	 
		//here get table id name
  	var tableId=jQtable.attr('id');
  	var res = tableId.split('TableDiv');
  	tableId=res[0];
  	var rowCount=$('#'+tableId+' tr').length;
 	var subsectionList='';
 	var section='';
  	
  		subsectionList=callSubSectionDropDown(tableId);
  		section='<select id="sectionList" name="sectionList" class="form-control"><option>'+tableId+'</option></select>';
  	
  	
  	jQtable.each(function(){
    var $table = $(this);
	// Number of td's in the last table row
  //n=n+1;
   if (cName == 'even'){
   	var j = 'odd';
   }
   else{
	 var j = 'even';   
	}


    var tds = '<tr class='+j+'>';
    //for(var i = 0; i < n; i++){
    
        tds += '<td><input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" value= ""/>'
        		+'<input type="checkbox" name="checkbox4" id="checkbox4" ></td>'
        		+'<td>'+section+'</td>'
         		+'<td>'+subsectionList+'</td>'
         		+'<td><textarea name="keywordsList" cols="50" rows="2" class="form-control"></textarea></td>'
				   
         tds += '</tr>';
    
    //Add new row under selected checkbox.
    
    var checkElements = document.getElementsByName('checkbox4');
  	
    //if not seleted any checkbox then row added after last bydefault
    if(checkCheckboxChecked()){
    	var v=1;
    	//This row object
		var checkedrow;
		for(var i=0; checkElements[i]; i++)
		{
			  if(checkElements[i].checked)
			  {
				   console.info("row added:"+i);
				   checkedrow = $(checkElements[i]);
				   checkedrow.parents('tr').after(tds);
				   checkedrow.attr('checked', false);
			  }
		}
  	}else{
    
    if($('tbody', this).length > 0){
        $('tbody', this).append(tds);
    }else {
        $(this).append(tds);
    }
 }  
    
});
}

  	
  	
  	
function callSubSectionDropDown(sectionname){
	  var subsection_dropdown ="";  
		 subsection_dropdown = '<select id="sub_sectionList" name="sub_sectionList" class="form-control">';
		<c:forEach items="${subSectionList}" var="subSectionList" varStatus="status">
		var cursectionname =  '<c:out value="${subSectionList.section}"/>';
		if(cursectionname == sectionname ){ 
		subsection_dropdown = subsection_dropdown+'<option value="${subSectionList.subSection}">${subSectionList.subSection}</option>';
		}
		</c:forEach>
		subsection_dropdown = subsection_dropdown+'</select>';
		
		return subsection_dropdown;
}



function checkCheckboxChecked()
{
	var len = $("[name='checkbox4']:checked").length;
	console.info("row len=:"+len);
	if(len)
	return true;
	else 
	return false;
}





</script>

<c:if test="${not empty rulFlag}">
<c:choose>
<c:when test="${rulFlag}">
	<script>
	/* alert("Extraction Updated Successfully"); */
	</script>
	
</c:when>
 <c:otherwise>
<script>
	/* alert("Extraction Rules Added Failed"); */
</script>				       
</c:otherwise>
</c:choose>
 </c:if>

 
 
 
<table width="100%" border="0" cellspacing="0" style="margin-bottom:5px;" class="newtable">
  <tr>
    <td align="left" valign="middle" class="td-bg" style="padding:0px 0px 0px 10px; line-height:26px;">
    	<b>Custom Configuration</b>
    	<a href="JavaScript:void('0');" class="col_icon_up"></a>
    </td>
    </tr>
  <tr >
    <td bgcolor="#ebebeb" style="border:1px solid #cccccc;"><table width="100%" border="0" cellspacing="15" cellpadding="0" style="border-collapse: separate; border-spacing:10px;">
      <tr>
      
      <td>Custodian Name<br>
         <select id="propertyValue3" name="propertyValue" style="width:96%">
         <c:set  var="CustodianNameCount" value="0"/>
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			<c:if test="${(extractor_runproperties_list.erp_propertyName=='Custodian Name')}">
            	  	<c:forEach items="${bankNameList}" var="bankMaster">
              		<option ${extractor_runproperties_list.erp_propertyValue==bankMaster.bankName ? 'selected' : ''} >${bankMaster.bankName}</option> 
              		</c:forEach>                  
          			<c:set var="CustodianNameCount" value="${CustodianNameCount + 1}" scope="page"/>
          			<input type="hidden" name="erp_Id" id="erp_Id" value="${extractor_runproperties_list.erpId}" />
          			    
          			 </c:if>
          			
              		</c:forEach>
              		
              	</c:when>
              
             </c:choose>
             <c:if test="${CustodianNameCount <= 0}">
              <c:forEach items="${bankNameList}" var="bankMaster">
              <option value="${bankMaster.bankName}">${bankMaster.bankName}</option> 
              </c:forEach>                  
              	</c:if>
         </select>
           <input type="hidden" name="propertyName" id="propertyName3" value="Custodian Name" />
         
        </td>
      
   
      
        <td>Extraction Scope<br>
        
        <select id="propertyValue3" name="propertyValue" style="width:96%">
          <c:set  var="ExtractionScopeCount" value="0"/>
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Extraction Scope')}">
          			    <c:set var="ExtractionScopeCount" value="${ExtractionScopeCount + 1}" scope="page"/>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'AccountSummary,Deposits,DailyBalances,Dummy' ? 'selected' : ''}>AccountSummary,Deposits,DailyBalances,Dummy</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'AccountSummary' ? 'selected' : ''}>AccountSummary</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Deposits' ? 'selected' : ''}>Deposits</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'DailyBalances' ? 'selected' : ''}>DailyBalances</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Dummy' ? 'selected' : ''}>Dummy</option>
          			    <input type="hidden" name="erp_Id" id="erp_Id" value="${extractor_runproperties_list.erpId}" />
          			  
          			 </c:if>
          			
              		</c:forEach>
              	
                 </c:when>
              
              </c:choose>
               <c:if test="${ExtractionScopeCount <= 0}">
               <option>AccountSummary,Deposits,DailyBalances,Dummy</option>
                <option>AccountSummary</option>
                <option>Deposits</option>
                <option>DailyBalances</option>
                <option>Dummy</option>
                <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
               </c:if>
              
         </select>
         <input type="hidden" name="propertyName" id="propertyName3" value="Extraction Scope" />
        
          </td>
        
          <td>Standalone<br>
              <select id="propertyValue1" name="propertyValue" style="width:96%">
              <c:set  var="StandaloneCount" value="0"/>
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Standalone')}">
          			  <c:set var="StandaloneCount" value="${StandaloneCount + 1}" scope="page"/>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             			<input type="hidden" name="erp_Id" id="erp_Id" value="${extractor_runproperties_list.erpId}" />
             		
             		 </c:if>
             		
              		</c:forEach>
              		
              </c:when>
               
              </c:choose>
              <c:if test="${StandaloneCount <= 0}">
              <option>Yes</option>
               <option selected="selected">No</option>
               <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
              </c:if>
              </select>
          <input type="hidden" name="propertyName" id="propertyName3" value="Standalone" />
          </td>
          
        <td>Generate Log<br>
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:set  var="GenerateLogCount" value="0"/>
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Generate Log')}">
          			  <c:set var="GenerateLogCount" value="${GenerateLogCount + 1}" scope="page"/>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Off' ? 'selected' : ''}>Off</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'On' ? 'selected' : ''}>On</option>
          			  <input type="hidden" name="erp_Id" id="erp_Id" value="${extractor_runproperties_list.erpId}" />
          		
             		 </c:if>
             		
                   </c:forEach>
            
              </c:when>
              
              </c:choose>
                <c:if test="${GenerateLogCount <= 0}">
                <option>Off</option>
               <option>On</option>
               <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
              	  </c:if>
         </select>
          <input type="hidden" name="propertyName" id="propertyName3" value="Generate Log" />
          </td>
          
        <td>Use Stored Logic<br>
          <select id="propertyValue4" name="propertyValue" style="width:96%">
          <c:set  var="UseStoredLogicCount" value="0"/>
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Use Stored Logic')}">
          			 <c:set var="UseStoredLogicCount" value="${UseStoredLogicCount + 1}" scope="page"/>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             			<input type="hidden" name="erp_Id" id="erp_Id" value="${extractor_runproperties_list.erpId}" />
             		 
             		 </c:if>
             		  
              		</c:forEach>
          
              </c:when>
              
              </c:choose>
               <c:if test="${UseStoredLogicCount <= 0}">
                <option>Yes</option>
               <option>No</option>
               <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
               </c:if>
         </select>
            <input type="hidden" name="propertyName" id="propertyName3" value="Use Stored Logic" />
          </td>
          
        <td>Overwrite ID Rules<br>
        
           <select id="propertyValue5" name="propertyValue" style="width:96%">
            <c:set  var="OverwriteIDRulesCount" value="0"/>  
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Overwrite ID Rules')}">
          			  <c:set var="OverwriteIDRulesCount" value="${OverwriteIDRulesCount + 1}" scope="page"/>

          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             		<input type="hidden" name="erp_Id" id="erp_Id" value="${extractor_runproperties_list.erpId}" />
             	
             		
             		 </c:if>
             	
              		</c:forEach>
              
              </c:when>
              
              </c:choose>
              <c:if test="${OverwriteIDRulesCount <= 0}">
              <option>Yes</option>
               <option>No</option>
                  <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
              </c:if>
         </select>
          <input type="hidden" name="propertyName" id="propertyName3" value="Overwrite ID Rules" />
          </td>
          <td>File Name:<br>
          
          <select id="uploadId" name="uploadId" style="width:96%" onchange="showBankParserSubPage('<c:out value='${fillingId}'/>')">
           <option value="0">All</option>
            	<c:forEach items="${fileUploadList}" var="fileUploadList">
	     	    	   
              <option value="${fileUploadList.fileUploadId}" ${fileUploadList.fileUploadId == fileUploadId ? 'selected' : ''}>${fileUploadList.fileName}</option>
           </c:forEach>
           </select>
          </td>
          
          
      </tr>
    </table></td>
    </tr>
</table>

<div style="height:320px; overflow:auto; padding-bottom:0px"> 
<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>AccountSummary Identification</strong></td>
    <td bgcolor="#fff" align="right">
    <a href="Javascript:void('0');" onClick="addTableRow($('#AccountSummaryTableDiv'));"><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a>   
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5" class="table table-bordered"  id="AccountSummaryTableDiv" name="AccountSummary">
  <tr class="throw row-bg">
  <td width="2%" ><input type="checkbox" name="ISMastercheckbox" id="ISMastercheckbox"></td>
    <td width="20%" ><strong>Section</strong></td>
    <td width="20%" ><strong>Sub Section</strong></td>
    <td width="28%" align="left" ><strong>Keywords</strong></td>
  </tr>

  <c:set  var="AccountSummaryCount" value="0"/>

<c:forEach items="${extractionMetadataList}" var="extractionMetadata">  

<c:if test="${extractionMetadata.section=='AccountSummary'}">
   <c:set var="AccountSummaryCount" value="${AccountSummaryCount + 1}" scope="page"/>
      <tr class='odd'>
      
    <c:choose>
        <c:when test="${AccountSummaryCount gt 0}">
        <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
        <td class="odd">
        <select name='sectionList' id='sectionList' class="form-control"><option>${extractionMetadata.section}</option></select> 
       
	   </td>
	   <td class="odd">
        <select name='sub_sectionList' id='sub_sectionList' class="form-control">
         <c:forEach items="${subSectionList}" var="subSectionList">
        <c:if test="${subSectionList.section eq 'AccountSummary'}">
         <option value="${subSectionList.subSection}" ${subSectionList.subSection == extractionMetadata.subSection ? 'selected' : ''}>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
        </select> 
        </td>
       <td class="odd">
 	 		<textarea rows="2" cols="50" name="keywordsList" class="form-control">${extractionMetadata.keyWords}</textarea> 
	    </td>
	  <input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" value="${extractionMetadata.extMetadataId}" />
       </c:when>
    </c:choose>
    
     </tr>
    </c:if>
    </c:forEach>
    <c:if test="${AccountSummaryCount eq 0}">
       <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
     <td class="odd">
      <select name='sectionList' id='sectionList' class="form-control"><option>AccountSummary</option></select> 
      </td>
     <td class="odd">
      <select name='sub_sectionList' id='sub_sectionList' class="form-control">
      <c:forEach items="${subSectionList}" var="subSectionList">
      <c:if test="${subSectionList.section eq 'AccountSummary'}">
      <option>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
      
      
      </select> 
     </td>
	<td class="odd">
 	<textarea rows="2" cols="50" name="keywordsList" class="form-control"></textarea> 
	</td>
	 <input type="hidden" name="extMetadataIdList" id="extMetadataIdList" class="form-control"/>
    </c:if>
 
    
   </table>
</div>


<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>AccountActivity Identification</strong></td>
    <td bgcolor="#fff">
    <span class="pull-right"><a href="Javascript:void('0');" onClick="addTableRow($('#AccountActivityTableDiv'));"><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a></span>
    </td>
   
    
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  class="table table-bordered" id="AccountActivityTableDiv" name="AccountActivity">
  <tr class="throw row-bg">
  <td width="2%" ><input type="checkbox" name="ISMastercheckbox" id="ISMastercheckbox"></td>
    <td width="20%" ><strong>Section</strong></td>
    <td width="20%" ><strong>Sub Section</strong></td>
    <td width="28%" align="left" ><strong>Keywords</strong></td>
  </tr>

  <c:set  var="AccountActivityCount" value="0"/>

<c:forEach items="${extractionMetadataList}" var="extractionMetadata">  

<c:if test="${extractionMetadata.section=='AccountActivity'}">
   <c:set var="AccountActivityCount" value="${AccountActivityCount + 1}" scope="page"/>
      <tr class='odd'>
      
    <c:choose>
        <c:when test="${AccountActivityCount gt 0}">
        <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
        <td class="odd">
        <select name='sectionList' id='sectionList' class="form-control"><option>${extractionMetadata.section}</option></select> 
       
	   </td>
	   <td class="odd">
        <select name='sub_sectionList' id='sub_sectionList' class="form-control">
         <c:forEach items="${subSectionList}" var="subSectionList">
        <c:if test="${subSectionList.section eq 'AccountActivity'}">
         <option value="${subSectionList.subSection}" ${subSectionList.subSection == extractionMetadata.subSection ? 'selected' : ''}>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
        </select> 
        </td>
       <td class="odd">
 	 		<textarea rows="2" cols="50" name="keywordsList" class="form-control">${extractionMetadata.keyWords}</textarea> 
	    </td>
	  <input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" value="${extractionMetadata.extMetadataId}" />
       </c:when>
    </c:choose>
    
     </tr>
    </c:if>
    </c:forEach>
    <c:if test="${AccountActivityCount eq 0}">
           <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
     <td class="odd">
      <select name='sectionList' id='sectionList' class="form-control"><option>AccountActivity</option></select> 
      </td>
     <td class="odd">
      <select name='sub_sectionList' id='sub_sectionList' class="form-control">
      <c:forEach items="${subSectionList}" var="subSectionList">
      <c:if test="${subSectionList.section eq 'AccountActivity'}">
      <option>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
      
      
      </select> 
     </td>
	<td class="odd">
 	<textarea rows="2" cols="50" name="keywordsList" class="form-control"></textarea> 
	</td>
	 <input type="hidden" name="extMetadataIdList" id="extMetadataIdList" class="form-control"/>
    </c:if>
 
    
   </table>
</div>



<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>Deposits Identification</strong></td>
    <td bgcolor="#fff" align="right">
    <span class="pull-right"><a href="Javascript:void('0');" onClick="addTableRow($('#DepositsTableDiv'));"><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a></span>
    </td>
   
    
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  class="table table-bordered" id="DepositsTableDiv" name="Deposits">
  <tr class="throw row-bg">
  <td width="2%" ><input type="checkbox" name="ISMastercheckbox" id="ISMastercheckbox"></td>
    <td width="20%" ><strong>Section</strong></td>
    <td width="20%" ><strong>Sub Section</strong></td>
    <td width="28%" align="left" ><strong>Keywords</strong></td>
  </tr>

  <c:set  var="DepositsCount" value="0"/>

<c:forEach items="${extractionMetadataList}" var="extractionMetadata">  

<c:if test="${extractionMetadata.section=='Deposits'}">
   <c:set var="DepositsCount" value="${DepositsCount + 1}" scope="page"/>
      <tr class='odd'>
      
    <c:choose>
        <c:when test="${DepositsCount gt 0}">
        <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
        <td class="odd">
        <select name='sectionList' id='sectionList' class="form-control"><option>${extractionMetadata.section}</option></select> 
       
	   </td>
	   <td class="odd">
        <select name='sub_sectionList' id='sub_sectionList' class="form-control">
         <c:forEach items="${subSectionList}" var="subSectionList">
        <c:if test="${subSectionList.section eq 'Deposits'}">
         <option value="${subSectionList.subSection}" ${subSectionList.subSection == extractionMetadata.subSection ? 'selected' : ''}>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
        </select> 
        </td>
       <td class="odd">
 	 		<textarea rows="2" cols="50" name="keywordsList" class="form-control">${extractionMetadata.keyWords}</textarea> 
	    </td>
	  <input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" value="${extractionMetadata.extMetadataId}" />
       </c:when>
    </c:choose>
    
     </tr>
    </c:if>
    </c:forEach>
    <c:if test="${DepositsCount eq 0}">
     <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
     <td class="odd">
      <select name='sectionList' id='sectionList' class="form-control"><option>Deposits</option></select> 
      </td>
     <td class="odd">
      <select name='sub_sectionList' id='sub_sectionList' class="form-control">
      <c:forEach items="${subSectionList}" var="subSectionList">
      <c:if test="${subSectionList.section eq 'Deposits'}">
      <option>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
      
      
      </select> 
     </td>
	<td class="odd">
 	<textarea rows="2" cols="50" name="keywordsList" class="form-control"></textarea> 
	</td>
	 <input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" />
    </c:if>
 
    
   </table>
</div>



<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>Withdrawals Identification</strong></td>
    <td bgcolor="#fff" align="right">
    <span class="pull-right"><a href="Javascript:void('0');" onClick="addTableRow($('#WithdrawalsTableDiv'));"><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a></span>
    </td>
   
    
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  class="table table-bordered" id="WithdrawalsTableDiv" name="Withdrawals">
  <tr class="throw row-bg">
  <td width="2%" ><input type="checkbox" name="ISMastercheckbox" id="ISMastercheckbox"></td>
    <td width="20%" ><strong>Section</strong></td>
    <td width="20%" ><strong>Sub Section</strong></td>
    <td width="28%" align="left" ><strong>Keywords</strong></td>
  </tr>

  <c:set  var="WithdrawalsCount" value="0"/>

<c:forEach items="${extractionMetadataList}" var="extractionMetadata">  

<c:if test="${extractionMetadata.section=='Withdrawals'}">
   <c:set var="WithdrawalsCount" value="${WithdrawalsCount + 1}" scope="page"/>
      <tr class='odd'>
      
    <c:choose>
        <c:when test="${WithdrawalsCount gt 0}">
        <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
        <td class="odd">
        <select name='sectionList' id='sectionList' class="form-control"><option>${extractionMetadata.section}</option></select> 
       
	   </td>
	   <td class="odd">
        <select name='sub_sectionList' id='sub_sectionList' class="form-control">
         <c:forEach items="${subSectionList}" var="subSectionList">
        <c:if test="${subSectionList.section eq 'Withdrawals'}">
         <option value="${subSectionList.subSection}" ${subSectionList.subSection == extractionMetadata.subSection ? 'selected' : ''}>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
        </select> 
        </td>
       <td class="odd">
 	 		<textarea rows="2" cols="50" name="keywordsList" class="form-control">${extractionMetadata.keyWords}</textarea> 
	    </td>
	  <input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" value="${extractionMetadata.extMetadataId}" />
       </c:when>
    </c:choose>
    
     </tr>
    </c:if>
    </c:forEach>
    <c:if test="${WithdrawalsCount eq 0}">
     <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
     <td class="odd">
      <select name='sectionList' id='sectionList' class="form-control"><option>Withdrawals</option></select> 
      </td>
     <td class="odd">
      <select name='sub_sectionList' id='sub_sectionList' class="form-control">
      <c:forEach items="${subSectionList}" var="subSectionList">
      <c:if test="${subSectionList.section eq 'Withdrawals'}">
      <option>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
      
      
      </select> 
     </td>
	<td class="odd">
 	<textarea rows="2" cols="50" name="keywordsList" class="form-control"></textarea> 
	</td>
	 <input type="hidden" name="extMetadataIdList" id="extMetadataIdList" class="form-control"/>
    </c:if>
 
    
   </table>
</div>



<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>DailyBalances Identification</strong></td>
    <td bgcolor="#fff" align="right">
    <span class="pull-right"><a href="Javascript:void('0');" onClick="addTableRow($('#DailyBalancesTableDiv'));"><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a></span>
    </td>
   
    
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  class="table table-bordered" id="DailyBalancesTableDiv" name="DailyBalances">
  <tr class="throw row-bg">
  <td width="2%" ><input type="checkbox" name="ISMastercheckbox" id="ISMastercheckbox"></td>
    <td width="20%" ><strong>Section</strong></td>
    <td width="20%" ><strong>Sub Section</strong></td>
    <td width="28%" align="left" ><strong>Keywords</strong></td>
  </tr>

  <c:set  var="DailyBalancesCount" value="0"/>

<c:forEach items="${extractionMetadataList}" var="extractionMetadata">  

<c:if test="${extractionMetadata.section=='DailyBalances'}">
   <c:set var="DailyBalancesCount" value="${DailyBalancesCount + 1}" scope="page"/>
      <tr class='odd'>
      
    <c:choose>
        <c:when test="${DailyBalancesCount gt 0}">
        <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
        <td class="odd">
        <select name='sectionList' id='sectionList' class="form-control"><option>${extractionMetadata.section}</option></select> 
       
	   </td>
	   <td class="odd">
        <select name='sub_sectionList' id='sub_sectionList' class="form-control">
         <c:forEach items="${subSectionList}" var="subSectionList">
        <c:if test="${subSectionList.section eq 'DailyBalances'}">
         <option value="${subSectionList.subSection}" ${subSectionList.subSection == extractionMetadata.subSection ? 'selected' : ''}>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
        </select> 
        </td>
       <td class="odd">
 	 		<textarea rows="2" cols="50" name="keywordsList" class="form-control">${extractionMetadata.keyWords}</textarea> 
	    </td>
	  <input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" value="${extractionMetadata.extMetadataId}" />
       </c:when>
    </c:choose>
    
     </tr>
    </c:if>
    </c:forEach>
    <c:if test="${DailyBalancesCount eq 0}">
     <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td> 
     <td class="odd">
      <select name='sectionList' id='sectionList' class="form-control"><option>DailyBalances</option></select> 
      </td>
     <td class="odd">
      <select name='sub_sectionList' id='sub_sectionList' class="form-control">
      <c:forEach items="${subSectionList}" var="subSectionList">
      <c:if test="${subSectionList.section eq 'DailyBalances'}">
      <option>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
      
      
      </select> 
     </td>
	<td class="odd">
 	<textarea rows="2" cols="50" name="keywordsList" class="form-control"></textarea> 
	</td>
	 <input type="hidden" name="extMetadataIdList" class="form-control" id="extMetadataIdList" />
    </c:if>
 
    
   </table>
</div>



<div style="margin-bottom:50px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>Dummy Identification</strong></td>
    <td bgcolor="#fff" align="right">
    <span class="pull-right"><a href="Javascript:void('0');" onClick="addTableRow($('#DummyTableDiv'));"><i class="fa fa-plus  custom-font14 pad3 cus-cls" style="" data-toggle="tooltip" data-placement="top" title="Add New Tag"></i></a></span>
    </td>
   
    
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5" class="table tbale-bordered" id="DummyTableDiv" name="Dummy">
  <tr class="throw row-bg">
  <td width="2%" ><input type="checkbox" name="ISMastercheckbox" id="ISMastercheckbox"></td>
    <td width="20%" ><strong>Section</strong></td>
    <td width="20%" ><strong>Sub Section</strong></td>
    <td width="28%" align="left" ><strong>Keywords</strong></td>
  </tr>

  <c:set  var="DummyCount" value="0"/>

<c:forEach items="${extractionMetadataList}" var="extractionMetadata">  

<c:if test="${extractionMetadata.section=='Dummy'}">
   <c:set var="DummyCount" value="${DummyCount + 1}" scope="page"/>
      <tr class='odd'>
      
    <c:choose>
        <c:when test="${DummyCount gt 0}">
        <td><input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4"></td>
        <td class="odd">
        <select name='sectionList' id='sectionList' class="form-control"><option>${extractionMetadata.section}</option></select> 
       
	   </td>
	   <td class="odd">
        <select name='sub_sectionList' id='sub_sectionList' class="form-control">
         <c:forEach items="${subSectionList}" var="subSectionList">
        <c:if test="${subSectionList.section eq 'Dummy'}">
         <option value="${subSectionList.subSection}" ${subSectionList.subSection == extractionMetadata.subSection ? 'selected' : ''}>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
        </select> 
        </td>
       <td class="odd">
 	 		<textarea rows="2" cols="50" name="keywordsList" class="form-control">${extractionMetadata.keyWords}</textarea> 
	    </td>
	  <input type="hidden" name="extMetadataIdList" id="extMetadataIdList" class="form-control" value="${extractionMetadata.extMetadataId}" />
       </c:when>
    </c:choose>
    
     </tr>
    </c:if>
    </c:forEach>
    <c:if test="${DummyCount eq 0}">
    <td><input type="checkbox" name="checkbox4" id="checkbox4"  class="IScheckbox4"></td>
     <td class="odd">
      <select name='sectionList' id='sectionList' class="form-control"><option>Dummy</option></select> 
      </td>
     <td class="odd">
      <select name='sub_sectionList' id='sub_sectionList' class="form-control">
      <c:forEach items="${subSectionList}" var="subSectionList">
      <c:if test="${subSectionList.section eq 'Dummy'}">
      <option>${subSectionList.subSection}</option>
      </c:if>
      </c:forEach>
      
      
      </select> 
     </td>
	<td class="odd">
 	<textarea rows="2" cols="50" name="keywordsList" class="form-control"></textarea> 
	</td>
	 <input type="hidden" name="extMetadataIdList" id="extMetadataIdList" class="form-control"/>
    </c:if>
 
    
   </table>
</div>
</div>












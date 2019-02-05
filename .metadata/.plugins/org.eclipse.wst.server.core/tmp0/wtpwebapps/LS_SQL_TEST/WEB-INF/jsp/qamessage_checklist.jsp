<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" /> 
<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.custom.css" />
<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/qamessage_checklist_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-checkbox.css" /> 
<script src="js/jquery.darktooltip.js"></script>
<script src="js/appjs/qamessage_checklist.js?value=${applicationScope['version']}"></script>	
<link rel="stylesheet" type="text/css" href="js/choosen/chosen.css" />
<script src="js/choosen/chosen.jquery.js"></script> 
<script type="text/javascript" src="js/jquery.bootpag.js"></script>
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>

<style>
 .nav .open>a, .nav .open>a:hover, .nav .open>a:focus{background:#428bca !important;}
 .bg-blue{background:#DBF6FF !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .bg-orange{background:#FEE8BF !important;}
 .bg-sand{background:#fde9d9 !important; font-weight:bold !important;}
 .bld td{font-weight:bold !important; !important;}
 .tblstyle2 {font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;  }
 .tblstyle2 td{border: 1px solid #D8D8D8; padding: 5px; color:#333 !important; font-size:11px;}
.tblstyle2 tbody tr:nth-child(even) {background: #f4f4f4; !important;}
.tblstyle2 tbody tr:nth-child(odd) {background: #fff; !important;}
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default{padding:5px 12px !important; width:375px !important}
.ui-multiselect span.ui-icon{display:none !important}
.ui-multiselect-checkboxes label input{top:1px; margin:0 5px 0 0}
ul.multiselect-container.dropdown-menu{width:auto !important}
input[type=checkbox], input[type=radio]{margin:0px}
.form-control{ height:32px !important; border-radius:3px !important; padding:2px 12px; font-size:13px;  font-family:open sans;}
 #showAdditionalQAChecksPopup{margin-top:66px !important}
 </style> 

<jsp:include page="common/appheader.jsp" >
	  <jsp:param name="pageNo" value="6"/>
	  <jsp:param value="${fillingId}" name="caseId"/>
      <jsp:param value="${decryptedFillingId}" name="decryptedFillingId"/>
      <jsp:param value="${decryptedCustomerName}" name="decryptedCustomerName"/>
      <jsp:param value="${businessName}" name="bussinessName"/>
      <jsp:param value="${decryptedCompIdOrCik}" name="decryptedCompIdOrCik"/>
      <jsp:param value="${wqId}" name="wqId"/>
	  <jsp:param value="${encriptedWqEId}" name="encriptedWqEId" />
 </jsp:include>

<div class="modal fade" id="showAdditionalQAChecksPopup" role="dialog"  style="padding-left:0px !important;">
    <div class="modal-dialog" style="width:100%">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="panel panel-primary" style="margin:10px">
                <div class="panel-heading">
                <input type="hidden" id="isBreakupQaChecks" name="isBreakupQaChecks" value="N">
                    <h3 class="panel-title" id="popuPanelHeading">Additional QA Checks</h3>
                    <div style="margin:0 0px 0 160px" class="pull-left">
                        <!-- Tabs -->
                        <ul class="nav panel-tabs" id="sectionTabList">
                            <c:forEach items="${sectionMap}" var="sectionMap" varStatus="loop">
                            <c:choose>
                            <c:when test="${loop.count eq 1}">
                            <li class="active" id="${sectionMap.key}"><a href="#" onclick="clickOnSection('${sectionMap.key}');" data-toggle="tab">${sectionMap.value}</a></li>
                            </c:when>
                            <c:when test="${loop.count lt 4}">
                            <li id="${sectionMap.key}"><a href="#" onclick="clickOnSection('${sectionMap.key}');" data-toggle="tab">${sectionMap.value}</a></li>
                            </c:when>
                            
                            </c:choose>
                            </c:forEach>
 					
  					 	 <li class="dropdown">
					           <a class="dropdown-toggle" data-toggle="dropdown" href="#"  id="dropdown_title">Select <b class="caret"></b></a>
					            <ul class="dropdown-menu" id="divNewNotifications">
					            <c:forEach items="${sectionMap}" var="sectionMap" varStatus="recipeCounter">
					             <c:if test="${recipeCounter.count >= 4}">
					             <li id="${sectionMap.key}"><a href="javasctipt:void(0)" onclick="clickOnSection('${sectionMap.key}')" data-toggle="tab">${sectionMap.value}</a></li>
					             </c:if>
					             </c:forEach>
					            </ul>
						 </li> 
					       
                        </ul>
                        
                    </div>
				<div class="pull-right" style="margin:-8px 0 0 6px;"><button aria-label="Close" data-dismiss="modal" class="close" type="button" style="color:#fff !important; text-shadow:none !important; font-size:18px !important" title="Close"><span aria-hidden="true">X</span></button></div>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                       
					<input type="hidden" name="fillingId" id="fillingId" value="${filingId}" />
					<input type="hidden" name="docStatus" id="docStatus" value="${docStatus}" />
					     <%--<c:forEach items="${sectionMap}" var="sectionMap" varStatus="status"> --%>
					     <%--<div class="tab-pane active Table" id="Table">--%>
					    <div style="margin:0px 0 0px 0; position:relative; top:-20px">
					    <table width="100%" cellpadding="0" cellspacing="0" class="tblstyle2">
					    	<tr id="tableHeaderDisplayTr">
					    		
					    	</tr>
					    </table>
					   </div>
					     
							<div style="max-height:374px; width:100%; overflow-y:auto; margin-top:-15px" id="dataDiv">
							<span id="emptyData"></span>
							<table id="parserTable" width="100%" cellpadding="5" cellspacing="1" border="0" bgcolor="#ebebeb" class="tblstyle2">
								<thead>
									
								</thead>
								<tbody>
									
							   	</tbody>
							</table>
							</div>
		
      </div>
    </div>
  </div>
  </div>
  </div>
  </div>

<div class="container-fluid mar-top80 rmDiv">
	<div class="row">
	 <div class="col-md-6"><h4 id="datahead" class="font16 mar-top8">QA Checklist</h4></div>
	<div class="col-md-12">
		<div class="panel panel-default">
				<div class="panel-body custom-padding">
					<div class="row">
						<div class="col-md-12" style="height:32px;">
							<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top6">Status</label></span>
							<span class="pull-left mar-rt5">
								<select name="Status" id="Status" class="form-control">
						          <c:if test="${not empty statusList}">
									<option value="${currentStatus}">${currentStatus}</option>
										<c:forEach items="${statusList}" var="statusList">
											<c:if test="${currentStatus ne statusList.statusName}">
												<option value="${statusList.statusName}">${statusList.statusName}</option>
											</c:if>
										</c:forEach>
								 	</c:if>
					        	</select>
							</span>
							<span>
								<input type="button" class="btn btn-primary" onclick="return modifyStatus();" value="Modify Status" />
                          	   <c:if test="${userGrpAttrMappingMap['Additional_QA_checks'] eq 'Additional_QA_checks'}">
								<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#showAdditionalQAChecksPopup"  onclick="showAdditionalQAChecks('N');" value="Additional QA Checks" />
				               </c:if>
				                <c:if test="${userGrpAttrMappingMap['Additional_QA_checks_Breakup'] eq 'Additional_QA_checks_Breakup'}">
								<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#showAdditionalQAChecksPopup"  onclick="showAdditionalQAChecks('Y');" value="Additional QA Checks-Breakup"/>
								</c:if>
							</span>
						</div>
					</div>
				</div>
			</div>	
	</div><!--- panel-default -->
</div><!-- row -->
</div><!-- container-fluid -->
 
            <input type="hidden" id="filingId" name="filingId" value="${fillingId}">
            <input type="hidden" name='encryptedFilingId' id='encryptedFilingId' value="${fillingId}" /> 
			<input type="hidden" id="wqId" name="wqId" value="${wqId}">
			<input type="hidden" id="fileName" name="fileName" value="${fileName}">
			<input type="hidden" id="customerId" name="customerId" value="${customerId}">
			<input type="hidden" id="customerName" name="customerName" value="${customerName}">
			<input type="hidden" id="bussinessName" name="bussinessName" value="${businessName}"> 
			<input type="hidden" id="compIdOrCik" name="compIdOrCik" value="${compIdOrCik}">
			<input type="hidden" id="caseId" name="caseId" value="${caseId}">
			<input type="hidden" id="docStatusQACheck" name="docStatusQACheck" value="${currentStatus}">
			<input type="hidden" id="sectionMapVal" name="sectionMapVal" value="${sectionMap}">
			<div id="data-div-1"></div>
	 

<div id="loadinglayer"></div>
<div id="showAdditionalQAChecksPopupDiv">
</div>

<script type="text/javascript">
var defualtSectionName="";
       $(document).ready(function()
		{
    	   $(".N").hide();
    	   uicTableDivHide();
			populateQAMessages($('#caseId').val());
			getOrigionalFileName($('#customerId').val(),$('#wqId').val());
			showConvertedFiles($('#customerId').val(),$('#wqId').val());
		});

function showAdditionalQAChecks(isBreakeup){
	
	 <c:forEach items="${sectionMap}" var="sectionMap" varStatus="loop">
  		<c:if test="${loop.count eq 1}">
  			defualtSectionName='${sectionMap.key}';
  		</c:if>
  	</c:forEach>
  	$('#sectionTabList li').each(function(i, li) {
  	  $(li).removeClass("active");  
  	});
  	showLoading();
  	
  	 getParserOutputForQAChecks(defualtSectionName,isBreakeup);	
  	 if(isBreakeup=='Y'){
  		$('#popuPanelHeading').html("QA Checks-Breakups");
  		
  	 }else{
  		$('#popuPanelHeading').html("Additional QA Checks");
  	 }
  	$('#isBreakupQaChecks').val(isBreakeup);
	
} 

function getParserOutputForQAChecks(statementFormat,isBreakeup){
	$('#emptyData').html("");
	 var filingId = $('#filingId').val();
	 var parametersDynamic='fillingId='+filingId+'&statementFormat='+statementFormat+'&isBreakup='+isBreakeup;
	 var url='parserOutputForQAChecks.htm';
  	 url=insertParam(url);
  	 var sectionDisplayName="";
  	 var sectionKey="";
  	<c:forEach items="${sectionMap}" var="sectionMap" varStatus="loop">
  		sectionKey ='${sectionMap.key}';
  		if(sectionKey === statementFormat){
  			sectionDisplayName='${sectionMap.value}';
  		}
	</c:forEach>
  	
   $("table#parserTable tbody").empty();
   $("table#parserTable thead").empty();
	$.ajaxSetup({
		cache: true
	});
	 $.ajax({
		type: "POST",  
		url: url,
		data:parametersDynamic,
		cache: true,
		dataType : "html",
		success: function(response)
		{	
	 		var responseObj = JSON.parse(response);
	 		var poModifyByList=responseObj["poModifyByList"];
	 		var poModifyBySelectString="";
	 		var QACheckFilterMapping;
	 		if(poModifyByList!=""){
		 		 var poModifyByListArray= JSON.parse(poModifyByList);
		 		 if(poModifyByListArray.length>0){
		 			 poModifyBySelectString =poModifyBySelectString+"<select id='poModifyBySelect'  style='width:120px' multiple='multiple' class='form-control custom-po-select' name='poModifyBySelect' onChange=showHideRows(this.value)>";
		 			 for(var i=0;i<poModifyByListArray.length;i++){
		 				 QACheckFilterMapping=poModifyByListArray[i];
		 				 poModifyBySelectString = poModifyBySelectString + "<option value='"+QACheckFilterMapping.modifiedBy+"' selected='selected'>"+QACheckFilterMapping.displayLabel+"</option>";
		 			 }
		 			 poModifyBySelectString = poModifyBySelectString +"</select>";
		 		 }else{
		 			 poModifyBySelectString =poModifyBySelectString+"<select id='poModifyBySelect' multiple='multiple' style='width:120px' multiple='multiple' class='form-control custom-po-select' name='poModifyBySelect'></select>";
		 		 }
	 		}else{
	 		 	poModifyBySelectString =poModifyBySelectString+"<select id='poModifyBySelect' multiple='multiple' style='width:120px' multiple='multiple' class='form-control custom-po-select' name='poModifyBySelect'></select>";
	 		}
	 		 if(isBreakeup =='Y'){
	 			$('#poModifyByDropDownLabelTd').html("");
	 			$('#poModifyByDropDown').html("");
	 			var modifyByTd='<td width="250px" valign="middle"><h1 style="padding:5px 0 0 0;  font-size:18px; border-bottom:0px" id="tableHeaderValue">'+sectionDisplayName+'</h1></td>';
	 			$('#tableHeaderDisplayTr').html(modifyByTd);
	 		 }else{
	 			 var modifyByTd='<td width="250px" valign="middle"><h1 style="padding:5px 0 0 0;  font-size:18px; border-bottom:0px" id="tableHeaderValue">'+sectionDisplayName+'</h1></td>';
	 			modifyByTd==modifyByTd+'<td width="100px" valign="middle" id="poModifyByDropDownLabelTd"><label style="margin-top:1px; color:#005d95;">Modifiy By :</label></td>';
	 			modifyByTd=modifyByTd+'<td width="auto" id = "poModifyByDropDown" valign="middle"></td>';
	 			
	 			$('#tableHeaderDisplayTr').html(modifyByTd);
	 			$('#poModifyByDropDown').html(poModifyBySelectString); 
		 		 $(".custom-po-select").multiselect({
		 			 includeSelectAllOption: true
		 		 });
	 		 }
	 		 
	 		var totalRecords =responseObj["totalRecords"];
	 		if(totalRecords>0){
	 			appendData(response);
	 		}else{
	 			$('#emptyData').html("No information available.");
	 		}
	 		hideLoading();
		}
	 	
	});
}

function appendData(response){
	 var parserOutPutObjList = JSON.parse(response);
	 var jsonObj =parserOutPutObjList["parserList"];
	 var arr = JSON.parse(jsonObj);	 
	 var columnCount=parserOutPutObjList["columnCount"];
	 columnCount=parseInt(columnCount);
	 var listOfNormItemLabels=parserOutPutObjList["listOfNormItemLabels"];
	 var listOfNormItemLabelsArray= JSON.parse(listOfNormItemLabels);	
	 var htmlHeaderString="";
	 htmlHeaderString =htmlHeaderString +"<tr><th style='width:50px; text-align:center'>SEQ</th>";
	 htmlHeaderString =htmlHeaderString +"<th style='width:460px;'>As Reported Label</th>";
	 htmlHeaderString =htmlHeaderString +"<th style='width:348px;'>Normalized Label</th>";
	 htmlHeaderString =htmlHeaderString +"<th style='width:78px;'>Sub Section</th>";
		for(var i=1;i<=columnCount;i++){
			 htmlHeaderString =htmlHeaderString +"<th>Value"+i+"</th>";
		}
	 htmlHeaderString =htmlHeaderString +"</tr>";
	 $("table#parserTable thead").empty();
	 $("table#parserTable thead").html(htmlHeaderString);
	 var htmlDataString="";
	 var parserOutputDataObj;
	 var normItemLabelObj;
	 $("table#parserTable tbody").empty();
	 
	 for(var i=0;i<arr.length;i++){
		 parserOutputDataObj = arr[i];
		 htmlDataString =htmlDataString +"<tr class ='poQAcheckRow "+parserOutputDataObj.trClass+"'>";
		 htmlDataString = htmlDataString + "<td align='center' id='parserOutputSequence'>" + parserOutputDataObj.poIndexOrder + "</td>";
			
		 htmlDataString = htmlDataString + "<td align='left' id='parserOutputAsRepLAbel'>" + parserOutputDataObj.poAsRepLabel + "</td>";
		 if(listOfNormItemLabelsArray.length>0){
			 htmlDataString = htmlDataString + "<td align='left' id='parserOutputNormItemLabel'><select class='form-control singleChosen' id='selectedNiItemQACheck"+parserOutputDataObj.poId + "' name='addNormLable'  onchange='saveNormItemLabelToParserOutput(this.value,"+parserOutputDataObj.poId+")' style='width:334px;font-size:11px !important'><option value='-1' >--Select--</option>";
			 for(var j=0;j<listOfNormItemLabelsArray.length;j++){
				 normItemLabelObj=listOfNormItemLabelsArray[j];
				 if(parseInt(parserOutputDataObj.niItem) == parseInt(normItemLabelObj.niItem)){
					 htmlDataString = htmlDataString + "<option value='"+parserOutputDataObj.poId+"~"+normItemLabelObj.niItem+"~"+normItemLabelObj.nilLabel+"' selected = 'selected'>"+normItemLabelObj.labelSection+": "+normItemLabelObj.nilLabel+"</option>";
				 }else{
					 htmlDataString = htmlDataString + "<option value='"+parserOutputDataObj.poId+"~"+normItemLabelObj.niItem+"~"+normItemLabelObj.nilLabel+"'>"+normItemLabelObj.labelSection+": "+normItemLabelObj.nilLabel+"</option>";
				 }
				 
			 }
			 htmlDataString = htmlDataString  + "</select></td>";
		 }else{
			 htmlDataString = htmlDataString + "<td align='left' id='parserOutputNormItemLabel'>" + parserOutputDataObj.normalizedLabel + "</td>";
		 }
		
		
		 htmlDataString = htmlDataString + "<td align='left' id='parserOutputSubSection'>" + parserOutputDataObj.poSubSection + "</td>";
		 for(var counter=1;counter<=columnCount;counter++){
			 htmlDataString = htmlDataString + "<td align='right' id='val"+counter+"'>" + parserOutputDataObj.poAsRepVal[counter] + "</td>";
		}
		 htmlDataString =htmlDataString +"</tr>";
		
	 }
	 $("table#parserTable tbody").html(htmlDataString);
	 $(".ParentParserRecord").css('background-color', '#baf0f2');
	 $(".form-control").css('font-size', '11px !important');
     jQuery(".singleChosen").chosen({width: "100%", search_contains: true});  
     }
     

function clickOnSection(selectedsectionNameParam){
		if(defualtSectionName!==selectedsectionNameParam){
			defualtSectionName=selectedsectionNameParam;
			getParserOutputForQAChecks(defualtSectionName,$('#isBreakupQaChecks').val());
		}
}

function showHideRows(obj){
	$(".poQAcheckRow").hide();
	$(".custom-po-select :selected").map(function(i, el) {
		console.log($(el).val());
   	    $("."+$(el).val()).show();
	});
}


</script>

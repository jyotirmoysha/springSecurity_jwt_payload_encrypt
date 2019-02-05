<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/qamessages_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css"> 
<script src="js/tableHeadFixer.js"></script>
<script type="text/javascript" src="js/jquery.bootpag.js"></script>
<style>
.custom-pad{padding:5px 6px 5px 6px !important}
.ui-autocomplete{z-index:99999}
.modal-dialog{margin-top:0px !important} 
</style>
<script type="text/javascript">

$(document).ready(function() {
	 
	 $("#MetaDataTable").tableHeadFixer();
		var totalRecords   ='${totalRecords}';
		var displayRecords =$('#displayRecordsId').val();
	if(totalRecords >0 && displayRecords>0){
	var startPage = 1;
	$("#totalRecords").val(totalRecords);
	 calpagenationAjax(startPage); 
}else{
	$('#MetaDataTable tbody').append("no data available!");
}

//
$('.Pageation').bootpag({
	total : 0,
	page : startPage,
	maxVisible : 10,
	leaps : true,
	firstLastUse : true,
	wrapClass : 'pagination',
	activeClass : 'active',
	disabledClass : 'disabled',
	nextClass : 'next',
	prevClass : 'prev',
	lastClass : 'last',
	firstClass : 'first'
}).on("page", function(event, num) {
	calpagenationAjax(num);
}).find('.pagination');

});

function calpagenationAjax(page) {	
    showLoading();
    	var keywordWQ = $('#keywordWQ').val();
	   	var keywordCN = $('#keywordCN').val();
		var featureListIDVal = $("#featureListIDS option:selected").text();
		var featureListID = $("#featureListIDS").val();
    	
		var displayRecords = $("#displayRecordsId").val();
		var totalRecords = $("#totalRecords").val();
		//processData = '&page='+encodeURIComponent(page)+'&displayRecords='+encodeURIComponent(displayRecords)+'&totalRecords='+encodeURIComponent(totalRecords);
		processData = '&page='+encodeURIComponent(page)+'&displayRecords='+encodeURIComponent(displayRecords)+'&totalRecords='+encodeURIComponent(totalRecords)+'&keywordWQ='+encodeURIComponent(keywordWQ)+'&keywordCN='+encodeURIComponent(keywordCN)+'&featureListID='+encodeURIComponent(featureListID);
		actionUrl = "jsonfeature_case_mapping.htm";
		successData = function(data) {
			hideLoading();
			$('#MetaDataTable tbody').empty();
			$('#pageInfo').empty();
			try {
				pagenation(data.totalPages, data.page);
				setDataToTable(data);
			} catch (err) {
				console.log("Error Occured in pagination" + err);
			}
			$('#MetaDataModal').modal('show');
		}
		errorData = function(data) {
			$.alert("Problem occurred while getting the values.");
		};
		callAjax(processData, successData, errorData, beforeSend,
				actionUrl, reqType, retDataType);
				
}


//dynamically set page and total pages in ajax.
function pagenation(totalPages, page) {
				$('.Pageation').empty();
				$('.Pageation').bootpag({
					total : totalPages,
					page : page,
					maxVisible : 10,
					leaps : true,
					firstLastUse : true,
					wrapClass : 'pagination',
					activeClass : 'active',
					disabledClass : 'disabled',
					nextClass : 'next',
					prevClass : 'prev',
					lastClass : 'last',
					firstClass : 'first'
				})
	}
	 
function setDataToTable(data) {
	
	var htmlString = "";
	var globalMetaObj;
	if(data.featureMapList!=null){
		for (var i = 0; i < data.featureMapList.length; i++){
			globalMetaObj = data.featureMapList[i];
			var inputs = '<tr>';
			inputs += '<td>'+globalMetaObj.wqId + '</td>';
			inputs += '<td>'+globalMetaObj.wqCompanyName +'</td>';
			inputs += '<td>' +globalMetaObj.wqStatus + '</td>';
			
			inputs += '<td>' + '<select name="Features" id="Features" class="form-control" onchange="updateFeatureCaseMappingData(this.value,'+globalMetaObj.wqId+');">';
			inputs += '<option value="0"></option>';
			if(data.featureList!=null){
				for (var j = 0; j < data.featureList.length; j++){
					var featureListObj = data.featureList[j];
					if(globalMetaObj.caseID == featureListObj.caseId){
					  		inputs += '<option value="'+featureListObj.caseId+'" selected="selected">'+featureListObj.caseName+'</option>';
					  }else{
						  inputs += '<option value="'+featureListObj.caseId+'">'+featureListObj.caseName+'</option>';
					  }
					
				}
			}
			inputs +='</select>';
			inputs += '</td>';
			
			inputs += '<td>'+parseJsonDate(globalMetaObj.createdOn)+'</td>';
			inputs += '<td>' + globalMetaObj.createdByI + '</td>';
			$('#MetaDataTable tbody').append(inputs);
			}
		var startNum=data.startNum;
		var endNum=data.endNum;
		var totalRecords=data.totalRecords;
	    $("#totalRecords").val(totalRecords);
		if(totalRecords >= endNum){
			$('#pageInfo').html("Displaying <b>"+startNum+"</b> to <b>"+endNum +"</b> of "+totalRecords+" records"); 
		}else{
			$('#pageInfo').html("Displaying <b>"+startNum+"</b> to <b>"+totalRecords +"</b> of "+totalRecords+" records"); 
		}
		//display dropdown of pageNation
		var displayRecords =$('#displayRecordsId').val();
		if(displayRecords < totalRecords){
			$('#displayDropDown').show();
		}else{
			$('#displayDropDown').hide();
		}
		
	}else{
		$('#MetaDataTable tbody').append("<tr><td colspan='3'>No data available!</td></tr>");	
		$('#pageInfo').empty();
		$('#displayDropDown').hide();
	}
}

function parseJsonDate(jsonDateString){
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//$.alert("Hi 1"+jsonDateString +"--"+new Date(parseInt(jsonDateString)));
	var date = new Date(parseInt(jsonDateString));
	
	var monthNames = [
	                  "January", "February", "March",
	                  "April", "May", "June", "July",
	                  "August", "September", "October",
	                  "November", "December"
	                ];
	
	
	var day = date.getDate();
	var monthIndex = date.getMonth();
	var year = date.getFullYear();
	
	var result = day + ' ' + monthNames[monthIndex] + ' ' + year;
	//$.alert(day + ' ' + monthNames[monthIndex] + ' ' + year);
	//console.log(day + ' ' + monthNames[monthIndex] + ' ' + year);
	//return new Date(parseInt(jsonDateString));
	return result;
}

function changeDisplayRecords(){
	var displayRecords =$('#displayRecordsId').val();
	if (displayRecords != null && displayRecords != 0) {
		/* calling pageation on changeDisplayvalues button */
		calpagenationAjax('1');
     }else{
    	 $.alert("Display record not empty!"); 
     }
}



function updateFeatureCaseMappingData(caseID,wqId){
		
	processData = 'caseID='+encodeURIComponent(caseID)+'&wqId='+encodeURIComponent(wqId);
	actionUrl = "updateWorkQueueForCaseId.htm";	
	successData = function(data){		
		$.alert(data);
		hideLoading();
	};
	errorData = function(data){		
		$.alert(data);
		hideLoading();
	};
	showLoading();
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
	
}

function setAutoCompleteDataWQ() {
	
	var keywordVal = $("#keywordWQ").val();
	if(keywordVal.trim().length > 1){
		processData = '&keywordVal=' + encodeURIComponent(keywordVal);
		showLoading();
		actionUrl = "autoCompleteToKeywordWQ.htm";
		successData = function(data) {
			hideLoading();
			setAutoCompleteDataToKeywordWQ(data.jsonArry);			        		   
		};
		errorData = function(data) {
			$.alert("error" + data);
		};
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
	}
}

function setAutoCompleteDataCN() {
	
	var keywordVal = $("#keywordCN").val();
	if(keywordVal.trim().length > 1){
		processData = '&keywordVal=' + encodeURIComponent(keywordVal);
		showLoading();
		actionUrl = "autoCompleteToKeywordCN.htm";
		successData = function(data) {
			hideLoading();
			setAutoCompleteDataToKeywordCN(data.jsonArry);			        		   
		};
		errorData = function(data) {
			$.alert("error" + data);
		};
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
	}
}

function setAutoCompleteDataToKeywordWQ(data) {
	 var availableTags =data; 
		$("#keywordWQ").empty();
		$("#keywordWQ").autocomplete({
			source: availableTags,
			minLength : 1,
			select: function(event, ui) {
			    $( "#keywordWQ").val(ui.item.label);
			     return false;
			     },
		});
}

function setAutoCompleteDataToKeywordCN(data) {
	 var availableTags =data; 
		$("#keywordCN").empty();
		$("#keywordCN").autocomplete({
			source: availableTags,
			minLength : 1,
			select: function(event, ui) {
			    $( "#keywordCN").val(ui.item.label);
			     return false;
			     },
		});
}

function searchFeatureCaseMappingList(){
	   var keywordWQ = $('#keywordWQ').val();
	   var keywordCN = $('#keywordCN').val();
		var featureListID = $("#featureListIDS option:selected").text();
		//var language = $("#languageId option:selected").text();
		var displayRecords = $("#displayRecordsId").val();
		$("#totalRecords").val(0);
		if (displayRecords != null && displayRecords != 0) {
			if (keywordWQ.trim() != '' || keywordCN.trim() != '' || featureListID.trim() != '') {
			} else {
				$.alert("please select one field!")
				return false;
			}
			/* calling pageation on search button */
			calpagenationAjax('1');
		} else {
			$.alert("no data found!");
		}
}
//onchange DropDowns
function customDropDown(){
	  // searchGlobalMeataDataList();   
}

</script>
<style>
.myTable tr th{color:#fff !important; font-weight:bold !important; background:#00AECF !important;}
.fade{padding-left:0px !important}
.txt-right{text-align:right !important}
.newtable1 tr td{border:1px solid #ccc}
.tblstyle1 th{text-align:left !important}
.chosen-container .chosen-results{max-height:150px;}
.chosen-container{width:334px !important}
.panel{margin-bottom:0px;}
 #showAdditionalQAChecksPopup{margin-top:66px !important}
</style>	
 </head> 
 <body> 
<form name="qa_feature_case_map_form" id="qa_feature_case_map_form" action="" method="POST">
<c:if test="${not empty featureCaseMappingList}">
<div class="container-fluid">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default mar-top4">
		<div class="panel-heading" role="tab" id="headingOne">
		<h4 class="panel-title">
         <a role="button" id="qaMessageId" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Feature Case Mapping
         </a>
       </h4>
	</div>
	 <!-- Search section start -->
	 <div class="panel panel-default">
		<div class="panel-body custom-padding">
	 		<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top3">WQ ID:</label></span>
	 		<span class="pull-left mar-rt5">
					<input type="text" class="" style="width:100px" id="keywordWQ" onkeyup="setAutoCompleteDataWQ();" autocomplete="off" name="keyword" /> 
			</span>
			<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top3">Company Name:</label></span>
	 		<span class="pull-left mar-rt5">
					<input type="text" class="" style="width:150px" id="keywordCN" onkeyup="setAutoCompleteDataCN();" autocomplete="off" name="keyword" /> 
			</span>
			<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top3">Features:</label></span>
			<span class="pull-left mar-rt5">
					<select class="form-control wdt-90 dropdwn" id=featureListIDS onchange="customDropDown();">
				     <option value='0'>ALL</option>
	     	 	      <c:forEach items="${featureList}" var="featureList"> 
			          <option value="${featureList.caseId}">${featureList.caseName}</option>	
	  			      </c:forEach> 
				     </select>
			</span>
			<span class="pull-right"><i class="fa fa-search custom-font14 custom-pad cus-cls" id="searchId" data-toggle="tooltip" data-placement="top" title="Search"  onclick="searchFeatureCaseMappingList();" ></i></span>
	 </div>
	 </div>
	 <!-- Search section end -->
	 <!-- Meta data table start -->
	 <input type="hidden" name="totalRecords" id="totalRecords" value="0">
	   <div class="clearfix"></div>
      <div class="mar-top-negi16" style="height:300px; overflow:auto">
        <table  id="MetaDataTable" class="table table-responsive newtable tblstyle dataTable-new">
        	<thead>
        		<tr>
        			<th nowrap="wrap"><strong>Case ID</strong></th>
					<th nowrap="wrap"><strong>Company Name</strong></th>
					<th nowrap="wrap"><strong>Status</strong></th>
					<th nowrap="wrap"><strong>Feature</strong></th>
					<th nowrap="wrap"><strong>Created On</strong></th>
					<th nowrap="wrap"><strong>Created By</strong></th>
        		</tr>
        	</thead>
        	<tbody>
        				     
        	</tbody>
        </table>
        	<input type="hidden" id="filingId" name="filingId" value="${fillingId}">
			<input type="hidden" id="wqId" name="wqId" value="${wqId}">
			<input type="hidden" id="fileName" name="fileName" value="${fileName}">
			<input type="hidden" id="customerId" name="customerId" value="${customerId}">
			<input type="hidden" id="customerName" name="customerName" value="${customerName}">
			<input type="hidden" id="bussinessName" name="bussinessName" value="${businessName}"> 
			<input type="hidden" id="compIdOrCik" name="compIdOrCik" value="${compIdOrCik}">
			<input type="hidden" id="caseId" name="caseId" value="${caseId}">
			<input type="hidden" id="docStatusQACheck" name="docStatusQACheck" value="${currentStatus}">
			<input type="hidden" id="sectionMapVal" name="sectionMapVal" value="${sectionMap}">
        </div>
	 
	  <!-- Meta data table end -->
	  <!-- Start for pagination -->
			<div  id="displayDropDown" style="width:7%; float:left; margin:20px 0 0 0; display: none">
	        <select id="displayRecordsId" class="form-control" style="height:26px !important;"  onchange="changeDisplayRecords();" >
	       	<option value='50'>50</option>
	       	<option value='100'>100</option>
	       	  	<option value='200'>200</option>
	    
	        </select>
	        </div>
	        <div class="bs-docs-example" style="width:auto; float:left">
			<p class="demo Pageation"  data-step="18" data-intro="pagenation"></p>
			</div>
			<div style="float:left; margin:25px 0 0 10px" id="pageInfo"></div>	 
	  <!-- End for pagination -->
	 </div>
	 </div>
</div>
</div>
</div>
</c:if>
</form>
</body>

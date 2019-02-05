<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var wqid = ["86922", "86916", "86979", "86844", "86841"];
$( "#Work_Queue_ID" ).autocomplete({
source: wqid
});

var compname = ["1234_test1", "	MultiPeriod_ITR", "test_PDF_ITR", "ELEGRAN LLC", "KML Enterprises Inc"];
$( "#Company_Name" ).autocomplete({
source: compname
});
$('.chosen').chosen();

function showFeatureChildPopUp(batchId)
{
    var featureId = $("#featureId").val();
    var tbodyData="";
	showLoading();
	var processData="batchId="+encodeURIComponent(batchId)+"&feautreId="+encodeURIComponent(featureId);
	var actionUrl="showFeaturePopupData.htm";
	 successData = function(data) {
     hideLoading();
     if(data.goldenSetReportsList!=null){
 		for (var i = 0; i < data.goldenSetReportsList.length; i++){
 			goldenSetReportObj = data.goldenSetReportsList[i];
 			tbodyData = '<tr>';
 			tbodyData += '<td align="center">'+goldenSetReportObj.wqId + '</td>';
 			tbodyData += '<td align="center">'+goldenSetReportObj.status +'</td>';
 			tbodyData += '</tr>';
 		}//end for
     }//end if 
     
 	 $('#featurePopUpId tbody').html(tbodyData);
  	 $('#featuremappingmodel').modal('toggle');
	};
	errorData = function(data) {
		hideLoading();
	};
	callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
}
function downloadGoldenCaseFile(batchId)
{
	showLoading();
	var processData="batchId="+encodeURIComponent(batchId);
	var actionUrl="checkFileValidation.htm";
	 successData = function(data) {
		  hideLoading();
		 if(data==='success'){
			window.location = "goldenCaseDownloadFileByPath.htm?batchId="+batchId;
		 }else{
			 $.alert(data);
		 }
    };
	errorData = function(data) {
		hideLoading();
	};
	callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);

}
</script>

<style>
.chosen-container{width:93% !important}
.chosen-container-single .chosen-single{height:28px; line-height:26px;}
</style>

<div id="featuremappingmodel" class="modal fade" role="dialog">
  <div class="modal-dialog" style="width:30%; margin-top:200px">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="margin-top:8px">&times;</button>
        <span style="font-size:14px; color:#ffff;">Header</span>
      </div>
      <div class="modal-body">
       <table class="table table-striped dataTable-new" id="featurePopUpId">
			<thead>
				<tr>
					<th width="75%">Work Queue ID</th>
					<th align="center">Status</th>
				</tr>
			</thead>
			<tbody>
			<!-- here data append dynamically -->
			</tbody>
		</table>
      </div>
    </div>
  </div>
</div>

<div class="" id="case_summary">
			<div>
				<table class="table-striped dataTable-new">
			<thead>
				<tr>
					<th>Batch ID</th>
					<th>Feature</th>
					<th width="10%">Created on</th>
					<th>Created by</th>
					<th width="10%">Batch status</th>
					<th width="7%">Download</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="batchTracker" items="${batchTrackersList}">
				<tr>
					<td>${batchTracker.batchId}</td>
					<td>
						<select class="form-control chosen" data-placeholder="Choose an option please" id="featureId">
						 <c:forEach items="${batchTracker.featuresMap}" var="featureObj">
						 <option value="${featureObj.key}">${featureObj.value}</option>
						 </c:forEach>
						</select> 
						<span class="pull-right"><input type="button" class="btn btn-primary pad4 mar-top1" value="GO" onclick="showFeatureChildPopUp(${batchTracker.batchId})"/></span>
					</td>
					<td align="center">${batchTracker.createdOn}</td>
					<td >${batchTracker.createdBy}</td>
					<td  align="center">${batchTracker.batchStatus}</td>
					<td  align="center"><a href="javascript:void(0)" onclick="downloadGoldenCaseFile(${batchTracker.batchId});"><i class="fa fa-download" style="font-size:16px"></i></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
			</div>
		</div>
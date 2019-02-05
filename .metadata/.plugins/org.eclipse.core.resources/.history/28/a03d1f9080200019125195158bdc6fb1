 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <script type="text/javascript">
 $(function() {		
		jQuery(".singleChosen").chosen({width: "165px"});
	});
 
 function submitAuditTrailForm() {
	 	var startDate=$('#startDate').val();
	 	var endDate=$('#endDate').val();
	 	var filingId=$('#filingId').val();
	 
	 	if((startDate=='' && endDate=='' && (filingId=='' || filingId==0))){
			$.alert("Please select Period or Filing Id");    		
	 	}else if(startDate!='' && endDate==''){
	 		$.alert("Please select End Date"); 
	 		 
	 	/*} else if(startDate!='' && endDate!=''){
	 		startDate = new Date(startDate);
	 		 endDate=new Date(endDate);
	 		 if(endDate < startDate){
	 			 $.alert("End Date should be less than start date");	 
	     } */
	     }else{
	    	$("#auditTrailForm").submit();
	    	$('#startDate').val('');
	    	$('#endDate').val('');
	    	$("#filingId").val($("#filingId option:first").val());
	    	$("#filingId").trigger("chosen:updated");
	 	}
	 }
		function clearDates(){
			$("#startDate").val("");
			$("#endDate").val("");
			$("#filingId").val($("#filingId option:first").val());
	    	$("#filingId").trigger("chosen:updated");

		 }
</script>
<style>
.jumbotron{padding:40px !important; width:100% !important;}
</style>



<div style="width:100%; margin:0px 0 10px 0; text-align:center;">

<iframe name="upload_iframe" src="" style="display:none;">
<jsp:include page="importError.jsp"></jsp:include>
</iframe>

<form name='auditTrailForm' id="auditTrailForm" action="download_audit_report.htm" method="POST" target = "upload_iframe">
	<div class="panel panel-default">
		<div class="panel-heading">Audit Trail</div>
		<div class="panel-body">
			<p style="color:#939393; font-size:11px;">Enter the Start Date and End Date to get the audit report for a particular period. You can also generate the report on the basis of filing ID. Click on download button to get the excel copy of the report.</p>
		<div class="jumbotron">
		<div class="row">
			<div class="col-md-4">
				<div class="col-md-4"><label>Start Date:</label></div>
				<div class="col-md-8">
					<input type="text" name="startDate" id="startDate" class="form-control" style="padding:2px !important" readonly="readonly">
					<script type="text/javascript">
						$( "#startDate" ).datepicker();
					</script>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="col-md-4"><label>End Date:</label></div>
				<div class="col-md-8">
					<input type="text" name="endDate" id="endDate" class="form-control" style="padding:2px !important" readonly="readonly">
				   <script type="text/javascript">
						$( "#endDate" ).datepicker();
					</script>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="col-md-5"><label>Filing Case Id:</label></div>
				<div class="col-md-7">
					<select  tabindex="2" id="filingId" name="filingId" class="form-control singleChosen" style="width:173px; !important">
			          <option value="0">All</option>
			          <c:forEach items="${filingIdList}" var="filingId" varStatus="status">
					  <option value="${filingId}">${filingId}</option>
					  </c:forEach>
			         </select>
				</div>
			</div>
			</div>
			</div>
			<div class="col-md-12 mar-negi12">
				<button type="button" class="btn btn-info"  onClick="submitAuditTrailForm()">Download</button>
				<input type="button" onclick="clearDates();" name="clear" id="clear" value="Clear" class=" btn btn-info">
			</div>
			
		</div>
	</div>	
</form>
</div>

 
 
 
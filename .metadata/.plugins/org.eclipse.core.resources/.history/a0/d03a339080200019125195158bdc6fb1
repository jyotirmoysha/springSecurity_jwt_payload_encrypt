 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$("#checkAll").change(function () {
    $("input:checkbox").prop('checked', $(this).prop("checked"));
});

</script>

 <script language="javascript" type="text/javascript">
    function submitReleaseLockForm() {
    	try{
    
    	var checkboxArray = new Array();
    	$.each($("input[name='filingIdCheckbox']:checked"), function() {
    		checkboxArray.push($(this).val());
    	});
    	if(checkboxArray.length<=0){
    		$.alert("Please select Case Id");
    		return;
    	}
    	showLoading();
    	var processData = "&checkboxArray=" + encodeURIComponent(checkboxArray);
     	actionUrl = "updateReleaseLock.htm";
 		successData = function(data) {
 		hideLoading();
 		$.alert(data);
 		showReleaseLockDiv('releaseLockDiv');
 		/* Here we are uncheck all chekboxes */
 		$.each($("input[name='filingIdCheckbox']:checked"), function() {
 			$(this).prop('checked', false);
 			$('#checkAll').attr('checked', false);
    	});
 		
 		};
 		errorData = function(data) {
 			hideLoading();
 			$.alert("Error while unlocking cases");
 		};
 		console.info("--------Value Validated-------");
 		retDataType = "html";
 		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType); 
    	}catch(err){
    		hideLoading();
    		$.alert(err);
    	}
    }
</script>

<style>

</style>
<div style="width:100%; margin:10px 0 10px 0; text-align:center;">

<form name="releaseLockForm" id="releaseLockForm"  method="POST">
		<!-- <p>Enter the Start Date and End Date to get the audit report for a purticular period. You can also generate the report on the basis of filing ID. Click on download button to get the excel copy of the report.</p> -->
		<div class="title-bg">Release lock feature to release the locks of the intended cases</div>
		
		<div style="height:350px; overflow:auto">
		<table width="100%" cellspacing="0" cellpadding="5" border="0" class="release-tbl newTable datatable-new table table-bordered" >
		  <thead>
		     <tr>
		       <th width="2%"><input type="checkbox" id="checkAll" class="mar-lt4"/></th>
		       <th>Case Id</th>
		       <th>Created Date</th>
		       <th>Company Name</th>
		       <th>Locked By</th>
		       <th>Locked Since</th>
		     </tr>
		  </thead>
		  <tbody>
			  <c:forEach var="workQueue" items="${workQueueList}">
			  <tr>
			  	<td align="left"><input type="checkbox" id="filingIdCheckbox" name="filingIdCheckbox" value="${workQueue.filingId}" /></td>
			  	<td align="left"><c:out value="${workQueue.filingId}"/></td>
			  	<td align="left"><c:out value="${workQueue.createDate}"/></td>
			  	<td align="left"><c:out value="${workQueue.wqCustomerName}"/></td>
			  	<td align="left"><c:out value="${workQueue.lockedBy}"/></td>
			  	<td align="left"><c:out value="${workQueue.differenceTwoDates}"/></td>
			  </tr>
			  </c:forEach>
		  </tbody>
		</table>
		</div>
		<div class="btn-wrap">
			<input type="button" class="btn btn-info" value="Submit" onClick='submitReleaseLockForm()'/>
			<input type="button" class="btn btn-info mar-rt10" value="Refresh"  onclick="showReleaseLockDiv('releaseLockDiv');"/>
		
		</div>
	</form>
	</div>

 
 
	<script>
	$('.multiselect').multiselect({
	includeSelectAllOption: true,
	buttonWidth: 130,
	});
	</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form name="submitFeatureMappingForm" id="submitFeatureMappingForm">
		<div class="tab-pane fade in active" id="case_association">
				<div class="container-fluid">
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-body" style="margin-bottom:-36px !important; height:481px">
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading"><span>Feature Name</span> <span class="mar-lt120">Work Queue ID</span></div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading"><span class="mar-lt3">Feature Name</span> <span class="mar-lt120">Work Queue ID</span></div>
							</div>
						</div>
						<div style="height:336px; overflow:auto; border:1px solid #fff;">
						<c:forEach var="dataValMapObj" items="${dataValMap}" varStatus="status">
						
					<c:if test="${status.count % 2 == 0}"> 	
					<div class="col-md-6 mar-top10">
						 <div class="col-md-8"><label>${dataValMapObj.key}</label></div>
					 <div class="col-md-4">
					  <c:set var="workQueueCmdList" value="${dataValMapObj.value}"/>
						 <select id="multiselect" class="multiselect" multiple="multiple" name="multiple"+${dataValMapObj.key}>
						<c:forEach var="workQueueCmdObj" items="${workQueueCmdList}">
						<option value="${workQueueCmdObj.filingId}">${workQueueCmdObj.filingId}:${workQueueCmdObj.companyName}</option>
						</c:forEach>						
						</select>
					 </div>
					</div>
					</c:if>
				  <c:if test="${status.count % 2 != 0}">
					<div class="col-md-6 mar-top10">
					 <div class="col-md-8"><label>${dataValMapObj.key}</label></div>
					   <div class="col-md-4">
					    <c:set var="workQueueCmdList" value="${dataValMapObj.value}"/>
					   <select id="multiselect" class="multiselect" multiple="multiple" name="multiple"+${dataValMapObj.key}>
						<c:forEach var="workQueueCmdObj" items="${workQueueCmdList}">
						<option value="${workQueueCmdObj.filingId}">${workQueueCmdObj.filingId}:${workQueueCmdObj.companyName}</option>
						</c:forEach>						
						</select>
					</div>
				 </div>
				 </c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			
			</div>
			</div>
			<div class="pull-right">
				<input type="button" class="btn btn-info" value="Submit" style="margin:-56px 10px 20px 0;" onclick="submitFeatureMapping()"/> 
			</div>
		</div>
		</form>
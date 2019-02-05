<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/report_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet" media="all"/>
<script type="text/javascript" src="js/appjs/report.js?value=${applicationScope['version']}"></script>
<script>

//below variable are rerquired for click backs
var USERIDDEC = '${userIdDec}';
var USERGROUPIDDEC = '${userGroupIdDec}';
</script>
 <script type='text/javascript'>
 	$(document).ready(function() {
    		$('#roleId').multiselect({
    			 buttonWidth: '100%',
    		   includeSelectAllOption: true
    		});
    		
    		$('#analystId').multiselect({
    			buttonWidth: '100%',
     		   includeSelectAllOption: true
     		});
    		
    		$(".multiselect-selected-text").css('float', 'left')
    		$(".caret").css('float', 'right');
            $(".caret").css('margin', '8px 0'); 
    	});
</script>

<script type="text/javascript">
		
		     var appendDynamicData="true";
		    $(document).ready(function() {
		  	
		     $("#startDate").change(function() {
				   $('#selectPeriod').attr('disabled', 'disabled');
				   enableSearchBtn();
			    });
			    
			 $("#endDate").change(function() {
				   $('#selectPeriod').attr('disabled', 'disabled');  
				   enableSearchBtn();
			   });
		
			var temp=${ReportStatusValues};
		    });
</script>	
			<div class="content_wpr main-doc-width main_min_width rmDiv" style="margin-top: 94px;" id="reportMain" style="display: block;">
				<div class="reportleft" style="width:100% !important;">
					<table width="100%" border="0" cellspacing="0" cellpadding="5" class="newTable dataTable-new">
						<tr>
							<td width="5%">Start Date:</td>
							<td width="10%">
						      <input type="text" name="startDate"  id="startDate" style="width:97% !important; padding:2px !important" readonly="readonly">
						      	<script type="text/javascript">
									$( "#startDate" ).datepicker();
								</script>
						      </td>
							<td width="20%" valign="bottom">Role :</td>
							<td width="20%" valign="bottom">Analyst:</td>
							<td width="8%"><div style="float:left; margin:0 5px 0 0"><input type="button" name="reset" id="btnReset" value="Refresh" onclick="resetStatus();" class="btn btn-info" ></div></td>
						</tr>
						<tr>
							<td >End Date:</td>
							<td  ><input type="text"  name="datepick2" id="endDate" style="width:97% !important; padding:2px !important" readonly="readonly">
						    	<script type="text/javascript">
									$( "#endDate" ).datepicker();
								</script>
							</td>
						<td>
							<select name="roleId" id="roleId" class="inputsource form-control" multiple="multiple">
						      <option value="MAKER">Maker</option>
						      <option value="CHECKER">Checker</option>
						      <option value="QA">QA</option>
						      </select>
						      
						      
						</td>
						<td >
						<select name="analystId" id="analystId" class="inputsource form-control" onchange="javascript:getAnalystSummery();"> 
					     <c:if test="${not empty analystList}">
					     <c:forEach items="${analystList}" var="analyst">
					     <%-- <option value="${analyst.key}">${analyst.value}</option> --%>
					     <option value="${analyst.value}">${analyst.value}</option>
					     </c:forEach>
					     </c:if>
					      <c:if test="${empty analystList}">
							<option value="0">Not Available</option>
							<option value="1">None</option>
						 </c:if>
						 </select>
						</td>
						<td><div><input type="button" name="search" id="btnSearch" value="Search" onclick="searchStatus();" class="btn btn-info disabled"></div></td>
					</table>
					
					<div class="nav-new">
						<span style="padding:0 0 0 0"><a href="javascript:void(0)" onclick="callReports(1);" class="active" id="1">Case Level Summary</a></span>
						<span style="padding:0 0 0 0"><a href="javascript:void(0)" onclick="callReports(2);" class="" id="2">Analyst Productivity Tracker</a></span>
						<span style="padding:0 0 0 0"><a href="javascript:void(0)" onclick="callReports(3);" class="" id="3">Audit Trail</a> </span>
						<!-- <span style="padding:0 20px 0 0"><a href="javascript:void(0)" onclick="callReports(4);" class="" id="4">Excel Export</a> </span></span> -->
					</div>
					
				</div>
                	<div id="master_1" style="margin-bottom:50px">
                		<div>
	                		<div class="col-md-12 bg-green">Case Submission:</div>  
		                	<div id="casesubmissiontable" class="col-md-6"></div>
		                	<div id="casesubmissionchart" class="col-md-6" ></div>
                		</div>
                		
                		<div class="col-md-12 bg-green">Case Inventory:</div>
                		<div class="col-md-6">
                		<div id="caseuploadedtable" class="col-md-12"></div>
	                	<div id="caseinventorytable" class="col-md-12"></div>
	                	</div>
	                	<div id="caseinventorydonut" class="col-md-6 bdr"></div>
	                	
	                	<div class="col-md-12 bg-green">Document Processing:</div> 
	                	<div id="documentprocessingtable" class="col-md-6"></div>
	                	<div id="documentprocessingchart" class="col-md-6 bdr" style="margin-bottom:100px; "></div>

                	</div>
                	<div id="master_2" style="display: none;">
                	<div id="analystproductivitytrackertable" class="col-md-12 " style="margin-top: 13px !important;"></div>
                	
                	</div>
  	               	<div id="master_3" style="display: none;">
                	<div class="col-md-12 bg-green">Audit Trail:</div>
  	               	<div id="audittrailtable" class="col-md-6 "></div>
  	               	<div id="audittrailchart" class="col-md-6 "></div>
                	<div class="col-md-12 bg-green">Audit Trail at Statement Level:</div>  	               	
  	               	<div id="audittrailatstatementleveltable" class="col-md-6"></div>
  	               	<div id="audittrailatstatementlevelchart" class="col-md-6"></div>
  	               	</div>
              	   <div id="master_4" style="display: none;"> Excel Export             		
                	</div>
                	
                <div id="loadinglayer"></div>
			</div>
		 <footer style="position:fixed; bottom:0px;">
			<div class="footer_wpr main-doc-width main_min_width"><jsp:include page="footer.jsp" ></jsp:include></div>
		</footer>
		
	<input id="currentGId" type="hidden" value="${user_GroupId}" />
	<input id="userAccess" type="hidden" value="${userAccess}" />


<!-- <div id="uic_Table" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;"> </div> -->
</body>
 <script type="text/javascript" src="js/datepickr.min.js"></script> 
</html>
	
 

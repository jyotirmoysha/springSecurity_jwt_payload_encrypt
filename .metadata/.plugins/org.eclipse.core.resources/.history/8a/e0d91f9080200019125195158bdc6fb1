<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
	<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.custom.css" />

	<!--[if IE]>
		<script src="js/html5.js"></script>
	<![endif]-->
	<!--[if lte IE 7]>
		<script src="js/IE7.js" type="text/javascript"></script><![endif]-->
	<!--[if lt IE 8]>
		<script src="js/IE8.js" type="text/javascript"></script>
	<![endif]-->
<script src="js/common.js?value=${applicationScope['version']}"></script>
	<!-- --for processing wheel -->
	<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
	<script src="js/jquery.darktooltip.js"></script>	
	<script>
		$(function(){
			var thlength = $("#myTable tr:eq(0) th").length;
			$("#myTable tr:eq(0) th:eq(0)").css("width", "400px");
			$("#myTable tr").each(function(index){
				var myrowtd = $(this).find('td').length;
				var addtdcount = thlength - myrowtd;
				var myrow = $(this);
				if(myrowtd < thlength){
					for(var j=0; j < addtdcount; j++){
						var myclass = $(myrow).find("td:last").attr("class");
						$(myrow).find("td:last").after('<td class="'+myclass+'">&nbsp;</td>');
					}
				}
				
			})
		})
		
		
		
		
	</script>
	
	
		<script>
	function submitBankNormalization( wqId, decryptedFillingId,  customerId, decryptedCustomerName, bussinessName, fileName, decryptedCompIdOrCik) {
		var accId = $("#accId").val();
		
		var workFlowIndicatorParent='${currentApplication.workFlowIndicator}';

      
			location.href = 'bank_normalization_view.htm?accId='+ encodeURIComponent(accId)
					+ '&customerName=' + encodeURIComponent(decryptedCustomerName)
					+ '&WqId='+ encodeURIComponent(wqId) 
					+ '&fillingId=' + encodeURIComponent(decryptedFillingId)
					+ "&customerId=" + encodeURIComponent(customerId)
					+ "&businessName=" + encodeURIComponent(bussinessName)
					+ "&fileName=" + encodeURIComponent(fileName)
					+ "&compIdOrCik=" + encodeURIComponent(decryptedCompIdOrCik);
				
	}
		</script>
			<jsp:include page="common/appheader.jsp" >
				    <jsp:param name="pageNo" value="7"/>   
				    <jsp:param value="${fillingId}" name="caseId"/>
            		<jsp:param value="${customerId}" name="customerId"/>
            		<jsp:param value="${customerName}" name="customerName"/>
           			 <jsp:param value="${businessName}" name="bussinessName"/>
            		<jsp:param value="${compIdOrCik}" name="compIdOrCik"/>
            		<jsp:param value="${decryptedCompIdOrCik}" name="decryptedCompIdOrCik"/>
            		<jsp:param value="${decryptedFillingId}" name="decryptedFillingId"/>
            		<jsp:param value="${decryptedCustomerName}" name="decryptedCustomerName"/>
            		<jsp:param value="${wqId}" name="wqId"/>   
				</jsp:include>	
<section style="margin-top:100px">
 <div class="container-fluid mar-top57">
<div class="row">
		<div class="col-md-12"><h4 id="datahead" class="font16 mar-top8 mar-rt5">Normalized View</h4></div>
		<div class="col-md-12 mar-negi4">
			<div class="panel panel-default">
			<div class="panel-body custom-padding">
				<div class="row" style="margin-right:-18px !important">
				<div class="col-md-12">
					<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top6">Status</label></span>
					<span class="pull-left mar-rt5" style="padding:6px; color:#00aecf; font-weight:bold"> ${currentStatus}</span>
					<c:set var="filing_id" value="${fillingId}"/>
					 <span class="pull-right">
					 <c:if test="${showNIItemValueMapFlag eq 'false'}">
					<span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" onClick="normalizedViewExportToExcel('<c:out value="${wqId}"/>', '<c:out value="${fillingId}"/>', '<c:out value="${customerId}"/>', '<c:out value="${customerName}"/>', '<c:out value="${businessName}"/>', '<c:out value="${fileName}"/>', '<c:out value="${compIdOrCik}"/>');"
						class="btn btn-info" id="export" value="Export" /></span>
					</c:if>
				 </span> 
				</div>
			</div>
			</div><!--- panel-body -->
			</div><!--- panel-default -->
			</div>
			<div class="mar-top-negi16">
				<div class="col-md-12">
							<div id="finStatement" class="financeTable" class="fin-tbl" style="margin-top:-10px">
	    	<c:choose>
			    <c:when test="${ShowAccList eq 'true'}">  
			  <c:forEach items="${NormalizedBankValueDetails}" var="normalizedBankValueDetails" varStatus="status">
			
			  	<c:set var="accNo" value="${normalizedBankValueDetails.key}"/>
			  	<c:set var="accValMap" value="${normalizedBankValueDetails.value}"/>			
			  
			   <table width="100%" border="0" cellspacing="2" cellpadding="0" style="margin-bottom:5px;" >
			  <tr>
			    <td width="33%" align="left" valign="middle">
			    	<table width="100%" border="0" cellspacing="7" cellpadding="0">
			      		<tr>
			      		
			        		<td width="12%" align="left" ><b>Account No : &nbsp;<c:out value="${accNo}"/></b></td>
			        		
			      		</tr>
			    	</table>
			    
			  </table>
			  
			  
			   <table width="100%" border="0" cellspacing="2" cellpadding="0" style="margin-bottom:5px;" >
			  <tr>
			    <td width="33%" align="left" valign="middle" class="td-bg">
			    	<table width="100%" border="0" cellspacing="7" cellpadding="0">
			      		<tr>
			        		<td width="12%" align="middle">Account Summary</td>
			        		
			      		</tr>
			    	</table>
			    
			  </table>	
			  
				
				
				
				
				
				<c:set var="showNIItemValueMapFlag" value="${accValMap['showNIItemValueMapFlag']}"/>
	
		<c:choose>
			<c:when test="${showNIItemValueMapFlag eq 'false'}">
				 <table width="100%" border="0" cellspacing="2" cellpadding="0" style="margin-bottom:20px;" >
			  <tr>
			    <td width="33%" align="left" valign="middle" class="td-bg">
			    	<table width="100%" border="0" cellspacing="7" cellpadding="0">
			      		<tr>
			        		<td width="12%" align="middle"> No data available for Account Summary. </td>
			      		</tr>
			    	</table>
				</table>	
			</c:when>
			<c:otherwise>
			
				<c:set var="NIItemHeaderList" value="${accValMap['NIItemHeaderList']}"/>
			
		<table id="myTable123" name="myTable" class="tblstyle" width="100%" cellspacing="0" cellpadding="5" style="margin-bottom:25px;"  border="0">
		
		
				<tr>
						<th  width="15%"> <c:out value="Description"/></th> 
				
					<c:forEach items="${NIItemHeaderList}" var="headerValue">
						<th> <c:out value="${headerValue}"/></th> 		
					</c:forEach>
				</tr>	
		<c:set var="NIItemMap" value="${accValMap['NIItemMap']}"/>
				<c:forEach items="${NIItemMap}" var="NIItemMapVal" varStatus="status">
				
				<c:if test="${NIItemMapVal.key eq 'NIItemList'}">
				<c:set var="listOfNIItem" value="${NIItemMapVal.value}"/>				    		
					<c:forEach items="${listOfNIItem}" var="normLabel" varStatus="status">
					<tr>					
						<c:if test="${normLabel eq 130}">
										<td class="subheadtd" width="15%"><c:out value="Beginning Balance "/></td>	
						</c:if>
						<c:if test="${normLabel eq 140}">
										<td class="subheadtd" width="15%"><c:out value="Deposits"/></td>	
						</c:if>
						<c:if test="${normLabel eq 150}">
										<td  class="subheadtd" width="15%"><c:out value="Withdrawals"/></td>	
						</c:if>
						<c:if test="${normLabel eq 100000}" >
										<td  class="subheadtd" width="15%"><c:out value="Calculated Balance"/></td>	
						</c:if>
						
						<c:if test="${normLabel eq 160}">
										<td  class="subheadtd" width="15%"><c:out value="Ending Balance"/></td>	
						</c:if>
								<c:set var="NIItemValueMap" value="${accValMap['NIItemValueMap']}"/>	
								
							
									
							<c:forEach items="${NIItemValueMap}" var="NIItemValue" varStatus="status1">
							
								<c:if test="${NIItemValue.key eq normLabel}">
								<c:set var="listOfNormalisedValues" value="${NIItemValue.value}"/>
														
									<c:forEach items="${listOfNormalisedValues}" var="normval2" varStatus="status2">		
												    
									
										<td a='vvv' align="right" width="${85/NIItemHeaderList.size()}%"><fmt:formatNumber   type="number" maxFractionDigits="3" value="${normval2.value}"/></td>
											
									</c:forEach>
								</c:if>
							</c:forEach>
					  </tr>
					</c:forEach>
				</c:if>
				
				</c:forEach>
		</table>
			</c:otherwise>
		</c:choose>

	
	 <table width="100%" border="0" cellspacing="2" cellpadding="0" style="margin-bottom:5px;" >
			  <tr>
			    <td width="33%" align="left" valign="middle" class="td-bg">
			    	<table width="100%" border="0" cellspacing="7" cellpadding="0">
			      		<tr>
			        		<td width="12%" align="middle">   Deposit </td>
			        		
			      		</tr>
			    	</table>
			    
	</table>
	
	<!--  for Deposit -->
			<c:set var="showNIDepositItemValueMap" value="${accValMap['showNIDepositItemValueMap']}"/>
		<c:choose>
				<c:when test="${showNIDepositItemValueMap eq 'false'}">
			    	
	 <table width="100%" border="0" cellspacing="2" cellpadding="0" style="margin-bottom:20px;" >
			  <tr>
			    <td width="33%" align="left" valign="middle" class="td-bg">
			    	<table width="100%" border="0" cellspacing="7" cellpadding="0">
			      		<tr>
			        		<td width="12%" align="middle">   No data available for Deposit. </td>
			        		
			      		</tr>
			    	</table>
			    
	</table>
			</c:when>
			<c:otherwise>
				<c:set var="NIItemHeaderList" value="${accValMap['NIItemHeaderList']}"/>
		<table id="myTable123" name="myTable" class="tblstyle" width="100%" cellspacing="0" cellpadding="5" border="0">
				<tr>
						<th  width="15%"> <c:out value="Description"/></th> 
					
					<c:forEach items="${NIItemHeaderList}" var="headerValue">
						<th> <c:out value="${headerValue}"/></th> 		
					</c:forEach>
				</tr>	
	<c:set var="NIItemMap" value="${accValMap['NIItemMap']}"/>
				<c:forEach items="${NIItemMap}" var="NIItemMapVal" varStatus="status">

				<c:if test="${NIItemMapVal.key eq 'NIItemDepositList'}">
				<c:set var="listOfNIItem" value="${NIItemMapVal.value}"/>				    		
					<c:forEach items	="${listOfNIItem}" var="normLabel" varStatus="status">
					<tr>					
						<c:if test="${normLabel eq 480}">
										<td class="subheadtd" width="15%"><c:out value="AXP "/></td>	
						</c:if>
						<c:if test="${normLabel eq 490}">
										<td class="subheadtd" width="15%"><c:out value="Other Bankcard"/></td>	
						</c:if>
						<c:if test="${normLabel eq 500}">
										<td  class="subheadtd" width="15%"><c:out value="Cash"/></td>	
						</c:if>
						<c:if test="${normLabel eq 2940}">
										<td  class="subheadtd" width="15%"><c:out value="Total Deposits"/></td>	
						</c:if>
								<c:set var="NIDepositItemValueMap" value="${accValMap['NIDepositItemValueMap']}"/>	
								
							<c:forEach items="${NIDepositItemValueMap}" var="NIItemValue" varStatus="status1">
							
								<c:if test="${NIItemValue.key eq normLabel}">
								<c:set var="listOfNormalisedValues" value="${NIItemValue.value}"/>
									<c:forEach items="${listOfNormalisedValues}" var="normval2" varStatus="status2">
										<td align="right" width="${85/NIItemHeaderList.size()}%"><fmt:formatNumber   type="number" maxFractionDigits="3" value="${normval2.value}"/></td>	
									</c:forEach> 
								</c:if>
							</c:forEach>
					  </tr>
					</c:forEach>
				</c:if>
				</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
 
 
 <table id="mainTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:25px;">
 <tr>
 <td colspan="6" class="td-bg" align="center" valign="middle">Debit ACH Summary</td>
 </tr>
 <tr>
    
    <c:set var="stmtDateMap" value="${normalizedBankValueDetailsForDebitACH.value}" />
    <c:forEach items="${normalizedBankValueDetailsForDebitACH}" var="normalizedBankValueDetailsForDebitACH" varStatus="status">
	
	
	<c:if test="${normalizedBankValueDetailsForDebitACH.key eq accNo}">
      
      <c:set var="stmtDateMap" value="${normalizedBankValueDetailsForDebitACH.value}" />
	   <c:forEach items="${stmtDateMap}" var="stmtDateMap">
			
      
       <c:set var="normalizeViewForDebitACHCommand" value="${stmtDateMap.value}"/>
      
      <td align="left" valign="top">
     <table width="100%" id="colTable1" cellspacing="0" cellpadding="5" border="0" class="tblstyle" style="margin-top:5px;">
     <tr>
     <th colspan="2">Month</th>
     <td colspan="3" class="subheadtd" align="center"><c:out value="${stmtDateMap.key}"/></td>
     </tr>
     <th colspan="2">Beginning Balance</th>
     <td colspan="3" align="right" valign="middle" class="subheadtd"><c:out value="${normalizeViewForDebitACHCommand.beginingBalance}"/></td>
     </tr>
     <tr>
        <th >Date<br/>(MM/DD/YYYY)</th>
        <th >Deposits</th>
        <th >Withdrawals</th>
        <th >Daily Cash Balance</th>
        <th >Calculated Daily Balance</th>
      </tr>
    	<c:set var="depositsListMap" value="${normalizeViewForDebitACHCommand.deposits}"/>
    	<c:set var="withdrawalsListMap" value="${normalizeViewForDebitACHCommand.withdrwals}"/>
    	<c:set var="dailyCashBalanceListMap" value="${normalizeViewForDebitACHCommand.dailyCashBalance}"/>
    	
    	<c:set var="statementDateList" value="${normalizeViewForDebitACHCommand.stmtDate}"/>
 		<c:set var="beginingBalance" value="${normalizeViewForDebitACHCommand.beginingBalance}"/>

     <c:forEach items="${statementDateList}" var="statementDate" varStatus="status">
      <tr>
     	
      	<c:set var="calcDailyCashBal" value="${beginingBalance+depositsListMap[statementDate]-withdrawalsListMap[statementDate]}"></c:set>
     
     	<td align="center" valign="middle">${statementDate}</td>
      
      		
        <td align="right" valign="middle"><c:out value="${depositsListMap[statementDate]}"/></td>
        <td align="right" valign="middle"><c:out value="${withdrawalsListMap[statementDate]}"/></td>
        <td align="right" valign="middle"><c:out value="${dailyCashBalanceListMap[statementDate]}"/></td>
        
        <td align="right" valign="middle"><fmt:formatNumber type="number" maxFractionDigits="2" value="${calcDailyCashBal}"/></td>
        
        <c:set var="beginingBalance" value="${calcDailyCashBal}"/>
        
      </tr>
  
    </c:forEach>
     
     </table>
    </td>
   <td width="2%" align="left" valign="top">&nbsp;</td>
   </c:forEach>
   </c:if>
   </c:forEach>
   
   
    
  </tr>
</table>
	<!-- End Deposit -->
	
	

	

 </c:forEach>
</c:when>
<c:otherwise>
 
  <table width="100%" border="0" cellspacing="2" cellpadding="0" style="margin-bottom:20px;" >
			  <tr>
			    <td width="33%" align="left" valign="middle" class="td-bg">
			    	<table width="100%" border="0" cellspacing="7" cellpadding="0">
			      		<tr>
			        		<td  align="left" style="font-size:12px;">No data available. </td>
			        		
			      		</tr>
			    	</table>
			    
	</table>
</c:otherwise>
</c:choose>
	    	</div>
				</div>
			</div>	
		</div><!-- row -->
	</div><!-- container-fluid -->	
	</section>
		 <footer>
			<div class="footer_wpr main-doc-width"><div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include>
	</div> </div>
		</footer> 
        <!-- <script src="js/bootstrap.min.js"></script> -->
        <script src="assets/js/docs.min.js"></script>
      <div id="text-file-data">
      
      </div> 
<div id="loadinglayer"></div>
<script type="text/javascript">
function normalizedViewExportToExcel(wqId, decryptedFillingId,  customerId, decryptedCustomerName, bussinessName, fileName, decryptedCompIdOrCik) {
	
		  var showAccList = $("#ShowAccList").val();
		
      if(ShowAccList == "false")
              return true;
      else{
    
		        setLocationHref('bankNormalizedViewExportToExcel.htm?customerName=' + encodeURIComponent(decryptedCustomerName)
				+ '&WqId='+ encodeURIComponent(wqId) 
				+ '&fillingId=' + encodeURIComponent(decryptedFillingId)
				+ "&customerId=" + encodeURIComponent(customerId)
				+ "&businessName=" + encodeURIComponent(bussinessName)
				+ "&fileName=" + encodeURIComponent(fileName)
				+ "&compIdOrCik=" + encodeURIComponent(decryptedCompIdOrCik));
      }	

}
</script>


<script>
$(document).ready(function() {
	
	$('[name=accId]').val('${accId}');
		getOrigionalFileName('${customerId}','${wqId}');
		showConvertedFiles('${customerId}', '${wqId}');
	});
	
     var objTable = document.getElementsByTagName("td");
     
</script>

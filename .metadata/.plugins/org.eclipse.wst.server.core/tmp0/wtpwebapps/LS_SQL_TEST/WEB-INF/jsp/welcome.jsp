<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/uic/jsp/include.jsp"%> 
<!DOCTYPE HTML>

<html lang="en">
<head>
<title>LiveSpread</title>
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />   
	<meta http-equiv="Expires" content="-1" />
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
	<link rel="stylesheet" type="text/css" href="css/commonCSS/custom-style.css?value=${applicationScope['version']}">
 	<link rel="stylesheet" type="text/css" href="css/commonCSS/appheader.css?value=${applicationScope['version']}" /> 
	<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.min.css" />
	<link rel="stylesheet" href="css/commonCSS/welcome.css?value=${applicationScope['version']}" type="text/css">
 	<link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/welcome_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css">
	<link type="text/css" href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link type="text/css" href="fonts/glyphicons/css/glyphicons.css" rel="stylesheet">
	<link type="text/css" href="fonts/themify-icons/themify-icons.css" rel="stylesheet"><!-- Themify Icons -->
	<script src="js/jquery/jquery-migrate.min.js"></script>
	<script src="js/common.js?value=${applicationScope['version']}"></script>
	<script type="text/javascript" src="js/fabric.js"></script>
	<script type="text/javascript" src="js/pdf.min.js"></script>
	<script type="text/javascript" src="js/pdf.combined.js"></script>
	<script type="text/javascript" src="js/compatibility.js"></script>
	<script type="text/javascript" src="js/lspdfoperations.js?value=${applicationScope['version']}"></script>
	<script type="text/javascript" src="js/reports/amChart.js"></script>
	<script type="text/javascript" src="js/reports/serial.js"></script>
	<script type="text/javascript" src="js/reports/none.js"></script>
	<script type="text/javascript" src="js/datepickr.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	<script type="text/javascript" src="js/appjs/welcome.js?value=${applicationScope['version']}"></script>
	
	<script type="text/javascript">
	
	(function (global) { 

	    if(typeof (global) === "undefined") {
	        throw new Error("window is undefined");
	    }

	    var _hash = "!";
	    var noBackPlease = function () {
	        global.location.href += "#";

	        global.setTimeout(function () {
	            global.location.href += "!";
	        }, 50);
	    };

	    global.onhashchange = function () {
	        if (global.location.hash !== _hash) {
	            global.location.hash = _hash;
	        }
	    };

	    global.onload = function () {            
	        noBackPlease();        
	    }

	})(window);
	window.location.hash="no-back-button";
	window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
	window.onhashchange=function(){window.location.hash="no-back-button";}
	</script>
	
	
	
<script>
var checkBoxArray=new Array();
	$(document).ready( function() {
		$("#btnClose, #btnBatch").click(function() {
		$('input[type=text]').each(function() {
		$(this).val('');
		});
		});	
		
		showMenuHeader();	
	$("#workQueueSearchElementsContainer").hide();
	$(".lll").click(function() {$("#uic_search_workQueue").show().appendTo("#hello");$( "input" ).autocomplete({
		  appendTo: "#hello"
	});});
	$('#closewq').click(function() { $('#uic_search_workQueue').hide(); });
	 $('div#uic_SearchRefreshDiv_workQueue button').click( function() {$('#uic_search_workQueue').hide();  $('#myModal').modal('hide'); });
	 $('#uic_DynamicResetButton_workQueue').click( function() {
		 jQuery("#includeSelectAllOption").find("option").removeAttr("selected");
	 }); 
	$('#dynamicSearchworkQueue select').multiselect({
		includeSelectAllOption: true,
      	enableCaseInsensitiveFiltering: true,
      	buttonWidth: '170px'
	});
	});
	  jQuery(function(){
	      jQuery('.multiselect-clear-filter').click();
	    });
	  
	  $("#uic_DynamicResetButton_workQueue").click(function () {
		    $('option', $('#dynamicSearchworkQueue select')).each(function (element) {
		        $(this).removeAttr('selected').prop('selected', false);
		    });
		    $('#dynamicSearchworkQueue select').multiselect('refresh');
		});
	  
	  /* $("#dynamicSearchworkQueueTable .multiselect-container li:nth-child(3)").remove();
	  $("#dynamicSearchworkQueueTable .multiselect-container li:nth-child(3)").attr('checked', false); */	  
</script>
</head>
<style>
.form-control {height:28px !important;}
.ui-autocomplete{z-index:99999}
.modal-backdrop {display: none;}
.modal {background: rgba(0,0,0,0.5);}
.table.uic_dynamictable > tbody > tr:nth-child(even) > td {background:#ffffff !important; border-right:1px solid #ccc !important; border-top:1px solid #ccc !important; }
.table.uic_dynamictable > tbody > tr:nth-child(odd) > td {background:#f4f4f4 !important; border-right:1px solid #ccc !important; border-top:1px solid #ccc !important;}
select {font-size: 11px; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif; width:100%; height:27px; border: solid 1px #ccc; height: 30px; padding:0px 6px; background-color: #fff; -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;}   
/* select:focus {outline:none;} */
</style>
<body>
<jsp:include page="common/appheader.jsp" >
    <jsp:param name="pageNo" value="1"/>       
</jsp:include>
<header style="z-index:9999 !important">
<div class="header-wpr main-doc-width main_min_width">
	<div style="width:100%; margin:0px;">
	<div class="logo_wpr"><a href="javascript:void(0)" onclick="setLocationHref('welcome.htm')" ></a></div>
	<div style="float:left; display:none" class="bdr-right-gray"><h3 class="financial" style="">Financial Spreading</h3></div>
	</div>

		<table align="right">
		<thead>
			<tr>
				<td>
					<div class="last-logged-since pull-left">Last Logged In<span id="counter1" style="color:#f04b5d">&nbsp;&nbsp;<fmt:formatDate type="both"  value="${lastTime}" /></span></div>
					<div class="logged-since pull-left">Logged In Since &nbsp;&nbsp;<span id="counter" style="color:#f04b5d"></span></div>
					<div class="dropdown pull-left" style="padding:39px 12px 0 0">
						<a href="javascript:void(0)"  class="dropdown-toggle welcome-txt custom-toggle" type="button"  data-toggle="dropdown">Welcome ${user.login} <span class="caret-custom"></span></a>
					    <ul class="dropdown-menu" role="menu" style="margin-top:5px !important">
					      <li><a href="javascript:void(0)" onclick="setLocationHref('changePasswordPage.htm','workQueueLink')">Change Password</a></li>
	 			  			<c:if test="${user.userAccess eq 1 || user.userAccess eq 2}">
	              				<li><a href="javascript:void(0)" onclick="calShowAdminPanal('${user.userGroupId}');">Admin Panel</a></li>
							</c:if>
					      <li><a href="javascript:void(0)" onclick="setLocationHref('logout.htm')" style="border-bottom:0px !important">Logout</a></li>
					    </ul>
  					</div>
				</td>
				<td>
					<div class="circle"><span class="glyphicon glyphicon-user user-icon"></span></div>
				</td>
			</tr>
			</thead>
		</table>
		
</div>
		</header>
	<div class="container-fluid uicTableDiv" style="margin-top:100px">
	  	<div class="row">
	  		<div class="col-lg-12">
	  			<div id="search-panel" class="pull-right">
	  				<c:if test="${bachProcessFlag eq 'Y'}">
		  		   	<button type="button" class="btn-info-green" id="btnBatch" data-toggle="modal" data-target="#batchAssociationId"><span class="fa fa-database" style="padding:0 5px 0 5px"></span>Batch Association</button>
		  		    </c:if>
		  			<button type="button" class="btn-info-green lll" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-search" style="padding:0 5px 0 5px"></span>Custom Search</button>
					<button type="button" class="btn-info-green 111" onclick="resetData('workQueue','getTablePage.htm');">Reset</button>
	  			</div>
	  		</div>
	  	</div>
	  	<div id="uic_Table" class="mar-top10"></div>
	  </div>

		<div id="mainPageDiv">
			<div class="row batch-process-wrapper">
			</div> 
			<div id="overallPortfolioDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="myPortfolioDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="uploadDocumentDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="normalizationTemplateDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="normalizationRulesDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="reportsDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;" >
			</div>
			<div id="rulesManagementDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="normalizationDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="qaCheckListDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			<div id="normalizedViewDiv" class="content_wpr main-doc-width main_min_width mar-top20 lsContentDiv" style="display:none;">
			</div>
			</div>
		
		

		
		<footer>
			<div class="footer_wpr main-doc-width main_min_width"> <jsp:include page="footer.jsp" ></jsp:include></div>
		</footer>



<input type="hidden" id="userId" value="${USERID}">
<input type="hidden" id="userAccess" value="${USERACCESS}">
<input type="hidden" id="userIdDec" value="${userIdDec}">
<input type="hidden" id="userGroupIdDec" value="${userGroupIdDec}">
<input type="hidden" id="tableName" value="${tableName}">
<input type="hidden" id="creationTime" value="${pageContext.session.creationTime}">
<input type="hidden" id="dealerNameSearch" value="${delearName}">
<input type="hidden" id="bachProcessFlag" value="${bachProcessFlag}">
<input type="hidden" id="goldenSetGroup" value="${goldenSetGroup}">





<div id="htmlShow" class="modal fade" role="dialog" style="display:none;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" id="htmlPopUp">&times;</button>
        <h4 class="modal-title">LiveSpread</h4>
      </div>
      <div class="modal-body">
        <div id="htmlViewer" class="html-viewer"></div>
      </div>
    </div>
  </div>
</div>
<div id="pdfshow" class="modal fade pdf-show" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" id="PDFPopUp">&times;</button>
        <h4 class="modal-title">LiveSpread</h4>
      </div>
      <div class="modal-body">
        <div id="viewer1"> </div>
      </div>
    </div>
  </div>
</div>
  <div id="batchAssociationId" class="modal fade pp" role="dialog" style="margin-top: 5%;">
		  <div class="modal-dialog" style="width:29%">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" id="btnClose">&times;</button>
		        <h3 class="modal-title">Batch Processing</h3>
		      </div>
		      <div class="modal-body" style="padding:20px 48px 20px 10px">
		      <div class="col-md-10">
		      	<div class="pull-left"><label>Batch Id:</label></div>
		      	<div class="pull-left mar-lt10"><input type="text" class="form-control" autocomplete="off" id="transactionId"  onkeyup="setAutoCompleteList();" style="z-index:99999 !important"/></div>
		      </div>
				<div class="col-md-2">
					<button type="button" class="btn-info-green" style="height:28px; padding:0 8px 0 8px !important" id="batchId" onclick="submitBatchId()" >Submit</button>
				</div>
		      </div>
		    </div>
		  </div>
		</div>
		  <div id="myModal" class="modal fade pp" role="dialog" style="margin-top:65px;">
		  <div class="modal-dialog modal-lg wdt83-perc">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" style="display:block !important">&times;</button>
		        <h4 class="modal-title">Search</h4>
		      </div>
		      <div class="modal-body">
		        <div id="hello"></div>
		      </div>
		    </div>
		  </div>
		</div>
				<div id="loadinglayer"></div>
</body>
</html>

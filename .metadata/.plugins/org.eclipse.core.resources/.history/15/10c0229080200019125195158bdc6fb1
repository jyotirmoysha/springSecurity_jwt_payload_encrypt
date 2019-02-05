<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="js/uic/jqueryFileDownload.js" ></script>
<script src="js/appjs/autoLogut.js?value=${applicationScope['version']}" /></script>
<script>
var idleTime;
  $(document).ready(function(){
	  $('[data-toggle="tooltip"]').tooltip();
	  
	  $('#btnNotes').click(function () {
	        $(this).popover('show');
	        e.preventDefault();
	    }); 
	  
	$("[rel=comments]").popover({
		trigger : 'click',  
		placement : 'bottom', 
		html: 'true', 
		content : '<input type="hidden" name="noteOldTxt" id="noteOldTxt"/><textarea class="popover-textarea" rows="12" name="noteTxId" id="noteTxId"  maxlength="2000" rows="14" style="margin:0px 0px 10px 3px; width:200px; padding:3px; color:#000;"></textarea>',
		template: '<div class="popover" id="noteContent"><div class="arrow"></div>'+
		          '<h3 class="popover-title"></h3><form id="notes-form"><input type="hidden" name="encriptedWqEId" value="<c:out value='${param.encriptedWqEId}'/>"/><div class="popover-content">'+
		          '</div></form><div class="popover-footer pull-right" style="margin:0 0 10px 0"><button type="button" id="btnsave" class="btn btn-primary popover-submit" onclick="saveNotes();" style="margin:0 4px 0 0">Save</button><button type="button" id="btnClose" class="btn btn-primary popover-submit" onclick="close_popover();">Close</button>'+
                  'Save</button>&nbsp;'+
                   '</div></div>' 
		});
		
	 reloadPage();
		$('html').bind('click mouseup mousedown keydown keypress keyup submit change mouseenter scroll resize dblclick', function () {
			clearTimeout(idleTime);
			reloadPage();
		});
}); 

	function reloadPage() {
		clearTimeout(idleTime);
		idleTime = setTimeout(function () {
			location.reload();
		}, 1700000);
	}
</script>
<style>
#overallPortfolioLink{display:none}
#myPortfolioLink{display:none}
@media screen and (max-width: 768px){
.menu_wpr ul li a{font:1.0em/18px Helvetica Neue, Helvetica, Arial, sans-serif !important; padding:13px 20px 9px 5px !important}
}
/* notes new popup*/
.txt_white{color:#fff !important}
.arrow-up {width: 0; height: 0; border-left: 10px solid transparent; border-right: 10px solid transparent; border-bottom: 10px solid #eee; margin-left:194px}
#btnsave{margin:0 20px 10px 0}
.popover{width:230px;}
.popover-title{color:#000; font-size:11px;}
.popover-content{font-size:11px;}
</style>

<script>

</script>
 	<nav class="navbar navbar-inverse navbar-fixed-top" style="border-radius: 0;">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"></a>
      </div>
	 
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      </div>
    </div> 
</nav>
  
  
<nav class="navbar navbar-default navbar-fixed-top nav-defaul">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      <div class="navbar-collapse collapse dynamicMenu" id="bs-example-navbar-collapse-1">
        <c:if test="${not empty param.pageNo && param.pageNo ne 1}">
        <ul class="nav navbar-nav" >
        <li id="overallPortfolioLink"><a href="javascript:void(0)" onclick="showWorkQueue();" class="wq overall"> <span>Overall  Portfolio </span></a></li>
		<li id="workQueueLink"><a href="javascript:void(0)" onclick="showWorkQueue();" class="wq workque"><span class="fa fa-home mar-rt5" style="font-size:18px"></span>Work Queue</a></li>
		<li id="myPortfolioLink"><a href="javascript:void(0)" class="port"> <span class="nobg">My Portfolio </span></a></li>
			
        <c:choose>	
		<c:when test="${param.pageNo eq 4}">
          <li id="rulesManagementLink" class="active"><a href="javascript:void(0)" class="tpl" onClick="showRulesExtractionSubPage('<c:out value='${caseId}'/>','<c:out value='${customerId}'/>', this.parentNode.id);">Rules Management</a></li>      
        </c:when>
       <c:otherwise>
		  <li id="rulesManagementLink"><a href="javascript:void(0)" onclick="callRulesManageMentPage('<c:out value='${fillingId}'/>','<c:out value='${wqId}'/>','<c:out value='${customerName}'/>','<c:out value='${businessName}'/>','<c:out value='${fileName}'/>','<c:out value='${customerId}'/>','<c:out value='${statementType}'/>','<c:out value='${compIdOrCik}'/>','<c:out value='${sessionParserId}'/>', this.parentNode.id)">Rules Management</a></li>
        </c:otherwise>
        </c:choose>	
		<c:choose>	
	        <c:when test="${param.pageNo eq 5}"> 
                <li id="normalizationLink" class="dropdown active"><a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown"><span class="nobg">Normalization</span> <b class="caret"></b>&nbsp;</a>
                <ul class="dropdown-menu">
                      	<!-- if  parser id is 6 ie bank parser then show AccountSummary,Deposits,DailyBalances option -->
				<c:forEach var="sectionList" items="${sessionSectionList}">
			  	<li style="width:100%" id="${sectionList.key}"><a href="javascript:void(0)" onclick="viewData('<c:out value='${wqId}'/>','<c:out value='${caseId}'/>','<c:out value='${sectionList.key}'/>','<c:out value='${customerId}'/>','<c:out value='${compIdOrCik}'/>');"><c:out value='${sectionList.value}'/></a></li>
				</c:forEach>
               	</ul>
                </li> 
         </c:when>        
         <c:otherwise>
             <li id="normalizationLink" class="dropdown"><a href="javascript:void(0)" class="tpl dropdown-toggle " data-toggle="dropdown"><span class="nobg">Normalization</span> <b class="caret"></b>&nbsp;</a>
              <ul class="dropdown-menu">
             <c:forEach var="sectionList" items="${sessionSectionList}">
  			  <li style="width:100%"  id="${sectionList.key}"><a href="javascript:void(0)" onclick="callNormalizationPage('<c:out value='${fillingId}'/>','<c:out value='${wqId}'/>','<c:out value='${sectionList.key}'/>','<c:out value='${customerName}'/>','<c:out value='${businessName}'/>','<c:out value='${customerId}'/>','<c:out value='${fileName}'/>','<c:out value='${compIdOrCik}'/>')"><c:out value='${sectionList.value}'/></a></li>
			 </c:forEach>   
             </ul>
             </li>   
        </c:otherwise>  
 	    </c:choose>
 	    <c:choose>          
	 <c:when test="${param.pageNo eq 6}"> 
        <li  id="qaCheckListLink" class="dropdown active"><a href="javascript:void(0)" onclick="callQACheckListPage('<c:out value='${fillingId}'/>','<c:out value='${wqId}'/>','<c:out value='${customerName}'/>','<c:out value='${businessName}'/>','<c:out value='${fileName}'/>','<c:out value='${customerId}'/>','<c:out value='${compIdOrCik}'/>', this.parentNode.id)" class="rules dropdown-toggle"><span class="nobg">QA Checklist</span></a></li>											
        </c:when>
        <c:otherwise>
           <li  id="qaCheckListLink" ><a href="javascript:void(0)" onclick="callQACheckListPage('<c:out value='${fillingId}'/>','<c:out value='${wqId}'/>','<c:out value='${customerName}'/>','<c:out value='${businessName}'/>','<c:out value='${fileName}'/>','<c:out value='${customerId}'/>','<c:out value='${compIdOrCik}'/>', this.parentNode.id)" class="rules dropdown-toggle"><span class="nobg">QA Checklist</span></a></li>											
        </c:otherwise>
				</c:choose>		
				<c:choose>		
		  <c:when test="${param.pageNo eq 7}"> 
           <li id="normalizedViewLink" class="dropdown active"><a href="javascript:void(0)" onclick="callNormalizationviewPage('<c:out value='${fillingId}'/>','<c:out value='${wqId}'/>','<c:out value='${customerName}'/>','<c:out value='${businessName}'/>','<c:out value='${fileName}'/>','<c:out value='${customerId}'/>','<c:out value='${compIdOrCik}'/>', this.parentNode.id)" class="reprt"><span class="nobg">Normalized View</span></a></li>
	     </c:when>
        <c:otherwise>
         <li id="normalizedViewLink"><a href="javascript:void(0)" onclick="callNormalizationviewPage('<c:out value='${fillingId}'/>','<c:out value='${wqId}'/>','<c:out value='${customerName}'/>','<c:out value='${businessName}'/>','<c:out value='${fileName}'/>','<c:out value='${customerId}'/>','<c:out value='${compIdOrCik}'/>', this.parentNode.id)" class="reprt"><span class="nobg">Normalized View</span></a></li>
	     </c:otherwise>
			</c:choose>
 			</ul>	
			<p class="note-txt">${param.decryptedFillingId} | ${param.decryptedCustomerName} | ${param.decryptedCompIdOrCik} |
 			<a href="#originalFile-modal" class="pad-lf4 note-icon-ft"  data-toggle="modal" data-target="#originalFile-modal"><i class="fa fa-file" data-toggle="tooltip" title="Original Files" data-placement="bottom"></i></a>
	        <a href="#convertedFile-modal" class="pad-lf4 note-icon-ft" data-toggle="modal" data-target="#convertedFile-modal"><i class="fa fa-file-code-o" data-toggle="tooltip" title="Converted Files" data-placement="bottom"></i></a> 
 			<a href="#" onclick="highlightedFiles();" class="pad-lf4 note-icon-ft" data-toggle="modal" data-target="#highFiles"><i class="fa fa-file-text" data-toggle="tooltip" title="Highlighted Files" data-placement="bottom"></i></a> 
 			<a id="btnNotes" rel="comments" class="pad-lf4 note-icon-ft" onclick="calCompanyNotes('<c:out value='${param.encriptedWqEId}'/>');" href="javascript:void(0)"  title="Maximum of 2000 characters <br/> Please do not enter comma(,)" ><i class="fa fa-clipboard" data-toggle="tooltip" title="Notes" data-placement="bottom"></i></a>
 		    </p>	
			</c:if>
       </div>
      </div> 
   </nav>
				<div class="infodocs">
				   <div class="modal fade" id="originalFile-modal" role="dialog" aria-hidden="true" tabindex="-1" style="padding-top: 200px !important;">
				    <div class="modal-dialog ">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Original File</h4>
				        </div>
				        <div class="modal-body">
				          <div id="orgDoc" style="font-size:14px; font-weight:normal;"></div>  
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div>
				     
				
				   <div class="modal fade" id="convertedFile-modal" role="dialog" aria-hidden="true" tabindex="-1" style="padding-top: 200px !important;">
				    <div class="modal-dialog ">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Converted Files</h4>
					        </div>
					        <div class="modal-body">
				          <div id="ConvertedFilesDoc" style="font-size:14px; font-weight:normal;"></div>  
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div>    
				   <div class="modal fade" id="HighlightedFiles-modal" role="dialog" aria-hidden="true" tabindex="-1" style="padding-top: 200px !important;">
				    <div class="modal-dialog ">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Highlighted Files</h4>
					        </div>
					        <div class="modal-body">
				          <div id="HighlightedFilesDoc" style="font-size:14px; font-weight:normal; color:#000"></div>  
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div> 	     
				</div>


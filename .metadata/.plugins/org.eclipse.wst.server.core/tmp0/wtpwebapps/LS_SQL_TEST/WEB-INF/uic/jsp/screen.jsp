<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<%@ include file="/WEB-INF/uic/jsp/include.jsp"%>
 <style>
 .brd{
  border: 1px solid #000;
 }
 .scr{
 width:550px;
 }
</style>

<script type="text/javascript">
$(document).ready(function(){
	  var list = ${componentDetailsList};
	  loadComponents(list);
	  //Added code to prevent default behavior of 'Enter' press on input elements, thus preventing unwanted submissions.
	  $(':input').bind('keypress', function(event) {
		  if (event.keyCode == 13/*Enter Key*/) {
	            event.preventDefault();
	        }
		});
});
</script>
<input type="hidden" id="screenId" name="screenId" value="${screen.scrId}" />
<input type="hidden" id="uic_context" name="uic_context" value="${pageContext.request.contextPath}" />
<c:if test="${not empty screen}">
 <div class="col-lg-12">
	<div id="screenContainer_${screen.uniqueScreenId}">
     <!-- below Line Belongs to Header screenLayout, null condition checking and div also created in ScreenLayoutTag.java  -->
      <scrLayout:scrLayoutTag screenLayout="${screen.headerScreen.screenLayout}"/>
	    <c:if test="${not empty breaCrumbList}">
		   <div id="UicCrumbs">
		    <ul>
		      <c:forEach items="${breaCrumbList}" var="screen" varStatus="loop">
		          <c:set var="liClass" value=""/>
		         <c:if test="${loop.last}">
		           <c:set var="liClass" value="active"/>
		         </c:if>
		         <li class="${liClass}">
		         <c:choose>
			         <c:when test="${loop.last}">
			         	<a>${screen.breadCrumbLabel}</a>
			         </c:when>
			         <c:otherwise>
			         	<a href="${screen.hrefLink}">${screen.breadCrumbLabel}</a>
			         </c:otherwise>
		         </c:choose>
		         </li>
		      </c:forEach>
		    </ul>
		  </div>
	    </c:if>
	    
	   <!-- below Line Belongs to Main/Requested screeId screenLayout, null condition checking and div also created in ScreenLayoutTag.java  --> 
       <scrLayout:scrLayoutTag screenLayout="${screen.screenLayout}"/>
	   <!-- below Line Belongs to Footer screenLayout, null condition checking and div also created in ScreenLayoutTag.java  -->
       <scrLayout:scrLayoutTag screenLayout="${screen.footerScreen.screenLayout}"/>
    </div>
  </div>
</c:if>
<!-- Modal -->
	<div class="modal fade commonMesgBox" id="commonModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body commonMesgBody">
				...
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="dm">Close</button>
				</div>
			</div>
		</div>
	</div>
<script>
	$("#dm").click(function() {
	    $('#commonModal').hide();
	});
</script>

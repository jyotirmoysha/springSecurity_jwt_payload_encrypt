<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<html>
<head>
<title>Screen Layout</title>
	<style>
	.brd{
		border: 1px solid #000;
	}
</style>
<script type="text/javascript">
function showList(){	
	   var list = ${componentDetailsList};
	   if(list!=null)		  
	    loadComponents(list); 	    			
}
</script>
</head>
<body>
<div class="adminLoading"></div>
  <script type="text/javascript">
  showList();
  </script>
<c:if test="${not empty screenLayout}">
	<scrLayout:scrLayoutTag screenLayout="${screenLayout}"/>
</c:if>
   <c:if test="${not empty screen}">
       <scrLayout:scrLayoutTag screenLayout="${screen.screenLayout}"/>
   </c:if>
     <div id="mainContent"></div> 
</body>
</html>
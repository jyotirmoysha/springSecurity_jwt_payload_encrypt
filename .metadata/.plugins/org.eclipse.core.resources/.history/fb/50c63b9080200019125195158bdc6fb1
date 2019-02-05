<html>
<head>
<script src="js/uic/jquery-2.1.1.min.js" ></script>
<script src="js/common.js?value=${applicationScope['version']}"></script>
<script type="text/javascript">
$(document).ready(function()
{
	var caseId=$('#caseId').val();
	var uploadId =$('#uploadId').val() ;
	var coordinates = $('#coordinates').val() ;
	$.ajaxSetup({
		cache: true
	});
	var tokenizedURL= insertParam("getHtmlDocument.htm");
	$.ajax({
		 url : tokenizedURL,
		 data: {filingId:caseId,uploadId:uploadId},
		 method : 'GET',
		 async : false,
		 cache: true,
		 complete : function(data) {
			 $("#htmlmain").html(data.responseText);
			 $("#myclick").attr("href", "#"+coordinates);
			 $('[name="'+coordinates+'"]').addClass("selectedElement");
			 $("#myclick")[0].click();
			 return false;
		}
	 });
});
</script>
<style type="text/css">
.selectedElement{background: #1aa3ff}
</style>
</head>
<body>
<input type="hidden" id="caseId" value="${caseId}">
<input type="hidden" id="uploadId" value="${uploadId}">
<input type="hidden" id="coordinates" value="${coordinates}">
<div id="htmlmain" class="htmlmain" style="height:570px  !important; overflow: scroll;    width: 100%;  border-style:solid;"></div>
<div id="nav" class="clearfix">
	<a href="" id="myclick" style="display:none">One</a>
</div>
</body>
</html>
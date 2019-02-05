<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.bootpag.js"></script>
<script src="js/appjs/extractionRulesData.js"></script>
</head>

<script>
var rowadd=1;
$(document).ready(function(){ 
	$("#extractionRulesId").tableHeadFixer();
	recordlistData();
$("#userCustomSearchBtn").click(function(){
	$("ul.cus-searchUser").toggle();
    $(this).children('.fa').toggleClass('fa-chevron-up fa-chevron-down');
});

$("#selLanguage").on("change", function() {
	resetFieldsOnLanguage();
	if (this.value != '') {
		getFileNames(this.value);	 
	}
});  
       
$("#selfileName").on("change", function() {
	resetFieldsOnFileName();
	if (this.value != '') {	
	 calTagName(this.value);	 
	}
});  
         
$("#seltagName").on("change", function() {
	if (this.value != '') {
	$('#selectedTagId').val($(this).find(":selected").attr('id'));
	$('#columnLengthId').val($(this).find(":selected").attr('columnlength'));
	$("#pageNo").val(1);
	$("#txtSearch").val('');
	$("#pageInfoEr").text('');
	calPageNationExtraction();
	}else{
	$('#selectedTagId').val(0);
	$('#columnLengthId').val(0);
	}
}); 
$("#selRecords").on("change", function() {
	if (this.value != '') {
		$("#pageNo").val(1);
		calPageNationExtraction();
	}
}); 

//need default PageNation  
bootPageExtraction();
});


</script>
<style>
.title:after {content: attr(title); font-style: italic;}
.left-panel ul {margin: 0; padding: 0;  list-style-type: none;}
.left-panel li {border-bottom: 1px dotted #fff; text-align:left;}
.left-panel ul li a{color:#333; font-size:14px; border-bottom:1px solid #ccc;  text-decoration:none; display:block; padding: 10px 0 8px 15px;}
.left-panel ul li a:hover{background:#073262; color:#fff;}
.left-panel ul li a.active{background:#00aecf; color:#fff}
.user-table{border:1px solid #ccc; margin:0 0 15px 0;}
.user-table th{background:#6ABBBD; color:#fff; font-size:13px; font-weight:bold;}
.multiselect-container>li>a>label.radio, .multiselect-container>li>a>label.checkbox{width:296px;}
.btn-default{border-radius:0px;}
.form-control{height:32px;}
.js-filter{font-size:11px !important}
.custom-wdt260{width:260px;}
.collapse-chevron .fa {transition: .3s transform ease-in-out;}
.collapse-chevron .collapsed .fa {transform: rotate(-90deg);}
.cus-searchUser{padding:15px 10px 15px 10px; margin:1px 0px 0px -2px; border-top-left-radius:0px; border-top-right-radius:0px;}
.custom-font20{font-size:20px !important;}
#selRecords{height:29px !important; width:48px; padding:0 5px 0 5px; margin:0 3px 0 0}
.btn-primary{padding:8px 8px !important}
.Records-lbl{position:absolute; right:200px; top:475px}
</style>

<body>
<div class="input-group-btn search-panel collapse-chevron">

   
<div class="cus-searchUser"  style="background:#fff; overflow:hidden; border:1px solid #ccc;  width:101.4%; margin:0 0 5px 0">
	<div class="col-md-3" style="margin-left:-10px">
		<div class="row">
			<span class="col-md-3"><label for="formGroupExampleInput">Language:</label></span>
			<span class="col-md-8">
			<select class="form-control" id="selLanguage" >
				<option value="">Select</option>
				<c:forEach items="${languageDetails}" var="languageDetails" varStatus="status">
				<option value="${languageDetails}">${languageDetails}</option>
				</c:forEach>
			</select>
			</span> 
		</div>
	</div>

	<div class="col-md-3" style="margin-left:-20px">
		<div class="row">
			<span class="col-md-3"><label for="formGroupExampleInput">File Name:</label></span>
			<span class="col-md-8"><select class="form-control" id="selfileName" disabled="disabled"><option>Select</option></select></span> 
		</div>
	</div>
		
	<div class="col-md-3" style="margin-left:-20px">
		<div class="row">
			<span class="col-md-3"><label for="formGroupExampleInput">Tag Name:</label></span>
			<span class="col-md-8"><select class="form-control" id="seltagName" disabled="disabled"><option>Select</option></select></span> 
			<input type="hidden" name="selectedTagName" id="selectedTagId" value="0">
			<input type="hidden" name="columnLengthName" id="columnLengthId" value="0">
		</div>
	</div>
	
	<div class="col-md-3">
		<div class="row">
			<!-- <span class="col-md-4"><label for="formGroupExampleInput" style="margin:0 0 0 -8px">Search Value:</label></span> -->
			<span class="col-md-9" style="margin-left:0px"><input type="text" id="txtSearch" placeholder="Search Values" class="form-control" disabled="disabled"/></span> 
			<span class="col-md-1" style="margin:-32px 0 0 175px"><a  onclick="searchRulesByText()"  href="#" class="btn btn-primary" id="btnSearch" disabled="disabled"><i class="fa fa-search" title="Search"></i></a></span>
		    <span class="col-md-1" style="margin:-32px 0 0 210px"><a  onclick="refreshEdRules()"  href="#"  class="btn btn-primary" id="btnRefresh" disabled="disabled"><i class="fa fa-refresh" title="Refresh"></i></a></span> 
			<span class="col-md-1" style="margin:-32px 0 0 245px"><a  onclick="resetEdRules()"  href="#" class="btn btn-primary" id="btnReset" disabled="disabled"><i class="fa fa-repeat" title="Reset"></i></a></span> 
			
		</div>
	</div>
</div>

</div>       
	            
<div class="btn-wrapper pull-right" style="margin:0px -14px 5px 0; display:none">
<a href="#"  onclick="addMetaDataRow()" ><i class="fa fa-Plus custom-font20 pad5 cus-cls" data-toggle="tooltip" data-placement="top" title="Add"  aria-describedby="ui-tooltip-3"></i></a>
<a href="#" onclick="deleteRulesExtraction('delMeataId')"><i class="fa fa-trash custom-font20 pad5 cus-cls" data-toggle="tooltip" data-placement="top" title="Delete"  aria-describedby="ui-tooltip-3"></i></a>
<a href="#" onclick="updateRulesExtraction()"><i class="fa fa-save custom-font20 pad5 cus-cls" data-toggle="tooltip" data-placement="top" title="Save"  aria-describedby="ui-tooltip-3"></i></a>
</div>
<div class="clearfix"></div>	            
<div style="height:auto; width:101.5%; overflow:auto; margin-top:0px;max-height:361px;">
<table id="extractionRulesId"  class="table table-bordered table-striped dataTable-new">
<thead></thead>	
<tbody></tbody>	
</table>
</div>
 <div class="bs-docs-example" style="display:none; margin-top:-10px" >
 <div  id="displayRecordsErDiv" style="float:left; margin:20px 0 0 0;">
	<select id="selRecords" class="form-control custom-input"></select>
 </div>
<div style="float:left;"><p class="demo pageationER"  data-step="18" data-intro="pagenation"></p></div>
<div style="float:left; margin:26px 0 0 10px; font-size:12px; font-weight:bold" id="pageInfoEr" ></div>
<div>
<input id="pageNo" type="hidden" value="1" class="form-control custom-input">
<input id="totalPageCount" type="hidden" value="1" class="form-control custom-input">
<input id="maxVisible" type="hidden" value="5" class="form-control custom-input">
</div>	
</div> 
</body>
</html>
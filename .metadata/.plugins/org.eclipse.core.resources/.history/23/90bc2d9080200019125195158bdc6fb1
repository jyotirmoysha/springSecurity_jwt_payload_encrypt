<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<script type="text/javascript" src="js/chosen.jquery.js"></script>
<script type="text/javascript" src="js/jquery.bootpag.js"></script>
<title>LiveSpread</title>

<script>
$(document).ready(function(){
	//here show first child page
	showChildPages('CaseAssociationPage');
});
	
function submitFeatureMapping()
{
	var selectedFilingIds = new Array();
	console.info("in submitFeatureMappingForm fuction");
		$('input:checked').each(function() {
		if(!isNaN((this.value)))
		selectedFilingIds.push(this.value);
		});
	if(selectedFilingIds.length>0)
	{
		showLoading();
		var processData ="selectedFilingIds="+selectedFilingIds;
		actionUrl = "submitGoldenCaseFeatureMapping.htm";
		successData = function(data) {
			hideLoading();
			$.ajaxSetup({
				async : true
			});
			if(successData){
				$.alert("Mapping updated successfully.");
			}else{
				$.alert("failed..");
			}
		};
		callAjax(processData, successData, errorData, beforeSend,
				actionUrl, reqType, retDataType);
	}else{
		$.alert("Please select mapping data..");
	}
		errorData = function(data) {
			$.alert("failed..");
			hideLoading();
		};
		

	}
function showChildPages(pageName)
{
	showLoading();
	var actionUrl="";
	if(pageName=='CaseAssociationPage')
	{
	actionUrl="showCaseAssociationPage.htm";
	}else if(pageName=='CaseFeatureAssociationPage')
	{
	actionUrl="feature_case_mapping.htm";
	}else if(pageName=='CaseSummaryPage')
	{
	actionUrl="showGoldenCaseSummary.htm";
	}
	successData = function(data) {
     hideLoading();
     $("#goldenChildPagesDiv").html(data);
	};
	errorData = function(data) {
		hideLoading();
	};
	callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
	} 
</script>


<style type="text/css">
body{overflow:hidden !important}
.open > .dropdown-menu{width:100%}
.multiselect-selected-text{font-size:13px;}
.btn-default{border-radius:0px;}
.form-control{height:26px;}
.js-filter{font-size:11px !important}

.nav-tabs{border-bottom:0px; overflow:hidden;}
.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
color: #fff;
cursor: default;
background-color: #074156;
border: 1px solid #074156;
border-bottom-color: transparent;
}
.nav-tabs > li > a{background:#eaeaea; border:1px solid #d4d4d4; color:#333; margin-left:1px}
.nav-tabs > li > a:hover{background:#cacaca; border:1px solid #d4d4d4; color:#333; margin-left:1px}
.chosen-container{width:93% !important}
.chosen-container-single .chosen-single{height:28px; line-height:26px;}

.btn-group > .btn:first-child{padding:3px 8px 3px 8px}
.pad4{padding:4px 3px 3px 3px !important}
.form-control{padding:6px 6px;}
</style>
</head>
<body>
<!-- Button trigger modal -->
<!-- Modal -->
<div id="loadinglayer"></div>

<div id="Golden" class="myTable" style="dispaly:block">
	<div class="tabs-x tabs-above">
		<ul id="myTab-kv-1" class="nav nav-tabs" role="tablist">
		<li class="active"><a href="#case_association" role="tab" data-toggle="tab" onclick="showChildPages('CaseAssociationPage');">Case Association</a></li>
		<li><a href="#case_summary" role="tab-kv" data-toggle="tab" onclick="showChildPages('CaseSummaryPage');">Case Summary</a></li>
		<li><a href="#case_association_feature" role="tab-kv" data-toggle="tab" onclick="showChildPages('CaseFeatureAssociationPage');">Case Association With Features</a></li>
	</ul>
	</div>
<!-- main div  -->
	<div id="goldenChildPagesDiv" class="tab-content tb-container">
	<!-- Here added child popup -->
	
	</div>
<!-- end main div -->

</div>	
</body>
</html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/jquery/smoothness/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="js/choosen/chosen.min.css" />
<script src="js/choosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.bootpag.js"></script>
 

 <style>
.custom-pad{padding:5px 6px 5px 6px !important}
.ui-autocomplete{z-index:99999}
.modal-dialog{margin-top:0px !important} 
</style>
 
  <script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
		 $('.dropdwn').chosen({width: "120px"});
		 $("#MetaDataTable").tableHeadFixer();
			var totalRecords   ='${totalRecords}';
		var displayRecords =$('#displayRecordsId').val();

	if(totalRecords >0 && displayRecords>0){
		var startPage = 1;
		$("#totalRecords").val(totalRecords);
		 calpagenationAjax(startPage); 
	}else{
		$('#MetaDataTable tbody').append("no data available!");
	}

	
	//
	$('.Pageation').bootpag({
		total : 0,
		page : startPage,
		maxVisible : 10,
		leaps : true,
		firstLastUse : true,
		wrapClass : 'pagination',
		activeClass : 'active',
		disabledClass : 'disabled',
		nextClass : 'next',
		prevClass : 'prev',
		lastClass : 'last',
		firstClass : 'first'
	}).on("page", function(event, num) {
		calpagenationAjax(num);
	}).find('.pagination');
	
	});

	
	// dynamic ajax call for search and pageation 	
	function calpagenationAjax(page) {	
		      showLoading();
		        var keyword = $('#keyword').val();
				var section = $("#sectionId option:selected").text();
				var language = $("#languageId option:selected").text();
				var displayRecords = $("#displayRecordsId").val();
				var totalRecords = $("#totalRecords").val();
				 processData = '&page='+encodeURIComponent(page)+'&displayRecords='+encodeURIComponent(displayRecords)+'&totalRecords='+encodeURIComponent(totalRecords)+'&keyword='+encodeURIComponent(keyword)+'&section='+encodeURIComponent(section)+'&language='+encodeURIComponent(language);
				actionUrl = "showGlobalPageNation.htm";
				successData = function(data) {
					hideLoading();
					$('#MetaDataTable tbody').empty();
					$('#pageInfo').empty();
					try {
						pagenation(data.totalPages, data.page);
						setDataToTable(data);
					} catch (err) {
						console.log("Error Occured in pagination" + err);
					}
					$('#MetaDataModal').modal('show');
				}
				errorData = function(data) {
					$.alert("Problem occurred while getting the values.");
				};
				callAjaxGet(processData, successData, errorData, beforeSend,
						actionUrl, reqType, retDataType);
						
	}


	 function setDataToTable(data) {
			var htmlString = "";
			var globalMetaObj;
			if(data.globalMetaDetaList!=null){
				for (var i = 0; i < data.globalMetaDetaList.length; i++) {
					globalMetaObj = data.globalMetaDetaList[i];
					var inputs = '<tr>';
					inputs += '<td>'+globalMetaObj.sectionName + '</td>';
					inputs += '<td>'+globalMetaObj.language +'</td>';
					inputs += '<td>' + globalMetaObj.keyWord + '</td>';
					$('#MetaDataTable tbody').append(inputs);
					}
				var startNum=data.startNum;
				var endNum=data.endNum;
				var totalRecords=data.totalRecords;
			    $("#totalRecords").val(totalRecords);
				if(totalRecords >= endNum){
					$('#pageInfo').html("Displaying <b>"+startNum+"</b> to <b>"+endNum +"</b> of "+totalRecords+" records"); 
				}else{
					$('#pageInfo').html("Displaying <b>"+startNum+"</b> to <b>"+totalRecords +"</b> of "+totalRecords+" records"); 
				}
				//display dropdown of pageNation
				var displayRecords =$('#displayRecordsId').val();
				if(displayRecords < totalRecords){
					$('#displayDropDown').show();
				}else{
					$('#displayDropDown').hide();
				}
				
			}else{
				$('#MetaDataTable tbody').append("<tr><td colspan='3'>No data available!</td></tr>");	
				$('#pageInfo').empty();
				$('#displayDropDown').hide();
			}
	 }
	 
	 
	 
	   //dynamically set page and total pages in ajax.
	   function pagenation(totalPages, page) {
					$('.Pageation').empty();
					$('.Pageation').bootpag({
						total : totalPages,
						page : page,
						maxVisible : 10,
						leaps : true,
						firstLastUse : true,
						wrapClass : 'pagination',
						activeClass : 'active',
						disabledClass : 'disabled',
						nextClass : 'next',
						prevClass : 'prev',
						lastClass : 'last',
						firstClass : 'first'
					})
		}
	   
	   
	   
	   
	   function setAutoCompleteData() {
			var keywordVal = $("#keyword").val();
			if(keywordVal.trim().length > 1){
				processData = '&keywordVal=' + encodeURIComponent(keywordVal);
				showLoading();
				actionUrl = "autoCompleteToKeyword.htm";
				successData = function(data) {
					hideLoading();
					setAutoCompleteDataToKeyword(data.jsonArry);			        		   
				};
				errorData = function(data) {
					$.alert("error" + data);
				};
				callAjaxGet(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
			}
	}
	   
	   
	   function setAutoCompleteDataToKeyword(data) {
			 var availableTags =data; 
				$("#keyword").empty();
				$("#keyword").autocomplete({
					source: availableTags,
					minLength : 1,
					select: function(event, ui) {
					    $( "#keyword").val(ui.item.label);
					     return false;
					     },
				});
	}

	   function searchGlobalMeataDataList(){
		   var keyword = $('#keyword').val();
			var section = $("#sectionId option:selected").text();
			var language = $("#languageId option:selected").text();
			var displayRecords = $("#displayRecordsId").val();
			$("#totalRecords").val(0);
			if (displayRecords != null && displayRecords != 0) {
				if (keyword.trim() != '' || section.trim() != '' || language.trim() != '') {
				} else {
					$.alert("please select one field!")
					return false;
				}
				/* calling pageation on search button */
				calpagenationAjax('1');
			} else {
				$.alert("no data found!");
			}
	   }
	   
	   
	   
	   function changeDisplayRecords(){
			var displayRecords =$('#displayRecordsId').val();
			if (displayRecords != null && displayRecords != 0) {
				/* calling pageation on changeDisplayvalues button */
				calpagenationAjax('1');
	         }else{
	        	 $.alert("Display record not empty!"); 
	         }
	   }
	   
	   //onchange DropDowns
	   function customDropDwon(){
		   searchGlobalMeataDataList();   
	   }
	
		</script>

  <!-- Modal -->
 <input type="hidden" name="totalRecords" id="totalRecords" value="0">
  <div class="modal fade" id="MetaDataModal"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog mar-top80" role="document" style="width:68%">
    <div class="modal-content">
      <div class="modal-header" style="height:7%;">
        <h5 class="modal-title" id="exampleModalLabel">View Global MetaData</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin:-9px 0 0 0 !important">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="panel panel-default">
		<div class="panel-body custom-padding">
				<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top3">Section:</label></span>
				<span class="pull-left mar-rt5">
					<select class="form-control wdt-90 dropdwn" id="sectionId" onchange="customDropDwon();">
				     <option value='ALL'>ALL</option>
	     	 	      <c:forEach items="${sectionList}" var="section"> 
			          <option value="${section}">${section}</option>	
	  			      </c:forEach> 
				     </select>
				</span>
				
				<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top3">Language:</label></span>
				<span class="pull-left mar-rt5">
					<select  class="form-control wdt-90 dropdwn"  id="languageId" onchange="customDropDwon();">
				    <option value='ALL'>ALL</option>	
			         <c:forEach items="${languageList}" var="language"> 
				          <option value='${language}'>${language}</option>	
		  			</c:forEach> 
				     </select>
				</span>
				
				<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top3">Keyword:</label></span>
				<span class="pull-left mar-rt5">
					<input type="text" class="" onkeyup="setAutoCompleteData();" style="width:364px" id="keyword" autocomplete="off" name="keyword" /> 
				</span>
				<span class="pull-right"><i class="fa fa-search custom-font14 custom-pad cus-cls" id="searchId" data-toggle="tooltip" data-placement="top" title="Search"  onclick="searchGlobalMeataDataList();" ></i></span>			
     	</div>
      </div>	
      <div class="clearfix"></div>
      <div class="mar-top-negi16" style="height:300px; overflow:auto">
        <table  id="MetaDataTable" class="table table-responsive newtable tblstyle dataTable-new">
        	<thead>
        		<tr>
        			<th align='left' width="20%">Section</th>
        			<th align='left' width="20%">Language</th>
        			<th align='left' width="50%">Keyword</th>
        		</tr>
        	</thead>
        	<tbody>
        				     
        	</tbody>
        </table>
        </div>
        <div  id="displayDropDown" style="width:7%; float:left; margin:20px 0 0 0; display: none">
        <select id="displayRecordsId" class="form-control" style="height:26px !important;"  onchange="changeDisplayRecords();" >
       	<option value='50'>50</option>
       	<option value='100'>100</option>
       	  	<option value='200'>200</option>
    
        </select>
        </div>
        <div class="bs-docs-example" style="width:auto; float:left">
		<p class="demo Pageation"  data-step="18" data-intro="pagenation"></p>
		</div>
		<div style="float:left; margin:25px 0 0 10px" id="pageInfo"></div>
   </div>
  </div>
   </div>
   </div>
 
  
  
  
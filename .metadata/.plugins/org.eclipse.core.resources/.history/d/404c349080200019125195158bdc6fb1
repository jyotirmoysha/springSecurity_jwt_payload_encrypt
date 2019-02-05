<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="js/jquery.bootpag.js"></script>
<script src="js/tableHeadFixer.js"></script>
    
 <style>
 .trash-txt{font-size: 20px; color: #074156; padding:4px;}
.tblstyle2 {font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;  }
.tblstyle2 td{border: 1px solid #D8D8D8; padding: 5px; color:#333 !important; font-size:11px;}
.tblstyle2 thead th{background:#074156 !important;  color:#fff !important; font-size:12px !important; font-weight:bold; padding:5px !important}
.tblstyle2 tbody tr:nth-child(even) {background: #f4f4f4; !important;}
.tblstyle2 tbody tr:nth-child(odd) {background: #fff; !important;}
.ui-autocomplete{z-index:99999}
.multiselect-container .open>.dropdown-menu{width:auto !important}
 </style>
 
  <script>
  var currentPageNo=1;
  
 $( document ).ready(function() {
	 //set headser title
 $(".close").click(function(){
	console.info("in close button");
$(".modal-backdrop.in").css("display", "none");

});

	 
	 var str = '${levelName}';
	 var header = str.split("Level");	
	 $('#headerId').html("Review "+header[0]+" Level Mapping");
	 
	 //$("#reviewcompanyGlobalLevelTableId1").tableHeadFixer();
	 //$("#reviewcompanyGlobalLevelTableId").css("overflow", "hidden !important");
 	var totalRec=parseInt('${totalPages}');
 	console.info("hii totalRec="+totalRec+"by");
 	if(totalRec>0){
 		
 		 $('.reviewCompanyLevelPagination').bootpag({
 	    	
	          total : totalRec,
	          page : 1,
	          maxVisible : 5,
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
	  	  console.info("pagenation function="+num);
	  	 calpagenationAjax(num,'${levelName}');
	    }).find('.pagination');
	    
 	}else{
 		$('#reviewcompanyGlobalLevelTableId tbody').empty();
 		var strEmpty = '<tr><td colspan="7">No data available.</td></tr>'
 		$('#reviewcompanyGlobalLevelTableId tbody').append(strEmpty);
 	}
 	 
 	
 		 
	   
	    
	  
 
  }); 
 //end ready function
 

  function calpagenationAjax(page,levelName){
		  showLoading();
	  //var levelName="CompanyLevel";
	  var filingId = $("#filingId").val();
	  var fiLabel =$("#fiLabel").val();
	   var actionUrl = "searchFinancialItemList.htm";
	   var displayRecords =$("#displayRecords").val();
		processData = '&page='+encodeURIComponent(page)+'&displayRecords=' + encodeURIComponent(displayRecords)+'&filingId=' + encodeURIComponent(filingId)+'&levelName=' + encodeURIComponent(levelName)+'&fiLabel='+encodeURIComponent(fiLabel);
		actionUrl = "searchFinancialItemList.htm";
		successData = function(data) {
			hideLoading();
			$('#reviewcompanyGlobalLevelTableId tbody').empty();
			$("#reviewcompanyGlobalLevelPopupId").modal('show');
			generateTableBody(data);
			pagenation(data.totalPages,data.page);
		}
		errorData = function(data) {
			$.alert("Problem occurred while getting the values.");
		};
		callAjax(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
	 
  }

  

  function generateTableBody(data){
	  try {
			var htmlString = "";
			for (var i = 0; i < data.financialItemsList.length; i++) {
				var financialItemObj = data.financialItemsList[i];
				htmlString = htmlString + "<tr>";
				htmlString = htmlString	+ "<td>" + financialItemObj.fiLabel+ "</td>";
				htmlString = htmlString	+ "<td>" + financialItemObj.fiSection+ "</td>";
				htmlString = htmlString	+ "<td>" + financialItemObj.fiSubSection+ "</td>";
				htmlString = htmlString	+ "<td>" + financialItemObj.nil_Lable+ "</td>";
				/* htmlString = htmlString	+ "<td>" + financialItemObj.fiIndustry+ "</td>"; */
				htmlString = htmlString	+ "<td>" + financialItemObj.createdBy+ "</td>";
				htmlString=htmlString+ "<td><input type='image' src='images/icon-recycle.png' width='28px' height='28px data-toggle='tooltip' title='Remove' style='border:none !important' onclick='deleteFinancialItem("+financialItemObj.fiId+");'/></td>";
				htmlString = htmlString + "</tr>";
			  }
			$('#reviewcompanyGlobalLevelTableId tbody').append(htmlString);
			}catch (err) {
			console.log("Error Occured in pagination" +err);
		}
  }
  
  function setAutoCompleteData() {
		var fiLabel = $("#fiLabel").val();
		console.info("fillable="+fiLabel);
	
		
		var filingId = $("#filingId").val();
		  var levelName='${levelName}';
		if (fiLabel.trim().length >= 3) {
			processData = '&fiLabel='+ encodeURIComponent(fiLabel)+'&filingId='+encodeURIComponent(filingId)+'&levelName='+encodeURIComponent(levelName);
			actionUrl = "getFinancialLabelAutoComplete.htm";
			successData = function(data) {
				var dataList=data.dataHeaderList;
				console.log(dataList);
				console.log(dataList.length);
			 	$("#fiLabel").autocomplete({
					source : dataList,
					minLength : 1,
					select : function(event, ui) {
						event.stopPropagation();
						$('#fiLabel').val($.trim(ui.item.label));
					},
					close : function(event, ui) {
					}
				});
						   
			};
			errorData = function(data) {
				$.alert("error" + data);
			};
			callAjaxGet(processData, successData, errorData, beforeSend,
					actionUrl, reqType, retDataType);
		}

	}
  
  function searchDataMappingList(){
	  showLoading();
	  var displayRecords =$("#displayRecords").val();
	  var fiLabel =$("#fiLabel").val();
	  var levelName='${levelName}';
	  var filingId=$("#filingId").val();
	  var page=1;
	  var processData = '&page=' + encodeURIComponent(page)+'&displayRecords=' + encodeURIComponent(displayRecords)+'&fiLabel='+encodeURIComponent(fiLabel)+'&levelName='+encodeURIComponent(levelName)+'&filingId='+encodeURIComponent(filingId);
	  actionUrl = "searchFinancialItemList.htm";
	  successData = function(data) {
			addRowCount=1;
			hideLoading();
			$('#reviewcompanyGlobalLevelTableId tbody').empty();
			generateTableBody(data);
			pagenation(data.totalPages,data.page);
			$("#reviewcompanyGlobalLevelPopupId").modal('show');
		}
		errorData = function(data) {
			$.alert("Problem occurred while getting the values.");
		};
		callAjaxGet(processData, successData, errorData, beforeSend, actionUrl,reqType, retDataType);
	  
  }
  
  function deleteFinancialItem(fiId){
		showLoading();
		var actionUrl = "deleteFinancialItem.htm";
		var processData="fiId="+encodeURIComponent(fiId);
		successData = function(data) {
				try {
					$.ajaxSetup({
						async : false
					});
				hideLoading();
				$.alert(data);
			     $("#closeButtonId").click(); 
			    
			 showCompanyGlobalLevelReviewPopUp('${levelName}');
			}catch (e) {
			hideLoading();
			$.alert("Error:" + e);
			}
	}
	showLoading();
	callAjax(processData, successData, errorData, beforeSend,actionUrl, reqType, retDataType);
	}
  
  function pagenation(totalPages, page) 
  {
  
	  $('.reviewCompanyLevelPagination').empty();
      $('.reviewCompanyLevelPagination').bootpag({
            total : totalPages,
            page : page,
            maxVisible : 5,
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
  </script>

  <!-- Modal -->
 
  <div class="modal fade" id="reviewcompanyGlobalLevelPopupId" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="margin-top:70px !important; width:100%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeButtonId">×</button>
        <h4 class="modal-title" id="headerId"></h4>
      </div>
      <div class="modal-body">
       <!-- start search form -->
        <div class="btn-wrapper" style="margin:-8px 0 10px 0">
       <form name="showDataMappingPopupForm1" id="showDataMappingPopupForm1" >
      	<div style="float:left; border:1px solid #ccc; background:#fafafa; padding:5px; margin:0 -1px 10px 0; width:100%">
      		<span style="padding:3px 0 0 0px;" class="col-lg-3"><label>Financial Lable :</label>
	      	<input type="text"  id="fiLabel" autocomplete="off" name="fiLabel" onkeyup="setAutoCompleteData();" style="margin:0 0 0 10px; padding:3px 5px 3px 5px; width:220px"/>	
      		</span>
      		<span id="searchId" onclick="searchDataMappingList();"><i class="fa fa-search custom-font pad5 cus-cls mar-rt5" data-toggle="tooltip" data-placement="top" title="Search" style="padding:5px 7px 6px 7px !important; margin:3px 5px 0 0"></i></span>
      		<span><a id="refreshBtn" href="#" onClick="showCompanyGlobalLevelReviewPopUp('<c:out value="${levelName}"/>')"><i class="fa fa-refresh custom-font pad5 cus-cls mar-rt5" ata-toggle="tooltip" data-placement="top" title="Refresh" title="Search" style="padding:3px 6px 3px 6px !important; margin:3px 5px 0 0"></i></a></span>
      	</div>
      	</form>
      	</div>
      	<!-- end search form -->
       	<input type="hidden" name="displayRecords" id="displayRecords" value="${displayRecords}">
       	<div style="max-height:320px; width:100%; overflow:hidden !important">
       	<table width="100%" id="reviewcompanyGlobalLevelTableId" cellpadding="5" cellspacing="1" border="0" bgcolor="#ebebeb" class="tblstyle2 newtable">
				<thead>
					<tr>
						<th width="30%">Financial Lable</th>
						<th width="10%">Section</th>
						<th width="10%">Sub Section</th>
						<th width="25%">Normalized Label</th>
						<!-- <th width="15%">Template Name</th> -->
						<th width="10%">Created By</th>
						<th width="3%">Delete</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${financialItemsList}" var="financialItems">
				<tr>
				<td><c:out value="${financialItems.fiLabel}" /></td>
				<td><c:out value="${financialItems.fiSection}" /></td>
				<td><c:out value="${financialItems.fiSubSection}" /></td>
				<td><c:out value="${financialItems.nil_Lable}" /></td>
				<%-- <td><c:out value="${financialItems.fiIndustry}" /></td>  --%>	
				<td><c:out value="${financialItems.createdBy}" /></td>
				<td style="text-align:center"><span class="fa fa-trash trash-txt" onclick="deleteFinancialItem('<c:out value="${financialItems.fiId}"/>');"></span></td>
				</tr>
				
				</c:forEach>
				</tbody>
			</table> 
		 </div>
	
    
      <div class="bs-docs-example">
		<p class="reviewCompanyLevelPagination"  data-step="18" data-intro="pagenation"></p>
		</div>
    </div>
  </div>
</div>
  

  
  
var globalReportNo=1;

// below lines are for pass the array in ajax
$.ajaxSetup({
	traditional: true
});

//to avoid autorefresh 
autoRefreshAllowed=0;
function  getAnalystSummery(){
    	
    var analistVal=	$("#analystId").val();
    if(analistVal=="-1"){
  	  $("#selectPeriod").prop( "disabled", false );
   }
    if(analistVal!="0"){
    	 $('#btnSearch').prop( "disabled", false );
    	 $('#btnSearch').removeClass('disabled');
    	
    }else{
   	  $('#btnSearch').attr('disabled', 'disabled');
   	  $('#btnSearch').addClass('disabled');
   	  $("#startDate").prop( "disabled", false );
	  $("#endDate").prop( "disabled", false );
	  $("#selectPeriod").prop( "disabled", false );
    }
   
    }

//parserList by groupId
    function paserserListbyGidAdmin(){
    	 //enable search button
    	 $('#btnSearch').prop( "disabled", false );
    	 $('#btnSearch').removeClass('disabled');
    	 
		 var groupIdVal= $("#groupNameId").val();
		 $('.inputsource').addClass('loadinggif'); 
		  processData = '&groupIdVal='+groupIdVal+'';
		  actionUrl="getParserListByGroupIdforAdmin.htm";
		  successData=function(data){
			  var parsers = data.parserNames;
			  var analistNames = data.analystList;
			  var poertFolioNames = data.portFolioMap;
		    
			  $('#docptId').find('option').remove().end();
		         $('#docptId') .append($('<option>', { value : 0 }).text("All"));
			  $.each(parsers , function( key, value ) {
		             $('#docptId') .append($('<option>', { value : key })
		             .text(value)); 
		         });
			  
			  $('#analystId').find('option').remove().end();
			  $('#analystId') .append($('<option>', { value : -1 }).text("All"));
			  $.each(analistNames , function( key, value ) {
		             $('#analystId') .append($('<option>', { value : key })
		             .text(value)); 
		         });
			 
			  $('#Portfolio').find('option').remove().end();
			  $('#Portfolio') .append($('<option>', { value : -1 }).text("All"));
			  $.each(poertFolioNames , function( key, value ) {
		             $('#Portfolio') .append($('<option>', { value : key })
		             .text(value)); 
		      }); 
			  
			  $('.inputsource').removeClass('loadinggif');
		
		  };
		  errorData=function(data)
			{
			  Console.info("data"+data); 
				alert("error"+data);
				 $('.inputsource').removeClass('loadinggif');
			};
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
 }

        function showLoading(){
		console.info("in loading");
		$('#loadinglayer').css("display","block"); 
		}

		function hideLoading(){
		console.info("ldff");
		$('#loadinglayer').css("display","none");
		}
		
		function clearDates(){
			$("#startDate").val("");
			$("#endDate").val("");
		    $('#selectPeriod').prop( "disabled", false );
		    $("#startDate").prop( "disabled", false );
		    $("#endDate").prop( "disabled", false );
		}

		function disableDates(){
			enableSearchBtn();
			 var val=$('#selectPeriod').val();
			 if(val=="Select"){
				    $("#startDate").prop( "disabled", false );
					$("#endDate").prop( "disabled", false );
					$("#clear").prop( "disabled", false );
			 }else{
				  $("#startDate").attr('disabled', 'disabled');
					$("#endDate").attr('disabled', 'disabled');
					$("#clear").attr('disabled', 'disabled');
			 }
		}
		
		function resetStatus(){
			
			//added by naveed.khan
			$("option:selected").removeAttr("selected");
			$("#roleId").multiselect('refresh');
			$("#analystId").multiselect('refresh');
			//===================
			
			$("#startDate").val("");
			$("#endDate").val("");
			$("#selectPeriod").val("Select");
			$("#analystId").val("Select");
		    $('#selectPeriod').prop( "disabled", false );
		    $("#clear").prop( "disabled", false );
		    $('#btnSearch').attr('disabled', 'disabled');
		    $('#btnSearch').addClass('disabled');
		    $("#startDate").prop( "disabled", false );
		    $("#endDate").prop( "disabled", false );
		    $("#docptId").val("All");
		    var adminAccess=$("#userAccess").val();
		    if(adminAccess==1){
		    var beforeGid=$("#currentGId").val();
		    var currentGid=$("#groupNameId").val();
		    if(beforeGid!=currentGid){
		    	$("#groupNameId").val(beforeGid);
		    	paserserListbyGidAdmin();
		    }
		    }
		    
		}
		
		function resetStatus(){
			//added by naveed.khan
			$("option:selected").removeAttr("selected");
			$("#roleId").multiselect('refresh');
			$("#analystId").multiselect('refresh');
			//===================
			
			$("#startDate").val("");
			$("#endDate").val("");
			$("#selectPeriod").val("Select");
			$("#analystId").val("Select");
		    $('#selectPeriod').prop( "disabled", false );
		    $("#clear").prop( "disabled", false );
		    $('#btnSearch').attr('disabled', 'disabled');
		    $('#btnSearch').addClass('disabled');
		    $("#startDate").prop( "disabled", false );
		    $("#endDate").prop( "disabled", false );
		    $("#docptId").val("All");
		    var adminAccess=$("#userAccess").val();
		    if(adminAccess==1){
		    var beforeGid=$("#currentGId").val();
		    var currentGid=$("#groupNameId").val();
		    if(beforeGid!=currentGid){
		    	$("#groupNameId").val(beforeGid);
		    	paserserListbyGidAdmin();
		    }
		    }
		    
		}
		
		function searchStatus(){
			var startDate=$("#startDate").val();
			var endDate=$("#endDate").val();
			var startDateVal = new Date($( "#startDate" ).val());
			var endDateVal = new Date($( "#endDate" ).val());
			if(startDateVal > endDateVal){
				alert("Start date must be less than End Date");
				return false;
			}
			if(endDate.trim()==""){
				alert("Plese select End Date ");
				return false;
			}
			if(startDate.trim()==""){
				alert("Plese select Start Date ");
				return false;
			}
			showLoading();
			// call reports
			callReports(globalReportNo);
			hideLoading();
		}

	function enableSearchBtn(){
		//enable search button
   	 $('#btnSearch').prop( "disabled", false );
   	 $('#btnSearch').removeClass('disabled');
	}	
	
	//Added By Naveed.Khan
	callReports(globalReportNo);

	//Added By Naveed.Khan		
	function callReports(reportNo){
		
		showLoading();
		
		 $("#"+globalReportNo).removeClass("active");
		 $("#"+reportNo).addClass("active");
		 //clearing existing content 
		 if(globalReportNo!=reportNo){
			 /*$('#master_'+globalReportNo).html('');*/
			 $('#master_'+reportNo).css("display","block");  
			 $('#master_'+globalReportNo).css("display","none");
			 hideLoading();
		 }
		globalReportNo=reportNo;

		var analystId=$("#analystId").val();
		var roleId=$("#roleId").val();
	    var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		var analystNames=[];
		var roles=[];
		//if analystid is null then get all analyst names
		if(analystId == null || !analystId){
			$("#analystId option").each(function(){
				analystNames.push($(this).val())
		        
		    });
		}else{
			analystNames.push(analystId);
		}
		
		//if roleId is null then get all roles
		if(roleId == null || !roleId){
			$("#roleId option").each(function(){
		        roles.push($(this).val());
		    });
		}else{
			roles.push(roleId);
		}

		// if dates are not seletec then choose default last one week date
		if(startDate == null || endDate == null || !startDate || !endDate){
				// below function will set the start and end dates	
				setDefaultDates(reportNo);
				//get the dates after function set dates values
				startDate=$("#startDate").val();
				endDate=$("#endDate").val();
			}
		if(reportNo == '1'){

			
			//casesubmissiontable table
			var tableId = 'casesubmissiontable';
			$.ajax({
				url : "show-table.htm",
				cache : true,
				type : 'POST',
			    data : {tableIds : tableId, endDate : endDate, startDate : startDate}, 
				success : function(data) {
//					hideLoading();
					$('#casesubmissiontable').html('');
					$('#casesubmissiontable').html(data);
				}
			});
			//casesubmissionchart chart
		var chartId = 'casesubmissionchart';
			$.ajax({
				url : "showChart.htm",
				cache : true,
				type : 'POST',
			    data : {tableIds : chartId, endDate : endDate, startDate : startDate}, 
				success : function(data) {
					hideLoading();
					$('#casesubmissionchart').html('');
					$('#casesubmissionchart').html(data);
				}
			});
			
			
			 tableId = 'caseuploadedtable';
			// caseinventorytable table
			$.ajax({
				url : "show-table.htm",
				cache : true,
				type : 'POST',
			    data : {tableIds : tableId, endDate : endDate, startDate : startDate}, 
				success : function(data) {
					hideLoading();
					$('#caseuploadedtable').html('');
					$('#caseuploadedtable').html(data);
				}
			});
			
			tableId = 'caseinventorytable';
			// caseinventorytable table
			$.ajax({
				url : "show-table.htm",
				cache : true,
				type : 'POST',
			    data : {tableIds : tableId, endDate : endDate, startDate : startDate}, 
				success : function(data) {
					hideLoading();
					$('#caseinventorytable').html('');
					$('#caseinventorytable').html(data);
				}
			});
			
			//caseinventorydonut donut
			chartId = 'caseinventorydonut';
			$.ajax({
				url : "showChart.htm",
				cache : true,
				type : 'POST',
			    data : {tableIds : chartId, endDate : endDate, startDate : startDate}, 
				success : function(data) {
					hideLoading();
					$('#caseinventorydonut').html('');
					$('#caseinventorydonut').html(data);
				}
			});
			
			tableId = 'documentprocessingtable';
			// documentprocessingtable table
			$.ajax({
				url : "show-table.htm",
				cache : true,
				type : 'POST',
			    data : {tableIds : tableId, endDate : endDate, startDate : startDate}, 
				success : function(data) {
					hideLoading();
					$('#documentprocessingtable').html('');
					$('#documentprocessingtable').html(data);
				}
			});
			
			//documentprocessingchart chart
			chartId = 'documentprocessingchart';
			$.ajax({
				url : "showChart.htm",
				cache : true,
				type : 'POST',
			    data : {tableIds : chartId, endDate : endDate, startDate : startDate}, 
				success : function(data) {
					hideLoading();
					$('#documentprocessingchart').html('');
					$('#documentprocessingchart').html(data);
					hideLoading();
				}
			});
	
	}else if(reportNo == '2'){
		var tableId="analystproductivitytrackertable";
		//APTTableSN screen name
		//analystproductivitytrackertable table
		
		var tableId = 'analystproductivitytrackertable';
		$.ajax({
			url : "show-table.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, endDate : endDate, startDate : startDate, analystNames : analystNames, roles : roles}, 
			success : function(data) {
				hideLoading();
				$('#analystproductivitytrackertable').html('');
				$('#analystproductivitytrackertable').html(data);
			}
		});
		
		
	}else if(reportNo == '3'){
		var tableId="";
		//audittrailtable table
		var tableId = 'audittrailtable';
		$.ajax({
			url : "show-table.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, endDate : endDate, startDate : startDate, analystNames : analystNames, roles : roles}, 
			success : function(data) {
				hideLoading();
				$('#audittrailtable').html('');
				$('#audittrailtable').html(data);
			}
		});
		
		//audittrailchart chart
		var chartId="audittrailchart";
		$.ajax({
			url : "showChart.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : chartId, endDate : endDate, startDate : startDate, analystNames : analystNames, roles : roles}, 
			success : function(data) {
				hideLoading();
				$('#audittrailchart').html('');
				$('#audittrailchart').html(data);
			}
		});
		
		//audittrailatstatementleveltable table
		tableId = 'audittrailatstatementleveltable';
		$.ajax({
			url : "show-table.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, endDate : endDate, startDate : startDate, analystNames : analystNames, roles : roles}, 
			success : function(data) {
				hideLoading();
				$('#audittrailatstatementleveltable').html('');
				$('#audittrailatstatementleveltable').html(data);
			}
		});
		
		//audittrailatstatementlevelchart chart
		chartId="audittrailatstatementlevelchart";
		$.ajax({
			url : "showChart.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : chartId, endDate : endDate, startDate : startDate, analystNames : analystNames, roles : roles}, 
			success : function(data) {
				hideLoading();
				$('#audittrailatstatementlevelchart').html('');
				$('#audittrailatstatementlevelchart').html(data);
			}
		});
		
	}else if(reportNo == '4'){
		
	}else{
		
	}
	}//callReports()
	
	
	//Added By Naveed.Khan
	function setDefaultDates(reportNo){
		
		var defaultEndDate = new Date();
		var month= defaultEndDate.getMonth() + 1;
		var date=defaultEndDate.getDate();
		var year=defaultEndDate.getFullYear();
		if(date.toString().length == 1 )
		{ date= '0'+date;}
		if(month.toString().length == 1 )
		{month= '0'+month;}

		defaultEndDate=month+ '/' + date + '/' +year;
		

		var defaultStartDate = new Date();
		defaultStartDate.setDate(defaultStartDate.getDate() - 7);
		var month1= defaultStartDate.getMonth() + 1;
		var date1=defaultStartDate.getDate();
		var year1=defaultStartDate.getFullYear();
		if(date1.toString().length == 1 )
		{ date1= '0'+date1;}
		if(month1.toString().length == 1 )
		{month1= '0'+month1;}

		defaultStartDate=month1+ '/' + date1 + '/' +year1

		setTimeout(function(){
			$("#startDate").val(defaultStartDate);
			$("#endDate").val(defaultEndDate);
			searchStatus();
			$('#btnSearch').prop( "disabled", false );
		},2000);
		enableSearchBtn();
		
		
//		callReports(reportNo);
	}//setDefaultDates()
		
	
	/*	Added By Naveed.Khan 
		for UIC table clickbacks*/
	function caseSubmissionClickback(createDate){

		showLoading();
		//displaying reports and showing work queue
		$('#reportMain').css("display","none");
		 $('#uic_Table').css("display","block");
		 
		 $('#reportsLink a').removeClass("active");
		 $('#workQueueLink a').addClass("active");

		 var caseStatus="Ready for submission";
		var sDate=createDate.split('/');
		var eDate=createDate.split('/');
		var startDate=sDate[1] +"-"+sDate[0]+"-"+sDate[2];
		var endDate=eDate[1] +"-"+eDate[0]+"-"+eDate[2];
		
        $('#uic_DynamicSearchButton_workQueue').removeClass('btn-primary').addClass('btn-info');
		showLoading();
		var userIdDec = USERIDDEC;
		var userGroupIdDec = USERGROUPIDDEC;
		var tableId = 'workQueue';
		$.ajax({
			url : "dynamicSearchWithSearchFilterView.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, userId : userIdDec, userGroupId : userGroupIdDec, 
			    	"search_Element:case_status" :caseStatus ,
			    	"startDate:search_Element:create_date" : startDate,
			    	"endDate:search_Element:create_date" : endDate
		    	}, 
			success : function(data) {
				hideLoading();
				$('#uic_Table').html('');
				$('#uic_Table').html(data);
				otherOPerations(tableId); 
			}
		});
		hideLoading();
	}//caseSubmissionClickback()
	
	
	/*	Added By Naveed.Khan 
	for UIC table clickbacks*/
	function caseInventoryClickback(cStatus){
		showLoading();
		
		//displaying reports and showing work queue
		$('#reportMain').css("display","none");
		 $('#uic_Table').css("display","block");
		 
		 $('#reportsLink a').removeClass("active");
		 $('#workQueueLink a').addClass("active");

		 var caseStatus=cStatus;
		 
		 
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		 
		var sDate=startDate.split('/');
		var eDate=endDate.split('/');
		
		var startDate=sDate[1] +"-"+sDate[0]+"-"+sDate[2];
		var endDate=eDate[1] +"-"+eDate[0]+"-"+eDate[2];
		
		
		$('#uic_DynamicSearchButton_workQueue').removeClass('btn-primary').addClass('btn-info');
		showLoading();
		var userIdDec = USERIDDEC;
		var userGroupIdDec = USERGROUPIDDEC;
		var tableId = 'workQueue';
		$.ajax({
			url : "dynamicSearchWithSearchFilterView.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, userId : userIdDec, userGroupId : userGroupIdDec, 
			    	"search_Element:case_status" :caseStatus ,
			    	"startDate:search_Element:create_date" : startDate,
			    	"endDate:search_Element:create_date" : endDate
		    	}, 
			success : function(data) {
				hideLoading();
				$('#uic_Table').html('');
				$('#uic_Table').html(data);
				
				otherOPerations(tableId);
			}
		});
		
		hideLoading();
	}//caseSubmissionClickback()
	
	/*	Added By Naveed.Khan 
	for UIC table clickbacks */
	
	function totalUploaded(){
		showLoading();
		//displaying reports and showing work queue
		$('#reportMain').css("display","none");
		 $('#uic_Table').css("display","block");
		 
		 $('#reportsLink a').removeClass("active");
		 $('#workQueueLink a').addClass("active");
		 
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		 
		var sDate=startDate.split('/');
		var eDate=endDate.split('/');
		
		var startDate=sDate[1] +"-"+sDate[0]+"-"+sDate[2];
		var endDate=eDate[1] +"-"+eDate[0]+"-"+eDate[2];
		
		
		$('#uic_DynamicSearchButton_workQueue').removeClass('btn-primary').addClass('btn-info');
		showLoading();
		var userIdDec = USERIDDEC;
		var userGroupIdDec = USERGROUPIDDEC;
		var tableId = 'workQueue';
		$.ajax({
			url : "dynamicSearchWithSearchFilterView.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, userId : userIdDec, userGroupId : userGroupIdDec, 
			    	"startDate:search_Element:create_date" : startDate,
			    	"endDate:search_Element:create_date" : endDate
		    	}, 
			success : function(data) {
				hideLoading();
				$('#uic_Table').html('');
				$('#uic_Table').html(data);
				otherOPerations(tableId);
			}
		});
		hideLoading();
	}//totalUploaded()
	
	
	/*	Added By Naveed.Khan 
	for UIC table clickbacks */
	
	function documentProcessingClickBack(wStatus){
		showLoading();
		//displaying reports and showing work queue
		$('#reportMain').css("display","none");
		 $('#uic_Table').css("display","block");
		 
		 $('#reportsLink a').removeClass("active");
		 $('#workQueueLink a').addClass("active");
		 
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		var wqStatus=wStatus; 
		
		var sDate=startDate.split('/');
		var eDate=endDate.split('/');
		
		var startDate=sDate[1] +"-"+sDate[0]+"-"+sDate[2];
		var endDate=eDate[1] +"-"+eDate[0]+"-"+eDate[2];
		
		
		$('#uic_DynamicSearchButton_workQueue').removeClass('btn-primary').addClass('btn-info');
		showLoading();
		var userIdDec = USERIDDEC;
		var userGroupIdDec = USERGROUPIDDEC;	
		var tableId = 'workQueue';
		$.ajax({
			url : "dynamicSearchWithSearchFilterView.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, userId : userIdDec, userGroupId : userGroupIdDec, 
		    		"search_Element:dropdown:wq_status" : wqStatus,
			    	"startDate:search_Element:create_date" : startDate,
			    	"endDate:search_Element:create_date" : endDate
		    	}, 
			success : function(data) {
				hideLoading();
				$('#uic_Table').html('');
				$('#uic_Table').html(data);
				
				otherOPerations(tableId);
			}
		});
		hideLoading();
	}//documentProcessingClickBack()
	
	
	/*	Added By Naveed.Khan 
	for UIC table clickbacks */
	
	function casesAssignedClickBack(role,analyst){
		showLoading();
		//displaying reports and showing work queue
		$('#reportMain').css("display","none");
		 $('#uic_Table').css("display","block");
		 
		 $('#reportsLink a').removeClass("active");
		 $('#workQueueLink a').addClass("active");
		 
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		 
		
		var sDate=startDate.split('/');
		var eDate=endDate.split('/');
		
		var startDate=sDate[1] +"-"+sDate[0]+"-"+sDate[2];
		var endDate=eDate[1] +"-"+eDate[0]+"-"+eDate[2];
		
		var caseStatusList=[];
		var makerName=" ";
		var checkerName=" ";
		var qAName=" ";
		
		// case status based on role
		if(role.toUpperCase() == 'Maker'.toUpperCase()){
			makerName=analyst;
			caseStatusList=['Maker Assigned','Checker Assigned','QA Assigned','Ready for submission'];
			
		}else if (role.toUpperCase() == 'Checker'.toUpperCase()){
			checkerName=analyst;
			caseStatusList=['Checker Assigned','QA Assigned','Ready for submission'];
			
		}else if (role.toUpperCase() == 'QA'.toUpperCase()){
			qAName=analyst;
			caseStatusList=['QA Assigned','Ready for submission'];
			
		}

		$('#uic_DynamicSearchButton_workQueue').removeClass('btn-primary').addClass('btn-info');
		showLoading();
		var userIdDec = USERIDDEC;
		var userGroupIdDec = USERGROUPIDDEC;
		var tableId = 'workQueue';
		$.ajax({
			url : "dynamicSearchWithSearchFilterView.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, userId : userIdDec, userGroupId : userGroupIdDec, 
		    		"search_Element:dropdown:case_status" : caseStatusList,
		    		"search_Element:dropdown:maker" : makerName,
		    		"search_Element:dropdown:checker" : checkerName,
		    		"search_Element:dropdown:checker2" : qAName,
		    		"startDate:search_Element:create_date" : startDate,
			    	"endDate:search_Element:create_date" : endDate
		    	}, 
			success : function(data) {
				hideLoading();
				$('#uic_Table').html('');
				$('#uic_Table').html(data);
				
				otherOPerations(tableId);
			}
		});
		hideLoading();
	}//casesAssignedClickBack()
	
	/*	Added By Naveed.Khan 
	for UIC table clickbacks */
	
	function casesCompletedClickBack(role,analyst){
		showLoading();
		//displaying reports and showing work queue
		$('#reportMain').css("display","none");
		 $('#uic_Table').css("display","block");
		 
		 $('#reportsLink a').removeClass("active");
		 $('#workQueueLink a').addClass("active");
		 
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		 
		
		var sDate=startDate.split('/');
		var eDate=endDate.split('/');
		
		var startDate=sDate[1] +"-"+sDate[0]+"-"+sDate[2];
		var endDate=eDate[1] +"-"+eDate[0]+"-"+eDate[2];
		
		var caseStatusList=[];
		var makerName=" ";
		var checkerName=" ";
		var qAName=" ";
		// case status based on role
		if(role.toUpperCase() == 'Maker'.toUpperCase()){
			makerName=analyst;
			caseStatusList=['Checker Assigned','QA Assigned','Ready for submission'];
			
		}else if (role.toUpperCase() == 'Checker'.toUpperCase()){
			checkerName=analyst;
			caseStatusList=['QA Assigned','Ready for submission'];
			
		}else if (role.toUpperCase() == 'QA'.toUpperCase()){
			qAName=analyst;
			caseStatusList=['Ready for submission'];
		}

		$('#uic_DynamicSearchButton_workQueue').removeClass('btn-primary').addClass('btn-info');
		showLoading();
		var userIdDec = USERIDDEC;
		var userGroupIdDec = USERGROUPIDDEC;
		var tableId = 'workQueue';
		$.ajax({
			url : "dynamicSearchWithSearchFilterView.htm",
			cache : true,
			type : 'POST',
		    data : {tableIds : tableId, userId : userIdDec, userGroupId : userGroupIdDec, 
		    		"search_Element:dropdown:case_status" : caseStatusList,
		    		"search_Element:dropdown:maker" : makerName,
		    		"search_Element:dropdown:checker" : checkerName,
		    		"search_Element:dropdown:checker2" : qAName,
		    		"startDate:search_Element:create_date" : startDate,
			    	"endDate:search_Element:create_date" : endDate
		    	}, 
			success : function(data) {
				hideLoading();
				$('#uic_Table').html('');
				$('#uic_Table').html(data);
				
				otherOPerations(tableId);
			}
		});
		hideLoading();
	}//casesCompletedClickBack()
	
	
	/*	Added By Naveed.Khan 
	for UIC table clickbacks */
	function otherOPerations(tableId){
		$("#"+tableId+"SearchElementsContainer .UicTblCaptionH2").append("<span class='search-icon'><span class='glyphicon glyphicon-search' style='padding:0 5px 0 5px'></span></span><span>&nbsp;Custom Search</span>");
		$('#uiIconChangeIdSearch_'+tableId).addClass("glyphicon-chevron-down");
		$('#uiIconChangeIdSearch_'+tableId).removeClass("glyphicon-chevron-up");
		$('#uic_search_'+tableId).hide();
		$('#'+tableId+'Container').css('padding-top','2px');
	

			$('#uic_SearchElement_workQueue_8').multiselect({
							  buttonWidth: '100%',
							  maxHeight: 100,
							   includeSelectAllOption: true,
							   onDropdownShow: function(event){
								   var seVal=$(".multiselect-container").find(".multiselect-all").next("li:eq(1)").text().trim();
									if(seVal == "Select"){
										$(".multiselect-container").find(".multiselect-all").next("li").remove();
									} 
						        }
							}); 
			$('#uic_SearchElement_workQueue_11').multiselect({
				buttonWidth: '100%',
				maxHeight: 100,
				   includeSelectAllOption: true,
				   onDropdownShow: function(event){
					   var seVal=$(".multiselect-container").find(".multiselect-all").next("li:eq(1)").text().trim();
						if(seVal == "Select"){
							$(".multiselect-container").find(".multiselect-all").next("li").remove();
						} 
			        }
			});
			$('#uic_SearchElement_workQueue_12').multiselect({
				buttonWidth: '100%',
				maxHeight: 100,
				 includeSelectAllOption: true,
				  onDropdownShow: function(event){
					  var seVal=$(".multiselect-container").find(".multiselect-all").next("li:eq(1)").text().trim();
						if(seVal == "Select"){
							$(".multiselect-container").find(".multiselect-all").next("li").remove();
						} 
			        }
			});
			$('#uic_SearchElement_workQueue_13').multiselect({
				buttonWidth: '100%',
				maxHeight: 100,
				   includeSelectAllOption: true,
				   onDropdownShow: function(event){
					   var seVal=$(".multiselect-container").find(".multiselect-all").next("li:eq(1)").text().trim();
						if(seVal == "Select"){
							$(".multiselect-container").find(".multiselect-all").next("li").remove();
						} 
			        }
			});
			$(".multiselect-selected-text").css('float', 'left')
			$(".caret").css('float', 'right');
	        $(".caret").css('margin', '8px 0');
			
		$( document ).ajaxComplete(function( event, request, settings ) {
			var responseText = request.responseText;
			if(responseText.indexOf("dynamicTableContainer"+tableId) >= 0){
				bindChageEvenets();
			}
		}); 
	
	}
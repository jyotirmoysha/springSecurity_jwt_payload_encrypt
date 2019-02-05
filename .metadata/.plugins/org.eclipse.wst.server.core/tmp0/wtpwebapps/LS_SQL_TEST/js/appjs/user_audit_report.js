$(function() {		
		jQuery(".singleChosenReport").chosen({width: "265px"});
	});
 
 function submitAuditTrailForm() {
 	var startDate=$('#startDate1').val();
 	var endDate=$('#endDate1').val();
 	var userId=$('.singleChosenReport').val();
 
 	if((startDate=='' && endDate=='' && userId=='')){
		$.alert("Please select Period or User Id");    		
 	}else{
 		if(startDate!=''){
     		if(endDate==''){
     			$.alert("Please select endDate!");    
         	   return false;
     		}
     	}
 		if(endDate!=''){
     		if(startDate==''){
     			$.alert("Please select startDate");  
     		return false;
         	}
     	}	
 	   if(startDate!='' && endDate!=''){
     		startDate = new Date(startDate);
     		 endDate=new Date(endDate);
     		 if(endDate < startDate){
     			 $.alert("End Date should be less than start date");	 
              return false;
         }
 	   }
 		$("#userauditTrailForm").submit();
        	$('#startDate1').val('');
        	$('#endDate1').val('');
        	$("#userId").val($("#target option:first").val());
 	}
 }
	function clearDates(){
		$("#startDate1").val("");
		$("#endDate1").val("");
	 }
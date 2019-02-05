
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();


function industryType(industryTypeVal){
	$('#loading').show();
	$('.msgIndustry').removeClass('msgBg');
	$("#msgIndustry").html("");
	 $("#Incomestatement").prop('disabled', true);
if((industryTypeVal.trim()) =="undefined" || (industryTypeVal.trim())==""){
	$('#loading').hide();
	$("#msgIndustry").html("Industry type should not be empty");
	return false;
} else{
	$('#loading').show();
	var parametersDynamic="industryTypeVal="+industryTypeVal;
	var url= "checkIndustryTypeVal.htm"
	url=insertParam(url);
	$.ajaxSetup({
		cache: true
	});
	 $.ajax({
			type: "POST",  
			 url: url,
			 data:parametersDynamic,
			cache: true,
			dataType : "html",
			success: function(response){
				if(response==""){
					 $('.msgIndustry').removeClass('msgBg');
					 $('#Incomestatement').prop('disabled',false);
					 $('#Incomestatement').selectpicker('refresh');
					 $('#industryType').prop('disabled',true);
					 $('.dropdwn').append("<option value='"+-1+"'>"+$(".chosen-search").find("input").val()+"</option>");
					 $('.dropdwn').val(-1); // if you want it to be automatically selected
					 $('.dropdwn').trigger("chosen:updated");
					 $('#loading').hide();
					 $("#exportToExcel").attr('disabled', 'disabled');
					 return false;
				}else{
					$('.msgIndustry').addClass('msgBg');
					 $("#msgIndustry").html("<span style='color:#fff';>"+"' "+industryTypeVal+" '"+"</span>"+response);
					 $('.dropdwn').val('').trigger('chosen:updated');
					 $('#industryType').prop('disabled',false);
					 $("#exportToExcel").attr('disabled', 'disabled');
					 $('#loading').hide();
				}
			},error: function(data) {
			}	
		});
	

}
}


function generateExacel(){
	var industrytext = $("#industryType option:selected").text();
	var industryTypeVal=$("#industryType").val();
	   if ((industryTypeVal.trim()) == "0"){
		    $.alert("Please Select Industry Type");
	    }else{
		setLocationHref('normalizationTemplateExportToExcel.htm?industryTypeVal='+industryTypeVal+'&industrytext='+industrytext);
	    }
}
	
function  insertData(fsTd1,nldTd2,nlTd3,derived4,formula5,industryTypeVal,subTotalArray,subSectionArray){

	
	$('#submiting').show();	
	$.ajaxSetup({
		cache: true
	});
    var dataForAjax1 = {'fsTd1 []':fsTd1, 'nldTd2 []':nldTd2,'nlTd3 []':nlTd3,'derived4 []':derived4 ,'formula5 []':formula5,'industryTypeVal':industryTypeVal,'subTotalArray []':subTotalArray,'subSectionArray []':subSectionArray}; 
	  $.ajax({
 		 type: 'POST',  
 		 url: insertParam('insertNormalization.htm'),
 		 data: dataForAjax1,
 	 success: function(response){
 		$.alert(response, "Alert");
      setTimeout(setLocationHref('./normalizationTemplate.htm'),5000);
	     $('#submiting').hide();
 		},error: function(data) {
		}
 	});
 }


function  calRefresh(){
	
	setLocationHref('./normalizationTemplate.htm');
	
/*	   window.location.href = './normalizationTemplate.htm';*/
}

function uploadNormTemplate(){
	
	var myForm = new FormData();
	myForm.append("file", importNormalizationTemp.files[0]);
	var filename = $("#importNormalizationTemp").val();
	$("#uploadErrors").html("");
	 var extension = filename.replace(/^.*\./, '');
	 if(filename === "" || filename === "undefined"){
		 $("#uploadErrors").html("<span style='color:#008000'>Please select a file to upload.</span>");
	 }else if(extension.toLowerCase() === "xlsx"){
		 $("#uploadErrors").html("<span style='color:#008000'>Please wait Template is uploading.</span>");
			$.ajaxSetup({
				cache: true
			});
		 $.ajax({
			    url: insertParam('uploadNormalizationTemp.htm'),
			    data: myForm,
			    dataType: 'text',
			    processData: false,
			    contentType: false,
			    type: 'POST',
			    success: function(data){
			    	if(data !== ""){
			    		var dataArr=data.split(",")
			    		var htmlStr=""
			    		for (var i=0; i < dataArr.length; i++){
			    			htmlStr=htmlStr+"<span style='color:#FF0000'>"+dataArr[i]+".</span><BR>";
			    		}
			    		$("#uploadErrors").html(htmlStr);
			    	}else{
			    		$("#uploadErrors").html("<span style='color:#008000'>Template uploaded successfully.</span>");
			    		$("#importNormalizationTemp").val("");
			    	}
			    	 
			    }
			  });
	 }else{
		 $("#uploadErrors").html("<span style='color:#008000'>Selected file type is not supporting to upload.<BR>Please select Excel file to upload.</span>");
	 }
}


     var prevCompanyId="";
	 var prevCompanyName="";	
	 /**Global upload document variables**/
		var clientName="";
		var companyId="";
		var parser="";
		var language="";
		var industryId="";
		var countryId="";
		var countryName="";
		var fYEDay="";
		var fYEMonth="";
		var templateName ="";
		var sectorId ="";
		var fYEYear ="";	
		var dealerId="";
		var sicId ="";
		var naicsId = "";
		var goldenCaseId="";
		var industryType="";
		 

function setValuesOfCompanyName(companyName){
	companyName=$.trim(companyName);
	    if(companyName==''){
   		return false;
   	}
	   var companyId=$("#company_id").val();
	  var entityId=$("#entity_id").val();
	   prevCompanyId=companyId;

		  if(prevCompanyName !==companyName){
			  prevCompanyName=companyName;
		
		var processdata="&entityId="+encodeURIComponent(entityId);
	    var url="getCompanyInfoByCompanyName.htm";
	    url=insertParam(url);
		$.ajaxSetup({
			 cache: true
		});
	   	$.ajax({
	 	        type : "post",
	 	        url: url,
	 	        data:processdata,
	 	        cache: true,
	 	        success : function(data) {
	 	        if(data.companyName !== "~new" && data!=""){
   	 	        if(($.trim(companyId) !== 'undefined') && ($.trim(companyId).length > 0) && $.trim(companyId) !== $.trim(data.companyId)){
	   	 	        if ($.confirm("Given company name is already associated with other company id. Do you want to proceed? ")) {
		   	 	        emptyFields();
		   	 	        $("#country-name").val(data.countryName);
		        		$("#country-id").val(data.countryId);
		        		$("#industryId").val(data.industryId);
		        		$('select[id="dealerId"] option[value='+data.dealerId+']').attr("selected","selected");
		        		$('select[id="sectorId"] option[value='+data.sectorId+']').attr("selected","selected");
		        		$("#company_id").val(data.companyId);
		        		$("#sicId").val(data.sicId);
		        		$("#sic_description").val(data.sicDesrcipion);
		        		$("#naicsId").val(data.naicsId);
		        		
		        		
	   	 	        }else{
						$("#c-name").val("");
  						prevCompanyName="";
  					}
   	 	 	   }else{
   	 	 		   	$("#country-name").val(data.countryName);
	        		$("#country-id").val(data.countryId);
	        		$("#industryId").val(data.industryId);
	        		$('select[id="dealerId"] option[value='+data.dealerId+']').attr("selected","selected");
	        		$('select[id="sectorId"] option[value='+data.sectorId+']').attr("selected","selected");
	        		$("#company_id").val(data.companyId);
	        		$("#sicId").val(data.sicId);
	        		$("#sic_description").val(data.sicDesrcipion);
	        		$("#naicsId").val(data.naicsId);
	        		$("#naics_description").val(data.naicsDesrcipion);


   	 	 	   }
	 	        }
	 	        
	 	        	
	 	        },    
	 	        error : function(xhr, ajaxOptions, thrownError) {
	 	        	  alert("Error");
	 	        }
	 	    });
	  }
	 
  	
}

function deleteAllFiles(){
	var  originalFileArray=[];	
    var  fileNameArray=[];	
		//original && filename in loop
		  $('.orgfilename').each(function() {	
       		originalFileArray.push(this.value);		         		
		  });
		  $('.uploadfilename').each(function() {	
			   fileNameArray.push(this.value);
       	});		         	
	            for(var i=0; i<fileNameArray.length;i++){
	                removeTr(uploadDeleteUrl,fileNameArray[i],originalFileArray[i]); 
	            }
			    if(originalFileArray.length==fileNameArray.length){
			    	originalFileArray=[];
			    	fileNameArray=[];
			    }	
}




function validateCustomerDetails()
{
	/********** Testing pupose  ********return true;***/
console.info("in validateCustomerDetails function");
	var validationFlag=true;
	
  //company validation
	if(!checkUndefinedValue(clientName)) {
		if (!checkNotEmpty(clientName)) {
			validationFlag = false;
			$.alert("Please fill the Comapany Name field!");
			return false;
		}
	}else {
		clientName = "";
	}
	
 //companyId validation
	if(!checkUndefinedValue(companyId))
	{
			 if (!checkNotEmpty(companyId)) {
			     validationFlag = false;
			      $.alert("Please fill the Comapany Id field!");
			    return false;
		        }	
	}else{
		companyId="";	
	}
	
	//parser
	if(!checkUndefinedValue(parser))
	{
			 if(!checkNotEmpty(parser)) {
				validationFlag = false;
				$.alert("Please fill the Parser field!");
			   return false;
		      }
	} else {
		parser = "";
	}
	// language
	if(!checkUndefinedValue(language)) {
			if (!checkNotEmpty(language)) {
			validationFlag = false;
			$.alert("Please fill the Language field!");
			return false;
		    }
	}else {
		language = "";
	}
	//industryId
	if (!checkUndefinedValue(industryId)) {
				if (!checkNotEmpty(industryId)){
			        validationFlag = false;
			       $.alert("Please fill the Industry Code field.");
			     return false;
		          }
	} else {
		industryId = "";
	}
	//countryId
	if(!checkUndefinedValue(countryId)) {
	}else{
		countryId = "";
	}
	
	if(!checkUndefinedValue(countryName)) {
	}else {
		countryName = "";
	}
	//fYEDay
	if(!checkUndefinedValue(fYEDay)) {
			if(!checkNotEmpty(fYEDay)) {
			validationFlag = false;
			$.alert("Please fill the fYEDay field.");
			return false;
		     }
	}else {
		fYEDay = "";
	}
	
	//fYEMonth
	if(!checkUndefinedValue(fYEMonth)) {
		if (!checkNotEmpty(fYEMonth)) {
			validationFlag = false;
			$.alert("Please fill the fYEMonth field.");
			return false;
		}
	}else {
		fYEMonth = "";
	}
	//fYEYear
	if (!checkUndefinedValue(fYEYear)) {
			if (!checkNotEmpty(fYEYear)) {
				validationFlag = false;
				$.alert("Please fill the fYEYear field.");
				return false;
			}
	} else {
		fYEYear = "";
	}
	
	//templateName
	if (!checkUndefinedValue(templateName)) {
		if (!checkNotEmpty(templateName)) {
			validationFlag = false;
			$.alert("Please fill the Norm Template field.");
			return false;

		}
	} else {
		templateName = "";
	}
	//sectorId
	if(!checkUndefinedValue(sectorId))
	{
		 if (!checkNotEmpty(sectorId)) {
			validationFlag = false;
			$.alert("Please fill the Sector field.");
			return false;
		}	
	}else{
		sectorId="";	
	}
	
	//dealerId
	if (!checkUndefinedValue(dealerId)) {
			if (!checkNotEmpty(dealerId)) {
				validationFlag = false;
				$.alert("Please fill the Dealer Name field.");
				return false;
			}
	} else {
		dealerId = "";
	}
	//sicId
	if (!checkUndefinedValue(sicId)) {
	} else {
		sicId = "";
	}
	//sicId
	if (!checkUndefinedValue(naicsId)) {

	} else {
		naicsId = "";
	}
    return true;
}





function validateFyeMonth(){
		var userChoice = $.trim($("#fYEMonth-name").val()).toLowerCase().replace(/\b[a-z]/g, function(letter) {
 	    return letter.toUpperCase();
 	});  
		setMonthDate(userChoice);
	}

//new methods for fileInput Js
function removeUploaded(Obj,fileName,orgfilename){
removeTr(uploadDeleteUrl,fileName,orgfilename);
$(Obj).closest('tr').remove();
}

function removeTr(url,fileName,orgfilename){ 	
var parametersDynamic='&fileName='+fileName+'&orgfilename='+orgfilename;
$.ajaxSetup({
	 cache: true
});
showLoading();
$.ajax({
type: "POST",  
url: url,
data:parametersDynamic,
cache: true,
async: true,
dataType : "html",
success: function(data)
{	
	var res=$.parseJSON(data);
		hideLoading();
}
});
}

function showLoading(){
console.info("in loading");
$('#loadinglayer').css("display","block"); 
}

function hideLoading(){
console.info("ldff");
$('#loadinglayer').css("display","none");
}

function submitFiles(){
setAllInputFormFields();
	var uloadFilesSize = $('.uploadfilename').size();
	var errorFile = $('.errorFile').size();
	var isPasswordSize= $('.isPasswordFile').size();
	var uploadFlag=true;
	//input validations
	    if(errorFile > 0){
	    	$.alert('Please cancel error files');		
			uploadFlag=false;
		return uploadFlag;
		}
	  //input validations
	   if(uloadFilesSize > 0){
		if(!validateCustomerDetails()){
			uploadFlag=false;
		return uploadFlag;
		}
	 //password protected
		if(isPasswordSize > 0){
		var  pwdFlag=checkFilePasswordDetails();	
		if(!pwdFlag){
			uploadFlag=false;
			return uploadFlag;	
		}
		}   
		
		//submit to controller
		if(uploadFlag){
			submiUploadedFiles();   
		}
	
	}else{
		$.alert('No files available for complete.');	
	}
	
}
function submiUploadedFiles(){
var finalListOfFiles = "";
$('.uploadfilename').each(function() {
	if(finalListOfFiles != ""){
		finalListOfFiles = finalListOfFiles+",";
 }
	finalListOfFiles = finalListOfFiles+this.value;
	}); 	
		finalListOfFiles = finalListOfFiles.replace(/(\r\n|\n|\r)/gm,"");
		finalListOfFiles = finalListOfFiles.replace(/" "/g,"");
		$("#customer_names").val(clientName);
		$("#company_ids").val(companyId);

var  parametersDynamic=$("#upload_file").serialize()+"&c-name="+encodeURIComponent(clientName)+'&company_id='+encodeURIComponent(companyId)+"&parserName="+encodeURIComponent(parser)+"&finalListOfFiles="+encodeURIComponent(finalListOfFiles)+"&language="+encodeURIComponent(language);
parametersDynamic =parametersDynamic+"&countryId="+encodeURIComponent(countryId)+"&countryName="+encodeURIComponent(countryName)+"&fYEDay="+encodeURIComponent(fYEDay)+"&fYEMonth="+encodeURIComponent(fYEMonth);
parametersDynamic =parametersDynamic+"&templateName="+encodeURIComponent(templateName)+"&fYEYear="+encodeURIComponent(fYEYear)+"&industryId="+industryId+"&dealerId="+dealerId+"&sectorId="+sectorId+"&sicId="+sicId+"&naicsId="+naicsId+"&goldenCaseId="+encodeURIComponent(goldenCaseId)+"&industryType="+encodeURIComponent(industryType);
var url=uploadConfirm;
$.ajaxSetup({
	cache: true
});
showLoading();
 $.ajax({
 	 type: "POST",  
 	 url: url,
 	 data:parametersDynamic,
 	 cache: true,
 	 async: true,
 	 dataType : "json",
 	 success: function(data)
 	 { 		 hideLoading();	
         var responseObj = JSON.parse(JSON.stringify(data));	
         var jsonObj =responseObj["customerInfo"];
			var arrayOfObjects = eval(jsonObj);
			var customerDetails;
			for(var i=0; i<arrayOfObjects.length;i++){
				var trCustomerInfo="";
				customerDetails = arrayOfObjects[i];
				    trCustomerInfo="<tr>"
					trCustomerInfo=trCustomerInfo+"<td>"+customerDetails.customerName+"</td>";
					trCustomerInfo=trCustomerInfo+"<td>"+customerDetails.companyId+"</td>";
					if(customerDetails.parserName == 'Enhanced Public Parser'){
					trCustomerInfo=trCustomerInfo+"<td>Public</td>";
					}
					else if (customerDetails.parserName == 'PDF Based Parser'){
						trCustomerInfo=trCustomerInfo+"<td>PDF</td>";
					}
					else if (customerDetails.parserName == 'Dealer Form'){
						trCustomerInfo=trCustomerInfo+"<td>Dealers</td>";
					}else{
						trCustomerInfo=trCustomerInfo+"<td>"+customerDetails.parserName+"</td>";
					}
				
				    trCustomerInfo=trCustomerInfo+"</tr>";
				    $("table#confirmTbl tbody").append(trCustomerInfo);
			}
 	 
 	 $('#confirmPopUp').modal('show');
 	 }
 });

}

function checkFilePasswordDetails(){
	 /* Here we check user entered password is correct or not */
	var processdata=$("#upload_file").serialize();
	var validatePwdFlag=false;
	var validatePwdMsg="";	
	url=insertParam(isPasswordCorrect);
	$.ajaxSetup({
		cache: true
	});
	$.ajax({
        type : "post",
        url: url,
        cache: true,
        async:false,
        data:processdata,
        success : function(data) {
        	var errorCheck=false;
        	result=JSON.parse(data);
        	var pwdFileCount=result['pwdFileCount'];
        	for(i=0;i<=pwdFileCount;i++){
           if(result.hasOwnProperty('blankpwd'+i))
			{        		
        		validatePwdMsg=validatePwdMsg+result['blankpwd'+i];
        	  errorCheck=true;
			}
        	if(result.hasOwnProperty('incorrectpwdmsg'+i))
			{
        		validatePwdMsg=validatePwdMsg+result['incorrectpwdmsg'+i];
        	  errorCheck=true;
			}
          }
        	if(errorCheck){
        		$.alert(validatePwdMsg);	
        		validatePwdFlag=false;
        		return validatePwdFlag;
        	}else{
        		validatePwdFlag=true;
        		return validatePwdFlag;
        	}
     	    },  error : function(xhr, ajaxOptions, thrownError) {
          	  $.alert("Error");
            }     
    });
	return validatePwdFlag;
}


function callBulkupload(){
	$('.modal-backdrop').remove();
	setLocationHref('documentUpload.htm'); 
}
function emptyFields(){
	$(".clr").val("");
	$("#FYEDaySelect").html("");
        $("#country-name").val("");
		$("#country-id").val("");
		$("#industryId").val("");
		$("#company_id").val("");
		$("#dealerId").val("");
		$("#sectorId").val("");
		$("#sicId").val("");
		$("#sic_description").val("");
		$("#naicsId").val("");
		$("#naics_description").val("");
		$("#goldenCaseId").val("");
		$("#industry_type").val("");

		
}
var prevCompanyId="";
var prevCompanyName="";

function  setValuesOfCompanyId(selectedVal){
	selectedVal=$.trim(selectedVal);
	
	if(selectedVal==''){
		return false;
	}
	var cNamee= $("#c-name").val();
	prevCompanyName =cNamee;
	if(prevCompanyId !==selectedVal){
		prevCompanyId=selectedVal;
		var processdata="&companyId="+encodeURIComponent(selectedVal);
    	var url="getCompanyInfoByCompanyId.htm";
    	url=insertParam(url);
		$.ajaxSetup({
			cache: true
		});
    		 $.ajax({
    	 	        type : "post",
    	 	        url: url,
    	 	        data:processdata,
    	 	        success : function(data) {
    	 	        	console.info("data="+data);
    	 	        	if(data.companyId !== "~new" && data!=""){
    	 	        		if(($.trim(cNamee) !== 'undefined') && ($.trim(cNamee).length > 0) && $.trim(cNamee) !== $.trim(data.companyName)){
        	 	        		if ($.confirm("Given company id is already associated with other company name. Do you want to proceed? ")) {
        	 	        			emptyFields();
                	              	$("#c-name").val(data.companyName);
                	          		$("#country-name").val(data.countryName);
                	            	$("#country-id").val(data.countryId);
                	            	$("#industryId").val(data.industryId);
                	            	$('select[id="dealerId"] option[value='+data.dealerId+']').attr("selected","selected");
                	            	$('select[id="sectorId"] option[value='+data.sectorId+']').attr("selected","selected");
        			        		$("#sicId").val(data.sicId);
        			        		$("#sic_description").val(data.sicDesrcipion);
        			        		$("#naicsId").val(data.naicsId);
        			        		$("#naics_description").val(data.naicsDesrcipion);
        			        		$("#company_id").val(selectedVal);
                	 	       		$("#entity_id").val(data.eID);
        	 	        		}else{
                  					$("#company_id").val("");
                  					prevCompanyId="";
                  				} 
        	 	        	}else{
        	 	        		emptyFields();
        	 	        		$("#c-name").val(data.companyName);
            	          		$("#country-name").val(data.countryName);
            	            	$("#country-id").val(data.countryId);
            	            	$("#industryId").val(data.industryId);
            	            	$('select[id="dealerId"] option[value='+data.dealerId+']').attr("selected","selected");
            	            	$('select[id="sectorId"] option[value='+data.sectorId+']').attr("selected","selected");
    			        		$("#sicId").val(data.sicId);
    			        		$("#sic_description").val(data.sicDesrcipion);
    			        		$("#naicsId").val(data.naicsId);
    			        		$("#naics_description").val(data.naicsDesrcipion);
    			        		$("#company_id").val(selectedVal);
            	 	       		$("#entity_id").val(data.eID);

        	 	        	}
        	 	        	
    	 	        	}
    	 	        	
    	 	        	
    	 	        },    
    	 	        error : function(xhr, ajaxOptions, thrownError) {
    	 	        	  $.alert("Error");
    	 	        }
    	 	    });
	}
	
	
	
}
function emptyFields(){
	$(".clr").val("");
	$("#FYEDaySelect").html("");
        $("#country-name").val("");
		$("#country-id").val("");
		$("#industryId").val("");
		$("#company_id").val("");
		$("#dealerId").val("");
		$("#sectorId").val("");
		$("#sicId").val("");
		$("#sic_description").val("");
		$("#naicsId").val("");
		$("#naics_description").val("");
		$("#goldenCaseId").val("");
		$("#industry_type").val("");
}
function checkUndefinedValue(value)
{
	if (typeof value === "undefined" || value==="undefined")
	 return true;
	else
	return false;
}
function setAllInputFormFields()
{
 clientName=$.trim($("#c-name").val());
 companyId=$.trim($("#company_id").val());
 parser=$("#parser").val();
 language=$("#language").val();
 industryId=$("#industryId").val();
 countryId=$("#country-id").val();
 countryName=$.trim($("#country-name").val());
 console.info("country name="+countryName);
 fYEDay=$("#fYEDay").val();
 fYEMonth=$("#fYEMonth-name").val();
 templateName = $("#templateName").val();
 sectorId = $("#sectorId").val();
 fYEYear = $("#fYEYear").val();	
 dealerId=$("#dealerId").val();
 sicId = $("#sicId").val();
 naicsId = $("#naicsId").val();
 goldenCaseId=$("#goldenCaseId").val();
 
 if($("#industry_type").val()!= undefined)
	{
	 	industryType=$("#industry_type").val();
	}
}

    
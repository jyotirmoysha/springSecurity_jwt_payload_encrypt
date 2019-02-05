function validateCustomerDetails()
{
	/********** Testing pupose  *********
		return true;
	***/
	console.info("validateCustomerDetails Called");
	$("#error-list").empty();
	var errorcnt=true;
	var accountNo=$("#acc-no").val();
	var clientName=$("#c-name").val();
	var businessName=$("#b-name").val();
	//console.info(accountNo+""+clientName+""+businessName);
    var numericReg = /^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/;
    var alphabetReg = /^\s*[a-zA-Z,\s]+\s*$/;
    var alphanumericReg="^\s*[a-zA-Z0-9.,]+\s*$";
    if(!checkNotEmpty(clientName))
    {
	     $("#error-list").append('<li>Customer Name is Not Valid.</li>').show();
	     errorcnt=false;
    }
    /* if(businessName!="" )
    {
	     $("#error-list").append('<li>Business Name is Not Valid.</li>').show();
	     errorcnt=false;
    } */
  
    if(accountNo!=null && accountNo!=''){
	    if(!numericReg.test(accountNo))
	    {
		     $("#error-list").append('<li>Customer Account Number is Not Valid.</li>').show();
		     errorcnt=false;
	    }
	  }
    console.info("validateCustomerDetails Completed");
    return errorcnt;
}

/*************** Student Registration Form Submittion ***************/
function addClient()
{
	 console.info("addClient Called");
	 $('#custSubm').hide();
	
	 if(validateCustomerDetails())
	 {
		 showLoading();
		$('#custSubm').hide();
		processData=$("#authinfoForm").serialize();
		actionUrl="add-customer.htm";
		successData=function(data)
		{
			
			$("#error-div").html(data).show();
		};
		errorData=function(data)
		{
			
			$("#error-div").html(data).show();
		};
		//callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType, timeOut);
		}
	else
		{
	
		 	$("#error-div").slideDown("fast");
		 	adjestHeight();
		 	$('#custSubm').show();
		}
	console.info("addClient Completed");
}

function adjestHeight()
{
	$(".inpt-fld-wpr").height(310);
	$(".DU-content-info-wpr").height(310);
	
}


function viewFileUpload(customerid)
{
	console.info("viewFileUpload Called");
	processData='&customerId='+encodeURIComponent(customerid);
	successData=function(data){
		
		$('#file-upload-content').html(data).show();
		hideLoading();
		
	}; 
	errorData=function(data){
		
		$("#file-upload-content").html(data).show();
		hideLoading();
	};
	actionUrl="upload_page.htm"; 
	callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType, timeOut);
	console.info("viewFileUpload Completed");
	
}

/*************************** Upload Functions ********************************/
function addFile(name,id)
{
	console.info(name+id);
	var data='<input id="'+id+'" type="hidden" name="uploadedfiles" value="'+name+'"/>';
	$("#addMainFiles").append(data);
}
function checkFiles(name)
{
	console.info(name+id);
	var data='<input id="'+id+'" type="hidden" name="uploadedfiles" value="'+name+'"/>';
	$("#addMainFiles").append(data);
} 
 
 function submitFiles()
 {
	 	if(setParser())
	 	{
	 		showLoading();
	 		processData=$("#addMainFiles").serialize()+'&parserName='+encodeURIComponent($("#parser").val());
	 		actionUrl="upload_confirm.htm";
			successData=function(data)
			{
				hideLoading();
				$("#error-div-1").html(data).show();
				
			};
			errorData=function(data)
			{
				hideLoading();
				$("#error-div-1").html(data).show();
			
			};
			
			if(checkNotEmpty($('input[name="uploadedfiles"]').val()))
			{
				console.info("--------Value Validated-------");
				callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
			}
			else
			{
				console.info("--------Validation failed-------");
				$("#error-div-1").show();
			 	return false;
			}
	  	}
	 	
 }
 
 
 
/* function removeFile(fileId)
 {
	 	console.info("----------------- removeFile Started -----------------"+fileId);
		processData="fileName="+document.getElementById(fileId).value;
		var result=false;
		sData=function(data)
		{
			console.info(data+"Server Result");
			var res=$.parseJSON(data);
			console.info(res);
			if(res.result)
			{ 
				document.getElementById(fileId).remove();
				result=true;	
			} 
			$("#error-div").html(res.message).show().hide(100); 
			hideLoading();
		};
		errorData=function(data)
		{
			console.info(data+"error-got");
			$("#error-div").html(data).show();
			hideLoading();
		};
		actionUrl="upload_delete.htm";	
		if(checkNotEmpty(document.getElementById(fileId).value))
		{	
			showLoading();
			console.info("--------Value Validated-------");
			callAjax(processData, sData, errorData, beforeSend, actionUrl, reqType, retDataType);
		}
		else
		{
			console.info("--------Validation failed-------");
			$("#error-div").slideDown("fast");
		} 
		console.info("----------------- removeFile Completed -----------------");
		return result;
}
 */
 function getParser()
 {
	 if(checkNotEmpty($('input[name="uploadedfiles"]').val()))
	 {
		console.info("--------Value Validated-------");
		 $("#parser-selection").show();
		 $("#file-selection").hide();
	 }
	 else
		 $("#error-div").html("Please Select Document for Upload").show();
 }
 
 function setParser()
 {
	 var parser=$("#parser").val();
	 console.info(parser);
	 if(checkNotEmpty(parser) && parser.toUpperCase()!='SELECT')
	 {
		 return true;
	 }
	 else
		 {
		 $("#error-div-1").html("Please Select Parser").show(1500).hide(500);
		 return false;
		 }
		
		 
 }
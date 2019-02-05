<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="Expires" content="-1" />
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
	<link href="js/jquery/smoothness/jquery-ui.custom.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="file-upload/css/bootstrap.min.css">
	<link rel="stylesheet" href="file-upload/css/blueimp-gallery.min.css">
	<link rel="stylesheet" href="file-upload/css/jquery.fileupload.css">
	<link rel="stylesheet" href="file-upload/css/jquery.fileupload-ui.css">
	<link rel="stylesheet" href="js/jGrowl/jquery.jgrowl.min.css">
	<noscript><link rel="stylesheet" href="file-upload/css/jquery.fileupload-noscript.css"></noscript>
	<noscript><link rel="stylesheet" href="file-upload/css/jquery.fileupload-ui-noscript.css"></noscript>
	
	
	<script src="js/uic/jquery-2.1.1.min.js" ></script>
	<script src="js/jquery/jquery-migrate.min.js"></script>
	<script src="js/jquery/jquery-ui.custom.min.js"></script>
	<script src="js/jGrowl/jquery.jgrowl.min.js"></script>
	<script src="js/common.js?value=${applicationScope['version']}"></script>
	<!-- --for processing wheel -->
	<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
	<script src="js/jquery.darktooltip.js"></script>

<style type="text/css">
.error {
	/* //background: #ff0000; */
	color: #ff0000;
	font-weight:bolder;
	padding:0.5em
}

.success {
	background: #85A366;
	color: white;
	font-weight:bolder;
}

</style>
</head>
<body>
				
		<section id="file-upload-content">
			<div class="content_wpr main-doc-width">
				<div class="DU-process-bar"> 
					<div class="process-steps process-1-steps"> <span class="active"> Authentication </span> </div>
					<div class="process-steps process-2-steps"> <span> File Upload </span> </div>
					<div class="process-steps process-3-steps"> <span> Confirmation </span> </div>
				</div>
				<div class="DU-content-wpr">
				<form  id="authinfoForm" method="POST" >
					<div class="DU-content-info-wpr">
						<h3 class="heading">Account Information</h3>
						<div class="auth-info">Before you upload your document please enter <b class="attentive-txt">Your Name, Business Name</b> and <b class="attentive-txt">Account Number</b> to help us identify you.</div>
					</div>
					<div class="inpt-fld-wpr">
					<div id="error-div" style="display:none;padding:0.2em 0.7em" class="error">
							<ul id="error-list" style="padding:0.5em">
								
							</ul>
					</div>
						<table width="100%" cellpadding="5" cellspacing="5" border="0">
							<tr>
								<td style="width:32%"> Customer Name <span class="mandate-filds">*</span></td>
								<td style="width:68%"> 
								<input type="text" name="c-name" id="c-name" class="required" placeholder="Your Name, As it appears on your statement" onblur=""  /> 
								<div class="invalid-msg" >Please enter Your Name</div>
								</td>
							</tr>
							<tr>
								<td style="width:32%"> Business Name </td>
								<td style="width:68%"> <input type="text" id="b-name" name="b-name" placeholder="Your Business Name, As it appears on your statement"/> </td>
							</tr>
							<tr>
								<td style="width:32%"> Company Id <span class="mandate-filds">*</span></td>
								<td style="width:68%"> <input type="text" name="company_id" id="company_id" class="required" /> 
								<div class="invalid-msg">Please enter Company Id</div>
								</td>
							</tr>
							<tr>
								<td style="width:32%"> Account Number <span class="mandate-filds"></span></td>
								<td style="width:68%"> <input type="text" name="acc-no" id="acc-no" class="required" placeholder="Your Account Number-only Numbers, no space & dash"/> 
								<div class="invalid-msg">Please enter Your Valid Account Number</div>
								</td>
							</tr>
							
							
							<tr>
								<td style="width:32%" valign="top"> Enter Validation Code <span class="mandate-filds">*</span></td>
								<td style="width:68%"> <img src="images/captcha.jpg" width="313" height="113" alt="Captcha"> </td>
							</tr>
							<tr>
								<td style="width:32%" valign="top"> </td>
								<td style="width:68%"> </td>
							</tr>
						</table>
					</div>
					<div class="clr"></div>
					<div class="btn-wpr"><a id="custSubm" onClick="javascript:addClient();" href="#" class="button" >Next </a> </div>
					</form>
				</div>
				
				
			</div>
		</section>
		<footer>
			<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include></div>
		</footer>
	<div id="loadinglayer"></div>
</body>
<script type="text/javascript">
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
	var companyId=$("#company_id").val();
	//console.info(accountNo+""+clientName+""+businessName);
    var numericReg = /^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/;
    var alphabetReg = /^\s*[a-zA-Z,\s]+\s*$/;
    var alphanumericReg="^\s*[a-zA-Z0-9.,]+\s*$";
    if(!checkNotEmpty(clientName))
    {
	     $("#error-list").append('<li>Customer Name is Not Valid.</li>').show();
	     errorcnt=false;
    }
    if(!checkNotEmpty(companyId))
    {
	     $("#error-list").append('<li>Company Id may not be empty.</li>').show();
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
			hideLoading();
		};
		callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType, timeOut);
		
		
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


function viewFileUpload(customerid,customerName,businessName,accountNo)
{
	console.info("viewFileUpload Called");
	processData='&customerId='+encodeURIComponent(customerid);
	successData=function(data){
		
		$('#file-upload-content').html(data).show();
		hideLoading();
		$('#c-lable').html(customerName);
		$('#b-lable').html(businessName);
		$('#acc-lable').html(accountNo);
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
	$("#custSubm").attr("style", "").attr("onclick", "getParser()");
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
			if($('#upload-list tr').length == 0){
				$("#custSubm").attr("style", "opacity:0.5;filter: alpha(opacity=50);-moz-opacity:0.5;cursor:default;").attr("onclick", "");
			}
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
} */
 
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

</script>	
</html>

<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td style="width:2%">
            <span class="preview"></span>
        </td>
        <td style="width:38%">
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td style="width:20%">
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td style="width:40%">
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>

<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td style="width:2%">
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td style="width:38%">
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td style="width:20%">
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td style="width:40%">
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>

<script src="file-upload/js/libs/jquery.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="file-upload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="file-upload/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="file-upload/js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
 <script src="file-upload/js/canvas-to-blob.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
 <script src="file-upload/js/bootstrap.min.js"></script>
<script src="file-upload/js/jquery.blueimp-gallery.min.js"></script> 
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="file-upload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="file-upload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="file-upload/js/jquery.fileupload-process.js"></script>
<!-- <!-- The File Upload image preview & resize plugin -->
<script src="file-upload/js/jquery.fileupload-image.js"></script> 
<!-- The File Upload audio preview plugin -->
<!-- <script src="file-upload/js/jquery.fileupload-audio.js"></script>
The File Upload video preview plugin
<script src="file-upload/js/jquery.fileupload-video.js"></script> -->
<!-- The File Upload validation plugin -->
<script src="file-upload/js/jquery.fileupload-validate.js"></script> 
<!-- The File Upload user interface plugin -->
<script src="file-upload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<!-- <script src="file-upload/js/main.js"></script> -->
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->

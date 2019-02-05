
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Live Spread</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="Expires" content="-1" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
	<script src="js/uic/jquery-2.1.1.min.js" ></script>
	<script src="js/common.js?value=${applicationScope['version']}"></script>	
	<script type="text/javascript" src="js/login.js?value=${applicationScope['version']}"></script>
	<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
	
	<script>
	$(function(){
		$('#newPassword').val("");
		$('#confirmPassword').val("");
		$('#newPwdDiv').html();
		$('#conformPwdDiv').html();
	    var isChromium = window.chrome,
	    vendorName = window.navigator.vendor,
	    isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
	    isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;
	if(isChromium !== null 
	  && isChromium !== undefined 
	  && vendorName === "Google Inc." 
	  && isOpera == false 
	  && isIEedge == false) {
		$('#newPwdDiv').html('<input name="newPassword" id="newPassword"  type="text" class="textfield input"  placeholder="Your Password" autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" />');
		$('#confirmPassword').html('<input name="confirmPassword" id="confirmPassword"  type="text" class="textfield input" placeholder="Confirm Password" autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" />');
	} else { 
		$('#newPwdDiv').html('<input type="password" class="stealthy" tabindex="-1"><input name="newPassword" id="newPassword"  type="password" class="textfield input"  autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" /><input type="password" class="stealthy" tabindex="-1">');
		$('#confirmPassword').html('<input type="password" class="stealthy" tabindex="-1"><input name="confirmPassword" id="confirmPassword"  type="password" class="textfield input"  autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" /><input type="password" class="stealthy" tabindex="-1">');
	}
	});
	
	function showLoading(){
		console.info("in loading");
		$('#loadinglayer').css("display","block"); 
	}

	function hideLoading(){
		console.info("ldff");
		$('#loadinglayer').css("display","none");
	}
		
	function submitForm(){
		if ($.confirm("Your password setup request will now be initiated. Click OK to be directed to login page or Click Cancel to edit the password")){
			   showLoading();
			   $("#error-list").empty();
			   var processData=$('#changepasswordForm').serialize();
			   actionUrl="updatePassword.htm";   
			   successData=function(data)
			   {
			   	
					result = JSON.parse(data);
					/***** check result success *********************/

					$.ajaxSetup({
						async : false
					});

					if (result.hasOwnProperty('errorList')) {
						/* Here we split string by comma */
						var errorList=result['errorList'];
						if(errorList){
						var myarray = errorList.toString().split(',');
						 for(var i = 0; i < myarray.length; i++)
						{
							 $("#error-list").append('<li>'+myarray[i]+'</li>');
						}
					}
						$('#newPassword').val('');	
						$("#confirmPassword").val('');
						$("#error-list").show();
						$("#succeschangepwd").hide();
				   }
					if(result['flag']){
						$('#newPassword').val('');	
						$("#confirmPassword").val('');
						 window.location.href = "login.htm?error=6";
					}
				   
			   	hideLoading();

			   };
			   errorData=function(data)
			   {
			   	$.alert("Fail="+data);
			   	hideLoading();
			   };
			   console.info("--------Value Validated-------");
			   retDataType="html";
			   callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
			 }
	}
	</script>
	
<style type="text/css">
label{color:#000 !important}
.loginbg1{height:100%;}
 .stealthy {
  left: 0;
  margin: 0;
  max-height: 1px;
  max-width: 1px;
  opacity: 0;
  outline: none;
  overflow: hidden;
  pointer-events: none;
  position: absolute;
  top: 0;
  z-index: -1;
}

input#newPassword { -webkit-text-security: disc; }
input#confirmPassword { -webkit-text-security: disc; }
</style>

	
</head>
<body>



<header class="loginHeader rmDiv" style="height:60px !important">
	<div class="header-wpr main-doc-width main_min_width">
		<div style="width:100%; margin:0px;">
	<a href="javascript:void(0)" onclick="setLocationHref('welcome.htm')"><div class="logo_wpr"></div></a>
	<div class="financial bdr-right-gray"><h3 style="font-size:19px;  color:#f7931d; font-weight:normal; text-transform:uppercase; margin:0px; padding:16px 0 0 5px;">Financial Spreading</h3></div>
	</div>				
	</div>
	<div class="clr"></div>
</header>
<section class="loginbg1 rmDiv" style="margin-top:60px;">
			<c:if test="${not empty errors}">
					<div class="error_message">
						<c:forEach items="${errors}" var="error">
							<c:out value='${error}'/>
							<br/>		
						</c:forEach>
					</div>
			  </c:if>
				<c:if test="${empty errors}">
					<div class="error_message" style="visibility:hidden">Error</div>
				</c:if>
	      <form id="changepasswordForm" method="post" autocomplete="off">
	      <div id="succeschangepwd" style="color:red; font-weight: bold; display: none; text-align:center">You have been successfully changed your password please <a href="logout.htm">click here</a> to login. </div>
          <div style="text-align:center"><ul id="error-list" style="display: none; color:#ff0000;"></ul></div>
        	<div class="login-container" style="position:fixed; left:500px; top:120px;">
			<div class="login-bg1" style="height:350px;">
			<div class="login-title bg-green">
			<h3>Change Password</h3>
			</div>
			<div class="clear"></div>
			<div class="login-body">
			<table width="100%"  cellpadding="0" cellspacing="0" border="0" >
			<tr>
			<td><label class="label">User Name:</label></td>
			<tr>
			<td><input type="text" name="userName" id="userName" class="input" readonly="true" value="${logingId}"/></td>
			</tr>
			<tr>
			<td><label class="label">Password:</label></td>
			</tr>
			<tr>
			<td>
			<div id="newPwdDiv"></div>
<!-- 				<input type="password" class="stealthy input" tabindex="-1">
                <input name="newPassword" id="newPassword"  type="password" class="textfield input" placeholder="Your Password" autocomplete="off" readonly onfocus="this.removeAttribute('readonly');"/>
                <input type="password" class="stealthy input" tabindex="-1"> -->
			</td>
			</tr>
			
			<tr>
			<td><label class="label">Confirm Password:</label></td>
			</tr>
			<tr>
			<td>
			<div id="conformPwdDiv"></div>
				<!-- <input type="password" class="stealthy input" tabindex="-1">
                <input name="confirmPassword" id="confirmPassword"  type="password" class="textfield input" placeholder="Confirm Password" autocomplete="off" readonly onfocus="this.removeAttribute('readonly');"/>
                <input type="password" class="stealthy input" tabindex="-1"> -->
			</td>
			</tr>
			<tr>
			<td>
			 <input type="hidden" name="userId" id="userId" value="${userId}"/>
            <input type="hidden" name="activationId" id="activationId" value="${activationId}"/>
              <input type="hidden" name="keynode3" id="keynode3" value="${usermgntForm.keynode3}"/>
			</td>
			</tr>
			<tr>
			<td>
			<div style="margin:0px 10px 10px 10px; font-size:11px;">Password length should be in between 8 to 15 characters containing at least 1 upper case, 1 lower case, 1 digit and 1 special character</div>
             <div  style="text-align:center; margin:30px 0 0 0 "><a href="#" class="btn btn-info" onclick="submitForm()">SUBMIT</a></div>
			</td>
			</tr>
			</table>
			</div>
			</div>
			</div>
			 <div id="loadinglayer"></div>
			</form>
		</section>
		
		<footer>	
			<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include>
			</div> 
        </footer>
		
</body>
</html>
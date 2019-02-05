<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Change Password</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<!-- <script src="js/uic/jquery-2.1.1.min.js" ></script> -->
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
<style>

.label{color:#333 !important}
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
input#oldPassword { -webkit-text-security: disc; }
#myAlert div.modal-dialog {
    width: 30%;
    margin-top: 15%;
}
#myAlert div.modal-content {
    border-radius: 8px !important;
}
</style>	
<script>

$(function(){
	$('#newPassword').val("");
	$('#confirmPassword').val("");
	$('#oldPassword').val("");
	$('#newPwdDiv').html();
	$('#conformPwdDiv').html();
	$('#oldPwdDiv').html();
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
	$('#conformPwdDiv').html('<input name="confirmPassword" id="confirmPassword"  type="text" class="textfield input" placeholder="Confirm Password" autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" />');
	$('#oldPwdDiv').html('<input name="oldPassword" id="oldPassword"  type="text" class="textfield input" placeholder="Old Password" autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" />');
	
} else { 
	$('#newPwdDiv').html('<input type="password" class="stealthy" tabindex="-1"><input name="newPassword" id="newPassword"  type="password" class="textfield input"  autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" /><input type="password" class="stealthy" tabindex="-1">');
	$('#conformPwdDiv').html('<input type="password" class="stealthy" tabindex="-1"><input name="confirmPassword" id="confirmPassword"  type="password" class="textfield input"  autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" /><input type="password" class="stealthy" tabindex="-1">');
	$('#oldPwdDiv').html('<input type="password" class="stealthy" tabindex="-1"><input name="oldPassword" id="oldPassword"  type="password" class="textfield input"  autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" /><input type="password" class="stealthy" tabindex="-1">');
}
});

function showLoading(){
	$('#loadinglayer').css("display","block"); 
}

function hideLoading(){
	$('#loadinglayer').css("display","none");
}
	
function resetValues(){
	$("#oldPassword").val("");
	$("#newPassword").val("");
	$("#confirmPassword").val("");
}
function submitPassword(){
     var  userName =  $("#userName").val().trim();	
     var  oldPwd =  $("#oldPassword").val().trim();	 
	 var  newPwd =   $("#newPassword").val().trim();
	 var cnfmpwd =  $("#confirmPassword").val().trim();

	 if(userName!=""){
		 
		 if(oldPwd==""){
			 $.alert("Please enter old Password");	 
		return false;
		 }else if(newPwd==""){
			 $.alert("Please enter new Password");
			 return false;
		 }else if(cnfmpwd==""){
			 $.alert("Please enter confirm password");
			 return false;
		 }
	 }
	 if(newPwd!=cnfmpwd){
		 $.alert("New Password and Confirm password entered do not match ");
		 return false;
	 }
	 if(newPwd.length < 8 || newPwd.length > 15 ){
		 $.alert("Password length should be atleast of 8 -15 characters ");
      return false;
	 }
	
	 var CharArray = newPwd.split(" ");
     if (CharArray.length > 1) {
    	 $.alert("Password should not have any spaces in between");
         return false;
     }
	 if(!/\d/.test(newPwd)){
		 $.alert("Password should contain at least one digit");
		 return false;
	 }
     if(!/[a-z]/.test(newPwd)){
    	 $.alert("Password should contain at least one lower case");
    	 return false;
     }
     if(!/[A-Z]/.test(newPwd)){
    	 $.alert("Password should contain at least one upper case");
    	 return false;
     } 
     if (!/[!@#$_]/.test(newPwd)) {
    	 $.alert("Password should contain atleast 1 Special character");
    	 return false;
     } 
    /*  if (/^[a-zA-Z0-9!@#$_]/.test(newPwd)) {
    	 $.alert('allowed special characters only ! or @ or # or $');
    	 return false;
     } */
    $('#alertText').text('');
    var url="changePassword.htm",
     url=insertParam(url);
		showLoading();
	   $.ajax({
			type: "POST",  
			url: url,
			cache: true,
			dataType : "text",
			 data: $('#changePasswordForm').serialize(),
			success: function(html){
				hideLoading();
		 $('#alertText').text(html);
	     $('#myAlert').modal('show');
			},error: function(html) {
				$.alert(html);	
				hideLoading();
			}
		});   

}


</script>
</head>
<body>
  <section class="loginbg1 rmDiv" style="margin-top:70px;">
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
	       <form name="changePasswordForm" id="changePasswordForm" autocomplete="off" style="height:100%">
        	<div class="login-container">
			<div class="login-bg1">
			<div class="login-title bg-green">
			<h3>Change Password</h3>
			</div>
			<div class="clear"></div>
			<div class="login-body">
			<table width="100%"  cellpadding="0" cellspacing="0" border="0" >
			<tr>
			<td><label class="label">User Name:</label></td>
			<tr>
			<td><input type="hidden" name="userId" id="userId" class="input"  readonly="readonly"  value="${user.userId}"/></td>
			</tr>
			
			<tr>
			<td><input type="text" name="userName" id="userName" class="input"  readonly="readonly"  value="${user.login}"/></td>
			</tr>
			<tr>
			<td><label class="label">Old Password:</label></td>
			</tr>
			<tr>
			<td>
			<div id="oldPwdDiv"></div>
				<!-- <input type="password" class="stealthy" tabindex="-1">
				<input name="oldPassword" id="oldPassword"  type="password" class="input" id="oldPassword" autocomplete="off" readonly onfocus="this.removeAttribute('readonly');"/>
				<input type="password" class="stealthy" tabindex="-1"> -->
			</td>
			</tr>
			<tr>
			<td><label class="label">New Password:</label></td>
			</tr>
			<tr>
			<td>
				<div id="newPwdDiv"></div>
				<!-- <input type="password" class="stealthy" tabindex="-1">
				<input name="newPassword" id="newPassword"  type="password" class="input" autocomplete="off" readonly onfocus="this.removeAttribute('readonly');"/>
				<input type="password" class="stealthy" tabindex="-1"> -->
			</td>
			</tr>
			<tr>
			<td><label class="label">Confirm Password:</label></td>
			</tr>
			<tr>
			<td>
			<div id="conformPwdDiv"></div>
				<!-- <input type="password" class="stealthy" tabindex="-1">
				<input name="confirmPassword" id="confirmPassword"  type="password" class="input" autocomplete="off" readonly onfocus="this.removeAttribute('readonly');"/>
				<input type="password" class="stealthy" tabindex="-1"> -->
			</td>
			</tr>
			<tr>
			<td align="right">
			<span><input type="button" class="btn btn-info" onclick="submitPassword();"  value="Submit" style="margin:15px 5px 15px 0"/></span>
			<span><input type="button" class="btn btn-info" onclick="resetValues();"  value="Reset" style="margin:0 8px 0 0"/></span>
			</td>
			</tr>
			</table>
			</div>
			</div>
			</div>
			<!-- alert Modal -->
			<div id="myAlert" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">      
			      <div class="modal-body">
			        <p id="alertText"></p>
			        <div class="text-right"><button type="button" class="btn btn-default" onclick="window.location.href='./logout.htm'">Ok</button></div>
			      </div>
			    </div>
			  </div>
			</div>		
			<!-- close alert Modal -->
		  <div id="loadinglayer"></div>
			</form>
			

			
		</section>

		<footer style="position:fixed; bottom:0px;">
			<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include></div>
		</footer>

	 
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.security.SecureRandom,java.util.Random" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>Live Spread</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="Expires" content="-1" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/commonCSS/custom-style${applicationScope['cssType']}.css?value=${applicationScope['version']}">
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/login-style_${applicationScope['cssType']}.css?value=${applicationScope['version']}">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans" />
	<script src="js/uic/jquery-2.1.1.min.js" ></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
    <script src="js/common.js?value=${applicationScope['version']}"></script>
	<script src="js/login.js?value=${applicationScope['version']}"></script>
	<script type="text/javascript">
	var url = window.location.href;
	if(url.indexOf('login.htm') == -1){
	  window.location.href = "login.htm";
	}
	</script>
	<script>
	$(function(){
		$('#j_username').val("");
		$('#j_password').val("");
		$('#j_username').focus();
		$('#pwdDiv').html();
	    var isChromium = window.chrome,
	    vendorName = window.navigator.vendor,
	    isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
	    isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;
	if(isChromium !== null 
	  && isChromium !== undefined 
	  && vendorName === "Google Inc." 
	  && isOpera == false 
	  && isIEedge == false) {
		$('#pwdDiv').html('<input name="j_password" id="j_password"  type="text" class="textfield form-control"  autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" />');
	} else { 
		$('#pwdDiv').html('<input type="password" class="stealthy" tabindex="-1"><input name="j_password" id="j_password"  type="password" class="textfield form-control"  autocomplete="off" readonly onfocus="this.removeAttribute(\'readonly\');" /><input type="password" class="stealthy" tabindex="-1">');
	}
		
		
		
		$('#loginForm input').bind('keypress', function(e) {
			var code = e.keyCode || e.which;
			 if(code == 13) { //Enter keycode
				 submitLoginForm();
			 	}
		 	});
		});
		
		
	function submitLoginForm() {
		if($('#j_password').val() == "" || $('#j_username').val() == ""){
			$('.error_message').show().text('The username and password are incorrect.');
		} else {
			$('.error_message').hide();
			$('#loginForm').submit();
		}
	}
	
	//forget password
	function forgetPwd(){	
		$('.error_message').hide();
		var	urlFpd=insertParam("forgetPwd.htm?");
		var parametersDynamic="";
			 ajaxCallforAll(urlFpd,parametersDynamic);
	}
	
	</script>
<style>
input:-webkit-autofill{-webkit-box-shadow: 0 0 0 1000px white inset !important;}
input[readonly] {background-color: white !important;} 
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
input#j_password { -webkit-text-security: disc; }
</style>
</head>
<body>

<div class="modal fade" id="alert_login_popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
      </div>
      <div class="modal-body" style="padding:20px 20px 20px 20px !important">
        <div style="margin:-1px 46px; font-size:14px; color:#777777; font-family:open sans; text-align: center;" id="errorMessageDivId"></div>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='welcome.htm?error=multiple'">Confirm</button>
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='./logout.htm'">Cancel</button>
      </div>
    </div>
  </div>
</div>
	<%
		Random r = null;
		try {
			r = SecureRandom.getInstance("SHA1PRNG");
		} catch (Exception e) {
		}
		double randNumber1 = r.nextDouble() * 40 + 1;
		double randNumber2 = r.nextDouble() * 65 + 1;
		double randNumber3 = r.nextDouble() * 99 + 1;
		int ranInt1 = (int) randNumber1;
		int ranInt2 = (int) randNumber2;
		int ranInt3 = (int) randNumber3;
	%>
<input type="hidden" id="R1" value="<%= ranInt1%>">
<input type="hidden" id="R2" value="<%= ranInt2%>">
<input type="hidden" id="R3" value="<%= ranInt3%>">
<input type="hidden" id="R4" value="${CurrentTimeStamp}">
<form id="loginForm" method="post" action="j_spring_security_check" autocomplete="off" onsubmit="javascript: return encryptPassword();">
<section class="login-block">
    <div class="container">
		<div class="row">
			<div class="col-md-9 banner-sec">
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="images/login-bg-new.jpg" alt="First slide" height="562px">
					</div>
				</div>	   
			</div>
		</div>
		<div class="col-md-3 login-sec">
		<div class="login-logo"></div>
		    <form class="login-form">
  <div class="form-group mar-top40 mar-t80 mar-top20">
		<label class="control-label ft-bold" for="prependedtext">User Name:</label>
		<div class="input-group wdt">
			<input type="text" name="j_username"  id="j_username"  class="textfield form-control"  autocomplete="off" />
		</div>
	</div>
	
  <div class="form-group">
		<label class="control-label ft-bold mar-top10 mar-top18" for="prependedtext">Password:</label>
		<div class="input-group wdt">
		<div id="pwdDiv"></div>
		</div>
	</div>
  
  
    <div class="form-check">
    <span class="pull-right"><a href="#" class="btn btn-primary" onclick="submitLoginForm();" style="cursor:pointer">Login</a></span>
	<!-- <span class="pull-left mar-top8 forgot"><a href="#" onclick="setLocationHref('forgotPwd.htm','');">Forgot Password?</a></span> -->
  	</div>
  	
  	<div class="error-msg mar-top80">
  	<c:if test="${not empty errors}">
					<c:choose>
						<c:when test="${errorNo eq 6}">
							<div class="error_message"
								style="width: 100%; margin: 10px auto; padding-left: 150px; color: green; font-weight: bold; font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">
								<c:forEach items="${errors}" var="error">
									<c:out value='${error}' />
									<br />
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${errorNo eq -2}">
						<script>
						<c:forEach items="${errors}" var="error" >
						var error =  '<c:out value="${error}"/>';
						</c:forEach>
						$('#alert_login_popup').modal('show');
						$('#errorMessageDivId').text(error);
						</script>
						</c:when>
						<c:otherwise>
							<div class="error_message err_msg1">
								<c:forEach items="${errors}" var="error">
									<c:out value='${error}' />
									<br />
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${empty errors}">
					<div class="error_message err_msg"></div>
				</c:if>
  	</div>
  
</form>

		
	</div>
</div>
</div>
</section>
</form> 
<c:if test="${applicationScope['clientSpecificHeaderFooter'] eq 'Y'}">
		<footer>
			<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include></div> 
        </footer>
</c:if>
		
</body>
</html>
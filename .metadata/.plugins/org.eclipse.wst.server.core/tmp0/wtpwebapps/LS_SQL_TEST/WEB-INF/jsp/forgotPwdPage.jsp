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
	<link rel="stylesheet" type="text/css" href="css/commonCSS/custom-style.css?value=${applicationScope['version']}">
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/login-style_${applicationScope['cssType']}.css?value=${applicationScope['version']}">
	<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
	<script>
	$(document).ready(function(){
	$('#emailName').keyup(function(){
	var regex = new RegExp(/[^A-Za-z0-9_@.-]/g);
	var containsAllowCharacters = this.value.match(regex);
	if (containsAllowCharacters)
	this.value = this.value.replace(regex, '');
	});
	});
	
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
	
function submitForm(){
	var	emailName=$('#emailName').val();
	if ($.trim(emailName).length == 0) {
		$.alert('Please enter valid email address.');
        e.preventDefault();
    }
	else if ($.trim(emailName).length > 50) 
		{
			$.alert('Please enter valid email address with 50 character limit.');
        	e.preventDefault();
		}
    if (validateEmail(emailName)) {
		 var url = "forgotPwdTest.htm";
		 var parametersTokenVal="emailName="+encodeURIComponent(emailName.trim());
			var urlAdmin=insertParam(url);
				 showLoading();
				$.ajax({
					 type: "POST",  
					   url: urlAdmin,
					   data:parametersTokenVal,
					 success: function(data){
						 console.log(data);
						  $("#successVal").html(data);
						  $("#email").hide();
						  $("#submit").hide();
						  $("#cancel").val("BACK TO LOGIN");
							hideLoading();
					},error: function(data) {
						$.alert("Error occured while forget password. Please try again.");
						hideLoading();
					}	
				}); 
    }
    else {
    	$.alert('Invalid Email Address');
        e.preventDefault();
    }
}
	
	
	function validateEmail(sEmail) {
	    var filter = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,15})?$/;
	    if (filter.test(sEmail)) {
	        return true;
	    }
	    else {
	        return false;
	    }
	}
	</script>
<style type="text/css">
.pad-top50 {padding-top: 50px !important;}
</style>
</head>
<body>
<section class="login-block rmDiv">
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
			  <div class="form-group mar-top40">
					<div id="email">
                	<div class="changePwd"><h4>Change Password</h4></div>
                	<label style="font-size:14px;">Let's find your account:</label>
                    <input name="emailName" id="emailName"  type="text" class="textfield form-control" placeholder="Enter your email" maxlength="50" />
              		</div>
				</div>
   					<div class="pull-right">
						<input type="button"  id="submit" class="btn btn-primary" style="text-align:center !important"  value="CONTINUE" onclick="submitForm()">
						<input type="button"  id="cancel" class="btn btn-primary" style="text-align:center !important"  value="CANCEL" onclick="setLocationHref('logout.htm','')">
					</div>
					
					
	<div id="successVal" class="error-msg mar-top80 pad-top50"></div>
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
				<div>
				<c:if test="${applicationScope['clientSpecificHeaderFooter'] eq 'Y'}">
					<footer>
					<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include>
					</div> 
				    </footer>
			     </c:if>
			     </div>
  	</div>
</form>
</div>
</div>
</div>
</section>	
</body>
</html>
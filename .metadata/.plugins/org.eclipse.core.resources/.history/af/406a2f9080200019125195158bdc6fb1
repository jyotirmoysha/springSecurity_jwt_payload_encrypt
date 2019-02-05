
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
	
</head>
<body>

	
		<header class="loginHeader">
			<div class="header-wpr main-doc-width main_min_width">
				<div class="logo_wpr"></div>				
			</div>
			<div class="clr"></div>

		</header>
		<section class="loginbg" style="height:600px !important">
		<div style="width:15%; margin:0 auto; color:#ff0000; padding:250px 0 0 0;  font-weight:bold; font-size:13px;">
		
			<c:choose>
				<c:when test="${status eq 'activationExpire'}">
					Your activation period is expired. Please regenerate the activation link.
				</c:when>
				<c:otherwise>
					Request id is invalid.
				</c:otherwise>
			</c:choose> 		
		</div>
		</section>
		<footer style="position:fixed; bottom:0px">
		
	<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include>
	</div> 
        </footer>
		
</body>
</html>
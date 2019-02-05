<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" /><link rel="stylesheet" type="text/css" href="css/style${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
	<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.custom.css" />
	<script src="js/uic/jquery-2.1.1.min.js" ></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery/jquery-migrate.min.js"></script>
	<script src="js/jquery/jquery-ui.custom.min.js"></script>
    <script src="js/common.js?value=${applicationScope['version']}"></script>
<body>
<header>
			<div class="header-wpr main-doc-width main_min_width ">
				<a href="workqueue.htm?tableIds=<c:out value='${tableName}'/>&userId=<c:out value='${user.userId}'/>&userGroupId=<c:out value='${user.userGroupId}'/>"><div class="logo_wpr"></div></a>
				<div class="user_details">
					<ul>
						<li class="user_wpr"> Welcome <c:out value="${user.login}" /></li>
						<li class="logout_wpr">Logged In Since 00h.00m | <a href="logout.htm">Logout</a></li>
					</ul>
				</div>
			</div>
			<div class="clr"></div>
			<nav>
				<div class="menu_wpr main-doc-width main_min_width">
					<ul>
						<li> <a href="javascript:void(0);" class="wq active"> <span>Work Queue </span></a></li>
						<li> <a href="customer_information.htm" class="du"> <span>Document Upload </span></a></li>
						<li> <a href="#" class="du"> <span>Normalization Template </span></a></li>
						<li> <a href="#" class="du"> <span>Normalization Rules </span></a></li>
<!-- 						<li> <a href="report.htm" class="reprt"> <span>Reports </span></a></li>
 -->					</ul>
				</div>
			</nav>
</header>
</body>
</html>
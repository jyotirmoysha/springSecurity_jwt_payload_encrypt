<!DOCTYPE html>
<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.security.SecureRandom,java.util.Random"%>
<title>UIC</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/uic/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/uic/jquery-2.1.1.min.js" ></script>
<script src="${pageContext.request.contextPath}/js/uic/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/uic/login.js"></script>
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/css/uic/login.css" />

</head>	
		<%
	Random r=null;
		try {
		    r = SecureRandom.getInstance("SHA1PRNG");
		} catch(Exception e) {
		}
		
		double randNumber1 =  r.nextDouble() * 40 + 1;
		double randNumber2 = r.nextDouble() * 65 + 1;
		double randNumber3 =  r.nextDouble() * 99 + 1;
		int ranInt1 = (int)randNumber1;
		int ranInt2 = (int)randNumber2;
		int ranInt3 = (int)randNumber3;          
		%>
	
		<input type="hidden" id="R1" value="<%=ranInt1%>">
		<input type="hidden" id="R2" value="<%=ranInt2%>">
		<input type="hidden" id="R3" value="<%=ranInt3%>">
		
		
		
		<div class="LoginContainer">
			
			
		
			<form action="<c:url value='j_spring_security_check' />" method='POST' id="loginForm" autocomplete="off"
				onsubmit="return encryptPassword();">
				<div class="error_message">			
				</div>
				<div class="LoginTitle">User Login</div>
				<div class="LoginLabelContainer">	
				
					<c:if test="${not empty error}">				
					<div class="error">${error}</div>
					</c:if>
					<c:if test="${not empty message}">
					<div class="msg">${message}</div>
					</c:if>				

					<div class="LoginTextLabel">Username</div>
					<div class="LoginTextBox">
						<input type="text" name="j_username" id="j_username"
							autocomplete="off">
					</div>


					<div class="LoginTextLabel">Password</div>
					<div class="LoginTextBox">


						<input type="password" name="j_password" id="j_password">
					</div>

					<div class="LoginTextLabel"></div>
					<div class="LoginRemember">
						<span> <input type="checkbox" />
						</span> <span>Remember me</span>
					</div>
					<div class="LoginForgotPwd">forgot password</div>


					<div class="LoginBtn">
						<input type="submit" class="btn btn-lg btn-info" value="Sign In">
					</div>
				</div>
			</form>
		</div>

	</html>	
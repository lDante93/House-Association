<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
<link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css"
	rel="stylesheet">
<link href="http://getbootstrap.com/dist/css/bootstrap.css"
	rel="stylesheet">

<link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css"
	rel="stylesheet">
<title>Logowanie do Panelu Administracyjnego</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 500px;
	padding: 25px;
	margin: 100px auto;
	background: #337AB7;
	-webkit-border-radius: 25px;
	-moz-border-radius: 2px;
	border: 1px solid black;
	color: white;
}

input, select, textarea {
	color: #000;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>


	&nbsp;&nbsp;
	<a href="/spoldzielnia" class="btn btn-primary">Strona Główna</a>
	<div id="login-box">

		<h3>Logowanie</h3>
		<br>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
			action="<c:url value='j_spring_security_check' />" method='POST'>

			<table>
				<tr>
					<td height="40">Login:&nbsp;&nbsp;</td>
					<td><input type='text' name='login' value=''></td>
				</tr>
				<tr>
					<td height="40">Hasło:&nbsp;&nbsp;</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td colspan='2' height="40"><input name="submit"
						class="btn btn-default" type="submit" value="Dalej" /></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>

</body>
</html>
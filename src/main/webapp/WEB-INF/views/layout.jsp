<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://getbootstrap.com/dist/css/bootstrap.css"
	rel="stylesheet">
<title><tiles:insertAttribute name="title" /></title>
<link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css"
	rel="stylesheet">
</head>
<body>

	<div class="container">

		<div class="jumbotron">
			<h1 class="text-muted">Spółdzielnia Mieszkaniowa</h1>
			<h2 class="text-muted">Panel Administracyjny</h2>

		</div>

		<div class="row">


			<c:url value="/j_spring_security_logout" var="logoutUrl" />

			<!-- csrt for log out-->
			<form action="${logoutUrl}" method="post" id="logoutForm">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>

			<script>
				function formSubmit() {
					document.getElementById("logoutForm").submit();
				}
			</script>

			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<h3>
					Użytkownik : ${pageContext.request.userPrincipal.name} | <a
						href="javascript:formSubmit()"> Wyloguj</a> <br>

				</h3>
			</c:if>
			<h2>
				<tiles:insertAttribute name="title" />
			</h2>

			<tiles:insertAttribute name="links" />
			<tiles:insertAttribute name="body" />
		</div>

		<div class="footer">
			<tiles:insertAttribute name="footer" />
		</div>

	</div>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Logowanie do Spółdzielni</title>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/form-elements.css">
<link rel="stylesheet" href="resources/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="resources/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="resources/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="resources/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="resources/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="resources/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>
	&nbsp;&nbsp;
	<a href="/spoldzielnia" class="btn-default"><spring:message
			code="label.returntohomepage" /></a>
	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">

						<div class="description"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div>
								<span style="float: right"> <a href="?lang=pl"><img
										src="resources/img/flags/polandFlag.jpg"></a> | <a
									href="?lang=en"><img
										src="resources/img/flags/britishFlag.jpg"></a> | <a
									href="?lang=de"><img
										src="resources/img/flags/germanyFlag.jpg"></a>
								</span>
							</div>
							<div class="form-top-left">
								<h3>

									<spring:message code="label.register" />

								</h3>
								<h4>
									<spring:message code="label.enterdata" />
								</h4>

							</div>

							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form:form method="post" action="registerNewUser.html"
								commandName="user" class="login-form">
								<tr>
									<td><form:hidden path="id" />
								</tr>
								<div class="form-group" style="color: black">

									<spring:message code="label.firstname" />
									<form:label class="sr-only" path="firstname"
										for="form-firstname"></form:label>
									<form:input type="text" path="firstname" name="form-firstname"
										class="form-username form-control" id="form-firstname" />
									<form:errors path="firstname" />
								</div>
								<div class="form-group" style="color: black">
									<spring:message code="label.lastname" />
									<form:label class="sr-only" path="lastname" for="form-lastname"></form:label>
									<form:input type="text" path="lastname" name="form-lastname"
										class="form-lastname form-control" id="form-lastname" />
									<form:errors path="lastname" />
								</div>
								<div class="form-group" style="color: black">
									<spring:message code="label.email" />
									<form:label class="sr-only" path="email" for="form-email"></form:label>
									<form:input type="text" path="email" name="form-email"
										class="form-email form-control" id="form-email" />
									<form:errors path="email" />
								</div>
								<div class="form-group" style="color: black">
									<spring:message code="label.telephone" />
									<form:label class="sr-only" path="telephone"
										for="form-telephone"></form:label>
									<form:input type="text" path="telephone" name="form-telephone"
										class="form-telephone form-control" id="form-telephone" />
									<form:errors path="telephone" />
								</div>
	<div class="form-group" style="color: black">
									<spring:message code="label.amountOfLocators" />
									<form:label class="sr-only" path="amountOfLocators"
										for="form-amountOfLocators"></form:label>
									<form:input type="text" path="amountOfLocators" name="form-amountOfLocators"
										class="form-amountOfLocators form-control" id="form-amountOfLocators" />
									<form:errors path="amountOfLocators" />
								</div>


								<table style="color: #888888">
									<tr>
										<td><font color="black"><spring:message
													code="label.building" /></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><form:select path="building" onchange="submit()">

												<c:forEach items="${buildingList}" var="building">
													<option value="${building.id}"
														${building.id == selectedBuilding ? 'selected="selected"' : ''}>${building.number}</option>
												</c:forEach>
											</form:select></td>
										<td><form:errors path="building" /></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

										
										<td>
										<td><font color="black"><spring:message
													code="label.apartment" /></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><form:select path="apartment">

												<c:forEach items="${apartmentList}" var="apartment">
													<option value="${apartment.id}"
														${apartment.id == selectedApartment ? 'selected="selected"' : ''}>${apartment.number}</option>
												</c:forEach>
											</form:select></td>
										<td><form:errors path="apartment" /></td>

									</tr>

								</table>



								<div class="form-group" style="color: black">
									<spring:message code="label.login" />
									<form:label class="sr-only" path="login" for="form-login"></form:label>
									<form:input type="text" path="login" name="form-login"
										class="form-login form-control" id="form-login" />
									<form:errors path="login" />
								</div>

					<td><form:input type="hidden" path="password" value="a"/></td>



								<c:if test="${user.id==0}">
									<input type="submit" class="btn" style="color: black"
										value="<spring:message code="label.register"/>" />
								</c:if>



							</form:form>



						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 social-login"></div>
				</div>
			</div>
		</div>

	</div>


	<!-- Javascript -->
	<script src="resources/js/jquery-1.11.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.backstretch.min.js"></script>
	<script src="resources/js/scripts.js"></script>


</body>

</html>
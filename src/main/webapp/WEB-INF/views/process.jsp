
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>


	<div class="thumbnail">

		<div class="caption">
			<%
				String remoteAddr = request.getRemoteAddr();
				ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
				reCaptcha.setPrivateKey("6LcfixUUAAAAAMmGxaG6l5QiGzAWxCsYqc_cAuCM");

				String challenge = request.getParameter("recaptcha_challenge_field");
				String uresponse = request.getParameter("recaptcha_response_field");
				ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

				if (reCaptchaResponse.isValid()) {
					String responseMessage = "Kod z obrazka jest poprawny.";
					out.print(responseMessage);
					pageContext.setAttribute("resp", responseMessage);

				} else {
					String responseMessage = "Niepoprawny kod z obrazka.";
					out.print(responseMessage);
					pageContext.setAttribute("resp", responseMessage);
				}
			%>


			<c:if test="${resp=='Niepoprawny kod z obrazka.'}">
				<a href=" <spring:url value="Payment.html" /> "
					class="btn btn-primary"> Powrót </a>
			</c:if>
			<c:if test="${resp=='Kod z obrazka jest poprawny.'}">
				<form:form method="post" action="makePayment.html"
					commandName="charge">
					<input type="submit" value="Dokonaj płatności"
						class="btn btn-success" />

				</form:form>
			</c:if>
			<br> <br>
		</div>
	</div>
</body>
</html>
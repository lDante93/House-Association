 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<html>
<head>

</head>
<body>




	<div class="thumbnail">

		<div class="caption">
			
		



			
<center>
			<form action="process.html" method="GET">
				<%
					//ReCaptcha c = ReCaptchaFactory.newReCaptcha("your_public_key", "your_private_key", false);
					ReCaptcha captcha = ReCaptchaFactory.newReCaptcha("6LcfixUUAAAAANCRMuGtixPOeCBhzRy6flaV-e3l",
							"6LcfixUUAAAAAMmGxaG6l5QiGzAWxCsYqc_cAuCM", false);
					out.print(captcha.createRecaptchaHtml(null, null));
				%>
				<input type="submit" value="Akceptuj" class="btn btn-success" />
			</form>
</center>


		</div>
	</div>






</body>
</html> 


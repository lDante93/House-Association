<%-- <%-- <%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
 
<html>
<body>
<form action="process.jsp" method="post">
        <%
          //ReCaptcha c = ReCaptchaFactory.newReCaptcha("your_public_key", "your_private_key", false);
          ReCaptcha captcha = ReCaptchaFactory.newReCaptcha("6LcfixUUAAAAANCRMuGtixPOeCBhzRy6flaV-e3l", "6LcfixUUAAAAAMmGxaG6l5QiGzAWxCsYqc_cAuCM", false);
          out.print(captcha.createRecaptchaHtml(null, null));
        %>
        <input type="submit" value="submit" />
    </form>
</body>
</html> --%> 
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login Success Page</title>
</head>
<body>
<h3>Hi Pankaj, Login successful.</h3>
<a href="login.html">Login Page</a>
</body>
</html>
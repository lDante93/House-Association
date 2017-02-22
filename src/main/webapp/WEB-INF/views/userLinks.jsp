<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="caption">




	<table style="width: 75%">
		<tr>
			<td><a href=" <spring:url value="home.html" /> "
				class="btn btn-primary"> <span class="glyphicon glyphicon-user" /></span>
					Panel Użytkownika
			</a></td>

			<td><a href=" <spring:url value="charges.html" /> "
				class="btn btn-primary"> <span class="glyphicon glyphicon-usd" /></span>
					Ureguluj Rachunki
			</a></td>

			<td><a href=" <spring:url value="counter.html" /> "
				class="btn btn-primary"> <span
					class=" 	glyphicon glyphicon-list-alt" /></span> Zgłoś dane z liczników
			</a></td>



			<td><a href=" <spring:url value="editPassword.html" /> "
				class="btn btn-primary"> <span class="glyphicon glyphicon-cog" /></span>
					Zmień Hasło
			</a></td>

		</tr>
	</table>
</div>
<br>
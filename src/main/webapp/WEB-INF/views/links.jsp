<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="caption">




	<table style="width: 100%">
		<tr>
			<td><a href=" <spring:url value="management.html" /> "
				class="btn btn-primary"> <span class="glyphicon glyphicon-cog" /></span>
					Panel Administracyjny
			</a></td>

			<td><a href=" <spring:url value="apartment.html" /> "
				class="btn btn-primary"> <span class="glyphicon glyphicon-list" /></span>
					Zarządzaj Mieszkaniami
			</a></td>

			<td><a href=" <spring:url value="building.html" /> "
				class="btn btn-primary"> <span class="glyphicon glyphicon-home" /></span>
					Zarządzaj Budynkami
			</a></td>



			<td><a href=" <spring:url value="users.html" /> "
				class="btn btn-primary"> <span class="glyphicon glyphicon-user" /></span>
					Zarządzaj Użytkownikami
			</a></td>
	<td><a href=" <spring:url value="charges.html" /> "
				class="btn btn-primary"> <span class=" 	glyphicon glyphicon-euro" /></span>
					Zarządzaj Opłatami
			</a></td>
		</tr>
	</table>
</div>
<br>
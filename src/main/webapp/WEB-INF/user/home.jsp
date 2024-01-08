	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profil user</title>
</head>
<body>

<c:if test="${sessionScope.user ne null}">
    <h2>Profil de ${sessionScope.user.name}</h2>
    
    <p><strong>Nom:</strong> ${sessionScope.user.name}</p>
    <p><strong>Email:</strong> ${sessionScope.user.email}</p>
    <img src="${sessionScope.user.avatar}" alt="Avatar de ${sessionScope.user.name}" width="100" height="100">

</c:if>
	<form action="update_user" method="get">
		<input type="submit" value="update profil">
	</form>
	<form action="delete_user" method="post">
		<input type="hidden" name="id" value="${sessionScope.user.id}">
		<input type="submit" value="delete">
	</form>
	<form action="logout" method="post">
		<input type="submit" value="logout">
	</form>
	<form action="create_post" method="get">
		<input type="submit" value="poster  ">
	</form>
	
</body>
</html>

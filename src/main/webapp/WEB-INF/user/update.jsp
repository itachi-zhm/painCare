<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
</head>
<body>
	
    <h1>Update User Information</h1>
	<c:if test="${sessionScope.user ne null}">
    <form action="update_user" method="post" enctype="multipart/form-data">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="${sessionScope.user.name }" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${sessionScope.user.email }" required><br>

        <label for="birthDay">Birthday:</label>
        <input type="date" id="birthDay" name="birthDay" value="${sessionScope.user.birthDay }" required><br>

        <label for="avatar">Avatar :</label>
		<input name="avatar" type="file"  id="avatar" value="${sessionScope.user.avatar } placeholder="Avatar" accept="image/*">

        <input type="submit" value="Update">
    </form>
	</c:if>
</body>
</html>

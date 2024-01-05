<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
</head>
<body>

    <h2>User Registration</h2>

    <form action="register" method="post">

        <p><label for="username">Username:</label>
        <input type="text" id="username" name="username" required></p>


        <p><label for="email">Email:</label>
        <input type="email" id="email" name="email" required></p>

        <p><label for="password">Password:</label>
        <input type="password" id="password" name="password" required></p>

        <p><label for="password2">Confirm Password:</label>
        <input type="password" id="password2" name="password2" required></p>

        <%-- Afficher le message d'erreur s'il y en a un --%>
        <c:if test="${not empty requestScope.erreurMessage}">
            <p style="color: red;">${requestScope.erreurMessage}</p>
        </c:if>

        <p><input type="submit" value="Register"></p>
        
    </form>

</body>
</html>

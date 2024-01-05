<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
    <title>login</title>
</head>
<body>
    <h2>login</h2>

    <form action="login" method="post">
        <!-- Les champs du formulaire -->
        <p><label for="email">Email:</label>
        <input type="email" name="email" required></p>

        <p><label for="password">Mot de passe:</label>
        <input type="password" name="password" required></p>
        <%-- Afficher le message d'erreur s'il y en a un --%>
        <c:if test="${not empty requestScope.erreurMessage}">
            <p style="color: red;">${requestScope.erreurMessage}</p>
        </c:if>

        <p><input type="submit" value="login"></p>
    </form>
</body>
</html>
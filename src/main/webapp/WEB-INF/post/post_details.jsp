<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Détails du Post</title>
    <style>
        /* Ajoutez vos styles personnalisés ici */
        .post-details {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 20px;
        }
    </style>
</head>
<body>

<c:if test="${post ne null}">
    <div class="post-details">
        <h1>${post.title}</h1>
        <p>${post.description}</p>
        <p>Auteur: ${post.user_name}</p>
        <p>${post.id }</p>
        <img src="${post.image}" alt="Image du post">
        
        <!-- Ajoutez d'autres détails du post si nécessaire -->

        <hr>
    </div>
</c:if>

</body>
</html>

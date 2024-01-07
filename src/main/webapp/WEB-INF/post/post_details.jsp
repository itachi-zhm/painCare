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
        .comment-form {
            margin-top: 20px;
        }
        .comment {
            border: 1px solid #eee;
            padding: 5px;
            margin: 10px 0;
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

        <hr>

        <!-- Ajouter le formulaire de commentaire -->
        <form class="comment-form" action="create_comment" method="post">
            <label for="comment">Ajouter un commentaire :</label>
            <textarea id="comment" name="comment" rows="4" cols="50" required></textarea><br>
            <input type="hidden" name="post_id" value="${post.id}">
            <input type="submit" value="Ajouter Commentaire">
        </form>

        <!-- Afficher tous les commentaires -->
        <h2>Commentaires :</h2>
        <c:forEach var="comments" items="${comments}">
            <div class="comment">
                <p>${comments.user_name} a dit :</p>
                <p>${comments.content}</p>
            </div>
            <form action="delete_comment" method="post">

            	<input type="hidden" name="comment_id" value="${comments.id}">
            	<input type="hidden" name="post_id" value="${post.id}">
            	<input type="submit" value="delete">
            </from>
        </c:forEach>
    </div>
</c:if>

</body>
</html>

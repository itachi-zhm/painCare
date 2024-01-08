<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>D�tails du Post</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://use.fontawesome.com/f5ea91e308.js"></script>
    <link rel="stylesheet" href="./assets/css/postdetails.css" type="text/css">
    <style>
        /* Ajoutez vos styles personnalis�s ici */

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

<%@include file="/WEB-INF/navbar.jsp" %>
<c:if test="${post ne null}">
    <div class="cards">
        
		<div class="blog-card">
		  <div class="meta">
		    <div class="photo" style="background-image: url(${post.image})"></div>
		    <ul class="details">
		      <li class="author"><a href="#">Auteur: ${post.user_name}</a></li>
		      <li class="date">${post.title}</li>
		    </ul>
		  </div>
		  <div class="description">
		    <h1>${post.title}</h1>
		    <h2>Auteur: ${post.user_name}</h2>
		    <p> ${post.description}</p>
		  </div>
		</div>	
        <hr>

        <div class="comment-section">
    <h2>Ajouter un commentaire :</h2>
    <form class="comment-form" action="create_comment" method="post">
        <textarea id="comment" name="comment" placeholder="�crivez votre commentaire ici..." required></textarea>
        <input type="hidden" name="post_id" value="${post.id}">
        <button type="submit" class="submit-button">Publier</button>
    </form>
</div>
        <!-- Afficher tous les commentaires -->
        <h2>Commentaires :</h2>
<div class="comments-container">
    <c:forEach var="comment" items="${comments}">
        <div class="comment-card">
            <div class="comment-img"></div>
            <div class="comment-box">
                <div class="comment-content">
                    <p class="comment-author">${comment.user_name} said:</p>
                    <p class="comment-text">${comment.content}</p>
                </div>
                <form action="delete_comment" method="post" class="delete-comment-form">
                    <input type="hidden" name="comment_id" value="${comment.id}">
                    <input type="hidden" name="post_id" value="${post.id}">
                    <button type="submit" class="delete-button">delete</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>

</c:if>

</body>
</html>

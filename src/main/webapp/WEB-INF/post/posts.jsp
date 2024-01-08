<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Posts</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://use.fontawesome.com/f5ea91e308.js"></script>
    <link rel="stylesheet" href="./assets/css/posts.css" type="text/css">
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>

<h1 style="display: block; 
    text-align: center; 
    margin-top: 20px;">Liste des Posts</h1>
<form action="create_post" method="get">
    <input type="submit" value="Add Post" class="add-post-button">
</form>
<div class="cards">

<c:forEach var="post" items="${posts}">
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
    <form action="post_details" method="get">
    	<input type="hidden" name = "post_id" value="${post.id }">
    	<input type="submit" value="read more" class="buttondetails">
    </form>
  </div>
</div>
    <hr>
</c:forEach>
<script src="./assets/js/posts.js"></script>
</div>
</body>
</html>

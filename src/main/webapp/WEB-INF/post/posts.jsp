<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Posts</title>
</head>
<body>

<h1>Liste des Posts</h1>

<c:forEach var="post" items="${posts}">
    <div>
        <h2>${post.title}</h2>
        <p>${post.description}</p>
        <p>Auteur: ${post.user_name}</p>
        <p>${post.id }</p>
        <img src="${post.image}" alt="Image du post">
        
        
    </div>
    <form action="update_post" method="get">
    	<input type="hidden" name = "id" value="${post.id }">
    	<input type="submit" value="update">
    </form>
    <form action="delete_post" method="post">
    	<input type="hidden" name = "post_id" value="${post.id }">
    	<input type="submit" value="delete">
    </form>
    <form action="post_details" method="get">
    	<input type="hidden" name = "post_id" value="${post.id }">
    	<input type="submit" value="voir">
    </form>
    <hr>
</c:forEach>

</body>
</html>

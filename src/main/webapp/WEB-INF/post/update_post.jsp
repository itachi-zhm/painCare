<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier le Post</title>
</head>
<body>

<h1>Modifier le Post</h1>

<c:if test="${post ne null}">
    <form action="update_post" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${post.id}">
        
        <label for="title">Titre :</label>
        <input type="text" id="title" name="title" value="${post.title}" required><br>

        <label for="description">Description :</label>
        <textarea id="description" name="description" required>${post.description}</textarea><br>

        <label for="image">Image :</label>
        <input type="file" id="image" name="image" accept="image/*"><br>

        <img src="${post.image}" alt="Image actuelle" width="100" height="100"><br>

        <input type="submit" value="Enregistrer les modifications">
    </form>
</c:if>

</body>
</html>

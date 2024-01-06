<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Création de Post</title>
    <script>
        function previewImage() {
            var input = document.getElementById('image');
            var preview = document.getElementById('imagePreview');
            var file = input.files[0];
            var reader = new FileReader();

            reader.onload = function(e) {
                preview.src = e.target.result;
            };

            reader.readAsDataURL(file);
        }
    </script>
</head>
<body>

<h1>Création de Post</h1>

<form action="create_post" method="post" enctype="multipart/form-data">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" required><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" rows="4" required></textarea><br>

    <label for="image">Image:</label>
    <input type="file" id="image" name="image" accept="image/*" required onchange="previewImage()">
    <br>
    
    <img id="imagePreview" src="#" alt="Aperçu de l'image" style="max-width: 300px; max-height: 200px; display: none;">
    <br>

    <input type="submit" value="Créer Post">
</form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <link rel="stylesheet" type="text/css" href="./assets/css/update.css">
</head>
<body>
<div class="container">
    
    <h1>Update User Information</h1>
    <c:if test="${sessionScope.user ne null}">
    <form action="update_user" method="post" class="form" enctype="multipart/form-data">
        <input  class="input" type="text" id="username" name="username" value="${sessionScope.user.name }" required>
        <input  class="input" type="email" id="email" name="email" value="${sessionScope.user.email }" required>
        <input  class="input" type="date" id="birthDay" name="birthDay" value="${sessionScope.user.birthDay }" required>

         <div class="file-upload-wrapper">
        <input name="avatar" type="file" id="avatar" class="input-file" accept="image/*" hidden>
        <label for="avatar" class="file-upload-label">
            <img src="./assets/images/upload.png" style="max-width: 25px; max-height: 25px; margin-right: 10px; vertical-align: middle;">
            Choose Avatar
        </label>
        <span id="file-upload-name" class="file-upload-name">No file chosen</span>
    </div>
        <input class="login-button" type="submit" value="Update" >

    </form>
    </c:if>



</div>
<script>
    document.getElementById('avatar').addEventListener('change', function() {
        var fileName = document.getElementById('avatar').files[0].name;
        document.getElementById('file-upload-name').textContent = fileName;
    });
</script>

</body>
</html>

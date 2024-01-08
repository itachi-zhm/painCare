<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/navbarcss.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
  <!-- Sidebar -->
    <div class="sidebar">
        
        <form action="home_page" method="get" class="logo">
            <li>
                <button type="submit" class="side-menu-link">
                <img src="./assets/images/Logo.png" style="max-height: 50px; max-width: 50px; margin: 5px;">
                <div class="logo-name"><span> Pain</span> Care</div>
                </button>
            </li>
        </form>
        <ul class="side-menu">
     <form action="home_page" method="get">
            <li>
                <button type="submit" class="side-menu-link">
                    <i class='bx bxs-dashboard'></i>Dashboard
                </button>
            </li>
        </form>
    <!-- Wrap the li in the form -->
    <form action="read_posts" method="get">
        <li>
            <button type="submit" class="side-menu-link">
                <i class='bx bx-store-alt'></i>Blogs
            </button>
        </li>
    </form>
    <li><a href="#"><i class='bx bx-calendar'></i>Calendrier</a></li>
</ul>

        <ul class="side-menu">
            <li>
               
                <form action="update_user" method="get">
		            <li>
		                <button type="submit" class="side-menu-link logout">
		                    <i class='bx bx-group'></i>Profil
		                </button>
		            </li>
       			 </form>
                <form action="logout" method="post">
		            <li>
		                <button type="submit" class="side-menu-link logout">
		                    <i class='bx bx-log-out-circle'></i>Logout
		                </button>
		            </li>
       			 </form>
           	
            </li>
        </ul>
    </div>
    <!-- End of Sidebar -->

    <!-- Main Content -->
    <div class="content">
        <!-- Navbar -->
        <nav>
            <i class='bx bx-menu'></i>
            <form action="#">
                <div class="form-input">
                    <input type="search" id="searchInput" placeholder="Search...">
                    <button class="search-btn" type="submit" id="searchBtn"><i class='bx bx-search'></i></button>

                </div>
            </form>
            <input type="checkbox" id="theme-toggle" hidden>
            <label for="theme-toggle" class="theme-toggle"></label>
<!--            <a href="#" class="notif">-->
<!--                <i class='bx bx-bell'></i>-->
<!--                <span class="count">12</span>-->
<!--            </a>-->
<c:if test="${sessionScope.user ne null}">
<p><strong>Nom:</strong> ${sessionScope.user.name}</p>
            <a href="#" class="profile">
                <img src="${sessionScope.user.avatar}" alt="Avatar de ${sessionScope.user.name}">
                
            </a>
            
        </nav>
</c:if>
        <!-- End of Navbar -->
<script src="./assets/js/navbarjs.js"></script>
</body>
</html>
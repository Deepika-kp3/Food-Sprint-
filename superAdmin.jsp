<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("SUPER_ADMIN")){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Sprint | Super Admin</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{

    background:
    linear-gradient(rgba(0,0,0,.78),rgba(0,0,0,.78)),
    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1800&q=80");

    background-size:cover;
    background-position:center;
    background-attachment:fixed;

}

/* Header */

.header{

    width:100%;
    background:rgba(0,0,0,.55);
    backdrop-filter:blur(8px);

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:20px 60px;

    color:white;

    box-shadow:0 5px 20px rgba(0,0,0,.4);

}

.logo{

    font-size:34px;
    font-weight:bold;
    color:#ff5722;

}

.welcome{

    font-size:18px;

}

.logout{

    text-decoration:none;
    color:white;
    background:#ff5722;
    padding:10px 25px;
    border-radius:8px;
    transition:.3s;

}

.logout:hover{

    background:#ff3d00;

}

/* Title */

.title{

    text-align:center;
    color:white;
    margin-top:50px;

}

.title h1{

    font-size:45px;
    margin-bottom:10px;

}

.title p{

    font-size:20px;
    color:#ddd;

}

/* Cards */

.container{

    width:90%;
    max-width:1300px;

    margin:50px auto;

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));

    gap:30px;

}

.card{

    background:rgba(255,255,255,.08);

    backdrop-filter:blur(10px);

    border-radius:18px;

    text-align:center;

    padding:35px;

    color:white;

    transition:.35s;

    box-shadow:0 10px 25px rgba(0,0,0,.45);

}

.card:hover{

    transform:translateY(-10px);

    box-shadow:0 20px 35px rgba(0,0,0,.5);

}

.card .icon{

    font-size:65px;

    margin-bottom:20px;

}

.card h2{

    margin-bottom:15px;

}

.card p{

    color:#ddd;

    margin-bottom:25px;

    line-height:24px;

}

.card a{

    display:inline-block;

    text-decoration:none;

    background:#ff5722;

    color:white;

    padding:12px 28px;

    border-radius:8px;

    transition:.3s;

    font-weight:bold;

}

.card a:hover{

    background:#ff3d00;

}

.footer{

    text-align:center;

    color:white;

    margin:50px 0 20px;

    opacity:.8;

}

</style>

</head>

<body>

<div class="header">

<div class="logo">
🍔 Food Sprint
</div>

<div class="welcome">
Welcome,
<b><%=session.getAttribute("name")%></b>
</div>

<a href="logout" class="logout">
Logout
</a>

</div>

<div class="title">

<h1>Super Admin Dashboard</h1>

<p>Manage Restaurants, Users and Orders </p>

</div>

<div class="container">

<div class="card">

<div class="icon">
👥
</div>

<h2>Users</h2>

<p>
View all registered customers, manage user accounts and remove inactive users.
</p>

<a href="viewUsers">
Manage Users
</a>

</div>


<div class="card">

<div class="icon">
🍽
</div>

<h2>Restaurants</h2>

<p>
Add new restaurants, update restaurant details and manage restaurant listings.
</p>

<a href="restaurantList">
Manage Restaurants
</a>

</div>


<div class="card">

<div class="icon">
📦
</div>

<h2>Orders</h2>

<p>
Track every order placed by customers and monitor delivery status.
</p>

<a href="viewOrders">
View Orders
</a>

</div>



</div>

<div class="footer">

© 2026 Food Sprint | Super Admin Panel

</div>

</body>
</html>
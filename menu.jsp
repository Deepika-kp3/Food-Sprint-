<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.Menu"%>
<%@ page import="com.tap.Model.Restaurant"%>

<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
List<Menu> allMenusByRestaurant =
        (List<Menu>) request.getAttribute("allMenusByRestaurant");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>
<%=restaurant.getName()%> Menu
</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:#f5f5f5;
}

header{

background:#e23744;
color:white;
padding:25px;
text-align:center;
font-size:35px;
font-weight:bold;

}

.subheading{

text-align:center;
padding:20px;
font-size:18px;
color:#555;

}

.container{

width:92%;
margin:auto;

display:grid;
grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
gap:30px;

padding-bottom:40px;

}

.card{

background:white;
border-radius:15px;
overflow:hidden;
box-shadow:0 10px 20px rgba(0,0,0,.15);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card img{

width:100%;
height:220px;
object-fit:cover;
display:block;

}

.content{

padding:18px;

}

.content h2{

margin-bottom:10px;
color:#333;

}

.content p{

color:#666;
line-height:24px;

}

.price{

font-size:25px;
font-weight:bold;
color:#e23744;
margin-top:15px;

}

.available{

margin-top:12px;
font-weight:bold;
color:green;

}

button{

margin-top:15px;
width:100%;
padding:12px;
border:none;
background:#e23744;
color:white;
font-size:17px;
border-radius:8px;
cursor:pointer;
transition:.3s;

}

button:hover{

background:#c2185b;

}

footer{

background:#111;
color:white;
text-align:center;
padding:20px;
margin-top:40px;

}

</style>

</head>

<body>

<header>

🍔 <%=restaurant.getName()%> Menu

</header>

<div class="subheading">

Choose your favourite food and enjoy delicious meals.

</div>

<div class="container">

<%

if(allMenusByRestaurant!=null){

for(Menu menu:allMenusByRestaurant){

%>

<div class="card">

<img src="<%=request.getContextPath()%>/images/<%=menu.getImagePath()%>"
     alt="<%=menu.getItemName()%>"
     onerror="this.src='<%=request.getContextPath()%>/images/no-image.png';">

<div class="content">

<h2>

<%=menu.getItemName()%>

</h2>

<p>

<%=menu.getDescription()%>

</p>

<div class="price">

₹ <%=menu.getPrice()%>

</div>

<p class="available">

<%=menu.isAvailable()?"Available":"Out Of Stock"%>

</p>

<form action="callCartServlet" method="post">

<input type="hidden"
name="menuId"
value="<%=menu.getMenuId()%>">

<input type="hidden"
name="restaurantId"
value="<%=menu.getRestaurantId()%>">

<input type="hidden"
name="quantity"
value="1">

<input type="hidden"
name="action"
value="add">

<button type="submit">

🛒 Add To Cart

</button>

</form>

</div>

</div>

<%

}

}

%>

</div>

<footer>

🍽 Food Sprint | Fresh Food • Fast Delivery • Happy Customers

</footer>

</body>

</html>
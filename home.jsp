<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.Restaurant"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Sprint</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,Arial,sans-serif;
}

body{
background:#f5f5f5;
color:#333;
}

header{
position:sticky;
top:0;
background:#e23744;
padding:16px 60px;
display:flex;
justify-content:space-between;
align-items:center;
z-index:100;
}

.logo{
font-size:30px;
font-weight:bold;
color:white;
}

nav a{
color:white;
text-decoration:none;
margin-left:25px;
font-weight:bold;
}

nav a:hover{
color:#ffd54f;
}

.hero{

height:70vh;

background:
linear-gradient(rgba(0,0,0,.55),rgba(0,0,0,.55)),
url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=80");

background-size:cover;
background-position:center;

display:flex;
flex-direction:column;
justify-content:center;
align-items:center;

color:white;
text-align:center;

}

.hero h1{
font-size:55px;
margin-bottom:20px;
}

.hero p{
font-size:20px;
width:70%;
margin-bottom:25px;
}

.search{

display:flex;
width:70%;
max-width:700px;

}

.search input{

flex:1;
padding:15px;
border:none;
border-radius:30px 0 0 30px;
font-size:16px;

}

.search button{

padding:15px 30px;
background:#ff9800;
color:white;
border:none;
border-radius:0 30px 30px 0;
cursor:pointer;

}

.section{

padding:60px 8%;

}

.section h1{

text-align:center;
margin-bottom:40px;
font-size:40px;

}

.cards{

display:grid;
grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
gap:30px;

}

.card{

background:white;
border-radius:15px;
overflow:hidden;
box-shadow:0 5px 15px rgba(0,0,0,.2);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card img{

width:100%;
height:220px;
object-fit:cover;

}

.content{

padding:20px;

}

.content h2{

margin-bottom:12px;

}

.content p{

margin:10px 0;

}

.badge{

background:#16a34a;
color:white;
padding:5px 12px;
border-radius:20px;

}

.status{

font-weight:bold;
color:green;

}

.btn{

display:block;
text-align:center;
text-decoration:none;
margin-top:18px;
padding:12px;
background:#e23744;
color:white;
border-radius:30px;

}

.btn:hover{

background:#c62839;

}

footer{

margin-top:60px;
background:#222;
color:white;
text-align:center;
padding:30px;

}

</style>

</head>

<body>

<header>

<div class="logo">
🍽 Food Sprint
</div>

<nav>

<a href="home">Home</a>

<a href="home">Restaurants</a>

<a href="cart.jsp">Cart</a>



<a href="login.html">Login</a>

<a href="register.html">Sign Up</a>

</nav>

</header>

<section class="hero">

<h1>Happiness Delivered To Your Doorstep ❤️</h1>

<p>

Explore top-rated restaurants and enjoy delicious food with lightning-fast delivery.

</p>

<div class="search">

<input
type="text"
placeholder="Search Restaurants...">

<button>

Search

</button>

</div>

</section>

<section class="section">

<h1>

Discover the Best Restaurants Near You

</h1>

<div class="cards">

<%

List<Restaurant> allRestaurants =
(List<Restaurant>)request.getAttribute("allRestaurants");

if(allRestaurants!=null && !allRestaurants.isEmpty()){

for(Restaurant restaurant : allRestaurants){

%>

<div class="card">

<img
src="images/<%=restaurant.getImagePath()%>"
alt="<%=restaurant.getName()%>">

<div class="content">

<h2>

<%=restaurant.getName()%>

</h2>

<p>

<strong>Cuisine :</strong>

🍽️ <%=restaurant.getCuisineType()%>

</p>

<p>

<strong>Delivery :</strong>

⏱ <%=restaurant.getDeliveryTime()%> mins

</p>

<p>

<strong>Address :</strong>

📍 <%=restaurant.getAddress()%>

</p>

<p>

<strong>Rating :</strong>

<span class="badge">

⭐ <%=restaurant.getRating()%>

</span>

</p>

<p>

<strong>Status :</strong>

<span class="status">

<%=restaurant.isActive() ? "✔ Active" : "❌ Inactive"%>

</span>

</p>

<a
class="btn"
href="menu?restaurantId=<%=restaurant.getRestaurantId()%>">

View Restaurant

</a>

</div>

</div>

<%

}

}else{

%>

<h2 style="text-align:center;color:red;grid-column:1/-1;">

No Restaurants Found

</h2>

<%

}

%>

</div>

</section>

<footer>

<h2>

🍽 Food Sprint

</h2>

<br>

<p>

Fresh Food • Fast Delivery • Happy Customers

</p>

<br>

<p>

Email : support@foodsprint.com

</p>

<p>

Phone : +91 9876543210

</p>

<br>

<p>

© 2026 Food Sprint. All Rights Reserved.

</p>

</footer>

</body>

</html>
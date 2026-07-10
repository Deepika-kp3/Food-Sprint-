<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tap.Model.Restaurant"%>

<%
Restaurant restaurant = (Restaurant)request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Sprint | Edit Restaurant</title>

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

.container{

width:100%;
height:100vh;

display:flex;
justify-content:center;
align-items:center;

}

.form-box{

width:500px;

background:rgba(255,255,255,.10);

backdrop-filter:blur(10px);

padding:35px;

border-radius:20px;

box-shadow:0 10px 25px rgba(0,0,0,.5);

}

h1{

text-align:center;
color:#ff5722;
margin-bottom:25px;

}

label{

display:block;

margin-top:15px;

color:white;

font-weight:bold;

}

input,
select{

width:100%;

padding:12px;

margin-top:8px;

border:none;

border-radius:8px;

outline:none;

font-size:15px;

}

button{

width:100%;

padding:15px;

margin-top:30px;

background:#ff5722;

color:white;

font-size:18px;

border:none;

border-radius:8px;

cursor:pointer;

transition:.3s;

}

button:hover{

background:#e64a19;

}

.back{

display:block;

text-align:center;

margin-top:20px;

text-decoration:none;

color:white;

}

.back:hover{

color:#ff5722;

}

</style>

</head>

<body>

<div class="container">

<div class="form-box">

<h1>🍽 Edit Restaurant</h1>

<form action="updateRestaurant" method="post">

<input
type="hidden"
name="restaurantId"
value="<%=restaurant.getRestaurantId()%>">

<label>Restaurant Name</label>

<input
type="text"
name="name"
value="<%=restaurant.getName()%>"
required>

<label>Cuisine</label>

<input
type="text"
name="cuisine"
value="<%=restaurant.getCuisineType()%>"
required>

<label>Delivery Time</label>

<input
type="number"
name="deliveryTime"
value="<%=restaurant.getDeliveryTime()%>"
required>

<label>Address</label>

<input
type="text"
name="address"
value="<%=restaurant.getAddress()%>"
required>

<label>Rating</label>

<input
type="number"
step="0.1"
min="1"
max="5"
name="rating"
value="<%=restaurant.getRating()%>"
required>

<label>Image Path</label>

<input
type="text"
name="image"
value="<%=restaurant.getImagePath()%>"
required>

<label>Status</label>

<select name="status">

<option value="true"
<%=restaurant.isActive()?"selected":""%>>
Active
</option>

<option value="false"
<%=!restaurant.isActive()?"selected":""%>>
Inactive
</option>

</select>

<button type="submit">

💾 Update Restaurant

</button>

</form>

<a href="restaurantList" class="back">

⬅ Back to Restaurant List

</a>

</div>

</div>

</body>
</html>
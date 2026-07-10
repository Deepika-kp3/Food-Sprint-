<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.Restaurant"%>

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Restaurants</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{

background:
linear-gradient(rgba(0,0,0,.80),rgba(0,0,0,.80)),
url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1800&q=80");

background-size:cover;
background-position:center;
background-attachment:fixed;

}

.container{

width:95%;
margin:40px auto;

}

.header{

display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:30px;

}

.header h1{

color:white;
font-size:40px;

}

.addBtn{

text-decoration:none;
background:#ff5722;
color:white;
padding:12px 25px;
border-radius:8px;
font-weight:bold;

}

.addBtn:hover{

background:#e64a19;

}

table{

width:100%;
border-collapse:collapse;
background:white;
border-radius:12px;
overflow:hidden;

}

th{

background:#ff5722;
color:white;
padding:18px;

}

td{

padding:15px;
text-align:center;
border-bottom:1px solid #ddd;

}

tr:hover{

background:#f7f7f7;

}

.edit{

background:#2196F3;
color:white;
padding:8px 16px;
text-decoration:none;
border-radius:6px;

}

.delete{

background:red;
color:white;
padding:8px 16px;
text-decoration:none;
border-radius:6px;

}

.back{

display:inline-block;
margin-top:30px;
text-decoration:none;
background:#444;
color:white;
padding:12px 25px;
border-radius:8px;

}

</style>

</head>

<body>

<div class="container">

<div class="header">

<h1>🍽 Restaurant Management</h1>

<a href="addRestaurant.jsp" class="addBtn">

+ Add Restaurant

</a>

</div>

<table>

<tr>

<th>ID</th>

<th>Name</th>

<th>Cuisine</th>

<th>Delivery Time</th>

<th>Rating</th>

<th>Status</th>

<th>Edit</th>

<th>Delete</th>

</tr>

<%

if(restaurants!=null){

for(Restaurant r:restaurants){

%>

<tr>

<td><%=r.getRestaurantId()%></td>

<td><%=r.getName()%></td>

<td><%=r.getCuisineType()%></td>

<td><%=r.getDeliveryTime()%> min</td>

<td>⭐ <%=r.getRating()%></td>

<td>

<%=r.isActive()?"Active":"Inactive"%>

</td>

<td>

<a class="edit"
href="editRestaurant?id=<%=r.getRestaurantId()%>">

Edit

</a>

</td>

<td>

<a href="deleteRestaurant?id=<%=r.getRestaurantId()%>"
class="delete"
onclick="return confirm('Are you sure you want to delete this restaurant?');">

Delete

</a>

</td>

</tr>

<%

}

}

%>

</table>

<a href="superAdmin.jsp" class="back">

⬅ Back to Dashboard

</a>

</div>

</body>
</html>
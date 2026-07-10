<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.Model.User"%>

<%
User user = (User)request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>

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

width:100%;
height:100vh;

display:flex;
justify-content:center;
align-items:center;

}

.form-box{

width:450px;

background:rgba(255,255,255,.10);

backdrop-filter:blur(12px);

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

font-size:15px;

outline:none;

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

<h1>👤 Edit User</h1>

<form action="updateUser" method="post">

<input
type="hidden"
name="userId"
value="<%=user.getUserId()%>">

<label>Name</label>

<input
type="text"
name="name"
value="<%=user.getName()%>"
required>

<label>Email</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

<label>Address</label>

<input
type="text"
name="address"
value="<%=user.getAddress()%>"
required>

<label>Role</label>

<select name="role">

<option value="CUSTOMER"
<%=user.getRole().equals("CUSTOMER")?"selected":""%>>

CUSTOMER

</option>

<option value="ADMIN"
<%=user.getRole().equals("ADMIN")?"selected":""%>>

ADMIN

</option>

<option value="SUPER_ADMIN"
<%=user.getRole().equals("SUPER_ADMIN")?"selected":""%>>

SUPER ADMIN

</option>

</select>

<button type="submit">

💾 Update User

</button>

</form>

<a href="viewUsers" class="back">

⬅ Back to Users

</a>

</div>

</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.User"%>

<%
List<User> users = (List<User>)request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Sprint | Manage Users</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{

background:
linear-gradient(rgba(0,0,0,.82),rgba(0,0,0,.82)),
url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1800&q=80");

background-size:cover;
background-position:center;
background-attachment:fixed;

}

.container{

width:95%;
margin:40px auto;

}

h1{

text-align:center;
color:white;
margin-bottom:30px;

}

table{

width:100%;
border-collapse:collapse;

background:rgba(255,255,255,.10);

backdrop-filter:blur(10px);

border-radius:15px;

overflow:hidden;

}

th{

background:#ff5722;
color:white;
padding:15px;

}

td{

padding:15px;
text-align:center;
color:white;
border-bottom:1px solid rgba(255,255,255,.15);

}

tr:hover{

background:rgba(255,255,255,.08);

}

.edit{

background:#2196F3;
padding:8px 18px;
border-radius:5px;
text-decoration:none;
color:white;

}

.delete{

background:red;
padding:8px 18px;
border-radius:5px;
text-decoration:none;
color:white;

}

.top{

display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:20px;

}

.back{

background:#ff5722;
padding:12px 25px;
border-radius:8px;
text-decoration:none;
color:white;

}

</style>

</head>

<body>

<div class="container">

<div class="top">

<h1>👥 Manage Users</h1>

<a href="superAdmin.jsp" class="back">

⬅ Dashboard

</a>

</div>

<table>

<tr>

<th>User ID</th>

<th>Name</th>

<th>Email</th>

<th>Role</th>

<th>Address</th>

<th>Edit</th>

<th>Delete</th>

</tr>

<%

if(users != null){

for(User user : users){

%>

<tr>

<td>

<%=user.getUserId()%>

</td>

<td>

<%=user.getName()%>

</td>

<td>

<%=user.getEmail()%>

</td>

<td>

<%=user.getRole()%>

</td>

<td>

<%=user.getAddress()%>

</td>

<td>

<a
href="editUser?id=<%=user.getUserId()%>"
class="edit">

Edit

</a>

</td>

<td>

<a
href="deleteUser?id=<%=user.getUserId()%>"
class="delete"
onclick="return confirm('Delete this user?');">

Delete

</a>

</td>

</tr>

<%

}

}

%>

</table>

</div>

</body>
</html>
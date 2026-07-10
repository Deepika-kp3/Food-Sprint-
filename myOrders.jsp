<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.Order"%>

<%
List<Order> orders=(List<Order>)request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;a
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

.status{

padding:8px 15px;

border-radius:20px;

font-weight:bold;

background:#ff9800;

}

.back{

display:inline-block;

margin-top:25px;

padding:12px 25px;

background:#ff5722;

color:white;

text-decoration:none;

border-radius:8px;

}

</style>

</head>

<body>

<div class="container">

<h1>📦 My Orders</h1>

<table>

<tr>

<th>Order ID</th>

<th>Total Amount</th>

<th>Payment</th>

<th>Status</th>

<th>Order Date</th>

</tr>

<%

if(orders!=null){

for(Order order:orders){

%>

<tr>

<td><%=order.getOrderId()%></td>

<td>₹ <%=order.getTotalAmount()%></td>

<td><%=order.getPaymentMethod()%></td>

<td>

<span class="status">

<%=order.getStatus()%>

</span>

</td>

<td>

<%=order.getOrderDate()%>

</td>

</tr>

<%

}

}

%>

</table>

<br>

<a href="home" class="back">

⬅ Continue Shopping

</a>

</div>

</body>
</html>
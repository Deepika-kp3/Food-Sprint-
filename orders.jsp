<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.Order"%>

<%
List<Order> orders = (List<Order>)request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Sprint | Orders</title>

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

.top{

display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:25px;

}

h1{

color:white;
font-size:38px;

}

.back{

text-decoration:none;
background:#ff5722;
color:white;
padding:12px 25px;
border-radius:8px;

}

.back:hover{

background:#e64a19;

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
border-bottom:1px solid rgba(255,255,255,.2);

}

tr:hover{

background:rgba(255,255,255,.08);

}

select{

padding:8px;
border:none;
border-radius:5px;

}

button{

background:#4CAF50;
color:white;
border:none;
padding:8px 18px;
border-radius:5px;
cursor:pointer;

}

button:hover{

background:#2E7D32;

}

.empty{

text-align:center;
color:white;
font-size:22px;
margin-top:80px;

}

</style>

</head>

<body>

<div class="container">

<div class="top">

<h1>📦 Order Management</h1>

<a href="superAdmin.jsp" class="back">

⬅ Dashboard

</a>

</div>

<%

if(orders!=null && !orders.isEmpty()){

%>

<table>

<tr>

<th>Order ID</th>

<th>User ID</th>

<th>Restaurant ID</th>

<th>Total Amount</th>

<th>Payment</th>

<th>Status</th>

<th>Order Date</th>

<th>Update</th>

</tr>

<%

for(Order order : orders){

%>

<tr>

<td>

<%=order.getOrderId()%>

</td>

<td>

<%=order.getUserId()%>

</td>

<td>

<%=order.getRestaurantId()%>

</td>

<td>

₹ <%=order.getTotalAmount()%>

</td>

<td>

<%=order.getPaymentMethod()%>

</td>

<td>

<form action="updateOrderStatus" method="post">

<input
type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">

<select name="status">

<option value="Pending"
<%=order.getStatus().equals("Pending")?"selected":""%>>

Pending

</option>

<option value="Preparing"
<%=order.getStatus().equals("Preparing")?"selected":""%>>

Preparing

</option>

<option value="Out For Delivery"
<%=order.getStatus().equals("Out For Delivery")?"selected":""%>>

Out For Delivery

</option>

<option value="Delivered"
<%=order.getStatus().equals("Delivered")?"selected":""%>>

Delivered

</option>

</select>

</td>

<td>

<%=order.getOrderDate()%>

</td>

<td>

<button type="submit">

Update

</button>

</form>

</td>

</tr>

<%

}

%>

</table>

<%

}else{

%>

<div class="empty">

<h2>No Orders Available</h2>

</div>

<%

}

%>

</div>

</body>
</html>
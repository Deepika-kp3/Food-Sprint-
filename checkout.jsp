<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.Model.Cart"%>
<%@ page import="com.tap.Model.CartItem"%>
<%@ page import="java.util.*"%>

<%
Cart cart = (Cart)session.getAttribute("cart");

double grandTotal = 0;
double deliveryFee = 40;
double platformFee = 10;

if(cart != null && !cart.getItems().isEmpty()){
    for(CartItem item : cart.getItems().values()){
        grandTotal += item.getTotalPrice();
    }
}

double finalAmount = grandTotal + deliveryFee + platformFee;

session.setAttribute("finalAmount", finalAmount);
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Food Sprint | Checkout</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

background:
linear-gradient(rgba(0,0,0,.70),rgba(0,0,0,.70)),
url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1800&q=80");

background-size:cover;
background-position:center;
background-attachment:fixed;

min-height:100vh;

}

.header{

width:100%;
padding:22px 60px;

display:flex;
justify-content:space-between;
align-items:center;

background:rgba(0,0,0,.35);

backdrop-filter:blur(12px);

color:white;

}

.logo{

font-size:32px;
font-weight:bold;
color:#ff6b35;

}

.tagline{

font-size:18px;
opacity:.9;

}

.container{

width:92%;
max-width:1400px;

margin:40px auto;

display:flex;

gap:35px;

align-items:flex-start;

}

.left{

width:60%;

background:rgba(255,255,255,.95);

padding:35px;

border-radius:22px;

backdrop-filter:blur(15px);

box-shadow:0 15px 40px rgba(0,0,0,.35);

}

.right{

width:40%;

background:rgba(255,255,255,.95);

padding:35px;

border-radius:22px;

backdrop-filter:blur(15px);

box-shadow:0 15px 40px rgba(0,0,0,.35);

position:sticky;

top:25px;

}

.banner{

background:linear-gradient(90deg,#ff5722,#ff9800);

padding:18px;

border-radius:15px;

color:white;

margin-bottom:25px;

display:flex;

justify-content:space-between;

align-items:center;

}

.banner h2{

font-size:28px;

}

.banner span{

font-size:15px;

}

.section-title{

font-size:28px;

font-weight:600;

color:#333;

margin-bottom:20px;

}

label{

display:block;

margin-top:18px;

font-weight:600;

color:#444;

}

input,
textarea,
select{

width:100%;

padding:14px;

margin-top:8px;

border:2px solid #eee;

border-radius:12px;

font-size:15px;

outline:none;

transition:.3s;

}

input:focus,
textarea:focus,
select:focus{

border-color:#ff6b35;

box-shadow:0 0 12px rgba(255,107,53,.25);

}

textarea{

height:110px;

resize:none;

}

table{

width:100%;

border-collapse:collapse;

margin-top:20px;

}

table th{

background:#ff6b35;

color:white;

padding:15px;

}

table td{

padding:15px;

border-bottom:1px solid #ddd;

}

.bill{

margin-top:25px;

}

.bill p{

display:flex;

justify-content:space-between;

margin:15px 0;

font-size:16px;

}

.total{

font-size:22px;

font-weight:bold;

color:#ff5722;

}

button{

width:100%;

padding:16px;

margin-top:30px;

border:none;

border-radius:12px;

background:linear-gradient(90deg,#ff5722,#ff9800);

color:white;

font-size:20px;

font-weight:bold;

cursor:pointer;

transition:.3s;

}

button:hover{

transform:translateY(-3px);

box-shadow:0 10px 25px rgba(255,87,34,.5);

}

.empty{

text-align:center;

padding:120px;

font-size:25px;

color:white;

}

.empty a{

display:inline-block;

margin-top:25px;

padding:12px 25px;

background:#ff6b35;

color:white;

text-decoration:none;

border-radius:8px;

}

.footer{

margin-top:40px;

text-align:center;

color:white;

opacity:.8;

padding-bottom:20px;

}

</style>

</head>
<body>

<%
if(cart==null || cart.getItems().isEmpty()){
%>

<div class="empty">

<h2>🛒 Your Cart is Empty</h2>

<a href="home">
Continue Shopping
</a>

</div>

<%
}else{
%>

<div class="header">

<div class="logo">
🍔 Food Sprint
</div>

<div class="tagline">
🛵 Fast Delivery • Fresh Food • Secure Payment
</div>

</div>

<div class="container">

<!-- LEFT SIDE -->

<div class="left">

<div class="banner">

<div>

<h2>🚚 Checkout</h2>

<span>Delivering Happiness to Your Doorstep</span>

</div>

<div style="font-size:55px;">
🍕
</div>

</div>

<h2 class="section-title">

Delivery Information

</h2>

<form action="Checkout" method="post">

<label>

👤 Full Name

</label>

<input
type="text"
name="fullName"
placeholder="Enter your full name"
required>

<label>

📱 Mobile Number

</label>

<input
type="text"
name="mobile"
placeholder="Enter mobile number"
required>

<label>

📍 Delivery Address

</label>

<textarea
name="address"
placeholder="Enter complete delivery address"
required></textarea>

<label>

💳 Payment Method

</label>

<select name="paymentMode">

<option value="Cash On Delivery">

💵 Cash On Delivery

</option>

<option value="UPI">

📲 UPI

</option>

<option value="Credit Card">

💳 Credit Card

</option>

<option value="Debit Card">

💳 Debit Card

</option>

</select>
<button type="submit">

🚀 Place Order

</button>

</form>

</div>

<!-- RIGHT SIDE -->

<div class="right">

<h2 class="section-title">

🧾 Order Summary

</h2>

<table>

<tr>

<th>Item</th>

<th>Qty</th>

<th>Total</th>

</tr>

<%

for(CartItem item : cart.getItems().values()){

%>

<tr>

<td>

🍽 <%=item.getName()%>

</td>

<td>

<%=item.getQuantity()%>

</td>

<td>

₹ <%=item.getTotalPrice()%>

</td>

</tr>

<%

}

%>

</table>

<div class="bill">

<p>

<span>🛒 Item Total</span>

<span>

₹ <%=grandTotal%>

</span>

</p>

<p>

<span>🚚 Delivery Fee</span>

<span>

₹ <%=deliveryFee%>

</span>

</p>

<p>

<span>💳 Platform Fee</span>

<span>

₹ <%=platformFee%>

</span>

</p>

<hr style="margin:18px 0;">

<p class="total">

<span>

💰 Grand Total

</span>

<span>

₹ <%=finalAmount%>

</span>

</p>

</div>

<div style="margin-top:25px;
background:#fff3e0;
padding:18px;
border-radius:12px;
line-height:28px;">

<h3 style="color:#ff5722;margin-bottom:10px;">

🎉 Why Food Sprint?

</h3>

<p>

✅ Fresh & Hygienic Food

</p>

<p>

🛵 Fast Delivery

</p>

<p>

⭐ Trusted Restaurants

</p>

<p>

🔒 Secure Payments

</p>

</div>

</div>

</div>

<div class="footer">

<h3>

🍔 Food Sprint

</h3>

<p>

Delivering Happiness • Fresh Food • Fast Service

</p>

<p>

© 2026 Food Sprint. All Rights Reserved.

</p>

</div>

<%

}

%>

</body>

</html>

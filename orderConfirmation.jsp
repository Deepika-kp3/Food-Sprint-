<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
display:flex;
justify-content:center;
align-items:center;
height:100vh;
background:
linear-gradient(rgba(0,0,0,.75),rgba(0,0,0,.75)),
url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1800&q=80");
background-size:cover;
background-position:center;
}

.container{
background:rgba(255,255,255,.12);
backdrop-filter:blur(12px);
padding:40px;
border-radius:15px;
text-align:center;
color:white;
width:450px;
}

h1{
color:#4CAF50;
margin-bottom:20px;
}

p{
font-size:18px;
margin-bottom:25px;
}

a{
display:inline-block;
padding:12px 25px;
background:#ff5722;
color:white;
text-decoration:none;
border-radius:8px;
margin:10px;
}

a:hover{
background:#e64a19;
}

</style>

</head>
<body>

<div class="container">

<h1>🎉 Order Placed Successfully!</h1>

<p>Your order has been placed successfully.</p>

<a href="myOrders">View My Orders</a>

<a href="home">Continue Shopping</a>

</div>

</body>
</html>
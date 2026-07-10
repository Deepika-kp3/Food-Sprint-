
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*,com.tap.Model.Cart,com.tap.Model.CartItem" %>

<%
Cart cart = (Cart)session.getAttribute("cart");
Integer restaurantId = (Integer)session.getAttribute("restaurantId");
double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Sprint | My Cart</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:
    linear-gradient(rgba(0,0,0,.70),rgba(0,0,0,.70)),
    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=80");
    background-size:cover;
    background-position:center;
    background-attachment:fixed;
}

.container{
    width:90%;
    max-width:1200px;
    margin:40px auto;
}

.heading{
    text-align:center;
    color:white;
    font-size:45px;
    margin-bottom:30px;
    text-shadow:2px 2px 10px black;
}

.cart-box{
    background:white;
    border-radius:15px;
    padding:25px;
    box-shadow:0 10px 25px rgba(0,0,0,.4);
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#ff5722;
    color:white;
    padding:15px;
}

td{
    padding:18px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

.quantity-box{
    display:flex;
    justify-content:center;
    align-items:center;
    gap:10px;
}

.qty-btn{
    width:35px;
    height:35px;
    border:none;
    border-radius:50%;
    background:#ff5722;
    color:white;
    font-size:20px;
    cursor:pointer;
    transition:.3s;
}

.qty-btn:hover{
    background:#e64a19;
}

.remove-btn{
    background:red;
    color:white;
    border:none;
    padding:8px 15px;
    border-radius:5px;
    cursor:pointer;
}

.summary{
    margin-top:30px;
    text-align:right;
}

.summary h2{
    color:#ff5722;
}

.buttons{
    margin-top:30px;
    display:flex;
    justify-content:space-between;
    flex-wrap:wrap;
}

.btn{
    text-decoration:none;
    color:white;
    background:#ff5722;
    padding:12px 25px;
    border-radius:8px;
    transition:.3s;
}

.btn:hover{
    background:#e64a19;
}

.checkout{
    background:green;
}

.checkout:hover{
    background:darkgreen;
}

.empty-cart{
    text-align:center;
    background:white;
    padding:50px;
    border-radius:15px;
}

.empty-cart h2{
    color:#444;
    margin-bottom:20px;
}

@media(max-width:768px){

table{
display:block;
overflow-x:auto;
}

.heading{
font-size:35px;
}

.buttons{
flex-direction:column;
gap:15px;
}

}

</style>

</head>

<body>

<div class="container">

<h1 class="heading">🛒 Food Sprint - My Cart</h1>

<%

if(cart!=null && !cart.getItems().isEmpty()){

%>

<div class="cart-box">

<table>

<tr>

<th>Food Item</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
<th>Remove</th>

</tr>

<%
for(CartItem item : cart.getItems().values()){

    grandTotal += item.getTotalPrice();
%>

<tr>

    <td>
        <%=item.getName()%>
    </td>

    <td>
        ₹ <%=item.getPrice()%>
    </td>

    <td>

        <div class="quantity-box">

            <!-- Minus -->

            <form action="callCartServlet" method="post">

                <input type="hidden" name="menuId"
                       value="<%=item.getMenuId()%>">

                <input type="hidden" name="restaurantId"
                       value="<%=restaurantId%>">

                <input type="hidden" name="quantity"
                       value="<%=item.getQuantity()-1%>">

                <input type="hidden" name="action"
                       value="update">

                <button type="submit" class="qty-btn">-</button>

            </form>

            <b><%=item.getQuantity()%></b>

            <!-- Plus -->

            <form action="callCartServlet" method="post">

                <input type="hidden" name="menuId"
                       value="<%=item.getMenuId()%>">

                <input type="hidden" name="restaurantId"
                       value="<%=restaurantId%>">

                <input type="hidden" name="quantity"
                       value="<%=item.getQuantity()+1%>">

                <input type="hidden" name="action"
                       value="update">

                <button type="submit" class="qty-btn">+</button>

            </form>

        </div>

    </td>

    <!-- Total -->

    <td>

        ₹ <%=item.getTotalPrice()%>

    </td>

    <!-- Remove -->

    <td>

        <form action="callCartServlet" method="post">

            <input type="hidden"
                   name="menuId"
                   value="<%=item.getMenuId()%>">

            <input type="hidden"
                   name="restaurantId"
                   value="<%=restaurantId%>">

            <input type="hidden"
                   name="action"
                   value="delete">

            <button type="submit"
                    class="remove-btn">

                Remove

            </button>

        </form>

    </td>

</tr>

<%
}
%>
</table>

<div class="summary">

<h2>

Grand Total : ₹ <%=grandTotal%>

</h2>

</div>

<div class="buttons">

<a href="menu?restaurantId=<%=restaurantId%>" class="btn">

⬅ Add More Items

</a>

<a href="checkout.jsp" class="btn checkout">

Proceed To Checkout ➜

</a>

</div>

</div>

<%

}else{

%>

<div class="empty-cart">

<h2>Your Cart is Empty 😔</h2>

<br>

<a href="home" class="btn">

Browse Restaurants

</a>

</div>

<%

}

%>

</div>

</body>
</html>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Sprint | Add Restaurant</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{

    background:
    linear-gradient(rgba(0,0,0,.75),rgba(0,0,0,.75)),
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

    border-radius:20px;

    padding:35px;

    box-shadow:0 10px 25px rgba(0,0,0,.5);

}

h1{

    text-align:center;

    color:#ff5722;

    margin-bottom:25px;

}

label{

    color:white;

    font-weight:bold;

    display:block;

    margin-top:15px;

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

    border:none;

    border-radius:10px;

    font-size:18px;

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

    color:white;

    text-decoration:none;

}

.back:hover{

    color:#ff5722;

}

</style>

</head>

<body>

<div class="container">

<div class="form-box">

<h1>🍽 Add Restaurant</h1>

<form action="addRestaurant" method="post">

<label>Restaurant Name</label>

<input
type="text"
name="name"
placeholder="Enter Restaurant Name"
required>

<label>Cuisine</label>

<input
type="text"
name="cuisine"
placeholder="Ex: South Indian, Chinese"
required>

<label>Delivery Time (Minutes)</label>

<input
type="number"
name="deliveryTime"
placeholder="30"
required>

<label>Address</label>

<input
type="text"
name="address"
placeholder="Restaurant Address"
required>

<label>Rating</label>

<input
type="number"
step="0.1"
min="1"
max="5"
name="rating"
placeholder="4.5"
required>

<label>Image Path</label>

<input
type="text"
name="image"
placeholder="Empire.jpeg"
required>

<label>Status</label>

<select name="status">

<option value="true">
Active
</option>

<option value="false">
Inactive
</option>

</select>

<button type="submit">

➕ Add Restaurant

</button>

</form>

<a href="restaurantList" class="back">

⬅ Back to Restaurant List

</a>

</div>

</div>

</body>
</html>
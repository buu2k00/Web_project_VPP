<%@page import="bo.GioHangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>

<%@page import="java.util.ArrayList"%>

<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>
<%
response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
if(request.getParameter("k")!=null && request.getParameter("k").toString().equals("1")) {%>
<script>alert('Đăng ký thành công\nVề trang đăng nhập để đăng nhập');</script>
 <%} else if(request.getParameter("k")!=null && request.getParameter("k").toString().equals("0")){ %>
 <script>alert('Tên này đã đăng ký\nHãy nhập tên khác');</script>
 <%} %>
 
<form action="dangkyad.jsp" method="post">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="username"><b>UserName</b></label>
    <input type="text" placeholder="Enter User Name" name="txtun1" id="name" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="txtpass1" id="password" required>  
    
    <label for="name"><b>Tên</b></label>
    <input type="text" placeholder="Enter Name" name="txtname"  required>
    
    <label for="diachi"><b>Địa chỉ</b></label>
    <input type="text" placeholder="Enter địa chỉ" name="txtaddress" >
    
    <label for="sodt"><b>Số điện thoại</b></label>
    <input type="text" placeholder="Enter số điện thoại" name="txtphone" >
    
    <label for="diachi"><b>Email</b></label>
    <input type="text" placeholder="Enter email" name="txtemail" >
    
    <hr>   
    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <a href="admin.jsp">Về trang đăng nhập</a>
  </div>
</form>

</body>
</html>
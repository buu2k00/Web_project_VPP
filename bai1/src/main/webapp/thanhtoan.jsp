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
<%response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
khachhangbean kh=(khachhangbean)session.getAttribute("dn");
if(request.getParameter("t")!=null &&request.getAttribute("t").equals("1")) 
	{%><script>alert('Xác nhận đơn hàng thành công');</script><%}else if(request.getParameter("t")!=null &&request.getAttribute("t").equals("0")){%>
	<script>alert('Xác nhận đơn hàng thất bại');</script> <%}
if(request.getAttribute("z")!=null &&request.getAttribute("z").equals("1")){
%>

<form action="xacNhanDonHang.jsp" method="post">
  <div class="container">
    <h1>Thanh toán</h1>
    <p>Kiểm tra và xác nhận</p>
    <hr>
    <label for="name"><b>Tên</b></label>
    <input type="text" placeholder="Enter Name" name="txtname" value="<%=(kh.getHoten()!=null)?kh.getHoten():"" %>" required>
    
    <label for="diachi"><b>Địa chỉ</b></label>
    <input type="text" placeholder="Enter địa chỉ" name="txtaddress" value="<%=(kh.getDiachi()!=null)?kh.getDiachi():"" %>" required>
    
    <label for="sodt"><b>Số điện thoại</b></label>
    <input type="text" placeholder="Enter số điện thoại" name="txtphone" value="<%=(kh.getSodt()!=null)?kh.getSodt():"" %>" required>
    
    <label for="diachi"><b>Email</b></label>
    <input type="text" placeholder="Enter email" name="txtemail" value="<%=(kh.getEmail()!=null)?kh.getEmail():"" %>" required>
    <input type="hidden"  name="txtun" value="<%=kh.getTendn() %>" >
    <input type="hidden"  name="txtpass" value="<%=kh.getMatkhau() %>" >
    <input type="hidden"  name="txtid" value="<%=kh.getMakh() %>" >
    
    <hr>   
    <button type="submit" class="registerbtn">Xác nhận đơn hàng</button>
  </div>
  
  <div class="container signin">
    <a href="HtVpp">Về trang đăng nhập</a>
  </div>
</form>

<% }if(request.getAttribute("z")!=null &&request.getAttribute("z").equals("0")){%>
<script>alert('Chưa đăng nhập\nVề trang chủ để đăng nhập');</script>
<a href="HtVpp">Về trang đăng nhập</a>
<% 
}%>
</body>
</html>


<%@page import="java.util.Random"%>
<%@page import="dao.Captcha"%>
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
</head>
<body>
<%response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8"); 
khachhangbean kh=(khachhangbean)session.getAttribute("dn2");



 Captcha cp = new Captcha();
String captcha= cp.getCaptcha(); 
%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav navbar-left">
    <li><a href="admin.jsp"><span class="glyphicon "></span> Trang chủ</a></li>
    <% 
		if(kh!=null){		   
		%>
      <li class="hli"><a href="qlvpp.jsp"><span class="glyphicon " ></span> Quản lý văn phòng phẩm</a></li>
     <li><a href="qlhoadon.jsp"><span class="glyphicon "></span> Quản lý hóa đơn</a></li>
     <%} %>
    
    </ul>
        <ul class="nav navbar-nav navbar-right">
        <li><a href="HtDangKyad">
      <span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
		<% 
		if(kh!=null){		   
		%>
		 <li><a href="#">Xin chao: <%=kh.getHoten()%> </a></li>
           <%}else{ %>
<li><a href="#" data-toggle="modal" data-target="#myModal">
           <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
              <%  if(session.getAttribute("kt3")!=null&&session.getAttribute("kt3").toString().equals("0")){session.setAttribute("kt3",null);%>             
             		 <script>alert('Dang nhap sai');</script>
              <%} 
              else if(session.getAttribute("kt3")!=null&&session.getAttribute("kt3").toString().equals("2")){session.setAttribute("kt3",null);%>             
             		 <script>alert('Sai captcha');</script>
              <%} %>
           <%} %>
           <% 
		if(kh!=null){		   
		%>
           <li><a href="dangxuatad.jsp">
      <span class="glyphicon glyphicon-user"></span> Đăng xuất</a></li>
      <%} %>
    </ul>
</div>
</nav>
  
 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
 <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="ktdnad.jsp">
             <label> Tên đăng nhập: </label>
 <input name="txtun" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <input name="txtpass" type="password" class="form-control">
             <div style="background-color: gray; width:65px;padding: 1px 1px;text-align:center; "><%=captcha %></div>
             <input name="txtcaptcha" type="text" value="">
             <input name="captcha" type="hidden" value="<%=captcha %>">
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>
     
      </div>
    </div>
  </div>
</body>
</html>
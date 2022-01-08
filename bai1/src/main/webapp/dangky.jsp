<%@page import="bo.MD5"%>
<%@page import="bo.khachhangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="java.util.ArrayList"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
   khachhangbo khbo=new khachhangbo();
   
   String un=request.getParameter("txtun1");
   String pass=request.getParameter("txtpass1");
   MD5 md5 = new MD5();
   pass=md5.encryptMD5(pass);
   String name=request.getParameter("txtname");
   String diachi=request.getParameter("txtaddress");
   String email=request.getParameter("txtemail");
   String phone=request.getParameter("txtphone");
  int i= khbo.dangky(un, pass,name,diachi,phone,email);
   
  if(i==1){	   
	   response.sendRedirect("HtDangKy?k=1");
   }else if(i==0){	  
	  response.sendRedirect("HtDangKy?k=0");
   }
%>
</body>
</html>
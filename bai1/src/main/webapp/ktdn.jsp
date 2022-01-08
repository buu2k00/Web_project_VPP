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
   String un=request.getParameter("txtun");
   String pass=request.getParameter("txtpass");
   MD5 md5 = new MD5();
   pass=md5.encryptMD5(pass);
   String captcha= request.getParameter("captcha");
   String txtcaptcha= request.getParameter("txtcaptcha");
    if(!txtcaptcha.equals(captcha)){
	   session.setAttribute("kt2", (long)2);
	   response.sendRedirect("HtSach");
   }
   else{  
   khachhangbean kh=khbo.ktdn(un, pass);
   if(kh!=null){
session.setAttribute("dn", kh);
	   
	   session.setAttribute("kt2", (long)1);
	   response.sendRedirect("HtVpp");
   }else{
	   
	   	   session.setAttribute("kt2", (long)0);
	   response.sendRedirect("HtVpp");
   }
   }
%>
</body>
</html>
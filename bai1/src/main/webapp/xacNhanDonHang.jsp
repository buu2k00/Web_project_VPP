<%@page import="bo.khachhangbo"%>
<%@page import="dao.khachhangdao"%>
<%@page import="bean.GioHangbean"%>
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
<%
response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
khachhangbo khbo=new khachhangbo();
String name=request.getParameter("txtname"); 

String dc=request.getParameter("txtaddress");
String sodt=request.getParameter("txtphone");
String email=request.getParameter("txtemail");
String un=request.getParameter("txtun");
String pass=request.getParameter("txtpass");
String makh=request.getParameter("txtid");
GioHangbo gh1= new GioHangbo();
ArrayList<GioHangbean> g1= new ArrayList<GioHangbean>() ;
if(session.getAttribute("gh")!=null){
	gh1=(GioHangbo) session.getAttribute("gh");
	g1=gh1.ds;
	

}
int i=khbo.xacNhan(un, pass, name, dc, sodt, email,makh,g1);
khachhangbean kh=khbo.ktdn(un, pass);
if(kh!=null){
session.setAttribute("dn", kh);
		 	   
   }
if(i==1)
{
response.sendRedirect("HtThanhToan?z=1&t=1");}
else
{
	response.sendRedirect("HtThanhToan?z=1&t=0");}



%>
</body>
</html>
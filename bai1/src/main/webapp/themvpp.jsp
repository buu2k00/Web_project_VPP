<%@page import="dao.vanphongphamdao"%>

<%@page import="bo.loaibo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
<%response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
loaibo lbo= new loaibo();
ArrayList<loaibean> dsloai=lbo.getloai();
if(request.getParameter("k")!=null && request.getParameter("k").toString().equals("1")) {%>
<script>alert('Thêm văn phòng phẩm thành công');</script>
 <%} else if(request.getParameter("k")!=null && request.getParameter("k").toString().equals("0")){ %>
 <script>alert('Mã văn phòng phẩm trùng\nHãy nhập mã khác');</script>
 <%}
if(request.getParameter("masach")!=null) 
{
String masach= request.getParameter("masach");
String tensach= request.getParameter("tensach");
String soluong= request.getParameter("soluong");
String gia= request.getParameter("gia");


String tenloai = request.getParameter("tenloai");
String anh = request.getParameter("anh");
vanphongphamdao sdao = new vanphongphamdao();
sdao.themVpp(masach, tensach, soluong, gia, tenloai, anh);
response.sendRedirect("themvpp.jsp");
}


 %>
<fieldset>

<form action="FileUploadHandler" enctype="multipart/form-data" method="post" class="form-horizontal">
<!-- Form Name" -->
<legend>THÊM VĂN PHÒNG PHẨM</legend>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Mã văn phòng phẩm</label>  
  <div class="col-md-4">
  <input id="product_id" name="masach" placeholder="Mã " class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Tên văn phòng phẩm</label>  
  <div class="col-md-4">
  <input id="product_id" name="tensach" placeholder="Tên " class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Số lượng</label>  
  <div class="col-md-4">
  <input id="product_id" name="soluong" placeholder="Số lượng" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Giá</label>  
  <div class="col-md-4">
  <input id="product_id" name="gia" placeholder="Giá" class="form-control input-md" required="" type="text">
    
  </div>
</div>






<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_categorie">Loại văn phòng phẩm</label>
  <div class="col-md-4">
    <select id="product_categorie" name="tenloai" class="form-control">

    <%for(loaibean a: dsloai)
    	out.println("<option>"+a.getTenloai()+"</option>");
    	%>
    </select>
  </div>
</div>
<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">Ảnh</label>
  <div class="col-md-4">
    <input id="filebutton" name="anh" class="input-file" type="file">
  </div>
</div>

<img alt="" src="">                           
               <!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Thêm</button>
  </div>
  </div>
  
  <!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button  class="btn btn-primary" ><a href="qlvpp.jsp" style="color:#fff;text-decoration:none;">Về quản lý văn phòng phẩm</a></button>
  </div>
  </div>
           </form>  
           
</fieldset>



           
          
           
</body>
</html>
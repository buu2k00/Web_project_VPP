<%@page import="bean.vanphongphambean"%>
<%@page import="bo.vanphongphambo"%>
<%@page import="bean.ChiTietHoaDonbean"%>
<%@page import="dao.ChiTietHoaDondao"%>
<%@page import="bean.khachhangbean"%>
<%@page import="dao.khachhangdao"%>
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

 String masach= request.getParameter("masach");
 if(masach!=null)
 {
String tensach= request.getParameter("tensach");
String soluong= request.getParameter("soluong");
String gia= request.getParameter("gia");

String tenloai = request.getParameter("tenloai");
String anh = request.getParameter("anh");
vanphongphamdao sdao = new vanphongphamdao(); 
//sdao.themSach(masach, tensach, soluong, gia, tenloai, sotap, anh, tacgia);
sdao.suaVpp(masach, tensach, gia,tenloai);
response.sendRedirect("suavpp.jsp?key="+masach);
 }

vanphongphambo sbo= new vanphongphambo();
loaibo lbo= new loaibo();
ArrayList<loaibean> dsloai=lbo.getloai();
ArrayList<vanphongphambean> dssach= sbo.getvpp();
String key= request.getParameter("key");
if(key!=null) dssach=sbo.Tim(dssach, key);
for(int i=0;i<dssach.size();i++) {
    vanphongphambean s=dssach.get(i);
%>

<fieldset>

<form action="FileUploadHandler" enctype="multipart/form-data" method="post" class="form-horizontal">
<!-- Form Name" -->
<legend>SỬA VĂN PHÒNG PHẨM</legend>
<!-- Text input-->
<div class="form-group">
  
  <div class="col-md-4">
  <input id="product_id" name="masach" value="<%=s.getMavpp() %>"  class="form-control input-md"  type="hidden">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Tên văn phòng phẩm</label>  
  <div class="col-md-4">
  <input id="product_id" name="tensach" value="<%=s.getTenvpp() %>" placeholder="Tên sách" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Giá</label>  
  <div class="col-md-4">
  <input id="product_id" name="gia" value="<%=s.getGia() %>" placeholder="Giá" class="form-control input-md" required="" type="text">
    
  </div>
</div>






<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_categorie">Loại văn phòng phẩm</label>
  <div class="col-md-4">
    <select id="product_categorie" name="tenloai" class="form-control">

    <%for(loaibean a: dsloai)
    	if(a.getMaloai().equals(s.getMaloai()))
    		out.println("<option selected>"+a.getTenloai()+"</option>");
    	else
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
    <img  src=<%=s.getAnh() %> style="width:220px;height:214px;">
 
  </div>
</div> 



                        
               <!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Sửa</button>
  </div>
  </div>
  <input  name="suasach"  type="hidden" value="ok">
  <input  name="key"  type="hidden" value="<%=key%>">
     
  <!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button  class="btn btn-primary" ><a href="qlvpp.jsp" style="color:#fff;text-decoration:none;">Về quản lý văn phòng phẩm</a></button>
  </div>
  </div>
  
           </form>  
           
</fieldset>
<%} 

%>
</body>
</html>
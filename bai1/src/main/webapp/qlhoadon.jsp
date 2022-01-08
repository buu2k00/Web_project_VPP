<%@page import="bean.ChiTietHoaDonbean"%>
<%@page import="dao.ChiTietHoaDondao"%>
<%@page import="bean.khachhangbean"%>
<%@page import="dao.khachhangdao"%>

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
ArrayList<ChiTietHoaDonbean> dshd;
khachhangdao khdao = new khachhangdao();
ChiTietHoaDondao hddao= new ChiTietHoaDondao();
if(request.getParameter("butupdate")!=null)
{
	String makh= request.getParameter("m");
	String soluong= request.getParameter("sl");
	String tam= request.getParameter("trangthai");
	long damua=((tam.equals("Chưa mua"))?(long)0:(long)1);
	String masach= request.getParameter("masach");
	String mahd= request.getParameter("mahd");
	String macthd= request.getParameter("macthd");	
	hddao.update(makh, soluong, damua, masach,mahd,macthd);	
}
if(request.getParameter("m")==null){
for(khachhangbean kh: khdao.gethdkh())
{
%>
<hr>
<p>Mã khách hàng:<a href="qlhoadon.jsp?m=<%=kh.getMakh() %>">
<%=kh.getMakh() %> </a></p>
<p>Tên khách hàng: <%=kh.getHoten() %></p> 
<%}%><button  class="btn btn-primary" ><a href="admin.jsp" style="color:#fff;text-decoration:none;">Về trang chủ</a></button> <%}
else {dshd=hddao.gethd(request.getParameter("m"));
if(dshd !=null)
{
%>

<table class="table table-hover">

<th>Stt</th><th>Mã khách hàng</th><th>Mã hóa đơn</th><th>Thời gian mua</th><th>Tên VPP</th><th>Số lượng mua</th><th>Trạng thái</th><th><button  class="btn btn-primary" ><a href="qlhoadon.jsp" style="color:#fff;text-decoration:none;">Về quản lí hóa đơn</a></button></th>
                  
                  <%
                  int n=dshd.size();
                  for(int i=0;i<n;i++) {
                    ChiTietHoaDonbean s=dshd.get(i);                   
                  %>
                  <form action="qlhoadon.jsp?m=<%=request.getParameter("m") %>" method="post">
<tr>
                       
                            
                             
                             <td><%=s.getStt()%> </td>
                            <td> <% if(request.getParameter("m")!=null) out.print(request.getParameter("m")); %> </td>
                           <td>  <%=s.getMahd() %> </td>
                           <td>  <%=s.getNgayMua() %> </td>
                             <td><%=s.getTenvpp()%> </td>
                            <td> <input type="number" name="sl" value="<%=s.getSoluongmua()%>"></td>
                               <td><select name="trangthai" class="form-control">
									<option><%=s.getMua()%></option>
									<option><%=((s.getMua().equals("Chưa mua"))?"Đã mua":"Chưa mua") %></option>
 
    	
    	
    							</select></td>
                              
                          <input type="hidden" name="masach" value="<%=s.getMavpp()%>">
                          <input type="hidden" name="mahd" value="<%=s.getMahd()%>">
                          <input type="hidden" name="macthd" value="<%=s.getMacthd()%>">
                           
                            <td> <input name="butupdate" type="submit" value="Cập nhật" class="btn-primary">   <td>
                             
     
						
                       </form>
                       <% } %>
                    </tr>
                  
              </table>
<% } }%>

<!-- in ra toan bo khach hang co quyen = true -->
<!-- neu ra ma thi phai in ra du lieu cua han de sua -->

</body>
</html>
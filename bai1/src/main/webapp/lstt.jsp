
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="dao.ChiTietHoaDondao"%>
<%@page import="bo.ChiTietHoaDonbo"%>
<%@page import="bean.ChiTietHoaDonbean"%>
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
<% response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
khachhangbean kh=(khachhangbean)session.getAttribute("dn");

GioHangbo gh1=null;
if(session.getAttribute("gh")==null){
	gh1= new GioHangbo();
	session.setAttribute("gh", gh1);
}
if(session.getAttribute("gh")!=null){
	gh1=(GioHangbo) session.getAttribute("gh");
	}

%>
<nav class="navbar navbar-inverse" ;">
  <div class="container-fluid">
    <ul class="nav navbar-nav navbar-left">
    <li><a href="HtVpp"><span class="glyphicon "></span> Trang chủ</a></li>
     <li><a href="HtGio2"><span class="glyphicon "></span> Giỏ hàng(<%=gh1.ds.size()%>)</a></li>
     <%if(kh!=null){ %>
     <li><a href="HtLS"><span class="glyphicon "></span> Lịch sử thanh toán</a></li>
     <%} %>
    
    </ul>
        <ul class="nav navbar-nav navbar-right">
        <li><a href="HtDangKy">
      <span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
		<% 
		if(kh!=null){		   
		%>
		 <li><a href="#">Xin chao: <%=kh.getHoten()%> </a></li>
           <%}else{ %>
<li><a href="#" data-toggle="modal" data-target="#myModal">
           <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
              <%  if(session.getAttribute("kt2")!=null&&session.getAttribute("kt2").toString().equals("0")){session.setAttribute("kt2",null);%>
             		 <script>alert('Dang nhap sai');</script>
              <%}   else if(session.getAttribute("kt2")!=null&&session.getAttribute("kt2").toString().equals("2")){session.setAttribute("kt2",null);%>             
             		 <script>alert('Sai captcha');</script>
              <%} %>
           <%} %>
           <% 
		if(kh!=null){		   
		%>
           <li><a href="dangxuat.jsp">
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
          <form method="post" action="ktdn.jsp">
             <label> Tên đăng nhập: </label>
 <input name="txtun" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <input name="txtpass" type="password" class="form-control">
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>
     
      </div>
    </div>
  </div>

<%


//out.println("<h3>Cookies:</h3>");
//tensach;
//out.println("<a href="+"#"+">A</a>");
response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
ArrayList<ChiTietHoaDonbean> dshd= new ArrayList<ChiTietHoaDonbean>();

ChiTietHoaDonbo hdbo= new ChiTietHoaDonbo();

if(kh!=null)
 dshd= hdbo.gethd(kh.getMakh());

if(dshd !=null)
{
%>

<table class="table table-hover">
<th>Stt</th><th>Mã khách hàng</th><th>Mã hóa đơn</th><th>Thời gian mua</th><th>Tên VPP</th><th>Số lượng mua</th><th>Trạng thái</th>
                  
                  <%
                  int n=dshd.size();
                  for(int i=0;i<n;i++) {
                    ChiTietHoaDonbean s=dshd.get(i);
                  %>
<tr>
                       
                            
                             
                             <td><%=s.getStt()%> </td>
                            <td> <% if(kh!=null) out.print(kh.getMakh()); %> </td>
                            <td>  <%=s.getMahd() %> </td>
                           <td>  <%=s.getNgayMua() %> </td>
                             <td><%=s.getTenvpp()%> </td>
                              <td><%=s.getSoluongmua()%> </td>
                              
                            <td>    <%=s.getMua()%></td> 
                                
                             
     
						
                       
                       <% } %>
                    </tr>
                  
              </table>
<% } %>

</body>
</html>
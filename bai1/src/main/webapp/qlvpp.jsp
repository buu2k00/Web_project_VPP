<%@page import="bo.GioHangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.vanphongphambean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.vanphongphambo"%>
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
  .linav{
  
  box-sizing: border-box;

  
  }
  .anav{
  text-decoration:none;
  color: #9d9d9d;
  }
  .anav:hover{
      color: #fff;
    background-color: transparent;
    text-decoration:none;
  }
  
  
  
  .ulnav{
  list-style:none;
  box-sizing: border-box;
  display:none;
  }
  .hli:hover .ulnav
  {
  display: block;
  }
  
  </style>
</head>
<body>
<%response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8"); 
khachhangbean kh=(khachhangbean)session.getAttribute("dn2");
loaibo lbo= new loaibo();
vanphongphambo sbo= new vanphongphambo();
String ml= request.getParameter("ml");
String key= request.getParameter("key");
ArrayList<vanphongphambean> dssach= sbo.getvpp();
ArrayList<loaibean> dsloai=lbo.getloai();	  
if(ml!=null) dssach= sbo.TimLoai(dssach, ml);
else
	 if(key!=null) dssach=sbo.Tim(dssach, key);
request.setAttribute("dsloai", dsloai);
request.setAttribute("dssach", dssach);

%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav navbar-left">
    <li><a href="admin.jsp"><span class="glyphicon "></span> Trang chủ</a></li>
     <li class="hli"><a href="qlvpp.jsp"><span class="glyphicon " ></span> Quản lý văn phòng phẩm<ul class="ulnav">
     <li class="linav"><a href="themvpp.jsp" class="anav"><span ></span> Thêm văn phòng phẩm</a></li>
     </ul></a></li>
     <li><a href="qlhoadon.jsp"><span class="glyphicon "></span> Quản lý hóa đơn</a></li>
     
    
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
              <%  if(session.getAttribute("kt3")!=null&&session.getAttribute("kt3").toString().equals("0")){%>
             		 <script>alert('Dang nhap sai');</script>
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
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>
     
      </div>
    </div>
  </div>
  
  
  <%
 

  %>
<table width="1000" align="center">
    
    <tr> 
       <td valign="top" width="200"> 
              <table class="table table-hover">
                 <%for(loaibean loai: dsloai) {%>
                    <tr>
                      <td>
                        <a href="qlvpp.jsp?ml=<%=loai.getMaloai() %>">
                           <%=loai.getTenloai() %>
                        </a>
                      </td>
                    </tr>
                    <%} %>
             </table>
        </td>
         <td valign="top" width="600"> 
              <table class="table table-hover">
                  <%
                  int n=dssach.size();
                  for(int i=0;i<n;i++) {
                    vanphongphambean s=dssach.get(i);
                  %>
<tr>
                       <td>
                            <img src=<%=s.getAnh() %> style="width:220px;height:214px;"><br>
                             
                             <button  class="btn btn-primary" ><a href="suavpp.jsp?key=<%=s.getMavpp() %>" style="color:#fff;text-decoration:none;">Sửa</a></button>
                             <button  class="btn btn-warning" ><a href="xoavpp.jsp?xoa=<%=s.getMavpp() %>" style="color:#fff;text-decoration:none;">Xóa</a></button>
                             <br>
                             <%=s.getTenvpp() %> <br>
                             
                             <%=s.getGia()%> <br>
     
						<%i++;
                         if(i<n){
                        	 s=dssach.get(i);
                         
                       %><td>
                            <img src=<%=s.getAnh() %> style="width:220px;height:214px;"><br>
                             
                             <button  class="btn btn-primary" ><a href="suavpp.jsp?key=<%=s.getMavpp() %>" style="color:#fff;text-decoration:none;">Sửa</a></button>
                             <button  class="btn btn-warning" ><a href="xoavpp.jsp?xoa=<%=s.getMavpp() %>" style="color:#fff;text-decoration:none;">Xóa</a></button>
                             <br>
                             <%=s.getTenvpp() %> <br>
                             
                             <%=s.getGia()%> <br>
                       </td>
                       <%} %>
                       <%i++;
                         if(i<n){
                        	 s=dssach.get(i);
                         
                       %><td>
                            <img src=<%=s.getAnh() %> style="width:220px;height:214px;"><br>
                             
                             <button  class="btn btn-primary" ><a href="suavpp.jsp?key=<%=s.getMavpp() %>" style="color:#fff;text-decoration:none;">Sửa</a></button>
                             <button  class="btn btn-warning" ><a href="xoavpp.jsp?xoa=<%=s.getMavpp() %>" style="color:#fff;text-decoration:none;">Xóa</a></button>
                             <br>
                             <%=s.getTenvpp() %> <br>
                             
                             <%=s.getGia()%> <br>
                       </td>
                       <%} %>
                    </tr>
                  <%} %>
              </table>

 
     <td valign="top" width="300"> 
        <form method="post" action="qlvpp.jsp">
        
        <label> Tìm kiếm: </label><br>
 <input name="key" type="text" class="form-control">
 <input name="but1" type="submit" value="Tìm kiếm" class="btn-primary">
 </form>                   
</table>     
         </td>
</tr>
</table>

</body>
</html>
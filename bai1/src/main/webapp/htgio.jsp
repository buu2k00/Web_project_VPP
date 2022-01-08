<%@page import="bean.vanphongphambean"%>
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
<% response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
int giohangtrong=0;

GioHangbo gh2=null;

if(session.getAttribute("gh")==null){
	gh2= new GioHangbo();
	session.setAttribute("gh", gh2);
}
if(session.getAttribute("gh")!=null){
	gh2=(GioHangbo) session.getAttribute("gh");

	}
khachhangbean kh=(khachhangbean)session.getAttribute("dn");%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  <ul class="nav navbar-nav navbar-left">
    <li><a href="HtVpp"><span class="glyphicon "></span> Trang chủ</a></li>
     <li><a href="HtGio2"><span class="glyphicon "></span> Giỏ hàng(<%=gh2.ds.size()%>)</a></li>
    <%if(kh!=null){ %>
     <li><a href="HtLS"><span class="glyphicon "></span> Lịch sử thanh toán</a></li>
     <%} %>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="HtDangKy"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
		<% 
		if(kh!=null){
		   
		%>
		 <li><a href="#">Xin chao: <%=kh.getHoten()%> </a></li>
           <%}else{ %>
<li><a href="#" data-toggle="modal" data-target="#myModal">
           <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
              <%  if(session.getAttribute("kt2")!=null&&session.getAttribute("kt2").toString().equals("0")){%>
             		 <script>alert('Dang nhap sai');</script>
              <%} %>
           <%} %>
           <% if(kh!=null){		   
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
 
  ArrayList<loaibean> dsloai=(ArrayList<loaibean>)request.getAttribute("dsloai");
  ArrayList<vanphongphambean> ds=(ArrayList<vanphongphambean>)request.getAttribute("dssach");
  %>
<table width="1000" align="center">
    
    <tr> 
       <td valign="top" width="200"> 
              <table class="table table-hover">
                 <%for(loaibean loai: dsloai) {%>
                    <tr>
                      <td>
                        <a href="HtVpp?ml=<%=loai.getMaloai() %>">
                           <%=loai.getTenloai() %>
                        </a>
                        
                      </td>
                    </tr>
                    <%} %>
             </table>
        </td>
         <td valign="top" width="600"> 
         <table class="table table-hover">
         
         
         
              <% GioHangbo gh1;
             
              
              
if(session.getAttribute("gh")!=null){
	long s=0;
	gh1=(GioHangbo) session.getAttribute("gh");
	if(request.getParameter("butxoa")!=null&&request.getParameter("xoa")!=null) gh1.xoa((String)request.getAttribute("xoa"));
	if(request.getParameter("sl")!=null) gh1.update(request.getParameter("masach"),request.getParameter("sl"));
	if(request.getParameter("xoahet")!=null) gh1.xoahet();
	for(int i=0;i<gh1.ds.size();i++) {
        GioHangbean g1=gh1.ds.get(i);%>
        <form action="HtGio2" method="post">
	<tr>
		<td>
        <img src=<%=g1.getAnh() %> style="height:164px;width:134px"> 	
         <br>
        <%=g1.getTenvpp() %> <br> 	
         
       <%=g1.getThanhtien()%> <br>
       <input type="number" name="sl" value="<%=g1.getSlmua()%>">
       <input type="hidden" name="masach" value="<%=g1.getMavpp()%>"> 
        <input type="hidden" name="xoa" value="<%=g1.getMavpp()%>">
        <button  name="butxoa" class="btn-primary" type="submit" >Xóa</button>       
        <button  name="butupdate" class="btn-primary" type="submit" >Cập nhật</button>
        <!--   <a href="HtGio2?xoa">Xóa</a>  
			<a href="HtGio2?">Cập nhật</a>  	-->
			</form>
	<% }%>
	</td>
	
	<% out.print("Tổng tiền: "+gh1.TongTien());
	if(gh1.TongTien()== 0) giohangtrong=1 ;
	}%>	 
	</tr>	
	<%if(giohangtrong!=1) {%>
<tr>	
	<a href="HtGio2?xoahet=1" class="btn-primary" style="padding: 2px 5px;
    margin: 0 6px;">Xóa hết</a>
	</tr>
	<%} %>
<tr>
	
<% 
if(giohangtrong!=1)
if(kh!=null){%>
<a href="HtThanhToan?z=1" class="btn-primary" style="padding: 2px 5px;
margin: 0px 2px;
    ">Thanh toán</a>
<%}else{ %>
<a href="HtThanhToan?z=0" class="btn-primary" style="padding: 2px 5px;
margin: 0px 2px;
   ">Thanh toán</a>
<%} %>
	</tr>
</table>
</td>

 
     <td valign="top" width="300"> 
        <form method="post" action="HtVpp">
        
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
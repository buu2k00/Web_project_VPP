<%@page import="bo.vanphongphambo"%>
<%@page import="dao.Captcha"%>
<%@page import="bo.GioHangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.vanphongphambean"%>
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
loaibo lbo= new loaibo();
vanphongphambo sbo= new vanphongphambo();
String ml= request.getParameter("ml");
String key= request.getParameter("key");
ArrayList<vanphongphambean> dssach= sbo.getvpp();
ArrayList<loaibean> dsloai=lbo.getloai();	  
if(ml!=null) dssach= sbo.TimLoai(dssach, ml);
else
	 if(key!=null) dssach=sbo.Tim(dssach, key);
GioHangbo gh1=null;
if(session.getAttribute("gh")==null){
	gh1= new GioHangbo();
	session.setAttribute("gh", gh1);
}
if(session.getAttribute("gh")!=null){
	gh1=(GioHangbo) session.getAttribute("gh");
	}
Captcha cp = new Captcha();
String captcha= cp.getCaptcha(); 
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
             <div style="background-color: gray; width:65px;padding: 1px 1px;text-align:center; "><%=captcha %></div>
             <input name="txtcaptcha" type="text" value="">
             <input name="captcha" type="hidden" value="<%=captcha %>" >
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>
     
      </div>
    </div>
  </div>
  
  
  <%

  //ArrayList<loaibean> dsloai=(ArrayList<loaibean>)request.getAttribute("dsloai");
  //ArrayList<vanphongphambean> dssach=(ArrayList<vanphongphambean>)request.getAttribute("dssach");
  %>
<table width="1000" align="center">
    
    <tr> 
       <td valign="top" width="200"> 
              <table class="table table-hover">
                 <%for(loaibean loai: dsloai) {%>
                    <tr>
                      <td>
                        <a href="HtVpp?ml=<%=loai.getMaloai() %>">
                        <span class="glyphicon glyphicon-chevron-right" style="text-indent:0px;color:Black;"></span>
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
                             <a href="giohang.jsp?ms=<%=s.getMavpp()%>&ts=<%=s.getTenvpp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
                             <img src="buynow2.jpg" width=75 height=50>
                             </a> 
                             <br>
                             <%=s.getTenvpp() %> <br>
                             
                             <%=s.getGia()%> <br>
     
						<%i++;
                         if(i<n){
                        	 s=dssach.get(i);
                         
                       %><td>
                            <img src=<%=s.getAnh() %> style="width:220px;height:214px;"><br>
                             <a href="giohang.jsp?ms=<%=s.getMavpp()%>&ts=<%=s.getTenvpp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
                             <img src="buynow2.jpg" width=75 height=50>
                             </a> 
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
                             <a href="giohang.jsp?ms=<%=s.getMavpp()%>&ts=<%=s.getTenvpp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
                             <img src="buynow2.jpg" width=75 height=50>
                             </a> 
                             <br>
                             <%=s.getTenvpp() %> <br>
                             
                             <%=s.getGia()%> <br>
                       </td>
                       <%} %>
                    </tr>
                  <%} %>
              </table>

 
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
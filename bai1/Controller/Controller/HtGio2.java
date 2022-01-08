package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;

import bean.vanphongphambean;
import bo.loaibo;

import bo.vanphongphambo;

/**
 * Servlet implementation class HtGio2
 */
@WebServlet("/HtGio2")
public class HtGio2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtGio2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			loaibo lbo= new loaibo();
		     vanphongphambo sbo= new vanphongphambo();
		     String ml= request.getParameter("ml");
		     String key= request.getParameter("key");
		     ArrayList<vanphongphambean> dssach= sbo.getvpp();
		     ArrayList<loaibean> dsloai=lbo.getloai();
		     if(request.getParameter("xoa")!=null)
					request.setAttribute("xoa",(String)request.getParameter("xoa"));			    	 		     
		     if(ml!=null) dssach= sbo.TimLoai(dssach, ml);
		     else
		    	 if(key!=null) dssach=sbo.Tim(dssach, key);
		     request.setAttribute("dsloai", dsloai);
		     request.setAttribute("dssach", dssach);
		     RequestDispatcher rd= request.getRequestDispatcher("htgio.jsp");
		     rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

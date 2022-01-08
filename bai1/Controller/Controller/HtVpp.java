package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HtVpp
 */
@WebServlet("/HtVpp")
public class HtVpp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtVpp() {
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
//			loaibo lbo= new loaibo();
//		     sachbo sbo= new sachbo();
//		     String ml= request.getParameter("ml");
//		     String key= request.getParameter("key");
//		     ArrayList<sachbean> dssach= sbo.getsach();
//		     ArrayList<loaibean> dsloai=lbo.getloai();	  
//		     if(ml!=null) dssach= sbo.TimLoai(dssach, ml);
//		     else
//		    	 if(key!=null) dssach=sbo.Tim(dssach, key);
//		     request.setAttribute("dsloai", dsloai);
//		     request.setAttribute("dssach", dssach);
		     RequestDispatcher rd= request.getRequestDispatcher("menu.jsp");
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

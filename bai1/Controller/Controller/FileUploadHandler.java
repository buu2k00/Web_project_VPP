package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import dao.vanphongphamdao;

/**
 * Servlet implementation class FileUploadHandler
 */
@WebServlet("/FileUploadHandler")
public class FileUploadHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String file_name = null;
        String masach= null;
        String tensach= null;
        String soluong= null;
        String gia= null;
        
        String tenloai = null;
        String anh = null;
        String suasach=null;
        String key=null;
       
        
        String file_name2="";
        String nameimg=null;
        
        

        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            return;
        }
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List < FileItem > fields = upload.parseRequest(request);
            Iterator < FileItem > it = fields.iterator();
            if (!it.hasNext()) {
                return;
            }
            
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                boolean isFormField = fileItem.isFormField();
                if (isFormField) {
                	
                    if (file_name == null) {
                        if (fileItem.getFieldName().equals("file_name")) {
                        	file_name = fileItem.getString();
                        }
                    }
                    if (masach == null) {
                        if (fileItem.getFieldName().equals("masach")) {
                        	masach = fileItem.getString();
                        }
                    }
                    if (tensach == null) {
                        if (fileItem.getFieldName().equals("tensach")) {
                        	tensach = fileItem.getString();
                        }
                    }
                    if (soluong == null) {
                        if (fileItem.getFieldName().equals("soluong")) {
                        	soluong = fileItem.getString();
                        }
                    }
                    if (gia == null) {
                        if (fileItem.getFieldName().equals("gia")) {
                        	gia = fileItem.getString();
                        }
                    }
                    
                    if (tenloai == null) {
                        if (fileItem.getFieldName().equals("tenloai")) {
                        	tenloai = fileItem.getString();
                        }
                        
                    }
                    if (suasach == null) {
                        if (fileItem.getFieldName().equals("suasach")) {
                        	suasach = fileItem.getString();
                        }
                        
                    }
                    if (key == null) {
                        if (fileItem.getFieldName().equals("key")) {
                        	key = fileItem.getString();
                        }
                        
                    }
                } else {
                	
                	nameimg = fileItem.getName();
                	anh="image_sach/"+nameimg;
            		if (!nameimg.equals("")) {
            	           //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
            			String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "image_sach";
            			File dir = new File(dirUrl);
            			if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
            				dir.mkdir();
            			}
            		           String fileImg = dirUrl + File.separator + nameimg;
            		           File file = new File(fileImg);//tạo file
            		            try {
            		               fileItem.write(file);//lưu file
            		              System.out.println("UPLOAD THÀNH CÔNG...!");
            		              System.out.println("Đường dẫn lưu file là: "+dirUrl);
            		 } catch (Exception e) {
            		    e.printStackTrace();
            		}
            	}
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	response.setCharacterEncoding("utf-8");
        	request.setCharacterEncoding("utf-8");
        	if(suasach!=null)
        	{
        		vanphongphamdao sdao= new vanphongphamdao();
        		if(!nameimg.equals(""))
        		{sdao.suaAnh(masach, anh);}
        		
        		//sdao.themVpp(masach, tensach, soluong, gia, tenloai, anh);
        		
                out.println("<script type='text/javascript'>");
                out.println("window.location.href='suavpp.jsp?masach="+masach+"&tensach="+tensach+"&soluong="+soluong+"&gia="+gia+"&tenloai="+tenloai+"&key="+key+"&anh="+anh+"&temp="+ new Date().getTime()+"'");
                out.println("</script>");
                System.out.println("anh"+anh);
                out.close();
        	}
        	else {
        		vanphongphamdao sdao= new vanphongphamdao();
        	int k=sdao.them(masach, anh);
        	
            out.println("<script type='text/javascript'>");
            out.println("window.location.href='themvpp.jsp?masach="+masach+"&tensach="+tensach+"&soluong="+soluong+"&gia="+gia+"&tenloai="+tenloai+"&k="+k+"&anh="+anh+"&temp="+ new Date().getTime()+"'");
            out.println("</script>");
            out.close();
        	}
        }
	}

}
   

       
   

        
    
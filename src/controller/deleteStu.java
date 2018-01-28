package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StudentinfoDao;

/**
 * Servlet implementation class deleteStu
 */
@WebServlet("/deleteStu")
public class deleteStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteStu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"
				+request.getServerPort()+path+"/";
		System.out.println(basePath);
		
		//1.取参数
		String ids=request.getParameter("id");
		
		//2.调用相应的模型实现业务逻辑处理
		StudentinfoDao dao=new StudentinfoDao();
		int iCount=dao.deleteStudent(ids);
		
		//3.根据处理结果给出不同的客户端响应
		response.setContentType("text/html; charset=gb2312");
		PrintWriter out = response.getWriter();
		out.println("  <script >");
		out.println(" alert('成功删除"+iCount/2+"条记录!')");
		out.println("window.location='"+basePath+"/studentsinfo.jsp'");
		out.println(" </script>");
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

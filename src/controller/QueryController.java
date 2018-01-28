package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.StringUtil;
import model.dao.StudentinfoDao;
import model.vo.pagesession;
import model.vo.studentinfo;

/**
 * Servlet implementation class QueryController
 */
@WebServlet("/QueryController")
public class QueryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryController() {
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
		//1.接收客户端页面发送过来的参数,必要时实行编码
				request.setCharacterEncoding("gb2312");
				String page=request.getParameter("page");
				String pagesize=request.getParameter("pagesize");
					
		//2.调用dao实现业务逻辑处理
		//封装查询条件参数
		pagesession pages=new pagesession();
		studentinfo studentCondition=new studentinfo();
		StudentinfoDao dao=new StudentinfoDao();
		
		//ArrayList<studentinfo> list=dao.query(studentCondition);
		ArrayList<studentinfo> list=dao. getAdminByPage(Integer.parseInt(page),Integer.parseInt(pagesize));
		int totalPage=(int)Math.ceil(1.0*dao.getTotalRows()/Integer.parseInt(pagesize));
		
		//3.根据dao返回的结果给出不同的客户端响应
		if(list.size()>0){
			String pagestr=StringUtil.page(Integer.parseInt(page), totalPage, basePath);
			//（1）客户端重定向，常用于直接打开目标页面，不需要传递任何数据
			//response.sendRedirect("queryResult.jsp");
			//（2）服务器端跳转（forword）,同时可以向目标页面传递各种数据
			System.out.println(totalPage);
			System.out.println(dao.getTotalRows());
			pages.setPagestr(pagestr);
			pages.setTotalPage(dao.getTotalRows());
			request.setAttribute("pages", pages);
			request.setAttribute("queryResult", list);  //key-value
			request.getRequestDispatcher("/studentsinfo.jsp").forward(request,response);	
		}
		else{
			//(3)向客户端发送纯文本的html字符串
			response.setContentType("text/html; charset=gb2312");
			PrintWriter out = response.getWriter();
			out.println("  <script >");
			out.println(" alert('暂无学生，请通知学生完善个人信息')");
			out.println("window.location='"+basePath+"/index.jsp'");
			out.println(" </script>");
			out.flush();
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"
				+request.getServerPort()+path+"/";
		System.out.println(basePath);
		
		//1.接收客户端页面发送过来的参数,必要时实行编码
		request.setCharacterEncoding("gb2312");
		String studentId=request.getParameter("studentid");
		String studentName=request.getParameter("name");
		HttpSession session = request.getSession();
		//2.调用dao实现业务逻辑处理
		//封装查询条件参数
		studentinfo studentCondition=new studentinfo();
		studentCondition.setStudentId(studentId);
		studentCondition.setStudentName(studentName);
		StudentinfoDao dao=new StudentinfoDao();
		ArrayList<studentinfo> list=dao.query(studentCondition);
		System.out.println(list.size());
		//3.根据dao返回的结果给出不同的客户端响应
		if(list.size()==1){
			session.setAttribute("studentInfo", list.get(0));  //key-value
			request.getRequestDispatcher("/mstudentinfo.jsp").forward(request,response);	
		}
		if(list.size()>1){
			//（1）客户端重定向，常用于直接打开目标页面，不需要传递任何数据
			//response.sendRedirect("queryResult.jsp");
			//（2）服务器端跳转（forword）,同时可以向目标页面传递各种数据
			request.setAttribute("queryResult", list);  //key-value
			request.getRequestDispatcher("/studentsqueryinfo.jsp").forward(request,response);	
		}
		else{
			//(3)向客户端发送纯文本的html字符串
			response.setContentType("text/html; charset=gb2312");
			PrintWriter out = response.getWriter();
			out.println("  <script >");
			out.println(" alert('未找到满足条件的数据，请重新查询')");
			out.println("window.location='"+basePath+"/querystudent.jsp'");
			out.println(" </script>");
			out.flush();
			out.close();
		}
	}

}

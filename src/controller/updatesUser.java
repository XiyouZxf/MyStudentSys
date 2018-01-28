package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.StringUtil;
import model.dao.UserDao;
import model.vo.student;

/**
 * Servlet implementation class updateUser
 */
@WebServlet("/updateUser")
public class updatesUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatesUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1.获取请求的参数,必要时进行编码转换
				request.setCharacterEncoding("gb2312");
				String newpassword=request.getParameter("newpassword1");
				String studentId=request.getParameter("uid");
				String snikname=request.getParameter("nikname");
				String semail=request.getParameter("email");
				
				//2.调用模型执行业务逻辑处理
				//封装方法调用时所需的参数
				student  student=new student();
				
				student.setStudentId(studentId);
				student.setSpwd(StringUtil.MD5(newpassword));
				student.setSnikname(snikname);
				student.setSemail(semail);
				UserDao dao=new UserDao();
				boolean success=dao.updatesUser(student);
				
				//3.客户端响应,提示后，返回queryCondition.jsp
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"
						+request.getServerPort()+path+"/";
				if(success){
					response.setContentType("text/html; charset=gb2312");
					PrintWriter out = response.getWriter();
					out.println("  <script >");
					out.println(" alert('修改成功!')");
					out.println("window.location='"+basePath+"/index.jsp'");
					out.println(" </script>");
					out.flush();
					out.close();
				}
	}

}

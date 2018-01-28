package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDao;
import model.vo.student;
import model.vo.teacher;
import util.StringUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		System.out.println(basePath);

		// 1.取参数
		request.setCharacterEncoding("gb2312");
		
		String password = request.getParameter("password");
		password=StringUtil.MD5(password);
		String code = request.getParameter("code");
		String identity = request.getParameter("RadioButtonList");
		System.out.println(identity);
		HttpSession session = request.getSession();
		String code1 = (String) session.getAttribute("code");
		if (!code.equals(code1)) {
			response.setContentType("text/html; charset=gb2312");
			PrintWriter out = response.getWriter();
			out.println("  <script >");
			out.println(" alert('您输入的验证码不正确，请重新输入')");
			out.println("window.location='" + basePath + "/login.jsp'");
			out.println(" </script>");
			out.flush();
			out.close();
			return;
		}
		

		// 2.调用相应的模型实现业务逻辑处理
		UserDao dao = new UserDao();
		if (identity.equals("教师")) {
			String tnumber = request.getParameter("username");
			System.out.println(tnumber + "," + password);
			boolean ret = dao.checkTeacherLogin(tnumber, password);

			// 3.根据处理结果给出不同的客户端响应
			if (ret) {// 成功登陆
				// 把某些全局共享的数据(可以是任何类型)存放在session中,在需要的时候取出来进行相关使用
				UserDao dao1 = new UserDao();
				teacher currentUser = dao1.findBytName(tnumber);
				session.setAttribute("currentUser", currentUser);
				response.sendRedirect(basePath + "teacherindex.jsp");
			} else { // 登陆失败
				response.setContentType("text/html; charset=gb2312");
				PrintWriter out = response.getWriter();
				out.println("  <script >");
				out.println(" alert('您输入的密码不正确，请重新输入')");
				out.println("window.location='" + basePath + "/login.jsp'");
				out.println(" </script>");
				out.flush();
				out.close();
				return;
			}
		}
		else{
			String studentid = request.getParameter("username");
			System.out.println(studentid + "," + password);
			boolean ret = dao.checkStudentLogin(studentid, password);

			// 3.根据处理结果给出不同的客户端响应
			if (ret) {// 成功登陆
				// 把某些全局共享的数据(可以是任何类型)存放在session中,在需要的时候取出来进行相关使用
				UserDao dao1 = new UserDao();
				student currentUser = dao1.findBysName(studentid);
				session.setAttribute("currentUser", currentUser);
				response.sendRedirect(basePath + "studentindex.jsp");
			} else { // 登陆失败
				response.setContentType("text/html; charset=gb2312");
				PrintWriter out = response.getWriter();
				out.println("  <script >");
				out.println(" alert('您输入的密码不正确，请重新输入')");
				out.println("window.location='" + basePath + "/login.jsp'");
				out.println(" </script>");
				out.flush();
				out.close();
				return;
			}
		}
	}
}

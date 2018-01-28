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

		// 1.ȡ����
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
			out.println(" alert('���������֤�벻��ȷ������������')");
			out.println("window.location='" + basePath + "/login.jsp'");
			out.println(" </script>");
			out.flush();
			out.close();
			return;
		}
		

		// 2.������Ӧ��ģ��ʵ��ҵ���߼�����
		UserDao dao = new UserDao();
		if (identity.equals("��ʦ")) {
			String tnumber = request.getParameter("username");
			System.out.println(tnumber + "," + password);
			boolean ret = dao.checkTeacherLogin(tnumber, password);

			// 3.���ݴ�����������ͬ�Ŀͻ�����Ӧ
			if (ret) {// �ɹ���½
				// ��ĳЩȫ�ֹ��������(�������κ�����)�����session��,����Ҫ��ʱ��ȡ�����������ʹ��
				UserDao dao1 = new UserDao();
				teacher currentUser = dao1.findBytName(tnumber);
				session.setAttribute("currentUser", currentUser);
				response.sendRedirect(basePath + "teacherindex.jsp");
			} else { // ��½ʧ��
				response.setContentType("text/html; charset=gb2312");
				PrintWriter out = response.getWriter();
				out.println("  <script >");
				out.println(" alert('����������벻��ȷ������������')");
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

			// 3.���ݴ�����������ͬ�Ŀͻ�����Ӧ
			if (ret) {// �ɹ���½
				// ��ĳЩȫ�ֹ��������(�������κ�����)�����session��,����Ҫ��ʱ��ȡ�����������ʹ��
				UserDao dao1 = new UserDao();
				student currentUser = dao1.findBysName(studentid);
				session.setAttribute("currentUser", currentUser);
				response.sendRedirect(basePath + "studentindex.jsp");
			} else { // ��½ʧ��
				response.setContentType("text/html; charset=gb2312");
				PrintWriter out = response.getWriter();
				out.println("  <script >");
				out.println(" alert('����������벻��ȷ������������')");
				out.println("window.location='" + basePath + "/login.jsp'");
				out.println(" </script>");
				out.flush();
				out.close();
				return;
			}
		}
	}
}

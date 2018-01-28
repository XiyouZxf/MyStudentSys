package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.StringUtil;
import model.dao.StudentinfoDao;
import model.dao.UserDao;
import model.vo.student;

/**
 * Servlet implementation class addStu
 */
@WebServlet("/addStu")
public class addStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addStu() {
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
		//1.��ȡ����Ĳ���,��Ҫʱ���б���ת��
		request.setCharacterEncoding("gb2312");
		String studentid = request.getParameter("studentid");
		String sname = request.getParameter("name");
		String spwd = StringUtil.MD5(studentid);
		////2.����ģ��ִ��ҵ���߼�����
		//��װ��������ʱ����Ĳ���
		student  student=new student();
		student.setStudentId(studentid);
		student.setsName(sname);
		student.setSpwd(spwd);
		UserDao dao=new UserDao();
		boolean success=dao.insertStudent(student);
		
		//3.�ͻ�����Ӧ,��ʾ�󣬷���queryCondition.jsp
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		if (success) {
			response.setContentType("text/html; charset=gb2312");
			PrintWriter out = response.getWriter();
			out.println("  <script >");
			out.println(" alert('��ӳɹ�!')");
			out.println("window.location='" + basePath + "/index.jsp'");
			out.println(" </script>");
			out.flush();
			out.close();
		}
		else{
			response.setContentType("text/html; charset=gb2312");
			PrintWriter out = response.getWriter();
			out.println("  <script >");
			out.println(" alert('���ʧ��,���������!')");
			out.println("window.location='" + basePath + "/addstudent.jsp'");
			out.println(" </script>");
			out.flush();
			out.close();
		}
	}

}

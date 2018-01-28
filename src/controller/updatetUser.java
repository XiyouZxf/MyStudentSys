package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.StringUtil;
import model.dao.UserDao;
import model.vo.student;
import model.vo.teacher;

/**
 * Servlet implementation class updatetUser
 */
@WebServlet("/updatetUser")
public class updatetUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatetUser() {
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
		String newpassword=request.getParameter("newpassword1");
		String teachernum=request.getParameter("uid");
		String tnikname=request.getParameter("nikname");
		String temail=request.getParameter("email");
		
		//2.����ģ��ִ��ҵ���߼�����
		//��װ��������ʱ����Ĳ���
		teacher  teacher=new teacher();
		
		teacher.setTeacherNum(teachernum);
		teacher.setTpwd(StringUtil.MD5(newpassword));
		teacher.setTnikname(tnikname);
		teacher.setTemail(temail);
		UserDao dao=new UserDao();
		boolean success=dao.updatetUser(teacher);
		
		//3.�ͻ�����Ӧ,��ʾ�󣬷���queryCondition.jsp
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"
				+request.getServerPort()+path+"/";
		if(success){
			response.setContentType("text/html; charset=gb2312");
			PrintWriter out = response.getWriter();
			out.println("  <script >");
			out.println(" alert('�޸ĳɹ�!')");
			out.println("window.location='"+basePath+"/index.jsp'");
			out.println(" </script>");
			out.flush();
			out.close();
		}
	}

}

package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDao;
import model.vo.student;
import model.vo.teacher;

/**
 * Servlet implementation class CheckUserName
 */
@WebServlet({ "/CheckUserName", "/CheckUserName.do" })
public class CheckUserName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		
		String userName=request.getParameter("userName");
		System.out.println(userName);
		UserDao dao=new UserDao();
		teacher user1=dao.findBytName(userName);
		student user2=dao.findBysName(userName);
		if(user1.getTeacherNum()!=null||user2.getStudentId()!=null){
			out.print("y");  
		}
		else{
			out.print("n");  
		}
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

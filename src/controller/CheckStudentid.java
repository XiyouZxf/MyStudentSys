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
 * Servlet implementation class CheckStudentid
 */
@WebServlet({ "/CheckStudentid", "/CheckStudentid.do" })
public class CheckStudentid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckStudentid() {
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
		
		String studentid=request.getParameter("studentid");
		System.out.println(studentid);
		UserDao dao=new UserDao();
		student student=dao.findBysName(studentid);
		if(student.getStudentId()==null){
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

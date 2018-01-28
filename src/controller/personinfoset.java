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

import model.dao.StudentinfoDao;
import model.dao.UserDao;
import model.vo.student;
import model.vo.studentinfo;

/**
 * Servlet implementation class personinfoset
 */
@WebServlet("/personinfoset")
public class personinfoset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personinfoset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1.获取请求的参数
				String id=request.getParameter("id");
				HttpSession session = request.getSession();
				//2.调用模型执行业务逻辑处理
				StudentinfoDao dao=new StudentinfoDao();
				studentinfo student=new studentinfo();
				student.setStudentId(id);
				ArrayList<studentinfo> list=dao.query(student);
				//3.客户端响应,根据需要向客户端返回数据
				UserDao dao1 = new UserDao();
				student currentUser = dao1.findBysName(id);
				if(list.size()<1){
					studentinfo s=new studentinfo();
					s.setStudentId(currentUser.getStudentId());
					list.add(s);
				}
				list.get(0).setStudentName(currentUser.getsName());
				session.setAttribute("studentInfo", list.get(0));  //key-value
				
				//服务器端跳转
				request.getRequestDispatcher("/mstudentinfo.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1.获取请求的参数,必要时进行编码转换
				request.setCharacterEncoding("gb2312");
				String studentId=request.getParameter("studentid");
				String studentName=request.getParameter("name");
				String imgfile=request.getParameter("imgfile");
				String studentimg=request.getParameter("imgfile");
				String gender=request.getParameter("gender");
				String birth=request.getParameter("birth");
				String oldname=request.getParameter("oldname");
				String studentsf=request.getParameter("studentsf");
				String nation=request.getParameter("nation");
				String life=request.getParameter("life");
				String province=request.getParameter("province");
				String city=request.getParameter("city");
				String sfrom=province+" "+city;
				String health=request.getParameter("health");
				String contry=request.getParameter("contry");
				String red=request.getParameter("red");
				String ocity=request.getParameter("ocity");
				//String from=request.getParameter("from");
				String fromx=request.getParameter("fromx");
				String ncity=request.getParameter("ncity");
				String yhcar2=request.getParameter("yhcar2");
				String yhcar=request.getParameter("yhcar");
				String school=request.getParameter("school");
				String weight=request.getParameter("weight");
				String height=request.getParameter("height");
				String hat=request.getParameter("hat");
				String fav[]=request.getParameterValues("favorite");
				String motion=request.getParameter("motion");
				String favorite="";
				//将多个兴趣爱好拼成一个字符串，中间以,分隔
				for(int i=0;i<fav.length;i++){
					favorite+=fav[i]+",";
				}
				//去除最后一个,
				if(favorite.length()>0)
					favorite=favorite.substring(0,favorite.length()-1);
				
				//2.调用模型执行业务逻辑处理
				//封装方法调用时所需的参数
				studentinfo  student=new studentinfo();
				student.setStudentId(studentId);
				student.setStudentName(studentName);
				student.setBirth(birth);
				student.setGender(gender);
				
				student.setImage(imgfile);
				student.setGender(gender);
				student.setBirth(birth);
				student.setOldname(oldname);
				student.setStudentsf(studentsf);
				student.setNation(nation);
				student.setLife(life);
				student.setSfrom(sfrom);
				student.setHeight(height);
				student.setContry(contry);
				student.setRed(red);
				student.setOcity(ocity);
				student.setHealth(health);
				//student.setFrom(from);
				student.setFromx(fromx);
				student.setYhcar(yhcar);
				student.setYhcar2(yhcar2);
				student.setNcity(ncity);
				student.setSchool(school);
				student.setWeight(weight);
				student.setHat(hat);
				student.setFavorite(favorite);
				student.setMotion(motion);
				StudentinfoDao dao=new StudentinfoDao();
				boolean success=dao.updateinfo(student);
		
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

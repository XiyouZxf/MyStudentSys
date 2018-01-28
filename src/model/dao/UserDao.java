package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.vo.student;
import model.vo.teacher;
import util.DBManager;

//实现用户对象的每一个业务逻辑处理操作
public class UserDao {
	
	public boolean checkTeacherLogin(String tnumber,String password)
	{
		boolean ret=false;
		DBManager db=new DBManager();
		String sql="select * from teacher where teachernum='"+tnumber;
		sql+="' and tpwd='"+password+"'";
		ResultSet rs=null;
		try {
			rs = db.executeQuery(sql);
			if(rs.next())
				ret=true;
			rs.close();
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public boolean checkStudentLogin(String studentid,String password)
	{
		boolean ret=false;
		DBManager db=new DBManager();
		String sql="select * from student where studentid='"+studentid;
		sql+="' and spwd='"+password+"'";
		ResultSet rs=null;
		try {
			rs = db.executeQuery(sql);
			if(rs.next())
				ret=true;
			rs.close();
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	/*
	 * 按用户名进行查找,将找到的纪录保存在user对象中进行返回
	 */
	public teacher findBytName(String tnumber)
	{
		teacher user=new teacher();
		
		DBManager db=new DBManager();
		String sql="select * from teacher where teachernum='"+tnumber+"'";
		ResultSet rs=null;
		try {
			rs = db.executeQuery(sql);
			if(rs.next()){
				user.setTeacherNum(tnumber);
				user.setTpwd(rs.getString("tpwd"));
				user.settName(rs.getString("tname"));
				user.setTnikname(rs.getString("tnikname"));
				user.setTemail(rs.getString("temail"));
			}
			rs.close();
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
		
	}
	public student findBysName(String studentid)
	{
		student user=new student();
		
		DBManager db=new DBManager();
		String sql="select * from student where studentid='"+studentid+"'";
		ResultSet rs=null;
		try {
			rs = db.executeQuery(sql);
			if(rs.next()){
				user.setStudentId(studentid);
				user.setSpwd(rs.getString("spwd"));
				user.setsName(rs.getString("sname"));
				user.setSnikname(rs.getString("snikname"));
				user.setSemail(rs.getString("semail"));
			}
			rs.close();
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public boolean updatesUser(student student){
		boolean ret=false;
		DBManager  db=new DBManager();
		String sql="update student set ";
		sql+="spwd='"+student.getSpwd()+"',";
		sql+="snikname='"+student.getSnikname()+"',";
		sql+="semail='"+student.getSemail()+"'";
		sql+=" where studentId='"+student.getStudentId()+"'";
		
		System.out.println(sql);
		
		try {
			int iCount=db.executeUpdate(sql);
			if (iCount>0)
				ret=true;
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
		
	}
	public boolean updatetUser(teacher teacher){
		boolean ret=false;
		DBManager  db=new DBManager();
		String sql="update teacher set ";
		sql+="tpwd='"+teacher.getTpwd()+"',";
		sql+="tnikname='"+teacher.getTnikname()+"',";
		sql+="temail='"+teacher.getTemail()+"'";
		sql+=" where teachernum='"+teacher.getTeacherNum()+"'";
		
		System.out.println(sql);
		
		try {
			int iCount=db.executeUpdate(sql);
			if (iCount>0)
				ret=true;
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
		
	}

	public boolean insertStudent(student student){
		boolean ret=false;
	
		DBManager  db=new DBManager();
		String sql1="insert into student(studentid,sname,spwd) values('";
		sql1+=student.getStudentId()+"','";
		sql1+=student.getsName()+"','";
		sql1+=student.getSpwd()+"')";
		String sql2="insert into studentinfo (studentid,sname) values('";
		sql2+=student.getStudentId()+"','"+student.getsName()+"')";

		System.out.println(sql1);System.out.println(sql2);
		
		try {
			int iCount=db.executeUpdate(sql1);db.executeUpdate(sql2);
			if (iCount>0)
				ret=true;
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
}

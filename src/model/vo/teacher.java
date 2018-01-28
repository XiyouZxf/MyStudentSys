package model.vo;

public class teacher {
	private String teacherNum;
	private String tName;
	private String temail;
	private String tnikname;
	private String tpwd;
	
	public teacher() {
		super();
	}
	public teacher(String teacherNum, String tName, String temail,
			String tnikname, String tpwd) {
		super();
		this.teacherNum = teacherNum;
		this.tName = tName;
		this.temail = temail;
		this.tnikname = tnikname;
		this.tpwd = tpwd;
	}
	public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	public String getTnikname() {
		return tnikname;
	}
	public void setTnikname(String tnikname) {
		this.tnikname = tnikname;
	}
	public String getTeacherNum() {
		return teacherNum;
	}
	public void setTeacherNum(String teacherNum) {
		this.teacherNum = teacherNum;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getTpwd() {
		return tpwd;
	}
	public void setTpwd(String tpwd) {
		this.tpwd = tpwd;
	}
	
}

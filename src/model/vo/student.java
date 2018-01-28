package model.vo;

public class student {
	private String studentId;
	private String sName;
	private String semail;
	private String snikname;
	private String spwd;

	public student() {
		super();
	}
	public student(String studentId, String sName, String semail,
			String snikname, String spwd) {
		super();
		this.studentId = studentId;
		this.sName = sName;
		this.semail = semail;
		this.snikname = snikname;
		this.spwd = spwd;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getSnikname() {
		return snikname;
	}
	public void setSnikname(String snikname) {
		this.snikname = snikname;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getSpwd() {
		return spwd;
	}
	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}
	
}

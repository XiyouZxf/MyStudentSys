<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="model.vo.studentinfo"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ѧ����Ϣ�鿴</title>
<style>
.step p{padding-left:100px;color:#003163;width:500px;text-align:center;}
	a{color:#003163; text-decoration:none;}
	a:hover{color:red;}
</style>
</head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	ArrayList<studentinfo> list=(ArrayList<studentinfo>)request.getAttribute("queryResult");
%>
<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;">
<table width="95%" style="text-align:center">
  <tr style="color:#003163; font-size:18px;">
    <td width="70">ѧ��</td>
    <td width="70">����</td>
    <td width="70">�Ա�</td>
    <td width="100">��������</td>
    <td width="150">����</td>
	<td width="70">����</td>
  </tr>
  <%
  for(int i=0;i<list.size();i++)
  {
  %>
	  <tr>
		<td><%=list.get(i).getStudentId()%></td>
		<td><%=list.get(i).getStudentName()%></td>
		<td><%=list.get(i).getGender()%></td>
		<td><%=list.get(i).getBirth()%></td>
		<td><%=list.get(i).getFavorite()%></td>
		<td width="70">
		<a href="personinfoset.do?id=<%=list.get(i).getStudentId()%>">�鿴</a>
		<a href="javascript:deleteAStudent('<%=list.get(i).getStudentId()%>')">ɾ��</a>&nbsp;
		</td>
	  </tr>                      
   <%
   }
   %>
		</table>
</div>
</body>
</html>
<script language="javascript">
	function deleteAStudent(studentId) {
		if (confirm("�Ƿ�ȷ��ɾ���ü�¼��")) {
			alert(studentId + "will be deleted!");
			window.location = "delete.do?id='" + studentId + "'";
			//ִ��ɾ������
		}
	}
</script>

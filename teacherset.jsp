<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.vo.teacher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������</title>
<style>
	.step p{padding-left:100px;color:#003163;width:500px;text-align:center;}
	th {
  width:300px;
  font-weight:normal;
    text-align: right;
}
tr{height:30px;}
</style>
</head>
<%
  teacher currentUser=(teacher)session.getAttribute("currentUser");
  if(currentUser==null)
	{
		response.sendRedirect("login.jsp");
		return;
	}	
%>
<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;">

<form action="updatetUser.do?uid=<%=currentUser.getTeacherNum()%>" method="post">
  <fieldset class="step">
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[�����޸�]</p></legend>

         
	<table width="95%" border="0">
  <tr>
    <th><label for="teachernum">ѧ��:</label></th>
    <td><input id="" type="text" name="teachernum" value="<%=currentUser.getTeacherNum()%>" readonly/></td>
  </tr>
  <tr>
    <th><label for="name">����:</label></th>
    <td><input id="" type="text" name="name" value="<%=currentUser.gettName()%>" readonly/></td>
  </tr>
  <tr>
    <th><label for="nikname">�ǳ�:</label></th>
    <td><input id="nikname" type="text" name="nikname" value="<%=currentUser.getTnikname()%>"/></td>
  </tr>
  <tr>
    <th><label for="email">����:</label></th>
    <td><input id="email" type="text" name="email" value="<%=currentUser.getTemail()%>"/></td>
  </tr>
  <tr>
    <th><label for="password">��ǰ����:</label></th>
    <td><input id="" type="password" name="password" value="<%=currentUser.getTpwd()%>" readonly/></td>
  </tr>
  <tr>
    <th><label for="newpassword1">������:</label></th>
    <td><input id="newpassword1" type="password" name="newpassword1" value=""/></td>
  </tr>
  <tr>
    <th><label for="newpassword2">����ȷ��:</label></th>
    <td><input id="newpassword2" type="password" name="newpassword2" value=""/></td>
  </tr>
</table>
 <p>
		<input id="" type="submit" name="submit" value="����"/>
	</p>
          
</fieldset>
</form>
</div>
</body>
</html>
<script>
	function checkForm(){
		/*
		*/
		if(document.getElementById("nikname").value=='')
		{
			alert("�ǳƲ���Ϊ��~!");
			return false;
		}
		
		if(document.getElementById("email").value=='')
		{
			alert("email����Ϊ��~!");
			return false;
		}
		
		if(document.getElementById("newpassword1").value=='')
		{
			alert("�����벻��Ϊ��~!");
			return false;
		}
		
		if(document.getElementById("newpassword2").value=='')
		{
			alert("ȷ�����벻��Ϊ��~!");
			return false;
		}
		
		if(document.getElementById("newpassword1").value!=document.getElementById("newpassword2").value)
		{
			alert("ȷ�����������������ͬ~!");
			return false;
		}
		
		return true;
	}
</script>
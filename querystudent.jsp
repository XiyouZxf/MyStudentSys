<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ѧ��</title>
<style>
.step p{padding-left:100px;color:#003163;width:500px;text-align:center;}
</style>
</head>

<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;">

<form action="QueryController.do" method="post" onsubmit="return checkForm();">
  <fieldset class="step">
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[����ѧ��]</p></legend>
	<p>
		<label for="studentid">ѧ��:</label>
		<input id="studentid" type="text" name="studentid" value="" />
	</p>
	<p>
		<label for="name">����:</label>
		<input id="name" type="text" name="name" value=""/>
	</p>
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
		if(document.getElementById("studentid").value==''||document.getElementById("name").value=='')
		{
			alert("������Ҫ��ѯ����Ϣ");
			return false;
		}
		
		return true;
	}
	</script>
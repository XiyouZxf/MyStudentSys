<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����¼��</title>
<style>
	.step p{padding-left:100px;color:#003163;width:500px;text-align:center;}
</style>
</head>

<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;">

<form action="addStudent.do" method="post">
  <fieldset class="step">
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[����¼��]</p></legend>
	<p>
		<label for="studentid">ѧ��:</label>
		<input id="studentid" type="text" name="studentid" value="" onblur="checkStudentid();"/><span id="userNameHint" style="position:absolute;"></span>
	</p>
	<p>
		<label for="name">����:</label>
		<input id="" type="text" name="name" value=""/>
	</p>
	<p>
		<label for="password">����:</label>
		<input id="" type="password" name="password" value="��ѧ����ͬ" readonly/>
	</p>
    <p>
		<input id="" type="submit" name="submit" value="���"/>
	</p>                
</fieldset>
</form>
</div>
</body>
</html>
<script>
	var xmlHttp;
	function createXMLHttp(){
		//1.��������
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}else{
			xmlHttp=new ActivexObject("Microsoft.XMLHTTP");
		}
	}
	
	//ʹ��ajax������ʵ��.�û���������Ϻ����û��Ƿ��Ѵ���
	function checkStudentid(){
		//
		createXMLHttp();
		//2.������صĲ���
		var userName=document.getElementById("studentid").value;
		xmlHttp.open("get","CheckStudentid.do?studentid="+userName);
		xmlHttp.onreadystatechange=callBack;
		
		//3.�����첽����
		xmlHttp.send(null);
		
	}
	
	//�ص�����
	function callBack(){
		if(xmlHttp.readyState==4){  //���������ݷ������
			if(xmlHttp.status==200){  //��������
				var text=xmlHttp.responseText;
				/*
					������Ӧ����Ӧ����������
				*/
				if(text=='y'){
					document.getElementById("userNameHint").innerHTML="<font color='green'>YES</font>";
				
				}
				else{
					document.getElementById("userNameHint").innerHTML="<font color='red'>��ѧ���Ѵ���</font>";
				}
			
			}
		}
	}
</script>
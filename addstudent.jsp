<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>新生录入</title>
<style>
	.step p{padding-left:100px;color:#003163;width:500px;text-align:center;}
</style>
</head>

<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;">

<form action="addStudent.do" method="post">
  <fieldset class="step">
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[新生录入]</p></legend>
	<p>
		<label for="studentid">学号:</label>
		<input id="studentid" type="text" name="studentid" value="" onblur="checkStudentid();"/><span id="userNameHint" style="position:absolute;"></span>
	</p>
	<p>
		<label for="name">姓名:</label>
		<input id="" type="text" name="name" value=""/>
	</p>
	<p>
		<label for="password">密码:</label>
		<input id="" type="password" name="password" value="与学号相同" readonly/>
	</p>
    <p>
		<input id="" type="submit" name="submit" value="添加"/>
	</p>                
</fieldset>
</form>
</div>
</body>
</html>
<script>
	var xmlHttp;
	function createXMLHttp(){
		//1.创建对象
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}else{
			xmlHttp=new ActivexObject("Microsoft.XMLHTTP");
		}
	}
	
	//使用ajax技术来实现.用户名输入完毕后检查用户是否已存在
	function checkStudentid(){
		//
		createXMLHttp();
		//2.设置相关的参数
		var userName=document.getElementById("studentid").value;
		xmlHttp.open("get","CheckStudentid.do?studentid="+userName);
		xmlHttp.onreadystatechange=callBack;
		
		//3.发起异步请求
		xmlHttp.send(null);
		
	}
	
	//回调函数
	function callBack(){
		if(xmlHttp.readyState==4){  //服务器数据返回完毕
			if(xmlHttp.status==200){  //操作正常
				var text=xmlHttp.responseText;
				/*
					根据响应作相应的其他处理
				*/
				if(text=='y'){
					document.getElementById("userNameHint").innerHTML="<font color='green'>YES</font>";
				
				}
				else{
					document.getElementById("userNameHint").innerHTML="<font color='red'>该学号已存在</font>";
				}
			
			}
		}
	}
</script>
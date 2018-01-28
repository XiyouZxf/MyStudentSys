<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>武汉纺织大学信息门户</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.12.3.js" type="text/javascript"></script>
<script src="js/loginjs.js" type="text/javascript" charset=utf-8></script>
</head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<body>
<div class="main">
	<div class="top">
    	<a href="http://www.wtu.edu.cn/"><img src="image/logo_school.png" width="308" height="60" alt=""/></a>
    </div>
 
    <div class="mid">
    	<div class="panel">
        	<form id="form" action="<%=basePath%>servlet/login.do" method="post" onsubmit="return oauthLogon ()">
            	<fieldset class="step">
                	<legend><img src="" />用户登录</legend>
                	<p class="user_area">
                    	<input id="user_name" type="text" name="username" onFocus="focusUserName()" onBlur="checkUserName()" onKeyDown="enterPassword(event)" onMouseOver="changeBorderColor(this)" onMouseOut="backBorderColor(this)" placeholder="学号/职工号"/>
						<span id="userNameHint"></span>
                    </p>
                	<p class="passwd_area">
                    	<input id="password" type="password" name="password" onFocus="focusPassword()" onBlur="leavePassword()" onKeyDown="enterCode(event)" onMouseOver="changeBorderColor(this)" onMouseOut="backBorderColor(this)" placeholder="密码"/>
                    </p>
                    <p id="code_area">
						<input name="code" id="code" placeholder="验证码" type="text" size="8" onFocus="focusCode()" onMouseOver="changeBorderColor(this)" onMouseOut="backBorderColor(this)" />
							<a href="javascript:changeCode();" title="点击更换">
  								<img border="0" id="codeimg" src="<%=basePath%>/servlet/ValidateCode.do"  />  
							</a>
  							<a href="javascript:changeCode();" class="change_code">换一张</a>
					</p>
                    <p class="remember_area">
                    	<input type="checkbox" id="remember_check" name="remember_check"/>
                        <span style="color:#003163;">记住我的账号</span>
                    </p>
					<p class="radio_area">
                    	<label for="RadioButtonList">教师：</label><input id="RadioButtonList" type="radio" name="RadioButtonList" value="教师" tabindex="4">
						<label for="RadioButtonList">学生：</label><input id="RadioButtonList" type="radio" name="RadioButtonList" value="学生" tabindex="4" checked="checked">
                    </p>
                    <p class="submit_area">
                    	<input id="submit_button" type="submit" name="submit" value="登录"/>
                    	<span id="msg"></span>
                    </p>
                    
        		</fieldset>
            </form>
        </div>
    </div>
    
    <div class="bottom">
    	<img src="image/weixin.jpg" width="86" />
        <div class="lx_info">
         	<span>服务热线:15002760706</span>
            <span>Email：<a href="mailto:bsxiaoyao316@qq.com">bsxiaoyao316@qq.com</a></span>
        	<span>&copy;武汉纺织大学数计学院</span>
        </div>
    </div>
</div>
</body>
</html> 

<script>


	function changeCode(){
		var timenow = new Date().getTime(); 
		document.getElementById("codeimg").src="<%=basePath%>/servlet/ValidateCode.do?v="+timenow;
	}
	
	window.onload=function ()
	{
		var oForm=document.getElementById('form');
		var oUser=document.getElementsByName('username')[0];
		var oFlag=document.getElementsByName('remember_check')[0];
		
		oForm.onsubmit=function ()
		{
			if(oFlag.checked)
			{
				setCookie('user',oUser.value,14);
			}
		}
		oUser.value=getCookie('user');
	}
	
	function setCookie(name,value,iDay)
	{
		var oDate=new Date();
		oDate.setDate(oDate.getDate()+iDay);
		
		document.cookie=name+'='+value+';expires='+oDate;
	}
	
	function getCookie(name)
	{
		var arr=document.cookie.split(';');
		for(var i=0;i<arr.length;i++)
		{
			var arr2=arr[i].split('=');
			if(arr2[0]==name)
			{
				return arr2[1];
			}
		}
		return '';
	}
	
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
	function checkUserName(){
		//
		createXMLHttp();
		//2.设置相关的参数
		var userName=document.getElementById("user_name").value;
		xmlHttp.open("get","CheckUserName.do?userName="+userName);
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
					document.getElementById("userNameHint").innerHTML="<font color='red'>NO</font>";
				}
			
			}
		}
	}
</script>


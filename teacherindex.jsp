<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.vo.teacher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ѧ����Ϣϵͳ����ʦ��</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
</head>
<%
	teacher currentUser=(teacher)session.getAttribute("currentUser");
	if(currentUser==null)
	{
		response.sendRedirect("login.jsp");
		return;
	}	
%>
<body>
<div class="header">
	<span class="logo"></span>
    <div class="hy"><span>��ӭ��<i class="i1"></i><%=currentUser.gettName()%></span><i class="i2"></i><a href="Logout.do">�˳�</a></div>
    <div class="header-bottom">
    	<div class="nav">
        	<ul>
            	<li class="current"><a href="">��ҳ</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="content">
        <!--����б�-->
        <div class="menu">
            <div class="cont">
                <ul class="mList">
                    <li>
                        <h3><span onClick="show('menu1','change1')" id="change1"></span><a href="teacherset.jsp" target="mainFrame">��������</a></h3>
                    </li>
                    <li>
                        <h3><span onClick="show('menu2','change2')" id="change2"></span><a href="addstudent.jsp" target="mainFrame">����¼��</a></h3>
                    </li>
                    <li>
                        <h3><span onClick="show('menu2','change2')" id="change2"></span><a href="QueryController.do?page=1&pagesize=4" target="mainFrame">ѧ����Ϣ�鿴</a></h3>
                    </li>
                    <li>
                        <h3><span onClick="show('menu2','change2')" id="change2"></span><a href="querystudent.jsp" target="mainFrame">ѧ������</a></h3>
                    </li>
                </ul>
            </div>
        </div>
       <div class="main">
            <!--�Ҳ�����-->
            <div class="cont">
                <div class="title"></div>
      	 		<!-- Ƕ����ҳ��ʼ -->         
                <iframe src="index.jsp"  frameborder="0" name="mainFrame" width="100%" height="522"></iframe>
                <!-- Ƕ����ҳ���� -->   
            </div>
        </div>

</div>

<div class="footer">
    <div class="footMsg">
		<a href="#">վ���ͼ</a>��Ȩ���� ��˳
	</div>
</div>
    <script type="text/javascript">
    	function show(num,change){
	    		var menu=document.getElementById(num);
	    		var change=document.getElementById(change);
	    		if(change.innerHTML==""){
	    				change.innerHTML="";
	        	}else{
						change.innerHTML="";
	            }
    		   if(menu.style.display=='none'){
    	             menu.style.display='';
    		    }else{
    		         menu.style.display='none';
    		    }
        }
    </script>
</body>
</html>

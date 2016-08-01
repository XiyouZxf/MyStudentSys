<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.vo.studentinfo"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人信息查看</title>
<style>
a{color:#003163;}
a:hovar{color:red;}
th, td {
    vertical-align: top;
}
.portlet-form-table td {
    width: 100px;
    background: url(image/f_down_bg.gif) repeat-x 100% 100%;
    padding-bottom: 4px;
}
.portlet-form-table td {
    padding: 5px;
}
.portlet-form-table th {
    width: 60px;
    text-align: right;
}
.portlet-form-table th {
    color: #003163;
	font-weight:normal;
    padding: 5px 0;
    white-space: nowrap;
}

</style>
</head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	studentinfo studenti=(studentinfo)session.getAttribute("studentInfo");
	if(studenti==null)
	{
		response.sendRedirect("login.jsp");
		return;
	}	
%>
<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;font: 12px Arial, Helvetica, sans-serif;">

<form action="personinfoset.do" method="post">
  <fieldset class="step">
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[个人信息]</p></legend>
	<table class="portlet-form-table" width="96%">
        <tbody><tr>
            <th>学号</th>
            <td>
	            <%=studenti.getStudentId()%>
            </td>
            <th>照片</th>
            <th rowspan="5">
	             <div align="center">
		             <img id="userFace" src="<%=basePath%>/image/touxiang/<%=studenti.getImage() %>" alt="个人头像" style="width:120px;height:135px;" align="center">
	           </div>	 
            </th>
        </tr>
        <tr>
            
            <th>姓名</th>
            <td>
            	<%=studenti.getStudentName() %>
            </td>
        </tr>
      	<tr>  
            <th>姓名拼音</th>
            <td>
            	
            </td>
        </tr>
        
        <tr>  
            <th>曾用名</th>
            <td>
            	<%=studenti.getOldname() %>
            </td>
        </tr>
        
      	<tr>
            <th>性别</th>
            <td>
            	<%=studenti.getGender() %>
            </td>
            
        </tr>
        
        <tr>
            <th>政治面貌</th>
            <td>
          		<%=studenti.getStudentsf() %>
            </td>
        </tr>
         
        <tr>
            <th>民族</th>
            <td>
            	<%=studenti.getNation() %>
            </td>
            <th> 婚姻状况</th>
            <td>
            	
            </td>
        </tr>
        
        <tr>
            <th>身份证件类型</th>
            <td>
            	身份证
            </td>
            
            <th> 身份证件号</th>
            <td>
            	
            </td>
        </tr>
         
        <tr>
         <th>出生日期</th>
            <td>
            	<%=studenti.getBirth() %>
            </td>
            
            <th>籍贯</th>
            <td>
            	<%=studenti.getFrom() %>
            </td>
        </tr>
        
        <tr>
            <th> 生源地</th>
            <td>
            	<%=studenti.getSfrom() %>
            </td>
            
            <th> 健康状况</th>
            <td>
            	<%=studenti.getHealth() %>
            </td>
         </tr>
          <tr>
            <th>国家地区</th>
            <td>
            	<%=studenti.getContry() %>
            </td>
            
            <th> 血型</th>
            <td>
            	<%=studenti.getRed() %>
            </td>
        </tr>
         
        <tr>
           <th>入学前户口<br>所在地</th>
            <td>
            	<%=studenti.getOcity() %>
            </td>
            
            <th>原户口性质</th>
            <td>
            	<%=studenti.getFromx() %>
            </td>
           </tr>
        
          <tr>
            <th> 入学后户口<br>所在地</th>
            <td>
            	<%=studenti.getNcity() %>
            </td>
            
            <th>银行账号</th>
            <td>
            	<%=studenti.getYhcar2() %>
            </td>
        </tr>
          <tr>
            <th>银行卡号</th>
            <td>
            	<%=studenti.getYhcar() %>
            </td>
            
            <th> 一卡通卡号</th>
            <td>
            	
            </td>
          </tr>
         <tr>
            <th>校区</th>
            <td>
            	<%=studenti.getSchool() %>
            </td>
            <th>体重</th>
            <td>
            	<%=studenti.getWeight() %>
            </td>
        </tr>
          <tr>
            
            <th> 身高</th>
            <td>
            	<%=studenti.getHeight() %>
            </td>
            
            <th>港澳台侨</th>
            <td>
            	<%=studenti.getHat() %>
            </td>
        </tr>
          <tr>
            <th>特长</th>
            <td>
            	<%=studenti.getFavorite() %>
            </td>
            <th>宗教信仰</th>
            <td>
            	<%=studenti.getMotion() %>
            </td>
        </tr> 
         </tbody></table>
    <p style="text-align:center">
		<a href="personinfo.jsp">修改</a>
	</p>                
</fieldset>

</form>
</div>
</body>
</html>


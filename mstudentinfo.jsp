<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.vo.studentinfo"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������Ϣ�鿴</title>
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
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[������Ϣ]</p></legend>
	<table class="portlet-form-table" width="96%">
        <tbody><tr>
            <th>ѧ��</th>
            <td>
	            <%=studenti.getStudentId()%>
            </td>
            <th>��Ƭ</th>
            <th rowspan="5">
	             <div align="center">
		             <img id="userFace" src="<%=basePath%>/image/touxiang/<%=studenti.getImage() %>" alt="����ͷ��" style="width:120px;height:135px;" align="center">
	           </div>	 
            </th>
        </tr>
        <tr>
            
            <th>����</th>
            <td>
            	<%=studenti.getStudentName() %>
            </td>
        </tr>
      	<tr>  
            <th>����ƴ��</th>
            <td>
            	
            </td>
        </tr>
        
        <tr>  
            <th>������</th>
            <td>
            	<%=studenti.getOldname() %>
            </td>
        </tr>
        
      	<tr>
            <th>�Ա�</th>
            <td>
            	<%=studenti.getGender() %>
            </td>
            
        </tr>
        
        <tr>
            <th>������ò</th>
            <td>
          		<%=studenti.getStudentsf() %>
            </td>
        </tr>
         
        <tr>
            <th>����</th>
            <td>
            	<%=studenti.getNation() %>
            </td>
            <th> ����״��</th>
            <td>
            	
            </td>
        </tr>
        
        <tr>
            <th>���֤������</th>
            <td>
            	���֤
            </td>
            
            <th> ���֤����</th>
            <td>
            	
            </td>
        </tr>
         
        <tr>
         <th>��������</th>
            <td>
            	<%=studenti.getBirth() %>
            </td>
            
            <th>����</th>
            <td>
            	<%=studenti.getFrom() %>
            </td>
        </tr>
        
        <tr>
            <th> ��Դ��</th>
            <td>
            	<%=studenti.getSfrom() %>
            </td>
            
            <th> ����״��</th>
            <td>
            	<%=studenti.getHealth() %>
            </td>
         </tr>
          <tr>
            <th>���ҵ���</th>
            <td>
            	<%=studenti.getContry() %>
            </td>
            
            <th> Ѫ��</th>
            <td>
            	<%=studenti.getRed() %>
            </td>
        </tr>
         
        <tr>
           <th>��ѧǰ����<br>���ڵ�</th>
            <td>
            	<%=studenti.getOcity() %>
            </td>
            
            <th>ԭ��������</th>
            <td>
            	<%=studenti.getFromx() %>
            </td>
           </tr>
        
          <tr>
            <th> ��ѧ�󻧿�<br>���ڵ�</th>
            <td>
            	<%=studenti.getNcity() %>
            </td>
            
            <th>�����˺�</th>
            <td>
            	<%=studenti.getYhcar2() %>
            </td>
        </tr>
          <tr>
            <th>���п���</th>
            <td>
            	<%=studenti.getYhcar() %>
            </td>
            
            <th> һ��ͨ����</th>
            <td>
            	
            </td>
          </tr>
         <tr>
            <th>У��</th>
            <td>
            	<%=studenti.getSchool() %>
            </td>
            <th>����</th>
            <td>
            	<%=studenti.getWeight() %>
            </td>
        </tr>
          <tr>
            
            <th> ���</th>
            <td>
            	<%=studenti.getHeight() %>
            </td>
            
            <th>�۰�̨��</th>
            <td>
            	<%=studenti.getHat() %>
            </td>
        </tr>
          <tr>
            <th>�س�</th>
            <td>
            	<%=studenti.getFavorite() %>
            </td>
            <th>�ڽ�����</th>
            <td>
            	<%=studenti.getMotion() %>
            </td>
        </tr> 
         </tbody></table>
    <p style="text-align:center">
		<a href="personinfo.jsp">�޸�</a>
	</p>                
</fieldset>

</form>
</div>
</body>
</html>


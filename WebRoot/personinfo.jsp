<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.vo.studentinfo" %>
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
	  String gender=studenti.getGender();
	  String maleChecked="";
	  String femaleChecked="";
	  if(gender!=null){
	  if(gender.equals("��"))
		maleChecked="checked";
	  if(gender.equals("Ů"))
		femaleChecked="checked";}
	  String favorite=studenti.getFavorite();
	  String singChecked="";
	  String danceChecked="";
	  String programChecked="";
	  String swingChecked="";
	  if(favorite!=null){
	  if(favorite.contains("����"))
		singChecked="checked";
	  if(favorite.contains("����"))
		danceChecked="checked";
	  if(favorite.contains("���"))
		programChecked="checked";
	  if(favorite.contains("��Ӿ"))
		swingChecked="checked";	}
%>
<body style="margin:0;padding:0;">
<div style="width:850px;margin:0 auto;">

<form action="personinfoset.do" method="post">
  <fieldset class="step">
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[������Ϣ]</p></legend>
	<table class="portlet-form-table" width="98%">
        <tbody><tr>
            <th><label for="studentId">ѧ��</label></th>
            <td>
	            <input id="" type="text" name="studentid" value="<%=studenti.getStudentId()%>" readonly=""/>
            </td>
            <th><label for="studentimg">��Ƭ</label></th>
            <th rowspan="5">
	             <div align="center">
		             <img id="userFace" src="<%=basePath%>/image/touxiang/<%=studenti.getImage() %>" alt="����ͷ��" style="width:120px;height:135px;" align="center"><label for="file">�ϴ�ͷ��:</label><input type="file" name="imgfile" value="<%=studenti.getImage() %>"/>
	           </div>	 
            </th>
        </tr>
        <tr>
            
            <th><label for="name">����</label></th>
            <td>
            	<input id="" type="text" name="name" value="<%=studenti.getStudentName()%>" readonly=""/>
            </td>
        </tr>
      	<tr>  
            <th><label for="namepy">����ƴ��</label></th>
            <td>
            	
            </td>
        </tr>
        
        <tr>  
            <th><label for="odlname">������</label></th>
            <td>
            	<input id="" type="text" name="oldname" value="<%=studenti.getOldname() %>"/>
            </td>
        </tr>
        
      	<tr>
            <th><label for="gender">�Ա�</label></th>
            <td>
            	<input name="gender" type="radio" value="��" <%=maleChecked%>/>��
		<input name="gender" type="radio" value="Ů" <%=femaleChecked%>/>Ů
            </td>
            
        </tr>
        
        <tr>
            <th><label for="studentsf">������ò</label></th>
            <td>
          		<input id="" type="text" name="studentsf" value="<%=studenti.getStudentsf() %>"/>
            </td>
        </tr>
         
        <tr>
            <th><label for="nation">����</label></th>
            <td>
            	<input id="" type="text" name="nation" value="<%=studenti.getNation() %>"/>
            </td>
            <th><label for="life">����״��</label></th>
            <td>
            	<input id="" type="text" name="life" value="<%=studenti.getLife() %>"/>
            </td>
        </tr>
        
        <tr>
            <th><label for="sfl">���֤����</label></th>
            <td>
            	<input id="" type="text" name="sfl" value="���֤"/>
            </td>
            
            <th><label for="sfnumber">���֤����</label></th>
            <td>
            	
            </td>
        </tr>
         
        <tr>
         <th><label for="birth">��������</label></th>
            <td>
            	<input id="" type="text" name="birth" value="<%=studenti.getBirth()%>"/>
            </td>
            
            <th><label for="from">����</label></th>
            <td>
            	<input id="" type="text" name="from" value="<%=studenti.getFrom() %>"/>
            </td>
        </tr>
        
        <tr>
            <th><label for="sfrom">��Դ��</label></th>
            <td>
            	<!--<input id="" type="text" name="sfrom" value=""/>-->
				<select name="province" id="province" onchange="queryCity();">
      				<option>��ѡ��ʡ��</option>
      				<option value="����">����</option>
      				<option value="����">����</option>
    			</select>
				<select name="city" id="city"></select>
            </td>
            
            <th><label for="health">����״��</label></th>
            <td>
            	<input id="" type="text" name="health" value="<%=studenti.getHealth() %>"/>
            </td>
         </tr>
          <tr>
            <th><label for="contry">���ҵ���</label></th>
            <td>
            	<input id="" type="text" name="contry" value="<%=studenti.getContry() %>"/>
            </td>
            
            <th><label for="red">Ѫ��</label></th>
            <td>
            	<input id="" type="text" name="red" value="<%=studenti.getRed() %>"/>
            </td>
        </tr>
         
        <tr>
           <th><label for="ocity">��ѧǰ����<br>���ڵ�</label></th>
            <td>
            	<input id="" type="text" name="ocity" value="<%=studenti.getOcity() %>"/>
            </td>
            
            <th><label for="fromx">ԭ��������</label></th>
            <td>
            	<input id="" type="text" name="fromx" value="<%=studenti.getFromx() %>"/>
            </td>
           </tr>
        
          <tr>
            <th><label for="ncity">��ѧ�󻧿�<br>���ڵ�</label></th>
            <td>
            	<input id="" type="text" name="ncity" value="<%=studenti.getNcity() %>"/>
            </td>
            
            <th><label for="yhcar2">�����˺�</label></th>
            <td>
            	<input id="" type="text" name="yhcar2" value="<%=studenti.getYhcar2() %>"/>
            </td>
        </tr>
          <tr>
            <th><label for="yhcar">���п���</label></th>
            <td>
            	<input id="" type="text" name="yhcar" value="<%=studenti.getYhcar() %>"/>
            </td>
            
            <th><label for="onecar">һ��ͨ����</label></th>
            <td>
            	
            </td>
          </tr>
         <tr>
            <th><label for="school">У��</label></th>
            <td>
            	<input id="" type="text" name="school" value="<%=studenti.getSchool() %>"/>
            </td>
            <th><label for="weight">����</label></th>
            <td>
            	<input id="" type="text" name="weight" value="<%=studenti.getWeight() %>"/>
            </td>
        </tr>
          <tr>
            
            <th><label for="height">���</label></th>
            <td>
            	<input id="" type="text" name="height" value="<%=studenti.getHeight() %>"/>
            </td>
            
            <th><label for="hat">�۰�̨��</label></th>
            <td>
            	<input id="" type="text" name="hat" value="<%=studenti.getHat() %>"/>
            </td>
        </tr>
          <tr>
            <th><label for="favorite">��Ȥ����:</label></th>
            <td>
            	<input type="checkbox" name="favorite" value="����" <%=singChecked%>/>����
		<input type="checkbox" name="favorite" value="����" <%=danceChecked%>/>����
		<input type="checkbox" name="favorite" value="���" <%=programChecked%>/>���
		<input type="checkbox" name="favorite" value="��Ӿ" <%=swingChecked%>/>��Ӿ
            </td>
            <th><label for="motion">�ڽ�����</label></th>
            <td>
            	<input id="" type="text" name="motion" value="<%=studenti.getMotion() %>"/>
            </td>
        </tr> 
         </tbody></table>
    <p style="text-align:center">
		<input id="" type="submit" name="submit" value="����"/>
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
	
function queryCity(){
		createXMLHttp();
		//2.������صĲ���
		var province=document.getElementById("province").value;
		xmlHttp.open("get","QueryCity.do?province="+province);
		xmlHttp.onreadystatechange=fillCitycallBack;
		
		//3.�����첽����
		xmlHttp.send(null);
	
	
	}
	
	function fillCitycallBack(){
		if(xmlHttp.readyState==4){  //���������ݷ������	
			if(xmlHttp.status==200){  //��������
				var text=xmlHttp.responseText;
				var ose=document.getElementById("city");
	
				/*
					������Ӧ����Ӧ����������
				*/
				text='{"province":'+text+"}";
				var cityObj=eval("("+text+")");
			
					for(var i=0;i<cityObj.province.length;i++){
					var oop=document.createElement('option');
						ose.appendChild(oop);
						
						oop.value=cityObj.province[i].city;
						oop.innerHTML=cityObj.province[i].city;
				}
				
			}
		}
	
	}
</script>
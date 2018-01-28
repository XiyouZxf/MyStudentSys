<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.vo.studentinfo" %>
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
	  if(gender.equals("男"))
		maleChecked="checked";
	  if(gender.equals("女"))
		femaleChecked="checked";}
	  String favorite=studenti.getFavorite();
	  String singChecked="";
	  String danceChecked="";
	  String programChecked="";
	  String swingChecked="";
	  if(favorite!=null){
	  if(favorite.contains("唱歌"))
		singChecked="checked";
	  if(favorite.contains("跳舞"))
		danceChecked="checked";
	  if(favorite.contains("编程"))
		programChecked="checked";
	  if(favorite.contains("游泳"))
		swingChecked="checked";	}
%>
<body style="margin:0;padding:0;">
<div style="width:850px;margin:0 auto;">

<form action="personinfoset.do" method="post">
  <fieldset class="step">
	<legend><p style="border:1px #003163 solid;color:#999;background:#333; ">[个人信息]</p></legend>
	<table class="portlet-form-table" width="98%">
        <tbody><tr>
            <th><label for="studentId">学号</label></th>
            <td>
	            <input id="" type="text" name="studentid" value="<%=studenti.getStudentId()%>" readonly=""/>
            </td>
            <th><label for="studentimg">照片</label></th>
            <th rowspan="5">
	             <div align="center">
		             <img id="userFace" src="<%=basePath%>/image/touxiang/<%=studenti.getImage() %>" alt="个人头像" style="width:120px;height:135px;" align="center"><label for="file">上传头像:</label><input type="file" name="imgfile" value="<%=studenti.getImage() %>"/>
	           </div>	 
            </th>
        </tr>
        <tr>
            
            <th><label for="name">姓名</label></th>
            <td>
            	<input id="" type="text" name="name" value="<%=studenti.getStudentName()%>" readonly=""/>
            </td>
        </tr>
      	<tr>  
            <th><label for="namepy">姓名拼音</label></th>
            <td>
            	
            </td>
        </tr>
        
        <tr>  
            <th><label for="odlname">曾用名</label></th>
            <td>
            	<input id="" type="text" name="oldname" value="<%=studenti.getOldname() %>"/>
            </td>
        </tr>
        
      	<tr>
            <th><label for="gender">性别</label></th>
            <td>
            	<input name="gender" type="radio" value="男" <%=maleChecked%>/>男
		<input name="gender" type="radio" value="女" <%=femaleChecked%>/>女
            </td>
            
        </tr>
        
        <tr>
            <th><label for="studentsf">政治面貌</label></th>
            <td>
          		<input id="" type="text" name="studentsf" value="<%=studenti.getStudentsf() %>"/>
            </td>
        </tr>
         
        <tr>
            <th><label for="nation">名族</label></th>
            <td>
            	<input id="" type="text" name="nation" value="<%=studenti.getNation() %>"/>
            </td>
            <th><label for="life">婚姻状况</label></th>
            <td>
            	<input id="" type="text" name="life" value="<%=studenti.getLife() %>"/>
            </td>
        </tr>
        
        <tr>
            <th><label for="sfl">身份证类型</label></th>
            <td>
            	<input id="" type="text" name="sfl" value="身份证"/>
            </td>
            
            <th><label for="sfnumber">身份证件号</label></th>
            <td>
            	
            </td>
        </tr>
         
        <tr>
         <th><label for="birth">出生日期</label></th>
            <td>
            	<input id="" type="text" name="birth" value="<%=studenti.getBirth()%>"/>
            </td>
            
            <th><label for="from">籍贯</label></th>
            <td>
            	<input id="" type="text" name="from" value="<%=studenti.getFrom() %>"/>
            </td>
        </tr>
        
        <tr>
            <th><label for="sfrom">生源地</label></th>
            <td>
            	<!--<input id="" type="text" name="sfrom" value=""/>-->
				<select name="province" id="province" onchange="queryCity();">
      				<option>请选择省市</option>
      				<option value="湖北">湖北</option>
      				<option value="湖南">湖南</option>
    			</select>
				<select name="city" id="city"></select>
            </td>
            
            <th><label for="health">健康状况</label></th>
            <td>
            	<input id="" type="text" name="health" value="<%=studenti.getHealth() %>"/>
            </td>
         </tr>
          <tr>
            <th><label for="contry">国家地区</label></th>
            <td>
            	<input id="" type="text" name="contry" value="<%=studenti.getContry() %>"/>
            </td>
            
            <th><label for="red">血型</label></th>
            <td>
            	<input id="" type="text" name="red" value="<%=studenti.getRed() %>"/>
            </td>
        </tr>
         
        <tr>
           <th><label for="ocity">入学前户口<br>所在地</label></th>
            <td>
            	<input id="" type="text" name="ocity" value="<%=studenti.getOcity() %>"/>
            </td>
            
            <th><label for="fromx">原户口性质</label></th>
            <td>
            	<input id="" type="text" name="fromx" value="<%=studenti.getFromx() %>"/>
            </td>
           </tr>
        
          <tr>
            <th><label for="ncity">入学后户口<br>所在地</label></th>
            <td>
            	<input id="" type="text" name="ncity" value="<%=studenti.getNcity() %>"/>
            </td>
            
            <th><label for="yhcar2">银行账号</label></th>
            <td>
            	<input id="" type="text" name="yhcar2" value="<%=studenti.getYhcar2() %>"/>
            </td>
        </tr>
          <tr>
            <th><label for="yhcar">银行卡号</label></th>
            <td>
            	<input id="" type="text" name="yhcar" value="<%=studenti.getYhcar() %>"/>
            </td>
            
            <th><label for="onecar">一卡通卡号</label></th>
            <td>
            	
            </td>
          </tr>
         <tr>
            <th><label for="school">校区</label></th>
            <td>
            	<input id="" type="text" name="school" value="<%=studenti.getSchool() %>"/>
            </td>
            <th><label for="weight">体重</label></th>
            <td>
            	<input id="" type="text" name="weight" value="<%=studenti.getWeight() %>"/>
            </td>
        </tr>
          <tr>
            
            <th><label for="height">身高</label></th>
            <td>
            	<input id="" type="text" name="height" value="<%=studenti.getHeight() %>"/>
            </td>
            
            <th><label for="hat">港澳台侨</label></th>
            <td>
            	<input id="" type="text" name="hat" value="<%=studenti.getHat() %>"/>
            </td>
        </tr>
          <tr>
            <th><label for="favorite">兴趣爱好:</label></th>
            <td>
            	<input type="checkbox" name="favorite" value="唱歌" <%=singChecked%>/>唱歌
		<input type="checkbox" name="favorite" value="跳舞" <%=danceChecked%>/>跳舞
		<input type="checkbox" name="favorite" value="编程" <%=programChecked%>/>编程
		<input type="checkbox" name="favorite" value="游泳" <%=swingChecked%>/>游泳
            </td>
            <th><label for="motion">宗教信仰</label></th>
            <td>
            	<input id="" type="text" name="motion" value="<%=studenti.getMotion() %>"/>
            </td>
        </tr> 
         </tbody></table>
    <p style="text-align:center">
		<input id="" type="submit" name="submit" value="保存"/>
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
	
function queryCity(){
		createXMLHttp();
		//2.设置相关的参数
		var province=document.getElementById("province").value;
		xmlHttp.open("get","QueryCity.do?province="+province);
		xmlHttp.onreadystatechange=fillCitycallBack;
		
		//3.发起异步请求
		xmlHttp.send(null);
	
	
	}
	
	function fillCitycallBack(){
		if(xmlHttp.readyState==4){  //服务器数据返回完毕	
			if(xmlHttp.status==200){  //操作正常
				var text=xmlHttp.responseText;
				var ose=document.getElementById("city");
	
				/*
					根据响应作相应的其他处理
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
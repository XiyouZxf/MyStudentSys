// JavaScript Document


function leaveUserName(){
	var name=$("#user_name").val();
	if(""==name || "学号/职工号"==name){
		$("#user_name").val("学号/职工号");
		$("#user_name")[0].style.color="#B7B7B9";
	}
}

function focusUserName(){
	var name=$("#user_name").val();
	if(""!=name && "学号/职工号"!=name){
		$("#user_name")[0].style.color="#043367";
		
	}
}


function focusCode(){
	var coded=$("#code").val();
	if(""!=coded && "验证码"!=coded){
		$("#code")[0].style.color="#043367";
	}
}

function enterPassword(keypressed){
	var key;
    if (document.all) {
        key=window.event.keyCode;
    }
    else {
        key=keypressed.which;
    };
	if(key==13){
		$("#password").focus();
	}
	else{
		var name=$("#user_name").val();
		if(""==name || "学号/职工号"==name){
			$("#user_name").val("");
			$("#user_name")[0].style.color="#043367";
		}
	}
}
function enterCode(keypressed){
	var key;
    if (document.all) {
        key=window.event.keyCode;
    }
    else {
        key=keypressed.which;
    };
	if(key==13){
		$("#code_area").show();
		$("#code").focus();
	}
	else{
		var password=$("#password").val();
		if(""==password || "密码"==password){
			$("#password").val("");
			$("#password")[0].style.color="#043367";
		}
	}
}

function focusPassword(){
  var val = $("#password").val();
  if("密码"==val){
       $("#password")[0].outerHTML="<input type='password' id='password'  name='password' tabIndex = '2' value='' onFocus='focusPassword()' onblur='leavePassword()' onKeyDown='enterCode(event)'  onMouseOver='changeBorderColor(this)' onMouseOut='backBorderColor(this)'/>";
       $("#password")[0].style.color="#043367";
       $("#password").focus();
  }
  $("#password").select();
}
function leavePassword(){
  var name=$("#user_name").val();
  var val = $("#password").val();
  if(""==val){
	   $("#password")[0].outerHTML="<input type='text' id='password' name='password' tabIndex = '2'  value='密码' onFocus='focusPassword()' onblur='leavePassword()' onKeyDown='enterCode(event)'  onMouseOver='changeBorderColor(this)' onMouseOut='backBorderColor(this)''/>";
	   $("#password")[0].style.color="#B7B7B9";
  }
  else if("密码"!=val && ""!= name && "学号/职工号"!=name){
	   $("#code_area").show();
  }
}

function enterCode(keypressed){
	var key;
    if (document.all) {
        key=window.event.keyCode;
    }
    else {
        key=keypressed.which;
    };

	if(key==13){
		if($("#user_name").val()=="" || $("#user_name").val()=="学号/职工号"){
			$("#user_name").focus();
			$("#valid_code").select();
		}
	}
}

function oauthLogon () {
   if($("#user_name").val()=="" || $("#user_name").val()=="学号/职工号") { 
     	$("#msg").html("<img src=\"./image/error.png\"/>账号不能为空");
     	$("#user_name").focus();
		return false;
   }else if($("#password").val()=="" ||	$("#password").val()=="密码") { 
     	$("#msg").html("<img src=\"./image/error.png\"/>密码不能为空");
     	$("#password").focus();
		return false;
   }
   else if($("#code_area")[0].style.display=="block" && 
   		($("#code").val()==""  || $("#code").val()=="验证码")) { 
   		$("#msg").html("<img src=\"./image/error.png\"/>验证码不能为空");
     	$("#code").focus();
		return false;
   }
   else
   	return true;
   
}

function changeBorderColor(obj){
	obj.style.border="1px solid #B40605";
}
function backBorderColor(obj){
	obj.style.border="1px solid ";
}
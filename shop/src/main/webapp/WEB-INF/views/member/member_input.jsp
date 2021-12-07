<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#section{
			width: 1000px;
			height: 600px;
			margin: auto;
			padding-top: 50px;
		}
		table{
			width: 500px;
			margin: auto;
			padding-left: 50px;
		}
		input[type=text], input[type=password]{
			width: 380px;
			height: 40px;
			font-size: 17px;
			margin-top: 10px;
			padding-left: 20px;
			border: 1px solid mediumseagreen;
		}
		input[type=submit]{
			width: 406px;
			height: 40px;
			font-size: 17px;
			margin-top: 10px;
			background: mediumseagreen;
			border: 1px solid mediumseagreen;
			color: white;
			font-weight: bold;
		}
		#inputId, #inputName, #inputEmail, #inputPhone{
			color: red;
			display: none;
		}
	</style>
	<script>
		var uchk = 1;
		var pchk = 1;
		function userid_check(userid) // 아이디 중복 체크 
		{
			var chk = new XMLHttpRequest();
			chk.open("get", "userid_check?userid="+userid);
			chk.send();
			if(userid == "")
			{
				uchk = 1;	
			}
			else
			{
				chk.onreadystatechange = function()
				{
					if(chk.readyState == 4)
					{
						// alert(chk.responseText);
						if(chk.responseText == 1)
						{
							document.getElementById("uc").innerText = "사용 불가능한 아이디";
							document.getElementById("uc").style.color = "red";
							uchk = 1;
						}
						else
						{
							document.all.uc.innerText = "사용 가능한 아이디";
							document.getElementById("uc").style.color = "blue";
							uchk = 0;
						}
					}
				}
			}	
		}
		
		function send(my) // submit 버튼을 클릭하면
		{
			if(uchk == 1)
			{
				document.getElementById("inputId").style.display = "table-row";
				document.getElementById("uc").innerHTML = "";
				return false;
			}
			else
			{
				document.getElementById("inputId").style.display = "none";
			}
			if(my.name.value.length == 0)
			{
				document.getElementById("inputName").style.display = "table-row";
				return false;
			}
			else
			{
				document.getElementById("inputName").style.display = "none";
			}
			if(pchk == 1)
			{
				alert("비밀번호 확인하세요!");
				return false;
			}
			if(my.email.value.length == 0)
			{
				document.getElementById("inputEmail").style.display = "table-row";
				return false;
			}
			else
			{
				document.getElementById("inputEmail").style.display = "none";
			}
			if(my.phone.value.length == 0)
			{
				document.getElementById("inputPhone").style.display = "table-row";
				return false;
			}
			else
			{
				document.getElementById("inputPhone").style.display = "none";
			}
			
			return true;			
		}
		
		function pwd_check(my)
		{
			if(my.pwd2.value.length > 0)
			{
				if(my.pwd.value == my.pwd2.value)
				{
				    document.getElementById("pc").innerText="비밀번호가 일치합니다";
				    document.getElementById("pc").style.color="blue";
				    pchk = 0;
				}	
				else
			    {
				    document.getElementById("pc").innerText="비밀번호가 일치하지 않습니다.";
				    document.getElementById("pc").style.color="red";
					pchk = 1;
			   	}
			}
		}
		
	</script>
</head>
<body>
	<div id="section">
	<form method="post" name="myinput" action="member_input_ok" onsubmit="return send(this)">
		<table>
		<caption><h2>회원 가입</h2></caption>
			<tr>
				<td> 
					<input type="text" name="userid" placeholder="ID" onblur="userid_check(this.value)">
					<br> <span id="uc"></span> 
				</td>
			</tr>
			<tr id="inputId">
				<td> 아이디를 입력하세요 </td>
			</tr>
			<tr>
				<td> <input type="text" name="name" placeholder="이름" > </td>
			</tr>
			<tr id="inputName">
				<td> 이름을 입력하세요 </td>
			</tr>
			<tr>
				<td> <input type="password" name="pwd" placeholder="비밀번호" onblur="pwd_check(this.form)"> </td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwd_check(this.form)">
					<br> <span id="pc"> </span>
				</td>
			</tr>
			<tr>
				<td> <input type="text" name="email" placeholder="이메일"> </td>
			</tr>
			<tr id="inputEmail">
				<td> 이메일 입력하세요 </td>
			</tr>
			<tr>
				<td> <input type="text" name="phone" placeholder="전화번호"> </td>
			</tr>
			<tr id="inputPhone">
				<td> 전화번호 입력하세요 </td>
			</tr>
			<tr>
				<td> <input type="submit" value="가 입 하 기"> </td>
			</tr>
		</table>	
	</form>
	</div>
</body>
</html>
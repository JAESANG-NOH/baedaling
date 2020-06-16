<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
function bgLabel(ob, id) {
    if(!ob.value) {
	    document.getElementById(id).style.display="";
    } else {
	    document.getElementById(id).style.display="none";
    }
}

function sendLogin(){
	var f = document.loginForm;

	var str = f.userId.value;
	if(!str) {
	    alert("아이디를 입력하세요. ");
	    f.userId.focus();
	    return;
	}

	str = f.userPwd.value;
	if(!str) {
	    alert("패스워드를 입력하세요. ");
	    f.userPwd.focus();
	    return;
	}

	f.action = "<%=cp%>/user/login";
	f.submit();
}
</script>
<link rel="stylesheet" href="<%=cp%>/resource/css/loginform.css" type="text/css">

	<div class="body-container" >
		<div style="border:1px solid gray; width: 400px; margin: 50px auto; padding-top: 30px;">
			<div style="text-align: center;">
				<span style="font-weight: bold; font-size: 25px; color: black;">로그인</span>
			</div>
			
			<form action="loginForm" name="loginForm" method="post">
			<table style="margin: 15px auto; width: 100%; border-spacing: 0px;">
				<tr align="center" height="60">
					<td> 
					 	<label class="lbl">아이디</label>
						<input type="text" name="userId" id="userId" class="loginTF" maxlength="15">
					</td>
				</tr>
				<tr align="center" height="60">
					<td>
						<label class="lbl">패스워드</label>
						<input type="text" name="userPwd" id="userPwd" class="loginTF" maxlength="15">
					</td>
				</tr>
		  		<tr align="center" height="65" > 
		      		<td>
		        		<button type="button" onclick="sendLogin();" class="loginBtn">로그인</button>
		      		</td>
		  		</tr>
		  		<tr align="center" height="65">
		      		<td>
		       			<a href="<%=cp%>/">아이디찾기</a>&nbsp;&nbsp;&nbsp;
		       			<a href="<%=cp%>/">비밀번호찾기</a>&nbsp;&nbsp;&nbsp;
		      			<p style="color:gray;">아직&nbsp;회원이&nbsp;아니신가요? <a href="<%=cp%>/">회원가입</a></p>
		      		</td>
		  		</tr>
			</table>
			</form>	
		</div>
	</div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.body-container {
    clear:both;
    box-sizing: border-box;  /* padding과 border는 크기에 포함되지 않음 */
    margin: 0px auto 15px;
    min-height: 500px;
    padding-top: 20px;
}

.btnConfirm {
	font-size: 15px; 
	border:none;
	color:#ffffff;
	background: #69cccc;
	width: 360px;
	height: 50px;
	line-height: 50px;
	border-radius:4px;
}

.re-password {
	font-size: 15px; 
	border:none;
	color:#ffffff;
	width: 360px;
	height: 50px;
	line-height: 50px;
	border-radius:4px;
}


.messageBox {
	margin-top: 20px;
	width: 420px; min-height: 150px;
	line-height: 100px;
	border: 1px solid #69cccc;
	padding: 5px;
	color:#333333;
	font-size:14px;
	text-align: center;
	border-radius:4px;
}

</style>
</head>
<body>


<div class="body-container">

    <div style="margin: 0px auto; padding-top:90px; width:420px;">
    	<div style="text-align: center;">
        	<span style="font-weight: bold; font-size:27px; color: #424951;"><strong>회원 탈퇴</strong></span>
        </div>
        
        <div class="messageBox">
            <div style="line-height: 150%; padding-top: 35px;">
                 <!-- 	   탈퇴 하시겠습니까? <p>
                 	   회원 탈퇴를 위한 비밀번호를 다시 한번 입력해주세요. -->
                 <!-- 	개인정보 보호를 위해 비밀번호를 다시 한번 입력해주세요.   -->
                 ${message}
            </div>
            <div style="margin-top: 20px;">
            		 <div class="re-password">
            		 	<input type="text" name="password" style="width: 300px; height: 46px; padding-left: 28px; margin-left: 43px;">
            		 </div>
                     <button type="button" onclick="javascript:location.href='<%=cp%>/';" class="btnConfirm">확&nbsp;&nbsp;인</button>
            </div>
        </div>
     </div>   

</div>
</body>
</html>
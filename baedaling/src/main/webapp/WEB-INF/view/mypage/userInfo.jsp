<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/mypage_user.css" type="text/css">

<div class="mypage_container">
    <div class="body-container">
        <div class="body-left">
            <div class="list-group">
                <div class="list-group-item lefthead"> 마이페이지</div>
                <a href="<%=cp%>/mypage/userInfo" class="list-group-item active">회원정보</a>
                <a href="<%=cp%>/mypage/userorderList" class="list-group-item">주문내역</a>
                <a href="#" class="list-group-item">내가 쓴 게시물</a>
                <a href="#" class="list-group-item">내가 쓴 리뷰</a>
                <a href="#" class="list-group-item">내가 쓴 댓글</a>
                <a href="<%=cp%>/mypage/message" class="list-group-item">회원정보수정</a>
                <a href="#" class="list-group-item">회원탈퇴</a>
            </div>     
        </div>
    
        <div class="body-right">
            <div class="body-right-container">
                 <div class="body-title">
                     <h3><span style="font-family: Webdings">4</span> 마이페이지 </h3>
                 </div>
                 <div id="mypage_container">
                 	<div class="alert-info">
			    		<p style="text-align: center;"><i class="fas fa-info-circle"></i>
			    		<span style="font-weight: bold; font-size: 16px;">&nbsp;${sessionScope.user.userName}</span>님의 회원 정보입니다. </p>
					</div>
                      <div class="mypage_box">
	                      <table border="1" style="border-color:#cccccc; margin: auto; width:95%; border-collapse: collapse; border-spacing: 0;">
	                      	<tr align="center" height="35" >
	                      		<td>아이디</td>
	                      		<td>${dto.userId}</td>
	                      	</tr>
	                      	<tr align="center" height="35">
	                      		<td>이&nbsp;름</td>
	                      		<td>${dto.userName}</td>
	                      	</tr>
	                      	<tr align="center" height="35">
	                      		<td>생년월일</td>
	                      		<td>${dto.birth}</td>
	                      	</tr>
	                      	<tr align="center" height="35">
	                      		<td>전화번호</td>
	                      		<td>${dto.tel}</td>
	                      	</tr>
	                      	<tr align="center" height="35">
	                      		<td>이메일</td>
	                      		<td>${dto.email}</td>
	                      	</tr>
	                      	<tr align="center" height="35">
	                      		<td>주&nbsp;소</td>
	                      		<td>
	                      			[&nbsp;${dto.zip}&nbsp;] ${dto.addr1} <br>
	                      									 ${dto.addr2}
	                      			</td>
	                      	</tr>
	                      	<tr align="center" height="35">
	                      		<td>가입날짜</td>
	                      		<td>${dto.created_date}</td>
	                      	</tr>
	                      </table>
                      </div>
                 </div>
            </div>
        </div>
    </div>        
</div>

</body>
</html>
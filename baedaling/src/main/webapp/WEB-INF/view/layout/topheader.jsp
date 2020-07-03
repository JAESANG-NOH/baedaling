<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:if test="${empty sessionScope.user}">
<div align="right" style="background: #fbfbfb; height: 25px; font-size: 15px; color: #C8C8C8; margin-right:100px; height: 30px; line-height: 32px;" > 
		<a href="<%=cp%>/user/login">로그인</a> &nbsp;|&nbsp;
		<a href="<%=cp%>/user/joincheck">회원가입</a>
</div>
</c:if>

<c:if test="${not empty sessionScope.user}">
<div align="right" style="background: #fbfbfb; height: 25px; font-size: 15px; color: #C8C8C8; margin-right:100px; " > 
		<a href="<%=cp%>/user/logout">로그아웃</a> &nbsp;|&nbsp;
		<c:if test="${sessionScope.user.separate=='0'}">
			<a href="<%=cp%>/mypage/userInfo">마이페이지</a>
		</c:if>
		<c:if test="${sessionScope.user.separate=='2'}">
			<a href="#">관리자</a>
		</c:if>
		<c:if test="${sessionScope.user.separate=='1'}">
			<a href="<%=cp%>/mypage/userInfo">마이페이지</a> &nbsp;|&nbsp;
			<a href="<%=cp%>/dashboard/orderlist?restaurantsNum=${sessionScope.user.restaurantsNum}">점주</a>
		</c:if>
</div>
</c:if>
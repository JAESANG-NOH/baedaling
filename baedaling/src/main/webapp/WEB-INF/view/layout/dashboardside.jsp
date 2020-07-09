<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="sidebox">
<aside>
<div style="width: 100%; height: 1000px;" >
	<div>
		<ul class="dash_title">
			<li style="padding: 30px 0px 30px 40px; color: white;">매장 관리</li>
		</ul>
	
	<div id="menu_content" class="snip1284">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="<%=cp%>/dashboard/orderlist?restaurantsNum=${sessionScope.user.restaurantsNum}">주문관리</a></li>
		</ul>
	</div>
	</div>
	
	<div id="menu_content" class="snip1284">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="">메뉴관리</a></li>
			<li id="dash_subcontent" style="margin-left: 40px;"><a href="">주메뉴</a></li>
			<li id="dash_subcontent" style="margin-left: 40px;"><a href="">부메뉴</a></li>
			<li id="dash_subcontent" style="margin-left: 40px;"><a href="">사이드메뉴</a></li>
		</ul>
	</div>
	
	<div id="menu_content" class="snip1284">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle" style="color: #D2D4D4;">가게정보관리</li>
			<li id="dash_subcontent" style="margin-left: 40px;"><a href="">가게정보수정</a></li>
			<li id="dash_subcontent" style="margin-left: 40px;"><a href="<%=cp%>/dashboard/fcinfo_read?restaurantsNum=${sessionScope.user.restaurantsNum}">상세정보수정</a></li>
		</ul>
	</div>
	
	
	<div id="menu_content" class="snip1284">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="<%=cp%>/dashboard/salesList?restaurantsNum=${sessionScope.user.restaurantsNum}">매출관리</a></li>
		</ul>
	</div>
	
	<div id="menu_content" class="snip1284">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="<%=cp%>/dashboard/myReviewList?restaurantsNum=${sessionScope.user.restaurantsNum}">게시글관리</a></li>
		</ul>
	</div>

	<div>
		<ul style="text-align: center;" class="snip1284">
			<li style="margin-top:200px; font-weight:bold; font-size: 20px; color: black;">오늘매출 ${dto.todaySales=='0'?dto.todaySales:0}원</li>
			<li style="margin-top:200px; font-weight:bold; font-size: 18px; color: white;"><a href="<%=cp%>/main">메인화면</a></li>
		</ul>
	</div>
	
</div>	
</aside>
</div>
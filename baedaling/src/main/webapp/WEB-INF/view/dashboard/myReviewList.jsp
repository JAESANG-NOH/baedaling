<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://unpkg.com/@kfonts/bm-hanna-pro/index.css" />
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
<link rel="stylesheet" href="<%=cp%>/resource/css/dashboard.css" type="text/css">

<!--  -->
<style type="text/css">
 *:focus { outline:none; }

#reviewTable{
	background-color: white;
	margin-top : 20px;
	margin-left : 340px;
	width: 1200px;
	height: 400px;
}


#review_button1{
	background-color: white;
	height : 45px;
	width: 50%;
	border : 0.5px solid #F9F9FA; 
	text-align: center;
	font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro';
	font-size: 20px;
}

#review_button2{
	background-color: white;
	height : 45px;
	width: 50%;
	border : 0.5px solid #F9F9FA; 
	text-align: center;
	font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro';
	font-size: 20px;
}

#review_button1:hover {
	border : 0.5px solid #F9F9FA; 
	background-color: #38BCC6;
}

#review_button1:link {
	border : 0.5px solid #F9F9FA; 
	background-color: #38BCC6;
}


#review_button2:hover {
	border : 0.5px solid #F9F9FA; 
	background-color: #38BCC6;
}

#review_button:after {
border : 0.5px solid #F9F9FA; 
	outline: 0;
	
}
</style>


</head>
<body>
<div class="sidebox">
<aside>
<div style="width: 100%; height: 1000px;" >
	<div>
		<ul class="dash_title">
			<li style="padding : 20px; color: white;">매장 관리</li>
		</ul>
	
	<div id="menu_content">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="">주문관리</a></li>
			<li id="dash_subcontent"><a href="">주문완료</a></li>
			<li id="dash_subcontent"><a href="">접수완료</a></li>
			<li id="dash_subcontent"><a href="">배달중</a></li>
			<li id="dash_subcontent"><a href="">배달완료</a></li>
		</ul>
	</div>
	</div>
	
	<div id="menu_content">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="">메뉴관리</a></li>
			<li id="dash_subcontent"><a href="">주메뉴</a></li>
			<li id="dash_subcontent"><a href="">사이드메뉴</a></li>
			<li id="dash_subcontent"><a href="">세트메뉴</a></li>
		</ul>
	</div>
	
	<div id="menu_content">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="">매출관리</a></li>
			<li id="dash_subcontent"><a href="">날짜별매출</a></li>
			<li id="dash_subcontent"><a href="">메뉴별매출</a></li>
		</ul>
	</div>
	
	<div id="menu_content">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="">게시글관리</a></li>
			<li id="dash_subcontent"><a href="">내 가게 리뷰</a></li>
			<li id="dash_subcontent"><a href="">내 댓글</a></li>
		</ul>
	</div>
</div>	
</aside>
</div>

<!--  -->
<div style="width: 25px; height:5px; background-color: #F9F9FA">&nbsp;</div>
<div style="width: 100%;">
	<div style="width: 500px; height: 45px; margin-left: 330px; margin-top: 20px;">
		<span style="font-family: "><button id="review_button1">내 가게 리뷰</button></span><span><button id="review_button2">내가 쓴 댓글</button> </span>
	</div>
	<div style="width: 500px; height: 45px; margin-left: 330px; margin-top: 20px;">
		<span style="font-family:'배달의민족 한나체 Pro', '배달의민족한나체Pro'; color: gray;" >리뷰  ${reviewCount}개(${pageNo}/${total_page} 페이지)개</span>
	</div>
	
	<table id="reviewTable">
		<tr style=" border: 1px solid #E6E5E5; text-align: center; width: 800px; height: 50px;">
			<td style="font-weight:bold; border-bottom : 1px solid #E6E5E5; width: 100px;">No</td>
			<td style="font-weight:bold; border-bottom: 1px solid #E6E5E5; width: 150px;">작성자</td>
			<td style="font-weight:bold; border-bottom: 1px solid #E6E5E5; width: 150px;">메뉴</td>
			<td style="font-weight:bold; border-bottom: 1px solid #E6E5E5; width: 200px;">내용</td>
			<td style="font-weight:bold; border-bottom: 1px solid #E6E5E5; width: 100px;">별점</td>
			<td style="font-weight:bold; border-bottom: 1px solid #E6E5E5; width: 150px;">날짜</td>
		</tr>
 <c:forEach var="dto" items="${list}">		
		<tr style=" border: 1px solid #E6E5E5; text-align: center; width: 800px; height: 45px;">
			<td style="width: 100px;"><a href="" style="color: gray;">${dto.reviewNum}</a></td>
			<td style="width: 150px;"><a href="" style="color: gray;">${dto.userName}</a></td>
			<td style="width: 150px;"><a href="" style="color: gray;">${dto.menuName}</a></td>
			<td style="width: 200px;"><a href="" style="color: gray;">${dto.content}</a></td>
			<td style="width: 100px;"><a href="" style="color: gray;">${dto.starCount}</a></td>
			<td style="width: 150px;"><a href="" style="color: gray;">${dto.created}</a></td>
		</tr>
</c:forEach>
	</table>
</div>

</body>
</html>
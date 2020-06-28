<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://unpkg.com/@kfonts/bm-hanna-pro/index.css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/dashboard.css" type="text/css">
<script type="text/javascript">
/* $("#orderManage").on("click", function (e) {
	e.preventDefault();
	var thisTarget = $(this).attr("href");
	$(window).scrollTop($(thisTarget).offset().top);
});



$("#delivery_ok").on("click", function (e) {
	e.preventDefault();
	var thisTarget = $(this).attr("href");
	$(window).scrollTop($(thisTarget).offset().top);
});
 */

</script>
</head>
<body>
<div class="sidebox">
<aside>
<div style="width: 100%; height: 1000px;" >
	<div>
		<ul class="dash_title">
			<li style="padding : 20px;">매장 관리</li>
		</ul>
	
	<div id="menu_content">
		<ul style="margin-top: 20px;">
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="<%=cp%>/dashboard/">주문관리</a></li>
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
	
	<div>
		<ul style="text-align: center;">
			<li style="margin-top:200px; font-weight:bold; font-size: 20px; color: black;">오늘매출 <span>${dto.todaySales}원</span></li>
		</ul>
	</div>
	
</div>	

</aside>
</div>
<div style="width: 25px; background-color: #F6F5F5">&nbsp;</div>
<div id="dashboard_box">
<table id="dash_table">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
		<span style="color: #38BCC6;">| </span>대시보드<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="150px;" id="waiting_text">주문완료</td>
		<td width="150px;" id="waiting_text">접수완료</td>
		<td width="150px;" id="waiting_text">배달중</td>
		<td width="150px;" id="waiting_text">배달완료</td>
	</tr>

	<tr style="width: 800px; text-align: center;">
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;${orderCount1}</td>
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;${orderCount2}</td>
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;${orderCount3}</td>
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;</td>
	</tr>

</table>
</div>

<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>주문완료   <span style="color: #38BCC6;">|</span>
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">No</td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주소</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문내역</td>
		<td width="150px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문시간</td>
		<td width="100" style="border-bottom: 1px dotted #F6F5F5;">확인</td>
	</tr>
<c:forEach var="dto" items="${list1}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;">${dto.foodorderNum}</td>
		<td width="300px;">${dto.foodOrderAddr}</td>
		<td width="200px;">${dto.menuNum}-${dto.menuName}</td>
		<td width="150px;">${dto.foodOrderDate}</td>
		<td width="100px;"><button>확인</button><button>취소</button></td>
	</tr>
</c:forEach>
</table>
</div>

<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>접수완료<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">No</td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주소</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문내역</td>
		<td width="150px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문시간</td>
		<td width="100" style="border-bottom: 1px dotted #F6F5F5;">확인</td>
	</tr>
<c:forEach var="dto" items="${list2}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;">${dto.foodorderNum}</td>
		<td width="300px;">${dto.foodOrderAddr}</td>
		<td width="200px;">${dto.menuNum}-${dto.menuName}</td>
		<td width="150px;">${dto.foodOrderDate}</td>
		<td width="100px;"><button>확인</button><button>취소</button></td>
	</tr>
</c:forEach>
</table>
</div>

<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>배달중<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>

	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">No</td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주소</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문내역</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문시간</td>
	</tr>
<c:forEach var="dto" items="${list3}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;">${dto.foodorderNum}</td>
		<td width="300px;">${dto.foodOrderAddr}</td>
		<td width="200px;">${dto.menuNum}-${dto.menuName}</td>
		<td width="200px;">${dto.foodOrderDate}</td>
	</tr>
</c:forEach>
</table>
</div>


<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>배달완료<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>

	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text"></td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text"></td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text"></td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text"></td>
	</tr>
<c:forEach var="dto" items="">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;"></td>
		<td width="300px;"></td>
		<td width="200px;"></td>
		<td width="200px;"></td>
	</tr>
</c:forEach>
</table>
</div>

</body>
</html>
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
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">
<%-- $(function(data) {
	var url = "<%=cp%>/hchart/line";
	
	$.getJSON(url, function(qty){
		//console.log(data);
		Highcharts.chart('lineContainer', {

		    title: {
		        text: '이 달의 메뉴'
		    },

		    xAxis: {
				categories:[qty.menuName]
		    },

		    yAxis: {
		       	title:{
					text:'판매량'		       		
		        }
		    },

		    list: data.series
		});
	});
}); --%>

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
			<li id="dash_subTitle"><a style="color: #D2D4D4;" href="">주문관리</a></li>
			<li id="dash_subcontent"><a href="">접수대기</a></li>
			<li id="dash_subcontent"><a href="">배달중</a></li>
			<li id="dash_subcontent"><a href="">완료</a></li>
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
			<li style="margin-top:150px; font-weight:bold; font-size: 17px; color: black;">오늘매출 <span>${today.todaySales} 원</span></li>
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
			오늘매출 <span style="color: #38BCC6;">${today.todaySales} </span>원
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" id="waiting_text"></td>
		<td width="200px;" id="waiting_text"></td>
		<td width="200px;" id="waiting_text"></td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" ></td>
		<td width="200px;" ></td>
		<td width="200px;" ></td>
	</tr>
</table>
</div>


<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			월매출  <span style="color: #38BCC6;">${month.monthSales} </span>원
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" id="waiting_text">No</td>
		<td width="200px;" id="waiting_text">이달의 베스트메뉴</td>
		<td width="200px;" id="waiting_text">판매금액</td>
	</tr>
<c:forEach var="vo" items="${bestlist}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" >${vo.menuNum}</td>
		<td width="200px;" >${vo.menuName}</td>
		<td width="200px;" >${vo.bestSales}</td>
	</tr>
</c:forEach>
</table>
</div>

<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			연매출  <span style="color: #38BCC6;">${annual.annualSales} </span>원
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" id="waiting_text"></td>
		<td width="200px;" id="waiting_text"></td>
		<td width="200px;" id="waiting_text"></td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" ></td>
		<td width="200px;" ></td>
		<td width="200px;" ></td>
	</tr>
</table>
</div>


</body>
</html>
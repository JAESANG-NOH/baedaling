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
$(function() {
	var url ="<%=cp%>/dashboard/pie3d?restaurantsNum=${restaurantsNum}";
	$.getJSON(url, function(data) {
		//console.log(data);
		
		Highcharts.chart('pie3dContainer', {
		    chart: {
		        type: 'pie',
		        options3d: {
		            enabled: true,
		            alpha: 45
		        }
		    },
		    title: {
		        text: ''
		    },
		    plotOptions: {
		        pie: {
		            innerSize: 100,
		            depth: 45,
		            colors: [
			            '#38BCC6', 
			            '#0588A9',
			            '#89D4E8',
			            '#F2F2F2',
			            '#D0ECF3',
			            '#0CA7D7'
			        ],
		        }
		    
		    },
		    series: data
		});
	});
});

$(function() {
	var url ="<%=cp%>/dashboard/barChart?restaurantsNum=${restaurantsNum}";
	$.getJSON(url, function(data) {
		console.log(data);
		// Create the chart
		Highcharts.chart('barContainer', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '2020년 월별 판매현황'
		    },
		    accessibility: {
		        announceNewData: {
		            enabled: true
		        }
		    },
		    xAxis: {
		        type: 'category'
		    },
		    yAxis: {
		        title: {
		            text: '총 판매금액'
		        }

		    },
		    legend: {
		        enabled: false
		    },
		    plotOptions: {
		        series: {
		            borderWidth: 0,
		            dataLabels: {
		                enabled: true
		            },
		            colors: [
			            '#38BCC6', 
			            '#0588A9',
			            '#89D4E8',
			            '#FAF0DA',
			            '#F2F2F2',
			            '#D0ECF3',
			            '#0CA7D7',
			            '#FAC44E'
			            
			        ]
		        }
		    },

		    series: data

		});

	});
});

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
			오늘매출 <span style="color: #38BCC6;">${today.todaySales} </span>원  <span style="font-size: 18px;">- 전체 판매 리스트</span>
		</td>
		<td style="font-size: 20px;">
			  ${dataCount}개 (${pageNo}/${total_page} 페이지)
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" id="waiting_text">no</td>
		<td width="200px;" id="waiting_text">메뉴</td>
		<td width="200px;" id="waiting_text">가격</td>
		<td width="200px;" id="waiting_text">완료시간</td>
	</tr>
	
	<c:forEach var="vo" items="${list}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" >${vo.foodorderNum}</td>
		<td width="200px;" >${vo.menuNum}-${vo.menuName}</td>
		<td width="200px;" >${vo.foodOrderTotalPrice}</td>
		<td width="200px;" >${vo.foodOrderCompletionDate}</td>
	</tr>
	</c:forEach>
	<tr style=" border: 1px solid #E6E5E5; text-align: center; width: 800px; height: 45px;">
			<td style="width:200px; font-family:'배달의민족 한나체 Pro', '배달의민족한나체Pro'; color: gray;">${dataCount==0 ? "판매내역이 없습니다.":paging}</td>
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
		<td width="200px;" id="waiting_text">이달의 베스트메뉴</td>
	</tr>
	
	<tr style="width: 800px; text-align: center;">
		<td width="100%">
			<div id="pie3dContainer"></div>
		</td>
	</tr>

</table>
</div>

<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td style="padding-left : 20px;">
			연매출  <span style="color: #38BCC6;">${annual.annualSales} </span>원
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100%">
			<div id="barContainer"></div>
		</td>
	</tr>
</table>
</div>

</body>
</html>
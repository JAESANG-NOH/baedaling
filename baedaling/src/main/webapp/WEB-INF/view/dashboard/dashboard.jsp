<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<li style="margin-top:150px; font-weight:bold; font-size: 17spx; color: black;">오늘매출 <span>257,550원</span></li>
		</ul>
	</div>
	
</div>	

</aside>
</div>

<div style="width: 100px">
<div id="dashboard_box">
<p id="dash_title">대시보드<p>
<hr color="#38BCC6">
<br>
<table id="dash_table">
	<tr>
		<td>주문 완료</td>
		<td>배달중</td>
		<td>완료</td>
	</tr>

	<tr>
		<td style="font-size: 45px; font-weight: bold;">2</td>
		<td style="font-size: 45px; font-weight: bold;">3</td>
		<td style="font-size: 45px; font-weight: bold;">5</td>
	</tr>

</table>

<div id="dashboard_box2">
<p id="dash_title">접수대기<p>
<hr color="#38BCC6">
<br>
<table id="dash_table2">
	<tr style="text-align: center; border-bottom: 1px solid gray ; ">
		<td id="waiting_text" style="font-weight:bold;">No</td>
		<td width="100px;" style="font-weight:bold;">주소</td>
		<td style="font-weight:bold;">주문내역</td>
		<td style="font-weight:bold;">주문시간</td>
		<td style="font-weight:bold;">확인</td>
	</tr>
	<tr style="text-align: center;">
		<td>1</td>
		<td width="220px;">서울시 서교동 쌍용센터</td>
		<td width="220px;">후라이드</td>
		<td>2020-06-24 03:21</td>
		<td><button>확인</button><button>취소</button></td>
	</tr>
</table>
</div>

<br>
<br>
<div id="dashboard_box2">
<p id="dash_title">배달완료<p>
<hr color="#38BCC6">
<br>
<table id="dash_table2">
	<tr style="text-align: center;">
		<td id="waiting_text" style="font-weight:bold; border-bottom: 1px solid #F6F5F5;">No</td>
		<td width="100px;" style=" border-bottom: 1px solid #F6F5F5; font-weight:bold;">주소</td>
		<td style=" border-bottom: 1px solid #F6F5F5; font-weight:bold;">주문내역</td>
		<td style=" border-bottom: 1px solid #F6F5F5; font-weight:bold;">완료시간</td>
		<td style=" border-bottom: 1px solid #F6F5F5; font-weight:bold;">확인</td>
	</tr>
	<tr style="text-align: center;">
		<td>1</td>
		<td width="220px;">인천시 서구 크리스탈로 74</td>
		<td width="220px;">뿌링클</td>
		<td>2020-06-24 04:10</td>
		<td><button>확인</button><button>취소</button></td>
	</tr>
</table>
</div>
</div>

</div>	


</body>
</html>
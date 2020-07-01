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
<style type="text/css">


ul li{
	color: #333;
	list-style: none;
	font-size: 90%;
}

.storeBox{
	width: 100%;
	margin: 0px auto;
	background-color: #f9f9fa;
}

.store_basic{
	width: 800px;
	margin: 30px auto;
	background-color: white;
}


#shop_title{
	font-size : 14.5px;
	height : 40px;
	padding-top : 10px;
	padding-bottom : 5px;
	padding-left : 9px;
	border: 1px solid #dadadb;
	border-bottom : none;
}

#store_content{
	border: 1px solid #dadadb;
	border-bottom: none;
	padding: 5px;
}

#store_img{
	border : 0.5px solid #dadadb;
	margin : 4px 5px;
	width: 70px;
	height: 70px;
	float: left;
}


#st_notice{
	border: 1px solid #dadadb;
	height: 50px;
	padding-top: 5px;
	padding-left: 10px;
}

.st_subClick{
	margin-top: 15px;
}


#st_menu_btn{
	border: 1px solid #dadadb;
	width: 259px;
	height: 40px;
	background-color: white;
}

#st_review_btn{
	border: 1px solid #dadadb;
	width: 259px;
	height: 40px;
	background-color: white;
}

#st_info{
	border: 1px solid #dadadb;
	width: 259px;
	height: 40px;
	background-color: white;
}

button{
	border: 0;
	outline: 0;
	
}

#st_menu_btn:hover {
	border-bottom: 3px solid #38BCC6; 
}

#st_info:hover {
	border-bottom: 3px solid #38BCC6; 
}

#st_review_btn:hover {
	border-bottom: 3px solid #38BCC6; 
}

#light_gray{
	color:#A0A1A2;
}

#red{
	color:#F0001E
}

/* 메뉴 부분 */

.menuImg_table{
	width:800px;
	height : 200px;
	padding: 5px;
	margin: 5px;
	white-space:nowrap;
	overflow-y:auto;
  }


.menuImg_table ul{
	float: left;
}

#store_menu_img{
	width: 170px;
	height: 130px;
	margin: 3px;
}

#menuName {
	margin : 5px;
	font-size: 15px;
	font-weight: bold;
}


.menu_table{
	clear: both;
}

.menu_table tr {
 	border: 1px solid #dadadb;
 	background-color: #EAEAEC;
}

.menu_table td{
	 width : 800px;
	 height: 40px;	
	font-size: 15px;
	padding-left: 15px;
}



/* 메뉴리스트 */

#menuContent_img{
	border : 0.5px solid #dadadb;
	margin : 5px 5px;
	padding : 5px;
	margin-right : 20px;
	width: 70px;
	height: 70px;
	float: right;
}

#listFoodname{
	font-size: 14px;
	font-weight: bold;
}

/* 리뷰  */
#score_text{
	padding-top : 1px;
	font-size: 20px;
	font-weight: bold;
}

.reviewContent{
	text-align: center;
	width: 800px; 
	height: 50px; 
	border: 1px solid #dadadb;
	border-bottom: none;
}

#star_deco{
	color: #F2D51B;
	font-size: 13px;	
}

#bold{
	font-weight: bold;
}

.reviewContent2{
	width: 800px; 
	height: 50px; 
	border: 1px solid #dadadb;
	border-bottom: none;
}

.reviewContent3{
	width: 800px; 
	height: 120px; 
	border: 1px solid #dadadb;
	border-top : none;
	margin-top: 16px;
}

/* 가게정보 */

.infoContent{
	width: 800px; 
	height: 700px;
	margin: 0px auto;
	border: 1px solid #dadadb;
	border-top: none;
}

#info_title{
	border-bottom: 0.5px dotted #dadadb;
	padding: 10px;
}

#info_content2{
	padding: 10px;
	margin-bottom: 5px;
}
</style>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://unpkg.com/@kfonts/bm-hanna-pro/index.css" />

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>

<link rel="stylesheet" href="<%=cp%>/resource/css/dashboard.css" type="text/css">

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
	
	<%-- <div>
		<ul style="text-align: center;">
			<li style="margin-top:200px; font-weight:bold; font-size: 20px; color: black;">오늘매출 <span>${dto.todaySales}원</span></li>
		</ul>
	</div> --%>
	
</div>	

</aside>
</div>
<div style="width: 25px; height:5px; background-color: #F9F9FA">&nbsp;</div>
<div class="storeBox">
<div class="store_basic">
	<ul>
		<li id="shop_title">${dto.name}</li>
	</ul>
<div id="store_content">	
	<ul>
		<li><img id="store_img" alt="logo" src="<%=cp%>/delivery/img/bhc.png"></li>
	</ul>
	<div id="st_content">	
	<ul>
		<li><span style="color:#F2D51B ">&nbsp;★★★★☆</span> 4.5</li>
		<li id="red">&nbsp;4,000원 할인</li>
		<li>&nbsp;<span id="light_gray">최소주문금액 </span> ${dto.minorder}</li>
		<li style="margin-left: 80px;">&nbsp;<span id="light_gray">배달 시간</span> ${dto.deliTime}<span><a href=""><i class="far fa-question-circle"></i></a> </span> </li>
		<li>파일</li>
	</ul>
	</div>
</div>
<div id="st_notice">	
	<ul>
		<li><i class="fas fa-bullhorn"></i><span style="font-weight: bold;"> 사장님알림</span></li>
		<li style="color: gray;">안녕하세요 bhc 연희점입니다. 치킨 주문시 콜라는 블라블라 블라블라블... <span> <a href=""> <i class="fas fa-chevron-right"></i></a></span> </li>
	</ul>
</div>	
	<!-- <div class="st_subClick" style="height: 40px;">
		<button id="st_menu_btn">메뉴<span style="padding-left: 3px;">42</span></button>
		<button id="st_review_btn">리뷰<span style="padding-left: 3px;">192</span></button>
		<button id="st_info">정보</button>
	</div>
	 -->
	
<!-- 	메뉴 -->

<!-- 카테고리 클릭화면 -->

<!-- 메뉴 리스트 -->



<!-- 리뷰 리스트 -->


<!-- 가게 정보 -->
<div class="storeInfo" style="width: 100px;">
<div class="infoContent">
<ul id="info_title">
	<li style="width: 200px;"><i class="fas fa-bullhorn"></i><span style="font-size: 14px; "> 사장님알림</span></li>	
</ul>

<ul style="padding: 10px;">
	<li>${dto.introduce}</li>
</ul>

<ul id="info_title">
	<li><span style="font-size: 14px; "><i class="fas fa-store"></i> 업체정보</span></li>	
</ul>

<ul id="info_content2">
	<li>  <span id="light_gray">영업시간</span>${dto.openingHour} - ${dto.endingHour}</li>
	<li>  <span id="light_gray">전화번호</span>${dto.fctel}</li>
	<li>  <span id="light_gray">주소</span>   서울</li>
</ul>

<ul id="info_title">
	<li><span style="font-size: 14px; "><i class="far fa-credit-card"></i> 결제정보</span></li>	
</ul>

<ul id="info_content2">
	<li>  <span id="light_gray">최소주문금액</span>   0원</li>
	<li>  <span id="light_gray">결제수단</span>   신용카드, 현금, 요기서 결제</li>
</ul>

<ul id="info_title">
	<li><span style="font-size: 14px; "><i class="far fa-credit-card"></i> 사업자정보</span></li>	
</ul>

<ul id="info_content2">
	<li>  <span id="light_gray">상호명</span>   ${dto.mutualName}</li>
	<li>  <span id="light_gray">사업자등록번호</span>${dto.licenseNumber}</li>
</ul>


<ul id="info_title">
	<li><span style="font-size: 14px; "><i class="far fa-file-alt"></i> 원산지정보</span></li>	
</ul>

<ul id="info_content2">
	<li>${dto.origin}</li>
</ul>

</div>
</div>	
</div>


</div>



</body>


</html>


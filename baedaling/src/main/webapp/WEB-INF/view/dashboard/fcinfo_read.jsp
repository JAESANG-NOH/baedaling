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
<link rel="stylesheet" href="<%=cp%>/resource/css/fcinfo.css" type="text/css">
<script type="text/javascript">
function updateSend() {
	  var q = "restaurantsNum=restaurantsNum";
	  var url = "<%=cp%>/dashboard/update?" + q;
		  	location.href=url;
	}



</script>

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
		<li><img id="store_img" alt="logo" src="<%=cp%>/resource/dashboard/"></li>
	</ul>																	
	<div id="st_content">	
	<ul>
		<li><span style="color:#F2D51B ">&nbsp;★★★★☆</span> 4.5</li>
		<li id="red">&nbsp;4,000원 할인</li>
		<li>&nbsp;<span id="light_gray">최소주문금액 </span> ${dto.minorder}</li>
		<li style="margin-left: 80px;">&nbsp;<span id="light_gray">배달 시간</span> ${dto.deliTime}<span><a href=""><i class="far fa-question-circle"></i></a> </span> </li>
	</ul>
	</div>
</div>
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
	<li>  <span id="light_gray">최소주문금액</span>${dto.minorder}</li>
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

<c:forEach var="vo" items="${listFile}">
<ul id="info_content2">
	<li><a href="<%=cp%>/dashboard/download?fileNum=${vo.fileNum}">${vo.saveFilename}</a></li>
</ul>
</c:forEach>
</div>
</div>	
</div>
<div class="f_button" align="right">
		<button id="f_btn2" type="button"onclick="updateSend();">수정</button>
		<button id="f_btn3" type="button" onclick="javascript:location.href='<%=cp%>/dashboard/list?">리스트</button>
	</div>

</div>



</body>


</html>


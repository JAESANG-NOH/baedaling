<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet" href="<%=cp%>/resource/css/storepage.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">

<script type="text/javascript">

function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

$(function(){
	$("#tab-0").addClass("active");
	listPage();
	
	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		listPage();
	});
});

function listPage(){
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url = "<%=cp%>/franchise/";
	var query = "restaurantsNum="+${dto.restaurantsNum};
	var purl = "";
	if(tab == 0){
		purl = "menu";
	}
	if(tab == 1){
		purl = "review";
	}
	
	if(tab == 2){
		purl = "info";
	}
	
	url = url + purl;
	var selector = "#contentLayout";
	ajaxHTML(url, "get", query, selector);
}

</script>
</head>
<body>
	<div class="storeBox">
		<div class="store_basic">
			<ul>
				<li id="shop_title">${dto.name }</li>
			</ul>
			<div id="store_content">
				<ul>
					<li><img id="store_img" alt="logo"
						src="<%=cp%>/delivery/img/bhc.png"></li>
				</ul>
				<div id="st_content">
					<ul>
						<li><span style="color: #F2D51B">&nbsp;★★★★☆</span> 4.5</li>
						<li id="red">&nbsp;4,000원 할인</li>
						<li>&nbsp;<span id="light_gray">최소주문금액 </span>${dto.minorder}</li>
						<li>&nbsp;<span id="light_gray">결제</span> 신용카드,현금,<span
							id="red"> 배다링 결제</span></li>
						<li style="margin-left: 80px;">&nbsp;<span id="light_gray">배달
								시간</span> 45~55분 <span><a href=""><i
									class="far fa-question-circle"></i></a> </span>
						</li>
					</ul>
					<input type="hidden" name = "restaurantsNum" value = "${dto.restaurantsNum }">
				</div>
			</div>
			<div id="st_notice">
				<ul>
					<li><i class="fas fa-bullhorn"></i><span
						style="font-weight: bold;"> 사장님알림</span></li>
					<li style="color: gray;">${dto.introduce}<span> <a
							href=""> <i class="fas fa-chevron-right"></i></a></span>
					</li>
				</ul>
			</div>
			
			<!-- <div class="st_subClick" style="height: 40px;">
				<button id="st_menu_btn">
					메뉴<span style="padding-left: 3px;">42</span>
				</button>
				<button id="st_review_btn">
					리뷰<span style="padding-left: 3px;">192</span>
				</button>
				<button id="st_info">정보</button>
			</div> -->


			<div style="clear: both;">
				<ul class="tabs">				 
						<li id="tab-0" data-tab="0" style="width: 150px">메뉴</li>
						<li id="tab-1" data-tab="1" style="width: 150px">리뷰</li>
						<li id="tab-2" data-tab="2" style="width: 150px">정보</li>
				</ul>
			</div>
			
			<div id="contentLayout"></div>
			
			
			
			<%-- <!-- 	메뉴 -->

			<div class="all_menuList" style="width: 600px; margin: 0px auto;">


			</div>

			<!-- 카테고리 클릭화면 -->

			<!-- 메뉴 리스트 -->

			<div class="menuList_content" style="width: 100%"></div>

			<!-- 리뷰 리스트 -->

			<div class="reviewList" style="width: 100px;"></div>

			<!-- 가게 정보 -->
			<div class="storeInfo" style="width: 100px;">
				<div class="infoContent">
					<ul id="info_title">
						<li style="width: 200px;"><i class="fas fa-bullhorn"></i><span
							style="font-size: 14px;"> 사장님알림</span></li>
					</ul>

					<ul style="padding: 10px;">
						<li>${dto.introduce}</li>
					</ul>

					<ul id="info_title">
						<li><span style="font-size: 14px;"><i
								class="fas fa-store"></i> 업체정보</span></li>
					</ul>

					<ul id="info_content2">
						<li><span id="light_gray">영업시간</span> ${dto.openingHour} -
							${endingHour}</li>
						<li><span id="light_gray">전화번호</span>${dto.fctel}</li>
						<li><span id="light_gray">주소</span> ${dto.addr1 } ${dto.addr2 }</li>
					</ul>

					<ul id="info_title">
						<li><span style="font-size: 14px;"><i
								class="far fa-credit-card"></i> 결제정보</span></li>
					</ul>

					<ul id="info_content2">
						<li><span id="light_gray">최소주문금액</span>${dto.minorder}</li>
						<li><span id="light_gray">결제수단</span> 신용카드, 현금, 요기서 결제</li>
					</ul>

					<ul id="info_title">
						<li><span style="font-size: 14px;"><i
								class="far fa-credit-card"></i> 사업자정보</span></li>
					</ul>

					<ul id="info_content2">
						<li><span id="light_gray">상호명</span> ${dto.mutualName}</li>
						<li><span id="light_gray">사업자등록번호</span> ${dto.licenseNumber}</li>
					</ul>


					<ul id="info_title">
						<li><span style="font-size: 14px;"><i
								class="far fa-file-alt"></i> 원산지정보</span></li>
					</ul>

					<ul id="info_content2">
						<li>* ${dto.origin}</li>
					</ul>
				</div>

			</div> --%>
		</div>


	</div>


</body>
</html>
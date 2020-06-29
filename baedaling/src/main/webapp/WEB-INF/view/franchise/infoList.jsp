<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="storeInfo" style="width: 100px;">
<div class="infoContent">
<ul id="info_title">
	<li style="width: 200px;"><i class="fas fa-bullhorn"></i><span style="font-size: 14px; "> 사장님알림</span></li>	
</ul>

<ul style="padding: 10px;">
	<li>Bhc 청라점은 8월1일부로 기존에 제공되던 245캔 콜라를 제공하지 않습니다.</li>
	<li>음료가 필요하신분은 추가주문 부탁드립니다.</li>
</ul>

<ul id="info_title">
	<li><span style="font-size: 14px; "><i class="fas fa-store"></i> 업체정보</span></li>	
</ul>

<ul id="info_content2">
	<li>  <span id="light_gray">영업시간</span>   ${dto.openingHour } - ${dto.endingHour }</li>
	<li>  <span id="light_gray">전화번호</span>   ${dto.fctel }</li>
	<li>  <span id="light_gray">주소</span>   ${dto.addr1 } ${dto.addr2 }</li>
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
	<li>  <span id="light_gray">상호명</span>   비에이치씨 청라점</li>
	<li>  <span id="light_gray">사업자등록번호</span>   111-11-1111</li>
</ul>


<ul id="info_title">
	<li><span style="font-size: 14px; "><i class="far fa-file-alt"></i> 원산지정보</span></li>	
</ul>

<ul id="info_content2">
	<li> *닭고기 : 국내산</li>
	<li> *소고기(돼지고기) : 국내산</li>
</ul>

</div>
</div>	
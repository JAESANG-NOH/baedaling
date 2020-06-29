<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="reviewList" style="width: 100px;">
<div class="reviewContent">
	<ul>
		<li id="score_text">4.5 </li>
		<li id="star_deco">★★★★☆</li>
	</ul>
</div>

<div class="reviewContent2" style="width: 600px; height: 50px; border: 1px solid #dadadb;">
	<ul>
		<li style="float: right; padding-right : 20px; padding-top: 12px;">
			사진 리뷰만 <input type="checkbox">
		</li>
	</ul>

	<ul>
		<li style="padding-left: 20px; padding-top: 12px;">리뷰 <span id="bold">  587</span>개 | 사장님 댓글 <span id="bold"> 0</span>개</li>
	</ul>

<div class="reviewContent3">
	<ul style="padding-left: 10px; padding-top: 10px;">
		<li > <span style="font-size: 15px; font-weight: bold;">홍*동님  </span> 2020-06-21</li>
		<li id="star_deco">★★★★★</li>
		<li style="color: #15AFD6;">골드킹 콤보</li>
		<li>너무 맛있어요</li>
	</ul>
</div>
	
</div>
</div>


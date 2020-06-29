<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/restaurantsmenulist.css" type="text/css">
<div class="menu_content_box">
	<div class="select_sort">
		<select>
			<option>기본 정렬순</option>
			<option>별점순</option>
			<option>리뷰순</option>
		</select>
	</div>
	<div class="menu_content_etch_line lineheader">
		<table class="fc_list_table">
			<tr >
				<td class="menu_td1"><div class="menu_img_box"><img alt="" src=""></div></td>
				<td class="menu_td2">
					<b>혼밥대왕-은평점</b>
					<br>
					<span>★4.7 | 리뷰:94 | 사장님댓글:94</span>
					<br>
					<div>
						<div class="coupon_line">쿠폰할인</div>
						<div class="delivery_time">50~90분</div>
					</div>
				</td>
			</tr>
		</table>
		<table class="fc_list_table">
		<tr >
			<td class="menu_td1"><div class="menu_img_box"><img alt="" src=""></div></td>
			<td class="menu_td2">
				<b>혼밥대왕-은평점</b>
				<br>
				<span>★4.7 | 리뷰:94 | 사장님댓글:94</span>
				<br>
				<div>
					<div class="coupon_line">쿠폰할인</div>
					<div class="delivery_time">50~90분</div>
				</div>
			</td>
		</tr>
		</table>
	</div>
	<div class="menu_content_etch_line">
		<table class="fc_list_table">
			<tr >
				<td class="menu_td1"><div class="menu_img_box"><img alt="" src=""></div></td>
				<td class="menu_td2">
					<b>혼밥대왕-은평점</b>
					<br>
					<span>★4.7 | 리뷰:94 | 사장님댓글:94</span>
					<br>
					<div>
						<div class="coupon_line">쿠폰할인</div>
						<div class="delivery_time">50~90분</div>
					</div>
				</td>
			</tr>
		</table>
		<table class="fc_list_table">
		<tr >
			<td class="menu_td1"><div class="menu_img_box"><img alt="" src=""></div></td>
			<td class="menu_td2">
				<b>혼밥대왕-은평점</b>
				<br>
				<span>★4.7 | 리뷰:94 | 사장님댓글:94</span>
				<br>
				<div>
					<div class="coupon_line">쿠폰할인</div>
					<div class="delivery_time">50~90분</div>
				</div>
			</td>
		</tr>
		</table>
	</div>
</div>
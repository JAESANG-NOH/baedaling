<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	$("body").on("click",".fc_list_table",function(){
		var num = parseInt($(this).attr('data-restaurantsNum'));
		var url = "<%=cp%>/franchise/page?restaurantsNum="+num;
		alert(url);
		forward(url);
	});
});

function forward(url){
	var f = document.listform;
	f.action = url;
	f.submit();
}
</script>

<link rel="stylesheet" href="<%=cp%>/resource/css/restaurantsmenulist.css" type="text/css">
<div class="menu_content_box" style="min-height: 400px;">
<form name="listform" method="post">
	<div class="select_sort">
		<select name="sort_type">
			<option value="distance" ${state=="distance"?"selected='selected'":""}>기본 거리순</option>
			<option value="star" ${state=="star"?"selected='selected'":""}>별점순</option>
			<option value="review" ${state=="review"?"selected='selected'":""}>리뷰순</option>
		</select>
	</div>
	
<c:forEach var="dto" items="${list}" varStatus="status">
	<c:if test="${status.index==0}">
           <c:out value="<div class='menu_content_etch_line lineheader'>" escapeXml="false"/>
    </c:if>
    <c:if test="${status.index!=0 && status.index%2==0}">
           <c:out value="</div><div class='menu_content_etch_line lineheader'>" escapeXml="false"/>
    </c:if>
		<table class="fc_list_table" data-restaurantsNum="${dto.restaurantsNum}">
			<tr>
				<td class="menu_td1"><div class="menu_img_box"><img src="<%=cp%>/resource/dashboard/${dto.savefilename}" onerror="this.src='<%=cp%>/resource/img/ready.jpg'" style="width: 85px; height: 85px;"></div></td>
				<td class="menu_td2">
					<b>${dto.name}</b>
					<br>
					<span>★4.7 | 리뷰:94 | 거리:${dto.distance}Km</span>
					<br>
					<div>
						<div class="coupon_line">쿠폰할인</div>
						<div class="delivery_time">영업시간:${dto.openinghour}~${dto.endinghour}</div>
					</div>
				</td>
			</tr>
		</table>
</c:forEach>
<c:out value="</div>" escapeXml="false"/>
	</form>
</div>
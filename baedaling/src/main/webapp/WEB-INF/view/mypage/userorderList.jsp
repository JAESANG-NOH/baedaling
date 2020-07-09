<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mypage_order.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/mypage_user.css" type="text/css">
<script type="text/javascript">

$(function(){
	$("body").on("click",".review_btn",function(){
		var url = "<%=cp%>/mypage/checkReview";
		var foodOrderNum = $(this).attr("data-orderNum");
		var restaurantsNum = $(this).attr("data-restaurantsNum");
		var query = "foodOrderNum="+foodOrderNum+"&restaurantsNum="+restaurantsNum;
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var ok = data.passed;
				if(ok=="true"){
					forwordreview(foodOrderNum,restaurantsNum);
				} else {
					alert("이미 리뷰를 작성하셨습니다.")
				}
			}
		    ,error:function(jqXHR) {
		    	console.log(e.responseText);
		    }
		});
		
	});
});
</script>
<script>
function forwordreview(foodOrderNum,restaurantsNum){
  	location.href = "<%=cp%>/review/write?foodOrderNum="+foodOrderNum+"&restaurantsNum="+restaurantsNum;
}
</script>

<div class="mypage_container">
    <div class="body-container">
        <div class="body-left">
            <div class="list-group">
                <div class="list-group-item lefthead"> 마이페이지</div>
                <a href="<%=cp%>/mapage/userInfo" class="list-group-item active">회원정보</a>
                <a href="<%=cp%>/mypage/userorderList" class="list-group-item">주문내역</a>
                <a href="<%=cp%>/mypage/recommendlist" class="list-group-item">내가 쓴 게시물</a>
                <a href="<%=cp%>/mypage/reviewList" class="list-group-item">내가 쓴 리뷰</a>
                <a href="<%=cp%>/mypage/message" class="list-group-item">회원정보수정</a>
                <a href="#" class="list-group-item">회원탈퇴</a>
            </div>   
        </div>
    
        <div class="body-right">
            <div class="body-right-container">
                 <div class="body-title">
                     <h3><span style="font-family: Webdings">4</span> 마이페이지 </h3>
                 </div>
			<div class="order_container">
				<div style="width: 100%; margin: 20px auto;">
				<form name="orderForm" method="GET">
					<table style="margin: auto; width: 800px; border-spacing: 0px;" >
							<tr height="35px;">
								<td align="left" style="font-size: 13px;">
								  ${dataCount}개(${page}/${total_page} 페이지)
								</td>
								<td align="right">
								<span style="font-size: 13px;">배달ing&nbsp;>&nbsp;주문내역</span>
								</td>
							</tr>
					</table>
					
					<table style="width: 800px; margin: 0px auto; border-spacing: 0; border-collapse:collapse;">
						<tr align="center" height="35" style="border-top: 2px solid #828282; border-bottom: 1px solid #828282; background: #41CDCD;">
							<th width="60" style="color:white;">번호</th>
							<th width="400" style="color:white;" align="center">상호명&nbsp; & &nbsp;주문내역</th>
							<th width="70" style="color:white;">&nbsp;금액</th>
							<th style="color:white;">주문날짜</th>
							<th width="80" style="color:white;"></th>
						</tr>
					
						<c:forEach var="dto" items="${list}">
						<tr align="center" height="140" style="border-bottom: 1px solid #41CDCD;">
							<td>${dto.listNum}</td>
							<td>
								<p style="font-weight: bold;"> ${dto.mutualName} </p>
								<p> ${dto.menuName} X ${dto.qty} </p> 
							</td>
							<td>${dto.foodOrderTotalPrice}원</td>
							<td>${dto.foodOrderDate}</td>
							<td>
								<button type="button" class="btn btn1 review_btn" data-orderNum="${dto.foodOrderNum}" data-restaurantsNum="${dto.restaurantsNum}">리뷰쓰기</button> <br>
								<button type="button" class="btn btn2" onclick="javascript:location.href='<%=cp%>/franchise/page?restaurantsNum=${dto.restaurantsNum}'">가게보기</button> <br>
								<button type="button" class="btn btn3" onclick="">주문상세</button>
							</td>
						</tr>	
						</c:forEach>
					</table>
				
					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					   <tr height="35">
							<td align="center">
						        ${dataCount==0? "주문 내역이 없습니다." : paging}
							</td>
					   </tr>
					</table>
					
					<table style="width: 800px; margin: 20px auto; border-spacing: 0px; border-top: 1px solid #41CDCD;">
						<tr height="100">
							<td align="right">
								<button type="button" onclick="javascript:location.href='<%=cp%>/mypage/userorderList'">새로고침</button>
							</td>				
						</tr>			
					</table>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
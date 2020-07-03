<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mypage_order.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/mypage_user.css" type="text/css">

<div class="mypage_container">
    <div class="body-container">
        <div class="body-left">
            <div class="list-group">
                <div class="list-group-item lefthead"> 마이페이지</div>
                <a href="<%=cp%>/mapage/userInfo" class="list-group-item active">회원정보</a>
                <a href="<%=cp%>/mypage/userorderList" class="list-group-item">주문내역</a>
                <a href="#" class="list-group-item">내가 쓴 게시물</a>
                <a href="#" class="list-group-item">내가 쓴 리뷰</a>
                <a href="#" class="list-group-item">내가 쓴 댓글</a>
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
			
					<form name="orderForm" action="<%=cp%>/mypage/userorderList" method="post">
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
								<button type="button" class="btn btn1">리뷰쓰기</button> <br>
								<button type="button" class="btn btn2">가게보기</button> <br>
								<button type="button" class="btn btn3" onclick="javascript:location.href='<%=cp%>/mypage/orderdetail';">주문상세</button>
							</td>
						</tr>	
						</c:forEach>
					</table>
				
					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					   <tr height="35">
							<td align="center">
						        ${dataCount==0? "등록된 게시물이 없습니다." : paging}
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
						<input type="hidden" name="restaurantsNum" value="${dto.restaurantsNum}">
						<input type="hidden" name="foodOrderNum" value="${dto.foodOrderNum}">
					
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
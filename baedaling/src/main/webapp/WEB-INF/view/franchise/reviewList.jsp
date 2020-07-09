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
		<li id="score_text">${aveStarCount} </li>
		<li id="star_deco">★★★★☆</li>
	</ul>
</div>

<div class="reviewContent" style="width: 600px; height: 50px; border: 1px solid #dadadb;">
	
	<ul>
		<li style="padding-left: 20px; padding-top: 12px;">리뷰 <span id="bold">${dataCount }</span>개 | 사장님 댓글 <span id="bold"> 0</span>개</li>
	</ul>

<div class="reviewContent">
	<c:forEach var="dto" items="${list}">
		<ul style="padding-left: 10px; padding-top: 10px;">
			<li > <span style="font-size: 15px; font-weight: bold;">${dto.userName }님  </span> ${dto.created }</li>
			<li id="star_deco">${dto.starCount }</li>
			<li style="color: #15AFD6;">${dto.menuName}</li>
			<li style="display: inline-block;">
				<textarea value="${dto.content }" style="resize: none; readonly="readonly"></textarea>
				
				
			</li>
		</ul>
	</c:forEach>
</div>
</div>	
</div>


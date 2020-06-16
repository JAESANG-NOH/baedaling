<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/eventlist.css" type="text/css">
<div class="event_container">
	<div>
		<h3>Event</h3>
	</div>

	<div>
		<table style="margin: 0px auto; width: 100%; border-spacing: 0px;" >
				<tr height="35px;">
					<td align="left" width="50%">
					1개(1/1 페이지)
					</td>
					<td align="right">
					<span>배달ing&nbsp;>&nbsp;이벤트</span>
					</td>
				</tr>
		</table>
		<table style="width: 100%; margin: 0px auto; border-spacing: 0; border-collapse:collapse;">
			<tr align="center" height="35" style="border-top: 2px solid #828282; border-bottom: 1px solid #828282; background: #41CDCD;">
				<th width="60" style="color:white;">번호</th>
				<th style="color:white;">이벤트</th>
				<th width="120" style="color:white;" align="right">이벤트</th>
				<th width="120" style="color:white;" align="left">&nbsp;기간</th>
				<th width="80" style="color:white;">조회수</th>
			</tr>
		
			<tr align="center" height="180" style="border-bottom: 1px solid #cccccc;">
				<td>1</td>
				<td>
					<a href="#"><img src="<%=cp%>/delivery/img/simple.png" width="350" height="150"></a>
				</td>
				<td>2020-06-15<br>&nbsp;~&nbsp;2020-07-17</td>
				<td>진행중</td>
				<td>3</td>
			</tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px; border-top: 1px solid #41CDCD;">
			<tr height="40" style="padding-top: 30px">
				<td align="left" width="100">
					<button type="button" onclick="javascript:location.href='<%=cp%>/'">글올리기</button>
				</td>		
				<td align="right" width="100">
					<button type="button" onclick="javascript:location.href='<%=cp%>/'">새로고침</button>
				</td>
			</tr>
		</table>
	</div>
</div>
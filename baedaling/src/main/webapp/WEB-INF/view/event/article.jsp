<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/write.css" type="text/css">

<div align="center" class="box">
	<h3
		style="width: 80%; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro'; font-size: 35px;">
		EVENT&nbsp;<span><img id="f_img2"
			src="<%=cp%>/resource/img/gangg.png"></span>
	</h3>
	<br>
	<table class="freeboard">
		<tr class="f_line">
			<td align="left" style="font-weight: bold;" class="subtitle">제목</td>
			<td align="left" id="ftitle" style="color: gray;">${dto.subject}</td>
		</tr>

		<tr class="f_line">
			<td align="left" style="color: gray;" class="subtitle">작성자</td>
			<td align="left" id="subcontent">${dto.userName}</td>
		</tr>

		<tr class="f_line">
			<td class="subtitle">작성일</td>
			<td id="subcontent2">${dto.created}<span style="display: inline-block; margin-left: 30px; font-weight: bold;">조회수</span><span
				style="margin-left: 20px;">${dto.hitCount}</span>
			</td>
		</tr>

		<tr class="fcontent" align="left">
			<td colspan="2" align="left"
				style="padding-left: 20px; border-bottom: 1px solid #cccccc;">
				<textarea style="margin: 0px; width: 940px; height: 420px; border-color: #DDDFE0; resize: none; color: gray; border-radius: 4px;">${dto.content}</textarea>
			</td>
		</tr>
	</table>

	<table>
		<tr height="45">
			<td>
				<button class="btn" type="submit" onclick="javascript:location.href='<%=cp%>/event/created';">수정</button>&nbsp;&nbsp;
				<button class="btn" type="submit" onclick="javascript:location.href='<%=cp%>/event/list';">삭제</button>&nbsp;&nbsp;
				<button class="btn" type="button" onclick="javascript:location.href='<%=cp%>/event/list';">리스트</button>
			</td>
		</tr>
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td align="left" style="padding-left: 5px; color: gray;">
			      이전글 :
			       <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/event/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
			       </c:if>
			</td>
		</tr>
			
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td align="left" style= "width:100%; padding-left: 5px; color: gray;">
			      다음글 :
			       <c:if test="${not empty nextReadDto}">
			              <a href="<%=cp%>/event/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
			       </c:if>
			</td>
		</tr>
	</table>
</div>
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
		자유게시판&nbsp;<span><img id="f_img2"
			src="<%=cp%>/delivery/img/gangg.png"></span>
	</h3>
	<br>
	<table class="freeboard">
		<tr class="f_line">
			<td align="left" style="font-weight: bold;" class="subtitle">제목</td>
			<td align="left" id="ftitle" style="color: gray;"><input
				class="boxTF" style="width: 95%; color: gray;"></td>
		</tr>

		<tr class="f_line">
			<td align="left" style="color: gray;" class="subtitle">작성자</td>
			<td align="left" id="subcontent">이미현</td>
		</tr>

		<tr class="f_line">
			<td class="subtitle">작성일</td>
			<td id="subcontent2">2020-06-15 <span style="display: inline-block; margin-left: 30px; font-weight: bold;">조회수</span><span
				style="margin-left: 20px;">181</span>
			</td>
		</tr>

		<tr class="fcontent" align="left">
			<td colspan="2" align="left"
				style="padding-left: 20px; border-bottom: 1px solid #cccccc;">
				<textarea style="margin: 0px; width: 940px; height: 420px; border-color: #DDDFE0; resize: none; color: gray; border-radius: 4px;"></textarea>
			</td>
		</tr>

		<tr align="left" height="100"
			style="border-bottom: 1px solid #DDDFE0; height: 50px">
			<td align="left" style="font-weight: bold;" class="subtitle">첨부파일</td>
			<td><input class="boxTF" type="file" name="upload" size="3"
				style="width: 95%;"></td>
		</tr>


	</table>

	<table>
		<tr>
			<td height="100px">
				<button class="btn" type="submit">등록하기</button>&nbsp;&nbsp;
				<button class="btn" type="reset">다시입력</button>&nbsp;&nbsp;
				<button class="btn" type="button">등록취소</button>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
</div>
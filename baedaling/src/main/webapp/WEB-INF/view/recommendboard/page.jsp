<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<<script type="text/javascript">
function delete_send() {
	
}
</script>
<link rel="stylesheet" href="<%=cp%>/resource/css/page.css" type="text/css">
<div align="center" class="box">
<h3 style="width: 80%; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro'; font-size: 35px; ">추천 게시판&nbsp;<span><img id="f_img2" src="<%=cp%>/resource/img/gangg.png"></span> </h3>
	<br>
	<table  class="freeboard">
		<tr class="f_line">
			<td align="left" style="font-size:15px; margin-top:3px; font-weight: bold;" class="subtitle">제목</td>
			<td align="left" id="ftitle" style="font-size:15px; color: gray;" > ${dto.subject}</td>
		</tr>
		
		<tr class="f_line">
			<td align="left" style="color: gray;" class="subtitle">작성자</td>
			<td align="left" id="subcontent">${dto.userName}</td>
		</tr>
		
		<tr class="f_line">
			<td class="subtitle">작성일</td>
			<td id="subcontent2">
				${dto.created}
				<span style="display: inline-block; margin-left:30px; font-weight: bold;">조회수</span><span style="margin-left:20px;">${dto.hitCount}</span>
			</td>
		</tr>
		
		<tr class="fcontent" align="left" >
			<td colspan="2" align="left" style="padding-left: 20px; border-bottom: 1px solid #DDDFE0;" >${dto.content}</td>
		</tr>
	
		<tr style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" height="40" style="padding-bottom: 15px;" align="center">
					<a href=""><span style="color:#38BCC6;"><i class="fab fa-gratipay fa-3x"></i></span></a>&nbsp;&nbsp;<span id="boardLikeCount" style="color: gray;">0</span>
			</td> 
		</tr>
		<c:forEach var="vo" items="${listFile}">
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
				    <td colspan="2" align="left" style="padding-left: 5px;">
				      <a href="<%=cp%>/recommend/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
			          (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
				    </td>
				</tr>
	    </c:forEach>
		
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px; color: gray;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/recommend/page?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
			        </c:if>
			</td>
		</tr>
			
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px; color: gray;">
			       다음글 :
			        <c:if test="${not empty nextReadDto}">
			              <a href="<%=cp%>/recommend/page?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
			        </c:if>
			</td>
		</tr>
	</table>
	<div class="f_button" align="right">
		<button id="f_btn2" type="button" onclick="">수정</button>
		<button id="f_btn" type="button" onclick="delete_send();">삭제</button> 
		<button id="f_btn3" type="button" onclick="javascript:location.href='<%=cp%>/recommend/list?${query}';">리스트</button>
	</div>
</div>

<table  style='width: 50%; margin: 15px auto 0px; border-spacing: 0px;'>
		<tr height='30'> 
			 <td align='left' >
			 	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
			 </td>
		</tr>
		<tr >
		   	<td align="center" style='padding:5px 5px 0px;'>
				<textarea class='boxTA' style='height: 70px;'></textarea>
		    </td>
		</tr>
		<tr align="right">
		   <td  class="f_reply">
		        <button type='button' style='height:37px; margin:10px; padding:10px 20px; align-items: center'>댓글 등록</button>
		    </td>
	    </tr>
</table>
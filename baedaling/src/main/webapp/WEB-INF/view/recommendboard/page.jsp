<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/page.css" type="text/css">
<div align="center" class="box">
<h3 style="width: 80%; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro'; font-size: 35px; ">자유게시판&nbsp;<span><img id="f_img2" src="<%=cp%>/resource/img/gangg.png"></span> </h3>
	<br>
	<table  class="freeboard">
		<tr class="f_line">
			<td align="left" style="font-size:15px; margin-top:3px; font-weight: bold;" class="subtitle">제목</td>
			<td align="left" id="ftitle" style="font-size:15px; color: gray;" > 서교동 통다리치킨</td>
		</tr>
		
		<tr class="f_line">
			<td align="left" style="color: gray;" class="subtitle">작성자</td>
			<td align="left" id="subcontent">이미현</td>
		</tr>
		
		<tr class="f_line">
			<td class="subtitle">작성일</td>
			<td id="subcontent2">
				2020-06-15
				<span style="display: inline-block; margin-left:30px; font-weight: bold;">조회수</span><span style="margin-left:20px;">181</span>
			</td>
		</tr>
		
		<tr class="fcontent" align="left" >
			<td colspan="2" align="left" style="padding-left: 20px; border-bottom: 1px solid #DDDFE0;" >완전 맛대가리 없습니당</td>
		</tr>
	
		<tr style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" height="40" style="padding-bottom: 15px;" align="center">
					<a href=""><span style="color:#38BCC6;"><i class="fab fa-gratipay fa-3x"></i></span></a>&nbsp;&nbsp;<span id="boardLikeCount" style="color: gray;">58</span>
			</td> 
		</tr>
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    	<td colspan="2" align="left" style="padding-left: 5px; color: gray;">
			       첨&nbsp;&nbsp;부 :
			</td>
		</tr>
		
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px; color: gray;">
			       이전글 :
			        <a href=""> 이전글입니다.</a>
			</td>
		</tr>
			
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px; color: gray;">
			       다음글 :
			        <a href=""> 다음글입니다.</a>
			</td>
		</tr>
	</table>
	<div class="f_button" align="right">
		<button id="f_btn2">수정</button>
		<button id="f_btn">삭제</button> 
		<button id="f_btn3">리스트</button>
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
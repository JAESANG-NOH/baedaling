<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/event.css" type="text/css">
<div class="event_Box">
	<div class="nav-box">
    	<div class="nav">배달ing&nbsp; 〉이벤트</div>
    </div>
            	
    <div>
    	<h3><span style="font-family: Webdings"></span>이벤트 등록/수정</h3>
    </div>
   
    <div class="event_tool">
    	<table style="margin: 20px auto; width: 100%; border-spacing: 0px; border-top: 2px solid #41CDCD;">
        	<tr height="10px">
            	<td width="30%">제&nbsp;목 </td>
            	<td width="40%" style="padding: 0px;">
            		<input type="text" name="subject" maxlength="50" style="width: 400px; height: 20px; margin-left: 0px;" value="김자바">
            	</td>           		
			</tr>
			<tr height="10px">
				<td style="vertical-align: middle;">내&nbsp;용 </td>
				<td width="100%;" style="padding: 10px;">
					<textarea name="content" rows="30" cols="100">내용입니다.</textarea>
				</td>
			</tr>
			<tr>
				<td style="padding: 10px;" colspan="2"> 이벤트 기간 설정&nbsp;&nbsp;:&nbsp;&nbsp;
					<input type="text" name="start_date" value="2020-05-22" maxlength="10" value="2020-06-16">~
					<input type="text" name="end_date" value="2020-05-23" maxlength="10" value="2020-07-17">
				</td>
			</tr>
			<tr height="10px">
				<td style="padding: 10px;" colspan="2">
					<input type="hidden" name="num" value="" />
					<input type="hidden" name="page" value=""/>
	
					<button type="submit">${mode=='update'?"수정":"등록"}</button>
					<button type="button" onclick="javascript:location.href='<%=cp%>/';">취소</button>
				</td>	
           </table>
      </div>       	
   </div>
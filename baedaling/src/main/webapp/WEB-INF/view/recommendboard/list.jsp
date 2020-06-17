<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/list.css" type="text/css">

<div class="body-container" align="center" style="width: 700px;">
    <div class="body-title" align="center">
     <h3 style="font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; font-size: 35px; ">추천 게시판 </h3>
    </div>
    
    <div>
      <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
         <tr height="35">
            <td align="left" width="50%">
                ${dataCount}개(${on_page}/${total_page}페이지)
            </td>
            <td align="right">
                &nbsp;
            </td>
         </tr>
      </table>
      <!-- "#EFF1F3" -->
      <table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
        <tr align="center" bgcolor="#EFF1F3" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; "> 
            <th width="60" style="color: #787878;">번호</th>
            <th style="color: #787878;">제목</th>
            <th width="100" style="color: #787878;">작성자</th>
            <th width="80" style="color: #787878;">작성일</th>
            <th width="60" style="color: #787878;">조회수</th>
        </tr>
<c:forEach var="dto" items="${list}">
       <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>${dto.listNum}</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="">${dto.subject}</a>
            </td>
            <td>${dto.userName}</td>
            <td>${dto.created}</td>
            <td>${dto.hitCount}</td>
        </tr>
</c:forEach>       
        </table>
      <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
         <tr height="35">
         <td align="center">
         </tr>
      </table>
      <table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
         <tr height="40">
            <td align="left" width="100">
                <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/recommend/list'">새로고침</button>
            </td>
            <td align="center">
                <form name="searchForm" action="" method="post">
                    <select name="condition" class="selectField">
                        <option value="all" selected='selected'>모두</option>
                        <option value="subject" >제목</option>
                        <option value="content" >내용</option>
                        <option value="userName" >작성자</option>
                        <option value="created" >등록일</option>
                  </select>
                  <input type="text" name="keyword" value="" class="boxTF">
                  
                  <button type="button" class="btn" onclick="searchList()">검색</button>
              </form>
            </td>
            <td align="right" width="100">
                <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/recommend/write'">글올리기</button>
            </td>
         </tr>
      </table>
    </div>

</div>
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
     <h3 style="font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; font-size: 35px; ">자유 게시판 </h3>
    </div>
    
    <div>
      <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
         <tr height="35">
            <td align="left" width="50%">
                7개(1/1 페이지)
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
            <th width="50" style="color: #787878;">첨부</th>
        </tr>
       
       <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>7</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="/sp4/bbs/article?page=1&num=7">11111111111111111111111 (0)</a>
            </td>
            <td>스프링</td>
            <td>2020-06-11</td>
            <td>2</td>
            <td>
                    </td>
        </tr>
        <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>6</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="/sp4/bbs/article?page=1&num=6">표 (0)</a>
            </td>
            <td>스프링</td>
            <td>2020-06-11</td>
            <td>12</td>
            <td>
                    </td>
        </tr>
        <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>5</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="/sp4/bbs/article?page=1&num=5">z (1)</a>
            </td>
            <td>스프링</td>
            <td>2020-06-11</td>
            <td>1</td>
            <td>
                    </td>
        </tr>
        <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>4</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="/sp4/bbs/article?page=1&num=4">고도리 (2)</a>
            </td>
            <td>이미현</td>
            <td>2020-06-04</td>
            <td>43</td>
            <td>
                    <a href="/sp4/bbs/download?num=4"><i class="far fa-file"></i></a>
                    </td>
        </tr>
        <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>3</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="/sp4/bbs/article?page=1&num=3">영어 (3)</a>
            </td>
            <td>이미현</td>
            <td>2020-06-04</td>
            <td>56</td>
            <td>
                    </td>
        </tr>
        <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>2</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="/sp4/bbs/article?page=1&num=2">ㅋㅋ (1)</a>
            </td>
            <td>이미현</td>
            <td>2020-06-04</td>
            <td>14</td>
            <td>
                    </td>
        </tr>
        <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
            <td>1</td>
            <td align="left" style="padding-left: 10px;">
                 <a href="/sp4/bbs/article?page=1&num=1">배고파 (1)</a>
            </td>
            <td>이미현</td>
            <td>2020-06-04</td>
            <td>10</td>
            <td>
                    </td>
        </tr>
        </table>
       
      <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
         <tr height="35">
         <td align="center">
         </tr>
      </table>
      
      <table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
         <tr height="40">
            <td align="left" width="100">
                <button type="button" class="btn" onclick="javascript:location.href='/sp4/bbs/list';">새로고침</button>
            </td>
            <td align="center">
                <form name="searchForm" action="/sp4/bbs/list" method="post">
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
                <button type="button" class="btn" onclick="javascript:location.href='/sp4/bbs/created';">글올리기</button>
            </td>
         </tr>
      </table>
    </div>

</div>
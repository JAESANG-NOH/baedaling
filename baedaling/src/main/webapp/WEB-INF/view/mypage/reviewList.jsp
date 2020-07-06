<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/mypage_reviewlist.css" type="text/css">

<div class="container">



    <div class="body-container">
        <div class="body-left">
            <div class="list-group">
                <div class="list-group-item lefthead"> 마이페이지</div>
                <a href="<%=cp%>/mypage/userInfo" class="list-group-item active">회원정보</a>
                <a href="<%=cp%>/mypage/order/list" class="list-group-item">주문내역</a>
                <a href="#" class="list-group-item">내가 쓴 게시물</a>
                <a href="#" class="list-group-item">내가 쓴 리뷰</a>
                <a href="#" class="list-group-item">내가 쓴 댓글</a>
                <a href="<%=cp%>/mypage/complete/message" class="list-group-item">회원정보수정</a>
                <a href="#" class="list-group-item">회원탈퇴</a>
            </div>     
        </div>
    
        <div class="body-right">
            <div class="body-right-container">
                 <div class="body-title">
                     <h3><span  style=" font-family: Webdings">4</span> 마이페이지 </h3>
                 </div>
                 <div id="mypage_container">
                    <div class="alert-info">
                   <p style= "color:white; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; font-size: 25px; text-align: center;">My Review List</p>
               </div>
               
        <div>
             <table>
               <tr>
               		<td style=" border-bottom:1px solid gray; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; font-size: 20px; ">내가 쓴 총 리뷰 1&nbsp;개</td>
               </tr>
             </table>
        </div>
               
                      <div class="mypage_box">
                         <table border="1" style="margin: auto; width:95%; border-collapse: collapse; border-spacing: 0;">
                            <tr class="subtitle" align="center" style="height:30px;">
                               <td align="center" style="font-weight: bold; color: gray;" class="subtitle">가게 이름 </td>
                               <td align="center" id="ftitle" style="color:gray;">치킨 개잘하는 집 </td>
                            </tr>
                            <tr class="subtitle" align="center" style="height:30px;">
                               <td align="center" style="font-weight: bold; color: gray;" class="subtitle">작성 날짜 </td> 
                               <td  align="center" id="ftitle" style="color:gray;">2020-07-03</td>
                            </tr>
                            <tr align="center" height="80"> <span>&nbsp;&nbsp;&nbsp;★★★★★</span>
                               <td colspan="2" style="color:gray; border: 1px solid #BDBDBD;">  리뷰내용zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                            </tr>
                            <tr>
                            	 <button type="button" class="btn">삭제</button> 
                            </tr>
                         </table>
                      </div>
                 </div>
            </div>
        </div>
    </div>        
</div>

</body>
</html>
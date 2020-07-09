<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/mypage_user.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/reviewList.css" type="text/css">
<div class="mypage_container">
    <div class="body-container">
        <div class="body-left">
            <div class="list-group">
                <div class="list-group-item lefthead"> 마이페이지</div>
                <a href="<%=cp%>/mypage/userInfo" class="list-group-item active">회원정보</a>
                <a href="<%=cp%>/mypage/order/list" class="list-group-item">주문내역</a>
                <a href="#" class="list-group-item">내가 쓴 게시물</a>
                <a href="#" class="list-group-item">내가 쓴 리뷰</a>
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
               <tr height="35">
               		<td style=" border-bottom:1px solid gray; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; font-size: 20px; ">내가 쓴 총 리뷰 ${dataCount}&nbsp;개</td>
               </tr>
             </table>
        </div>

        <div class="review_box">
        <c:forEach var="dto" items="${list}">
        	<table style="border: 1px solid #808080; margin-bottom: 20px; width: 95%; border-collapse: collapse; border-spacing: 0;" >
        		<tr class="subtitle" height="35" style="border-bottom: 1px solid #cccccc;">
        			<td id="ftitle" style="font-weight: bold; ">가게명 </td>
        			<td id="ftitle" style="padding-top: 8px;"  > ${dto.name}
                    	<button class="reviewDeletebtn">삭제</button>
                    </td>
                </tr>
                <tr class="subtitle" height="35" style="border-bottom: 1px solid #cccccc;">
                    <td id="ftitle" style="font-weight: bold;">작성 날짜 </td> 
                    <td id="ftitle">${dto.created}</td>
                </tr>
                <tr class="subtitle" height="35" style="border-bottom: 1px solid #cccccc;">
                	<td id="ftitle" style="font-weight: bold;">내가 준 별점 </td> 
                    <td id="ftitle">${dto.starCount} &nbsp;/&nbsp;5</td>
                </tr>
                <tr height="100" style="border-bottom: 1px solid #cccccc;">
                	<td colspan="2" style="color:gray; padding-left: 10px;">${dto.content}</td>
                </tr>
                <tr class="subtitle2">
                	<td width="300" style="border-right-color: #f8f8f8; font-weight: bold; color:black; border-top: 1px solid #cccccc;">
                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└&nbsp;&nbsp;&nbsp;RE : ${dto.name}&nbsp;사장님</td>
                	<td align="right" colspan="2" style="color: black;" >${dto.replycreated}&nbsp;&nbsp;</td>
                </tr>           
                <tr height="80">
                    <td colspan="2" style="color:black; border: 1px solid #BDBDBD; background-color: #f8f8f8;">${dto.reply}</td>
                </tr>                
           	</table>
	                <input type="hidden" name="foodOrderNum" value="${foodOrderNum}">
				   	<input type="hidden" name="restaurantsNum" value="${restaurantsNum}">      
           	</c:forEach>
           	
           	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
        		<tr height="35">
         			<td align="center">
         				${dataCount==0 ? "등록하신 리뷰가 없습니다.":paging}
         			</td>
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

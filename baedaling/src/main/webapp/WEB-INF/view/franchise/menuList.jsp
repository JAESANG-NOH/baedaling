<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="all_menuList" style="width: 600px; margin: 0px auto;">

<div class="menuImg_table" align="center" style="margin: 5px; padding: 5px;">
	<c:forEach var="dto" items="${menuList }">
		<ul >
			<li><img class="store_menu_img" src="<%=cp%>/uploads/menu/${dto.saveFilename}" onerror="this.src='<%=cp%>/resource/img/ready.jpg'"></li>
			<li style="text-align: center;" class="menuName" data-menuNum="${dto.menuNum }">${dto.menuName }</li>
			<li style="text-align: center;">${dto.menuPrice }</li>
		</ul>
	</c:forEach>

</div>

<table class="menu_table">
	<tr>
		<td><span><i class="fas fa-award"></i></span> 인기 메뉴 <span style="margin-left: 20px; padding-left: 430px;"><a href=""><i class="fas fa-chevron-down"></i></a></span></td>
	</tr>
	<c:forEach var="vo" items="${listCatrgory }">
		<tr class="listCatrgory" data-menuCategoryNum="${vo.menuCategoryNum }">
			<td>${vo.menuCategoryName } <span style="margin-left: 20px; padding-left: 466px;"><a href=""><i class="fas fa-chevron-down"></i></a></span></td>
		</tr>
		<tr class = "detailCategory" style="display: none;">
			<td>
	
			</td>
		</tr>
		
	
	</c:forEach>
</table>

<div id="readMenu-dialog" style="display: none;">
		<form name="readMenuForm">
			<table style="width: 100%;  margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr>
			      <td colspan="2">
			        <img class="detail-image"  onerror="this.src='<%=cp%>/resource/img/ready.jpg'" style="display: block; width: 100%;  height: 300px;">
			      </td>
			  </tr>
			
			  <tr>
			      <td colspan="2" class="detail-text" id="menuName" style="text-align: center; font-size: 25px; padding-top :15px;">
			       <!--  <input class="detail-text" type="text" name="menuName" readonly="readonly"> -->
			      		치즈케이크 블랙타이거피자 
			      </td>
			  </tr>
			  <tr>
			  	<td style="text-align:center; color: #999999; padding: 10px;" colspan="2">인기 메뉴 블랙타이거 슈림프와 단종 메뉴 치즈케이크 샌드 콜라보</td>
			  </tr>
			
			  <tr style="height: 50px;">
			      <td style="border-top: 1px solid #f0f0f0; border-bottom:1px solid #f0f0f0;">
			      	가격 
			        <!-- <input class="detail-price" type="text" name="menuPrice" readonly="readonly"> -->
			      </td >
			      <td style="border-top: 1px solid #f0f0f0; border-bottom:1px solid #f0f0f0; text-align: right;">
			      	<span style="text-align:right; font-weight: bold; padding-right: 15px; font-size: 14px;">30,000</span>원 
			      </td>
			  </tr>
					
				<tr height="60px;" style="background-color: #f0f0f0;">
					<td style="font-weight: bold;">총 주문금액</td>
					<td style="font-size: 23px; color: red; text-align: right; padding-right: 10px;">35,900 원</td>
				</tr>
				
			  <tr>
			      
			      <td style="width: 50%; text-align: center; background-color:#38BCC6; color: white; height: 60px;">
			       	<span class="buyAdd" style="font-weight: bold;">주문표에 추가</span>
			      </td>
			      <td style="width: 50%; text-align: center; background-color:#555555; color: white; height: 60px;">
			      	<span style="font-weight: border: ;">취소</span>
			      </td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  		<input type="hidden" name="menuNum">
			  	</td>
			  </tr>
			 
			  </table>
		</form>
    </div>

</div>

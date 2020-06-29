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
	<ul>
		<li><img id="store_menu_img" src="<%=cp%>/uploads/menu/${dto.saveFilename}" onerror="this.src='<%=cp%>/resource/img/ready.jpg'"></li>
		<li style="text-align: center;" id="menuName">${dto.menuName }</li>
		<li style="text-align: center;">${dto.menuPrice }</li>
	</ul>
	</c:forEach>

</div>

<table class="menu_table">
	<tr>
		<td><span><i class="fas fa-award"></i></span> 인기 메뉴 <span style="margin-left: 20px; padding-left: 430px;"><a href=""><i class="fas fa-chevron-down"></i></a></span></td>
	</tr>
	<c:forEach var="vo" items="${listCatrgory }">
	<tr>
		<td>${vo.menuCategoryName } <span style="margin-left: 20px; padding-left: 466px;"><a href=""><i class="fas fa-chevron-down"></i></a></span></td>
	</tr>
	
	</c:forEach>
</table>
</div>

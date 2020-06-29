<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>


<div style="background: white; " class="menunu" align="center">
	<table class="menuContainer">
		<tr height="35px">
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/all.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/korea.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/china.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/japan.png"></a></td>
		</tr>
				
		<tr>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/west.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/chicken.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/pizza.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/fast.png"></a></td>
		</tr>
			
		<tr>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/dd.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/brunch.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/night.png"></a></td>
			<td><a href="#"><img class="menu-Box" src="<%=cp%>/resource/img/delivery/desert.png"></a></td>
		</tr>
	</table>
</div>	
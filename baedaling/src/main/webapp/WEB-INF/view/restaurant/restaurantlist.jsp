<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/restaurants_list.css" type="text/css">

<script type="text/javascript">

function searchList() {
	var f=document.searchForm;
	f.enabled.value=$("#selectEnabled").val();	
	f.action="<%=cp%>/restaurant/restaurantlist";
	f.submit();
}

function detaileRestaurant(userId) {
	var dlg = $("#user-dialog").dialog({
		autoOpen: false,
		modal: true,
		buttons: {
			"수정": function() {
				updateOk();
			},
			"닫기": function() {
				$(this).dialog("close");
			}
		},
		height: 520,
		width: 800,
		title: "가게상세정보",
		close: function(event, ui){
		}
	});
	
	var url = "<%=cp%>/restaurant/detaileRestaurant";
	var query = "userId="+userId;
	
	$.ajax({
		url:url,
		data:query,
		type:'post',
		success: function(data){
			$('#user-dialog').html(data);
			dlg.dialog("open");
		},
		beforeSend: function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error: function(jqXHR) {
			if(jqXHR.status==403) {
				location.href="<%=cp%>/restaurant/restaurantlist";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function updateOk() {
	var f = document.detailedRestaurantForm;
	
	if(! f.stateCode.value) {
		f.stateCode.focus();
		return;
	}
	var url="<%=cp%>/restaurant/updateUserState";
	var query=$("#detailedRestaurantForm").serialize();
	
	$.ajax({
		url: url,
		data: query,
		type: 'post',
		success: function(data){
			$("form input[name=page]").val("${page}");
			searchList();
		},
		beforeSend: function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error: function(jqXHR) {
			if(jqXHR.status==403) {
				location.href="<%=cp%>/restaurant/restaurantlist";
			}
			console.log(jqXHR.responseText);
		}
	});
	$('#user-dialog').dialog("close");
}

function selectStateChange() {
	
}

</script>

<div class="list_container">
	<div style="width: 100%; margin: 20px auto;">
		<div align="left">
			<h2 style="width: 80%; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro'; font-size: 25px;">
			|&nbsp;가맹점 목록&nbsp;<span><img width="70px" height="70px"
			src="<%=cp%>/resource/img/gangg.png"></span></h2>
		</div>
		
		<table style="margin: 0px auto; width: 100%; border-spacing: 0px;" >
				<tr height="35px;">
					<td align="left" style="font-size: 13px;">
					 ${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">
					</td>
					
					 <td align="right">
			          <select id="selectEnabled" class="selectField" onchange="searchList();">
			          		<option value="" ${enabled=="" ? "selected='selected'":""}>::계정상태::</option>
			          		<option value="1" ${enabled=="1" ? "selected='selected'":""}>활성 계정</option>
			          		<option value="0" ${enabled=="0" ? "selected='selected'":""}>잠금 계정</option>
			          </select>
			      </td>
				</tr>
		</table>
		
		<table style="width: 1100px; margin: 0px auto; border-spacing: 0; border-collapse:collapse;">
			<tr align="center" height="35" style="border-top: 2px solid #828282; border-bottom: 1px solid #828282; background: #41CDCD;">
				<th width="60" style="color:white;">번호</th>
				<th width="90" style="color:white;">이름</th>
				<th width="80" style="color:white;">아이디</th>
				<th width="80" style="color:white;">상호명</th>
				<th width="130" style="color:white;">업체등록번호</th>
				<th width="150" style="color:white;">주&nbsp;&nbsp;소</th>
				<th width="100" style="color:white;">상&nbsp;&nbsp;태</th>
			</tr>
			
	<c:forEach var="dto" items="${list}">	
			<tr onclick="detaileRestaurant('${dto.userId}');" align="center" height="50" style="border-bottom: 1px solid #cccccc; font-size: 12px;">
				<td>${dto.listNum}</td>
				<td>${dto.name}</td>
				<td>${dto.userId}</td>
				<td>${dto.mutualName}</td>
				<td>${dto.licenseNumber}</td>
				<td>${dto.addr1}${dto.addr2}</td>
				<td>
					${dto.enabled=="1"?"활성":"잠금"}
				</td>
			</tr>
	</c:forEach>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
				<td align="center">
			        ${dataCount==0?"등록된 게시물이 없습니다.":paging}
				</td>
		   </tr>
		</table>
		
		
		<table style="width: 100%; margin: 20px auto; border-spacing: 0px; border-top: 1px solid #41CDCD;">
			<tr height="100">
				<td align="right">
					<button type="button" onclick="javascript:location.href='<%=cp%>/restaurant/restaurantlist'">새로고침</button>
				</td>
				  <td align="center">
					   <form name="searchForm" action="<%=cp%>/restaurant/restaurantlist" method="post">
			              <select name="condition" class="selectField">
			                  <option value="userId"     ${condition=="userId" ? "selected='selected'":""}>아이디</option>
			                  <option value="name"   ${condition=="name" ? "selected='selected'":""}>이름</option>
			                  <option value="tel"        ${condition=="tel" ? "selected='selected'":""}>전화번호</option>
			            </select>
			            <input type="text" name="keyword" class="boxTF" value="${keyword}">
			            <input type="hidden" name="enabled" value="${enabled}">
			            <input type="hidden" name="page" value="1">
			            <button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
			      </td>		
			</tr>		
		</table>
	</div>
	<div id="user-dialog" style="display: none"></div>
</div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://unpkg.com/@kfonts/bm-hanna-pro/index.css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/dashboard.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>

<script type="text/javascript">

function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

$(function(){
	$("body").on("click", ".btnOrderOk", function(){
		if(! confirm("주문을 받을까요?"))
		    return;
		var restaurantsNum = $(this).next().next().val();
		var foodorderNum=$(this).attr("data-foodorderNum");
		var orderState = $(this).attr("data-orderState");
		var url = "<%=cp%>/dashboard/updateState";
		var query = "foodorderNum="+foodorderNum+"&orderState=" + orderState;
		var fn = function(data) {
			var state = data.state;
			if(state == false){
				alert("다시 시도해주세요");
			}
			location.href="<%=cp%>/dashboard/orderlist?restaurantsNum="+restaurantsNum;
		}

		//alert(foodorderNum);
		ajaxJSON(url, "post", query, fn);
	});
});



$(function(){
	$("body").on("click", ".btnResOk", function(){
		if(! confirm("라이더를 요청 할까요? "))
		    return;
		var restaurantsNum = $(this).next().val();
		var foodorderNum=$(this).attr("data-foodorderNum");
		var orderState = $(this).attr("data-orderState");
		var url = "<%=cp%>/dashboard/updateState";
		var query = "foodorderNum="+foodorderNum+"&orderState=" + orderState;
		var fn = function(data) {
			var state = data.state;
			if(state == false){
				alert("다시 시도해주세요");
			}
			 /* var q = "restaurantsNum=${dto.restaurantsNum}"; */
			location.href="<%=cp%>/dashboard/orderlist?restaurantsNum="+restaurantsNum;
		}

		//alert(foodorderNum);
		ajaxJSON(url, "post", query, fn);
	});
});


$(function(){
	$("body").on("click", ".btnDeliOk", function(){
		if(! confirm("배달이 완료되었습니까?"))
		    return;
		var restaurantsNum = $(this).next().val();
		var foodorderNum=$(this).attr("data-foodorderNum");
		var orderState = $(this).attr("data-orderState");
		var url = "<%=cp%>/dashboard/updateState";
		var query = "foodorderNum="+foodorderNum+"&orderState=" + orderState;
		var fn = function(data) {
			var state = data.state;
			if(state == false){
				alert("다시 시도해주세요");
			}
			
			location.href="<%=cp%>/dashboard/orderlist?restaurantsNum="+restaurantsNum;
		}

		//alert(foodorderNum);
		ajaxJSON(url, "post", query, fn);
	});
});




$(function(){
	$("body").on("click", ".btnOrderCancel", function(){
		if(! confirm("주문을 취소할까요?"))
		    return;
		var restaurantsNum = $(this).next().val();
		var foodorderNum=$(this).attr("data-foodorderNum");
		var orderState = $(this).attr("data-orderState");
		var url = "<%=cp%>/dashboard/updateState";
		var query = "foodorderNum="+foodorderNum+"&orderState=" + orderState;
		var fn = function(data) {
			var state = data.state;
			if(state == false){
				alert("다시 시도해주세요");
			}
			alert("주문이 취소되었습니다.")
			location.href="<%=cp%>/dashboard/orderlist?restaurantsNum="+restaurantsNum;
		}

		//alert(foodorderNum);
		ajaxJSON(url, "post", query, fn);
	});
});





$(function(){
	$("body").on("click", ".btnOrderDelete", function(){
		var restaurantsNum = $(this).next().val();
		var foodorderNum=$(this).attr("data-foodorderNum");
			 var q = "restaurantsNum=${dto.restaurantsNum}";
		if(! confirm("완료된 주문을 삭제할까요?"))
		    return;
		var url = "<%=cp%>/dashboard/delete";
		var query = "foodorderNum="+foodorderNum;
		var fn = function(data) {
			var state = data.state;
			if(state == false){
				alert("다시 시도해주세요");
		}
			location.href="<%=cp%>/dashboard/orderlist?restaurantsNum="+restaurantsNum;
		}
		ajaxJSON(url, "post", query, fn);
	});
});
</script>
<div style="width: 25px; background-color: #F6F5F5">&nbsp;</div>
<div id="dashboard_box">
<table id="dash_table">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
		<span style="color: #38BCC6;">| </span>대시보드<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="150px;" id="waiting_text">주문완료</td>
		<td width="150px;" id="waiting_text">접수완료</td>
		<td width="150px;" id="waiting_text">배달중</td>
		<td width="150px;" id="waiting_text">배달완료</td>
	</tr>

	<tr style="width: 800px; text-align: center;">
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;${orderCount1}</td>
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;${orderCount2}</td>
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;${orderCount3}</td>
		<td width="150" style="font-size: 45px; font-weight: bold;">&nbsp;${orderCount4}</td>
	</tr>

</table>
</div>

<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>주문완료   <span style="color: #38BCC6;">|</span>
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">No</td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주소</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문내역</td>
		<td width="150px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문시간</td>
		<td width="100" style="border-bottom: 1px dotted #F6F5F5;" id="waiting_text">확인</td>
	</tr>
<c:forEach var="dto" items="${list1}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;">${dto.foodorderNum}</td>
		<td width="300px;">${dto.foodOrderAddr}</td>
		<td width="200px;">${dto.menuNum}-${dto.menuName}</td>
		<td width="150px;">${dto.foodOrderDate}</td>
		<td width="100px;">
			<button type="button" data-foodorderNum="${dto.foodorderNum}" data-orderState="접수완료" class="btnOrderOk">확인</button>
			<button type="button" data-foodorderNum="${dto.foodorderNum}" data-orderState="주문취소" class="btnOrderCancel">취소</button>
			<input type="hidden" name ="restaurantsNum" value = "${dto.restaurantsNum }">
		</td>
	</tr>
</c:forEach>
</table>
</div>

<div id="dash3board_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>접수완료<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>
	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">No</td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주소</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문내역</td>
		<td width="150px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문시간</td>
		<td width="100" style="border-bottom: 1px dotted #F6F5F5;" id="waiting_text">확인</td>
	</tr>
<c:forEach var="dto" items="${list2}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;">${dto.foodorderNum}</td>
		<td width="300px;">${dto.foodOrderAddr}</td>
		<td width="200px;">${dto.menuNum}-${dto.menuName}</td>
		<td width="150px;">${dto.foodOrderDate}</td>
		<td width="100px;"><button type="button" data-foodorderNum="${dto.foodorderNum}" data-orderState="배달중" class="btnResOk">라이더요청</button>
							<input type="hidden" name ="restaurantsNum" value = "${dto.restaurantsNum }">
							</td>
		
	</tr>
</c:forEach>
</table>
</div>

<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>배달중<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>

	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">No</td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주소</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문내역</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문시간</td>
	</tr>
<c:forEach var="dto" items="${list3}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;">${dto.foodorderNum}</td>
		<td width="300px;">${dto.foodOrderAddr}</td>
		<td width="200px;">${dto.menuNum}-${dto.menuName}</td>
		<td width="200px;">${dto.foodOrderDate}</td>
		<td width="100px;"><button type="button" data-foodorderNum="${dto.foodorderNum}" data-orderState="배달완료" class="btnDeliOk">완료</button>
							<input type="hidden" name ="restaurantsNum" value = "${dto.restaurantsNum }">
							</td>
	</tr>
</c:forEach>
</table>
</div>


<div id="dashboard_box">
<table id="dash_table2">
	<tr id="dash_title">
		<td colspan="3" style="padding-left : 20px;">
			 <span style="color: #38BCC6;">| </span>배달완료<span style="color: #38BCC6;"> |</span>
		</td>
	</tr>

	<tr style="width: 800px; text-align: center;">
		<td width="100px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">No</td>
		<td width="300px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주소</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문내역</td>
		<td width="200px;" style="border-bottom: 3px dotted #F6F5F5;" id="waiting_text">주문시간</td>
	</tr>
	
<c:forEach var="dto" items="${list4}">	
	<tr style="width: 800px; text-align: center;">
		<td width="100px;">${dto.foodorderNum}</td>
		<td width="300px;">${dto.foodOrderAddr}</td>
		<td width="200px;">${dto.menuNum}-${dto.menuName}</td>
		<td width="200px;">${dto.foodOrderDate}</td>
		<td width="100px;"><button type="button" data-foodorderNum="${dto.foodorderNum}" class="btnOrderDelete">삭제</button>
							<input type="hidden" name ="restaurantsNum" value = "${dto.restaurantsNum}">
							</td>
	</tr>
</c:forEach>
</table>
</div>
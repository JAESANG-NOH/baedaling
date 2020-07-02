<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resource/css/storepage.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">

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




function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
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
	$("#tab-0").addClass("active");
	listPage();
	
	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		listPage();
	});
});

function listPage(){
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url = "<%=cp%>/franchise/";
	var query = "restaurantsNum="+${dto.restaurantsNum};
	var purl = "";
	if(tab == 0){
		purl = "menu";
	}
	if(tab == 1){
		purl = "review";
	}
	
	if(tab == 2){
		purl = "info";
	}
	
	url = url + purl;
	$("#contentLayout").empty();
	
	var selector = "#contentLayout";
	ajaxHTML(url, "get", query, selector);
}

$(function(){
	$("body").on("click",".listCatrgory",function(){
		var restaurnatsNum = ${dto.restaurantsNum}
		var menuCategoryNum = $(this).attr("data-menuCategoryNum");
		var $tr = $(this).next(".detailCategory");
		var isVisible = $tr.is(':visible');
		if(isVisible){
			$tr.hide();
		}else{
			$tr.find("td").load("<%=cp%>/franchise/detailMenu?menuCategoryNum="+menuCategoryNum + "&restaurantsNum=" + restaurnatsNum);
			
			$tr.show();
		}
		
		
	});
});

$(function(){
	$("body").on("click",".menuName",function(){
		var menuNum = $(this).attr("data-menuNum");
		$("form[name=readMenuForm]").each(function(){
			this.reset();
		});
		
		$('#readMenu-dialog').dialog({
			  modal: true,
			  height: 650,
			  width: 600,
			  title: '메뉴 정보',
			  open: function(){
				
				var url = "<%=cp%>/franchise/read";
				var query = "menuNum="+menuNum;
				var fn = function(data){
					var dto = data.dto;
					var menuNum = dto.menuNum;
					var menuName = dto.menuName;
					var menuPrice = dto.menuPrice;
					var saveFilename = dto.saveFilename;
					
					$("#readMenu-dialog input[name=menuNum]").val(menuNum);
					$("#readMenu-dialog input[name=menuName]").val(menuName);
					$("#readMenu-dialog input[name=menuPrice]").val(menuPrice);
					
					$(".detail-image").attr("src", "<%=cp%>/uploads/menu/"+saveFilename);
				};
				ajaxJSON(url, "get", query, fn);
			  },
			  
			  close: function(event, ui) {
			  }
		});
	});
});

$(function(){
	$("body").on("click",".buyAdd",function(){
		var totalBuyAmt = parseInt($("#totalBuyAmt").text());
		
		var menuNum = $(this).closest("table").find("input[name=menuNum]").val();
		var menuName = $(this).closest("table").find("input[name=menuName]").val();
		var menuPrice = parseInt($(this).closest("table").find("input[name=menuPrice]").val());
		var qty = 1;
		
		var t = "#buyTr"+menuNum;
		if($(t).length){
			qty = $(t+" input[name=quantity]").val();
			if(! qty){
				qty = 0;
			}
			
			pty = parseInt(qty)+1;
			
			$(t+" input[name=quantity]").val(pty);
			$(t+" .productPrice").text(pty*menuPrice);
			
			totalBuyAmt = totalBuyAmt + menuPrice;
			$("#totalBuyAmt").text(totalBuyAmt);
			$('#readMenu-dialog').dialog("close");
			
			return;
		}
		
		
		var $tr, $td, $input;
		
		var vprice = "<span class='productPrice'>" + menuPrice + "</span>원";
		
		$tr = $("<tr height='40px'>");
		$td = $("<td>",{colspan:"3",style:"padding: 15px; font-size: 14px;", html:menuName});
		$tr.append($td);
		$("#buyList").append($tr);
		
		$tr = $("<tr height='40px' id='buyTr"+menuNum+"'>");
		
		$td = $("<td>",{style:"padding: 15px; font-size: 14px;"});
		$input = $("<input>",{"type":"button", "class":"btn buyCancel", "data-code":menuNum, "data-price":menuPrice, "value":"X"});
		$td.append($input);
		$tr.append($td);
		
		$td  = $("<td>",{html:vprice});
		$tr.append($td);
		
		$td = $("<td>");
		$input = $("<input>",{"type":"button", "style":"background-color:white; width: 23px; border: 0.5px solid #38BCC6;", "class":"btn btnMinus", "value":"-"});
		$td.append($input);
		$input = $("<input>",{"type":"text","style":"width: 23px;", "name":"quantity", "value":qty, "readonly":"readonly"});
		$td.append($input);
		$input = $("<input>",{"type":"button", "style":"background-color:white; width: 23px; border: 0.5px solid #38BCC6;", "class":"btn btnPlus", "value":"+"});
		$td.append($input);
		
		$tr.append($td);
		$("#buyList").append($tr);
		$('#readMenu-dialog').dialog("close");
		
		totalBuyAmt=totalBuyAmt+menuPrice;
		$("#totalBuyAmt").text(totalBuyAmt);
	
	});
});

$(function(){
	$("body").on("click",".buyCancel", function(){
		var menuNum = $(this).attr("data-code")
		var menuPrice = parseInt($(this).attr("data-price"));
		var t = "#buyTr"+menuNum;
		var qty = $(t+" input[name=quantity]").val();
		if(! qty){
			qty = 0;
		}
		
		$(t).prev().remove();
		$(t).remove();
		
		
		var totalBuyAmt = parseInt($("#totalBuyAmt").text());
		totalBuyAmt=totalBuyAmt-(menuPrice*parseInt(qty));
		$("#totalBuyAmt").text(totalBuyAmt);
	});
});

$(function(){
	$("body").on("click",".btnPlus", function(){
		var menuPrice = parseInt($(this).closest("tr").find(".buyCancel").attr("data-price"));
		var qty = parseInt($(this).parent().children("input[name=quantity]").val());
		var productPrice = parseInt($(this).closest("tr").find(".productPrice").text());
		var totalBuyAmt = parseInt($("#totalBuyAmt").text());
		
		qty = qty +1;
		productPrice = productPrice+menuPrice;
		
		$(this).prev().val(qty);
		$(this).closest("tr").find(".productPrice").text(productPrice);
		
		totalBuyAmt=totalBuyAmt+menuPrice;
		$("#totalBuyAmt").text(totalBuyAmt);
	});
	
	$("body").on("click",".btnMinus", function(){
		var menuPrice = parseInt($(this).closest("tr").find(".buyCancel").attr("data-price"));
		var qty = parseInt($(this).parent().children("input[name=quantity]").val());
		var productPrice = parseInt($(this).closest("tr").find(".productPrice").text());
		var totalBuyAmt = parseInt($("#totalBuyAmt").text());
		
		if(qty<=0){
			return;
		}
		
		qty = qty-1;
		productPrice = productPrice-menuPrice;
		
		$(this).next().val(qty);
		$(this).closest("tr").find(".productPrice").text(productPrice);
		
		totalBuyAmt=totalBuyAmt-menuPrice;
		$("#totalBuyAmt").text(totalBuyAmt);
	});
});

$(function(){
	$("body").on("click",".allCancel", function(){
		$("#buyList").remove();
		$("#totalBuyAmt").text(0);
	})
});

</script>
</head>
<body>

<div class="sideOrderBox" style="overflow: scroll; max-height: 400px;">
<aside class="sideOrderBox2">
   <table style="width: 330px; border:1px solid #DCDBDB; height: 200px; background-color: white; max-height: 400px;">
      
	      <tr class="orderBoxTitile">
	         <td colspan="3" style="color: white; font-size: 15.4px;">&nbsp; 주문표<a class="allCancel"><span style="float: right; padding-right: 20px; color: white;"><i class="fas fa-trash-alt"></i></span></a> </td>
	      </tr>
	   
	     
	      <tbody id = "buyList">
	      </tbody>
	      
	      <tr height="35px;">
	         <td colspan="3" style="border-top:1.5px solid #DCDBDB; text-align: right;">배달요금 2,000원 별도</td>
	      </tr>
	      
	      <tr height="40px;">
	         <td  colspan="3" style="background-color:#fff8eb; color:red; text-align: right; font-size: 15px; border-top:1px solid #DCDBDB; "><span>합계 :</span> <span id="totalBuyAmt">0</span><span>원</span></td>
	      </tr>
	      
	      <tr height="46px;" style="padding-top: 10px;">
	         <td colspan="3" style="background-color:#38BCC6; text-align: center; color:white; font-size: 17px; border-top:1px solid #DCDBDB; ">주문하기</td>
	      </tr>
      
   </table>


</aside>
</div>

	<div class="storeBox">
		<div class="store_basic">
			<ul>
				<li id="shop_title">${dto.name }</li>
			</ul>
			<div id="store_content">
				<ul>
					<li><img id="store_img" alt="logo"
						src="<%=cp%>/delivery/img/bhc.png" onerror="this.src='<%=cp%>/resource/img/ready.jpg'"></li>
				</ul>
				<div id="st_content">
					<ul>
						<li><span style="color: #F2D51B">&nbsp;★★★★☆</span> 4.5</li>
						<li id="red">&nbsp;4,000원 할인</li>
						<li>&nbsp;<span id="light_gray">최소주문금액 </span>${dto.minorder}</li>
						<li>&nbsp;<span id="light_gray">결제</span> 신용카드,현금,<span
							id="red"> 배다링 결제</span></li>
						<li style="margin-left: 80px;">&nbsp;<span id="light_gray">배달
								시간</span> 45~55분 <span><a href=""><i
									class="far fa-question-circle"></i></a> </span>
						</li>
					</ul>
					<input type="hidden" name = "restaurantsNum" value = "${dto.restaurantsNum }">
				</div>
			</div>
			<div id="st_notice">
				<ul>
					<li><i class="fas fa-bullhorn"></i><span
						style="font-weight: bold;"> 사장님알림</span></li>
					<li style="color: gray;">${dto.introduce}<span> <a
							href=""> <i class="fas fa-chevron-right"></i></a></span>
					</li>
				</ul>
			</div>

			<div style="clear: both;">
				<ul class="tabs">				 
						<li id="tab-0" data-tab="0" style="width: 150px">메뉴</li>
						<li id="tab-1" data-tab="1" style="width: 150px">리뷰</li>
						<li id="tab-2" data-tab="2" style="width: 150px">정보</li>
				</ul>
			</div>
			<div id="contentLayout"></div>
		</div>

	</div>


</body>
</html>
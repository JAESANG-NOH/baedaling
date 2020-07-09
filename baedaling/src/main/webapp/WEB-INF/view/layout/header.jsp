<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/@kfonts/bm-hanna-pro/index.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29c323b80554e07678426dcb232dd593&libraries=services"></script>
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
	
	function ajaxXML(url,type,query,fn){
		$.ajax({
			type:type,
			url:url,
			data:query,
			dataType:"xml",
			success:function(data) {
				fn(data);
			},
			error:function(e){
				console.log(e.responseText);
			}
		});
	}
	
	var surl="";
	$(function(){
		$("#inputbutton").click(function(){
			var url="<%=cp%>/point/search";
			var point = $(this).closest("li").find("#inputline").val();
			var query="point="+point;
			var out="";
			var fn=function(data) {
				surl="ok";
				$('#point_result_list').find('li').remove();
				$(data).find('newAddressListAreaCdSearchAll').each(function(){
					var lnmAdres = $('lnmAdres',this).text();
					var rnAdres = $('rnAdres',this).text();
					$('#point_result_list').find('ul').append("<li class='point_search_li' data_point='"+rnAdres+"'><b class='point_search_b'>도로명 :</b>"+lnmAdres+"<br><b class='point_search_b'>지번 :</b>"+rnAdres+"</li>");
					$('#point_result_list').show();
				});
			};
			ajaxXML(url, "post", query, fn);
		});
	});
	
	$(function(){
		$("#inputline,#point_result_list").hover(function(){
			$('#point_result_list').show();
		},function(){
			$('#point_result_list').hide();
		});
	});
	
	$(function(){
		$("body").on("mouseover", ".point_search_ul li", function(){
			$(this).css("background", "#A9F5E1");
		});
		$("body").on("mouseout", ".point_search_ul li", function(){
			$(this).css("background", "white");
		});		
	});	
	
	$(function(){
		$(".top_bbs_sub").add(".top_bbs_sub").parent().hover(function(){
			$('.top_bbs_sub').show();
		},function(){
			$('.top_bbs_sub').hide();
		});
	});
	
	$(function(){
		$(".top_bbs_sub2").add(".top_bbs_sub2").parent().hover(function(){
			$('.top_bbs_sub2').show();
		},function(){
			$('.top_bbs_sub2').hide();
		});
	});
	
	$(function(){
		$("body").on("click",".point_search_ul li", function(){
			var point = $(this).attr('data_point');
			point.replace(/ *\([^)]*\) */g, "");
			var geocoder = new kakao.maps.services.Geocoder();
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			    	var item = result[0].address;
			    	var x = item.x;
			    	var y = item.y;
			    	var addr = item.address_name;
			    	ajaxPoint(x,y,addr)
			    }
			};
			geocoder.addressSearch(point, callback);
		});
	});
	
	function ajaxPoint(x,y,addr){
		var url = "<%=cp%>/user/location";
		var query = "ln="+x+"&lt="+y+"&addr="+addr;
		var fn = function(){
			$("#inputline").val(addr);
		};
		ajaxJSON(url, "post", query, fn);
	}
</script>


<div id="menu-wrapper" >
      <div id="menu" class="container">
         <a href="<%=cp%>/main"><img align="left" src="<%=cp%>/resource/img/logo.png" id="logo-img"></a>
         	<ul class="snip1275">
            	<li><a href="<%=cp%>/main" data-hover="주문">주문</a></li>
               	<li><a href="#" data-hover="게시판">게시판</a>
               		<ul class="top_bbs_sub" style="padding: 0px;">
               			<li class="sub_li"><a href="<%=cp%>/freeboard/list" data-hover="자유게시판">자유게시판</a></li>
               			<li class="sub_li"><a href="<%=cp%>/recommend/list" data-hover="추천게시판">추천게시판</a>
               		</ul>
               	</li>
               	<li><a href="<%=cp%>/event/list" data-hover="이벤트">이벤트</a></li>
				<li><a href="<%=cp%>/notice/list" data-hover="공지사항">공지사항</a></li>
				<li><a href="#" data-hover="고객센터">고객센터</a>
					<ul class="top_bbs_sub2" style="padding: 0px;">
               			<li class="sub_li"><a href="<%=cp%>/inquire/created" data-hover="1:1문의">1:1문의</a></li>
               			<li class="sub_li"><a href="<%=cp%>/faq/list" data-hover="FAQ">FAQ</a>
               		</ul>
				</li>
			</ul>
      </div>
   </div>
   <div id="logo" class="container">
      <h1 style="font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; font-size: 35px;"><a href="#"> &nbsp;&nbsp;어&nbsp;디&nbsp;로&nbsp;<span style="color:#276CA2; ">&nbsp;배&nbsp;달&nbsp;</span>해&nbsp;드&nbsp;릴&nbsp;까&nbsp;요&nbsp;?&nbsp; &nbsp; "</a></h1>
   </div>
   
   <div id="page" class="container">
      <div>
         <div class="entry" style="margin: 0px;" align="center">
            <ul>
               <li style="list-style: none;">
                  <input id="inputline" type="search" placeholder="주소입력창" value="">
                  <button id="inputbutton" type="button">검색</button>
               </li>
            </ul>
            <div id="point_result_list" style="display: none;">
				<ul class="point_search_ul">
            	</ul>
			</div>
         </div>
      </div>
   </div>
   <hr style="border: 0.5px solid #D8D8D8;">

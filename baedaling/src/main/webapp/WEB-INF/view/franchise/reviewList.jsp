<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
ul li{
	color: #333;
	list-style: none;
	font-size: 90%;
}

.storeBox{
	width: 100%;
	margin: 0px auto;
	background-color: #f9f9fa;
}

.store_basic{
	width: 700px;
	margin: 30px auto;
	background-color: white;
}


#shop_title{
	font-size : 14.5px;
	height : 40px;
	padding-top : 10px;
	padding-bottom : 5px;
	padding-left : 9px;
	border: 1px solid #dadadb;
	border-bottom : none;
}

#store_content{
	border: 1px solid #dadadb;
	border-bottom: none;
	padding: 5px;
}

#store_img{
	border : 0.5px solid #dadadb;
	margin : 4px 5px;
	width: 70px;
	height: 70px;
	float: left;
}


#st_notice{
	border: 1px solid #dadadb;
	height: 50px;
	padding-top: 5px;
	padding-left: 10px;
}

.st_subClick{
	margin-top: 15px;
}


#st_menu_btn{
	border: 1px solid #dadadb;
	width: 220px;
	height: 40px;
	background-color: white;
}

#st_review_btn{
	border: 1px solid #dadadb;
	width: 220px;
	height: 40px;
	background-color: white;
}

#st_info{
	border: 1px solid #dadadb;
	width: 220px;
	height: 40px;
	background-color: white;
}

button{
	border: 0;
	outline: 0;
	
}

#st_menu_btn:hover {
	border-bottom: 3px solid #38BCC6; 
}

#st_info:hover {
	border-bottom: 3px solid #38BCC6; 
}

#st_review_btn:hover {
	border-bottom: 3px solid #38BCC6; 
}

#light_gray{
	color:#A0A1A2;
}

#red{
	color:#F0001E
}

/* 메뉴 부분 */

.menuImg_table{
	width:700px;
	height : 200px;
	padding: 5px;
	margin: 5px;
	white-space:nowrap;
	overflow-y:auto;
  }


.menuImg_table ul{
	float: left;
}

.store_menu_img{
	width: 130px;
	height: 130px;
	margin: 3px;
}

.menuName {
	margin : 5px;
	font-size: 15px;
	font-weight: bold;
}


.menu_table{
	clear: both;
}

.menu_table tr {
 	border: 1px solid #dadadb;
 	background-color: #EAEAEC;
}

.menu_table td{
	 width : 700px;
	 height: 40px;	
	font-size: 15px;
	padding-left: 15px;
}



/* 메뉴리스트 */

#menuContent_img{
	border : 0.5px solid #dadadb;
	margin : 5px 5px;
	padding : 5px;
	margin-right : 20px;
	width: 70px;
	height: 70px;
	float: right;
}

#listFoodname{
	font-size: 14px;
	font-weight: bold;
}

/* 리뷰  */
#score_text{
	padding-top : 1px;
	font-size: 20px;
	font-weight: bold;
}

.reviewContent{
	text-align: center;
	width: 700px; 
	height: 50px; 
	border: 1px solid #dadadb;
	border-bottom: none;
}

#star_deco{
	color: #F2D51B;
	font-size: 13px;	
}

#bold{
	font-weight: bold;
}

.reviewContent2{
	width: 700px; 
	height: 50px; 
	border: 1px solid #dadadb;
	border-bottom: none;
}

.reviewContent3{
	width: 700px; 
	height: 120px; 
	border: 1px solid #dadadb;
	border-top : none;
	margin-top: 16px;
}

/* 가게정보 */

.infoContent{
	width: 698px; 
	height: 600px;
	margin: 0px auto;
	border: 1px solid #dadadb;
	border-top: none;
}

#info_title{
	border-bottom: 0.5px dotted #dadadb;
	padding: 10px;
}

#info_content2{
	padding: 10px;
	margin-bottom: 5px;
}


/*장바구니*/

.sideOrderBox{
	position: absolute;
	right: 200px;
	margin-top: 30px;
}

.sideOrderBox2{
	width: 100%;
	float: right;
}

.orderBoxTitile{
	height: 40px; 
	background-color: #38BCC6;
}



</style>

<div class="reviewList" style="width: 100px;">
<div class="reviewContent">
	<ul>
		<li id="score_text">4.5 </li>
		<li id="star_deco">★★★★☆</li>
	</ul>
</div>

<div class="reviewContent" style="width: hgjh00px; height: 50px; border: 1px solid #dadadb;">
	<ul>
		<li style="float: right; padding-right : 20px; padding-top: 12px;">
			사진 리뷰만 <input type="checkbox">
		</li>
	</ul>

	<ul>
		<li style="padding-left: 20px; padding-top: 12px;">리뷰 <span id="bold">  587</span>개 | 사장님 댓글 <span id="bold"> 0</span>개</li>
	</ul>

<div class="reviewContent">
	<ul style="padding-left: 10px; padding-top: 10px;">
		<li > <span style="font-size: 15px; font-weight: bold;">홍*동님  </span> 2020-06-21</li>
		<li id="star_deco">★★★★★</li>
		<li style="color: #15AFD6;">골드킹 콤보</li>
		<li>너무 맛있어요</li>
	</ul>
</div>
	
</div>
</div>


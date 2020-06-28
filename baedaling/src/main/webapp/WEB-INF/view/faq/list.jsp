<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<script type="text/javascript">
$(function(){
	$("#tab-${group}").addClass("active");

	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		var url="<%=cp%>/faq/list?group="+tab;	
		location.href=url;
	});
});

$(function(){
	$(".board-list tr").hover(function(){
		$(this).addClass("over");
	}, function(){ // 마우스가 벗어나면
		$(this).removeClass("over");
	});
});

$(function(){
	$(".faqSubject").css("cursor", "pointer");
	$(".faqSubject").click(function(){
		var $content = $(this).next();
		var state = $content.is(":hidden");
		$(".faqContent").hide();

		if(state) {
			$content.show();
		} else {
			$content.hide();
		}
	});
});

function searchList() {
	var f=document.searchForm;
	f.submit();
}

function deleteBoard(num) {
	
		var url = "<%=cp%>/faq/delete?num=" + num + "&group="+${group}+"&page="+${page};
		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
	
	}
function updateBoard(num){
	 var q = "num="+ num +"&page=${page}";
	  var url = "<%=cp%>/faq/update?" + q;

	  location.href=url;
}
</script>

<div class="body-container" style="width: 800px; margin: 0px auto; color: black;">
	<div class="body-title">
		<h3> 자주묻는질문 </h3>
	</div>

	<div>

		<div style="clear: both;">
			<ul class="tabs">
				<li id="tab-0" data-tab="0">전체</li>
				 <c:forEach var="vo" items="${groupList}">
					<li id="tab-${vo.categoryNum}" data-tab="${vo.categoryNum}">${vo.category}</li>
				</c:forEach>
			</ul>
		</div>
		<div id="tab-content" style="clear:both; padding: 20px 0px 0px; ">
		
			<div class="alert-info">
			    자주 묻는 질문들 리스트 입니다.
			</div>
		
			<table style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			  <thead>
			  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <th width="60" style="color: #787878;">번호</th>
			      <th width="130" style="color: #787878;">분류</th>
			      <th style="color: #787878;">제목</th>
			      <th width="90" style="color: #787878;">작성자</th> 
			  </tr>
			 </thead>
			 <tbody class="board-list" >

			<c:forEach var="dto" items="${list }">
				<tr style="height: 1px;"> 
			      <td colspan="4" style="font-size: 1px;">&nbsp;</td>
			  	</tr>			
			  <tr class="faqSubject" align="center" data-num="${dto.num}" height="35" style="border: 1px solid #ccc;"> 
			      <td>${dto.listNum}</td>
			      <td>${dto.category}</td>
			      <td align="left"style="padding-left: 10px;">
			           ${dto.subject }
			      </td>
			      <td>${dto.userName }</td>
			  </tr>
			  <c:if test="${sessionScope.user.userId!='admin'}">
			  <tr class="faqContent" align="left" height="35" style="display:none; border: 1px solid #ccc;"> 
			      <td colspan="4" style="padding:10px; word-break:break-all;">${dto.content}</td>
			  </tr>
			  </c:if>
			  
			  <c:if test="${sessionScope.user.userId=='admin'}">
			  <tr class="faqContent" align="left" height="35" style="display:none; border: 1px solid #ccc;"> 
			      <td colspan="3" style="padding:10px; ">${dto.content}</td>
			      <td>
			      	<button type="button" onclick="updateBoard(${dto.num})">수정</button> 
			      	<button type="button" onclick="deleteBoard(${dto.num})">삭제</button>
			      </td>
			      
			  </tr>
			  </c:if>
			</c:forEach>
			  </tbody>
			</table>
			 
			<table style="width: 100%; border-spacing: 0px;">
			   <tr height="35">
				<td align="center">
				       ${paging }
				 </td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/faq/list?group=${group}';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="<%=cp%>/faq/list" method="post">
			              <select name="condition" class="selectField">
			                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
			                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
			                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
			            </select>
			             <input type="hidden" name="group" value="${group}"> 
			            <input type="text" name="keyword" value="${keyword}" class="boxTF"> 
			            <button type="button" class="btn" onclick="searchList()">검색</button>
			        </form>
			      </td>
					<c:if test="${sessionScope.user.userId=='admin'}">
			      		<td align="right" width="100">
			          		<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/faq/created';">글올리기</button>
			      		</td>	
					</c:if>	
			   </tr>
			</table>
			
		</div>
		
	</div>

</div>



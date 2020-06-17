<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function sendOk() {
    var f = document.freeBoardForm;

	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

	f.action="<%=cp%>/freeboard/${mode}";

    f.submit();
}

</script>
<link rel="stylesheet" href="<%=cp%>/resource/css/write.css" type="text/css">
<div align="center" class="box">
	<h3
		style="width: 80%; font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro'; font-size: 35px;">
		자유게시판&nbsp;<span><img id="f_img2"
			src="<%=cp%>/delivery/img/gangg.png"></span>
	</h3>
	<br>
<form name="freeBoardForm" method="post" enctype="multipart/form-data">	
	<table class="freeboard">
		<tr class="f_line">
			<td align="left" style="font-weight: bold;" class="subtitle">제목</td>
			<td align="left" id="ftitle" style="color: gray;"><input
				class="boxTF" style="width: 95%; color: gray;"></td>
		</tr>

		<tr class="f_line">
			<td align="left" style="color: gray;" class="subtitle">작성자</td>
			<td align="left" id="subcontent">${sessionScope.user.userName }</td>
		</tr>

		<tr class="f_line">
			<td class="subtitle">작성일</td>
			<td id="subcontent2">${created}<span style="display: inline-block; margin-left: 30px; font-weight: bold;">조회수</span><span
				style="margin-left: 20px;">${hitCount}</span>
			</td>
		</tr>

		<tr class="fcontent" align="left">
			<td colspan="2" align="left"
				style="padding-left: 20px; border-bottom: 1px solid #cccccc;">
				<textarea style="margin: 0px; width: 940px; height: 420px; border-color: #DDDFE0; resize: none; color: gray; border-radius: 4px;">${dto.content}</textarea>
			</td>
		</tr>

		<tr align="left" height="100"
			style="border-bottom: 1px solid #DDDFE0; height: 50px">
			<td align="left" style="font-weight: bold;" class="subtitle">첨부파일</td>
			<td><input class="boxTF" type="file" name="upload" size="53"
				style="width: 95%;"></td>
		</tr>
		
		<c:if test="${mode=='update'}">
				   <c:forEach var="vo" items="${listFile}">
						  <tr id="f${dto.fileNum}" height="40" style="border-bottom: 1px solid #cccccc;"> 
						      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
						      <td style="padding-left:10px;"> 
								<a href="javascript:deleteFile('${dto.fileNum}');"><i class="far fa-trash-alt"></i></a> 
								${dto.originalFilename}
						      </td>
						  </tr>
				   </c:forEach>
				</c:if>

	</table>

	<table>
		<tr>
			<td height="100px">
				<button class="btn" type="button" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>&nbsp;&nbsp;
				<button class="btn" type="reset">다시입력</button>&nbsp;&nbsp;
				<button class="btn" type="button" onclick="javascript:location.href='<%=cp%>/freeboard/list';">${mode=='update'?'수정취소':'등록취소'}</button>&nbsp;&nbsp;
				  <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="num" value="${dto.num}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			</td>
		</tr>
	</table>
</form>
    <script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
   oAppRef: oEditors,
   elPlaceHolder: "content",
   sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",   
   htParams : {bUseToolbar : true,
      fOnBeforeUnload : function(){
         //alert("아싸!");
      }
   }, //boolean
   fOnAppLoad : function(){
      //예제 코드
      //oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
   },
   fCreator: "createSEditor2"
});

function pasteHTML() {
   var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
   oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
   var sHTML = oEditors.getById["content"].getIR();
   alert(sHTML);
}
   
function submitContents(elClickedObj) {
   oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
   
   // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
   
   try {
      // elClickedObj.form.submit();
      return check();
   } catch(e) {}
}

function setDefaultFont() {
   var sDefaultFont = '돋움';
   var nFontSize = 24;
   oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</div>
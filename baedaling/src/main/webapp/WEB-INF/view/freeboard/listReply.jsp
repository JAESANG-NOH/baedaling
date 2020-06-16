<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
</head>
<body>

<table style='width: 54%; margin:20px auto; border-spacing: 0px; align-content: center;'>
	<thead align="center"  style="height: 30px; background-color: #C8C8C8;">
		<tr height='35' style="width: 600px;">
		    <td colspan='2'>
		           <div align="center" style='float: left;'><span style='color: gray ; font-weight: bold; '>댓글 ${replyCount}20개</span> <span style="">[댓글 목록, ${pageNo}/${total_page} 페이지]</span></div>
		           <div style='float: right; text-align: right;'></div>
		    </td>
		</tr>
	</thead>
</table>

     
<div align="center">
    	<table style="width: 54%; margin:20px auto; border: 1px solid gray; ">
    		<tr  height="25px">
    			<td style="color: gray; font-weight: bold; font-size: 14px;"><span style="color: #38BCC6;"><i class="far fa-user"></i></span> 작성자</td>
    		</tr>
    		
    		<tr>
    			<td style="color: gray; font-size: 14px;">댓글내용나올부분</td>
    		</tr>

    		<tr>
    			<td style="color: #D3D7D8;">날짜</td>
    		</tr>
    		
    	</table>
	</div>


</body>
</html>
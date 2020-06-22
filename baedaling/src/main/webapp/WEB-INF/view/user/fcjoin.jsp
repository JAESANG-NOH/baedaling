<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/fcjoin.css" type="text/css">
 <div id="container_join">
		<div id="head_line">
			<span>BAEDALING</span>
			<br>
			<span style="font-size: 40px;">FRANCHISE</span>
		</div>
		
		<div id="body_line">
		<form action="" id="">
			<table>
				<tr class="etch_list1">
					<td class="textinfo_tr">아이디</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal" name="userId"></td>
				<tr class="etch_list3">
					<td id="message_line1"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="textinfo_tr">비밀번호</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="password" class="input_normal" name="userPwd"></td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line2"></td>
				</tr>
				
				
				<tr class="etch_list1">
					<td class="textinfo_tr">비밀번호 확인</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="password" class="input_normal" name="userPwd2"></td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line3"></td>
				</tr>
				
				
				<tr class="etch_list1">
					<td class="textinfo_tr">생년월일</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr">
					<input type="text" class="birth_tr" name="year">
					<select class="birth_tr birth_tr_select" name="month">
							<option value="">월</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12 </option> 
						</select>
					<input type="text" class="birth_tr" name="date">
					</td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line4"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="textinfo_tr">이메일</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal" name="email"></td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line5"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="textinfo_tr">휴대전화</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line6"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="textinfo_tr">주소</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal" style="width: 270px; margin-right: 10px;"><button type="button" class="city_search_btn">주소검색</button></td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line7"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="textinfo_tr">업체명</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				<tr class="etch_list3">
					<td id="message_line1"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="textinfo_tr">상호명</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				<tr class="etch_list3">
					<td id="message_line1"></td>
				</tr>

				<tr class="etch_list1">
					<td class="textinfo_tr">사업자 등록번호</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				<tr class="etch_list3">
					<td id="message_line1"></td>
				</tr>

				<tr class="etch_list1">
					<td class="textinfo_tr">업체 전화번호</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line6"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="textinfo_tr">업체 주소</td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal" style="width: 270px; margin-right: 10px;"><button type="button" class="city_search_btn">주소검색</button></td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				</tr>
				<tr class="etch_list2">
					<td class="inputinfo_tr"><input type="text" class="input_normal"></td>
				</tr>
				<tr class="etch_list3">
					<td id="message_line7"></td>
				</tr>
				
				<tr class="etch_list1">
					<td class="inputinfo_tr"><button class="send_info_btn" type="button" onclick="">가입하기</button></td>
				</tr>
			</table>
			</form>
		</div>
</div>
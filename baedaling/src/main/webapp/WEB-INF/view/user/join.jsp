<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="banner_visual join">
	<div class="row join">
		<h2>
			<span>회원가입</span>
		</h2>
		<p class="welcome">
			<span>Join us, Cookie&amp;Cream Coffee</span>
		</p>
		<p>
			<span>배달ing 약관 동의입니다.</span>
		</p>
	</div>
</div>
<div class="row">
	<form action="/cafe/auth/join_ok.do" method="post" name="joinForm">
		<div class="joinbox">
			<div class="join_form">
				<div class="component_wrap">
					<div class="join_item_title">
						<h3>회원정보입력</h3>
					</div>
					<div class="join_item">
						<strong>아이디</strong> <input type="text" value="" name="userId" />
						<p class="desc hidden">아이디가 중복되면 안 됩니다.</p>
					</div>

					<div class="join_item">
						<strong>이름</strong> <input type="text" value="" name="userName" />
						<p class="desc hidden">이름을 입력하세요</p>
					</div>
					<div class="join_item">
						<strong>휴대폰</strong> <input type="text" maxlength="11"
							name="phone" onkeyup="autoFormatPhone()"
							onkeydown="autoFormatPhone()" />
						<p class="desc hidden">휴대폰 번호를 입력하세요</p>
					</div>


					<div class="join_item">
						<strong>비밀번호</strong> <input type="password" name="userPwd" />
						<p class="desc hidden">※ 안전한 비밀번호를 위해 숫자, 문자 조합하여 5~10자 이내로
							입력해주세요.</p>
					</div>
					<div class="join_item">
						<strong>비밀번호 확인</strong> <input type="password"
							name="userPwdConfirm" />
						<p class="desc hidden">비밀번호를 한 번 더 입력하세요</p>
					</div>

					<div class="join_item">
						<strong>주소</strong> <input type="text" name="addr1" /> <input
							type="text" name="addr2" style="margin: 4px; float: right;" />
						<p class="desc hidden"></p>
					</div>
				</div>

				<div class="component_wrap">
					<h3>서비스 이용약관</h3>
					<div class="agreement_box">

						<div class="agreement_content_box">
							<p>
								제1조 (목적) 본 약관은 유한책임회사 딜리버리히어로코리아(이하 “회사”라 함)가 운영하는 “배달ing”
								사이트(www.delivering.co.kr) 또는 “배달ing” 모바일 애플리케이션에서 제공하는 서비스(이하
								“서비스”라 함)를 이용함에 있어 “배달ing”와 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.
								<br> 제2조 (서비스 이용요금) ① 회사가 제공하는 서비스는 기본적으로 무료입니다. ② 회사는 유료
								서비스 이용요금을 회사와 계약한 전자지불업체에서 정한 방법에 의하거나 회사가 정한 청구서에 합산하여 청구할 수
								있습니다. ③ 유료서비스 이용을 통하여 결제된 대금에 대한 취소 및 환불은 회사의 결제 이용약관 등 관계법에
								따릅니다. ④ 이용자의 정보도용 및 결제사기로 인한 환불요청 또는 결제자의 개인정보 요구는 법률이 정한 경우 외에는
								거절될 수 있습니다. ⑤ 무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며 가입한 각 이동통신사의 정책에
								따릅니다. MMS 등으로 게시물을 등록할 경우 발생하는 요금은 이동통신사의 정책에 따릅니다
							</p>
						</div>
						<div class="join_item_title">
							배달ing 이용약관 동의 <span class="color">(필수)</span> <input
								id="join_item_checkbox" type="checkbox">
							<h4></h4>

						</div>
					</div>
				</div>


				<div class="join_item_title submit">
					<p align="center" style="color: black;"></p>
					<button type="button" name="btn" class="sky_button"
						onclick="checkSubmit();">가입하기</button>
				</div>
			</div>
		</div>
	</form>
</div>
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티벳샵</title>

<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">

<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<title>Insert title here</title>
<style>
.title {
	margin: 20px 25%;
	font-size: 30px;
}

.info-rect {
	width: 40%;
	height: auto;
	background: #E5E5E5;
	margin: 0 25% 15px 25%;
	padding: 5%;
}

.form-group {
	margin-bottom: 22px;
}

.form-group .form-control {
	width: 33%;
}

.form-group label {
	position: relative;
	display: inline-block;
	width: 150px;
	top: 1px;
}

.form-group .mailsend-margin {
	margin-right: 10%;
}

.form-address {
	width: 50%;
}

#mem_address {
	width: 20%;
}

#id-info {
	font-size: 12px;
	width: auto;
}

#pwd-info {
	position: relative;
	top: 6px;
	font-size: 12px;
	width: auto;
	margin: 0;
}

.secession {
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
	margin: 0 25%;
}

.buttons {
	display: flex;
	margin: 0 25%;
	
}

.correction-btn {
	width: 20%;
	height: 50px;
	margin-right: 5%;
	margin-left: 25%;
	border: none;
	background-color: #1e1e1e;
	border-radius: 6px;
	color: white;
	font-size: 17px;
	font-weight: bold;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
}

.cancel-btn {
	width: 20%;
	height: 50px;
	margin-right: 13%;
	font-size: 17px;
	font-weight: 500;
	padding: 16px 4px;
	font-weight: bold;
	background-color: white;
	border: none;
	border-radius: 6px;
	border: 1px solid #C4C4C4;
	vertical-align: middle;
	cursor: pointer;
}

.secession-btn {
	width: 15%;
	height: 30px;
	align-items: center;
	text-align: center;
	background-color: #696868;
	border-radius: 6px;
	color: white;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
}

#modal1 {
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 10000;
	display: none;
}

#modal2 {
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 10000;
	display: none;
}

#modal3 {
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 10000;
	display: none;
}

.popup {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 20%;
	height: 150px;
	background: white;
	box-shadow: 0 2px 3px 0 rgb(34 36 38/ 15%);
	transform: translateX(-50%) translateY(-50%);
	border-radius: 6px;
	box-sizing: border-box;
	transition: all 0.6s;
	z-index: 10000;
	text-align: center;
}

.popup a {
	margin-left: 575px;
}

.popup-secession {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 45%;
	height: 400px;
	background: white;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
	border-radius: 6px;
	box-sizing: border-box;
	transition: all 0.6s;
	z-index: 10000;
	text-align: center;
	padding: 30px 5%;
}

.popup-head {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}

#benefit-box {
	width: 100%;
	height: 150px;
	border: 1px solid black;
	border-radius: 6px;
	box-sizing: border-box;
	display: flex;
	align-items: center;
	margin-bottom: 30px;
	box-sizing: border-box;
}

#benefit-label1 {
	margin-right: 7%;
	display: flex;
	height: 100%;
	width: 25%;
	border-right: 1px solid black;
}

#benefit-label1 label {
	margin: auto;
}

#benefit-label2 {
	margin-right: 5%;
}

.popup-sub {
	text-align: left;
	margin-bottom: 10px;
}

.dropdown-option {
	display: flex;
	margin-bottom: 40px;
}

.dropdown-option span {
	margin-right: 15px;
}

.selectbox select {
	width: 200px;
}

.submit-btn {
	width: 15%;
	height: 25px;
	background: black;
	border: none;
	border-radius: 6px;
	color: white;
	fontsize: 10px;
	cursor: pointer;
}

.close-btn {
	width: 15%;
	height: 25px;
	background: white;
	border: 1px solid black;
	border-radius: 6px;
	color: black;
	fontsize: 10px;
	cursor: pointer;
}

#modal1-1 {
	margin-top: 35px;
	margin-bottom: 41px;
}

#modal2-1 {
	margin-top: 35px;
}

#modal2-2 {
	margin-bottom: 25px;
}

.mypage-table{
    display: flex;
    height: 60px;
    justify-content: space-around;
    width: 100%;
    align-items: center;
    font-size: 20px;
    font-weight: bold;
    line-height: 1.2;
    border-width: 1px;
    border-bottom: 3px solid rgb(0, 0, 0);
}

.mgb10{
    margin-top: 10px;
    margin-bottom: 0px;
   border-bottom: 3px solid rgb(0, 0, 0);
}

.mypage-front-fonter-orderList:hover{
   text-decoration: underline #000000;
}

.mypage-front-fonter-memModify{
   color: #999;
}

.mypage-front-fonter-memModify:hover{
   text-decoration: underline #999;
}

.mypage-front-fonter-delivery{
   color: #999;
}

.mypage-front-fonter-delivery:hover{
   text-decoration: underline #999;
}
</style>
</head>
<body>
	<section>
		<div class="mypage">
			<div class="mypage-table mgb10">
				<div class="mypage-front-fonter-orderList">
					<a href="${contextPath}/orderList.do" class="font-777">주문내역</a>
				</div>
				<div class="mypage-front-fonter-memModify">
					<a href="${contextPath}/memModify.do" class="font-777">회원정보</a>
				</div>
				<div class="mypage-front-fonter-delivery">
					<a href="" class="font-777">배송조회</a>
				</div>
			</div>
		</div>
		<div class="title">
			<h1>
				<b>회원정보</b>
			</h1>
		</div>
		<div class="info-rect">

			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control"
					id="mem_id" name="mem_id" placeholder=" "> <label
					id="id-info">(영문소문자/숫자, 4~16자)</label>
				<div class="eheck_font" id="pw2_check"></div>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" id="mem_pw" name="mem_pw" placeholder=" ">
				<label id="pwd-info">(영문 대소문자/숫자/특수문자 중 <br>2가지 이상 조합,
					10자~16자)
				</label>
			</div>
			<div class="form-group">
				<label for="pw2">비밀번호 확인</label> <input type="password"
					class="form-control" id="mem_pw2" name="mem_pw2" placeholder=" ">
				<div class="eheck_font" id="pw2_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_name">이름</label> <input type="text"
					class="form-control" id="mem_name" name="mem_name" placeholder=" ">
				<div class="eheck_font" id="name_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_birth">생년월일</label> <input type="tel"
					class="form-control" id="mem_birth" name="mem_birth"
					placeholder=" ">
				<div class="eheck_font" id="birth_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_phone">휴대폰 번호</label> <input type="tel"
					class="form-control" id="mem_phone" name="mem_phone"
					placeholder=" '-'없이 번호만 입력해주세요 ">
				<div class="eheck_font" id="phone_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_gender">성별 </label> <input type="radio"
					class="mem_gender" name="mem_gender" value="남">남 <input
					type="radio" class="mem_gender" name="mem_gender" value="여">여
			</div>
			<div class="form-group">
				<label for="mem_address">주소 </label> <input class="form-control"
					placeholder="우편번호" name="mem_address" id="mem_address" type="text"
					readonly="readonly">
				<button type="button" class="btn btn-default"
					onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
			<div class="form-group">
				<label></label> <input class="form-address" placeholder="도로명 주소"
					name="mem_address" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<label></label> <input class="form-address" placeholder="상세주소"
					name="mem_detailaddress" type="text" />
			</div>
			<div class="form-group">
				<label for="mem_email">이메일 주소</label> <input type="email"
					class="form-control" id="mem_email" name="mem_email"
					placeholder=" ">
				<div class="eheck_font" id="email_check"></div>
			</div>
			<div class="form-group">
				<label>이메일 수신여부</label> <input type="radio" class="email_send"
					name="email_send" value="수신함"><span>수신함</span><input
					type="radio" class="email_send" name="email_send" value="수신안함"><span
					class="mailsend-margin">수신안함</span> <label id="pwd-info">쇼핑몰에서
					제공하는 유익한 이벤트 <br>소식을 이메일로 받으실 수 있습니다.
				</label>
			</div>
		</div>
		<div class="secession">
			<button class="secession-btn">회원탈퇴</button>
		</div>
		<div class="buttons">
			<button class="correction-btn">회원정보수정</button>

			<button class="cancel-btn">취소</button>
		</div>
	</section>
	<div id="modal1">
		<div class="popup">
			<div>
				<h1 id="modal1-1">작성하신 내용을 수정하시겠습니까?</h1>
			</div>
			<div>
				<button type="button" class="submit-btn" onclick="location.href='#'">확인</button>
				<button class="close-btn">취소</button>
			</div>
		</div>
	</div>
	<div id="modal2">
		<div class="popup">
			<div>
				<h1 id="modal2-1">작성 중인 내용이 있습니다.</h1>
				<h1 id="modal2-2">나가시겠습니까?</h1>
			</div>
			<div>
				<button type="button" class="submit-btn" onclick="location.href='#'">확인</button>
				<button class="close-btn">취소</button>
			</div>
		</div>
	</div>

	<div id="modal3">
		<div class="popup-secession">
			<div class="popup-head">
				<h1>회원탈퇴</h1>
			</div>
			<div id="benefit-box">
				<div id="benefit-label1">
					<label>혜택내역</label>
				</div>
				<div id="benefit-label2">
					<label>회원 탈퇴 시 회원 혜택, 잔여포인트 및 <br>개인정보가 삭제됩니다.
					</label>
				</div>
			</div>
			<div class="popup-sub">
				<label>회원탈퇴 사유</label>
			</div>
			<div class="dropdown-option">
				<div>
					<span>선택</span>
				</div>
				<div class="selectbox">
					<select>
						<option value="그냥">그냥</option>
						<option value="A">A</option>
					</select>
				</div>
			</div>
			<div>
				<button type="button" class="submit-btn" onclick="location.href='#'">확인</button>
				<button class="close-btn">취소</button>
			</div>
		</div>
	</div>
	<script>
		$(".correction-btn").click(function() {
			$("#modal1").attr("style", "display:block");
		});

		$(".cancel-btn").click(function() {
			$("#modal2").attr("style", "display:block");
		});

		$(".secession-btn").click(function() {
			$("#modal3").attr("style", "display:block");
		});
		
		$(".submit-btn").click(function() {
			$("#modal1").attr("style", "display:none");
			$("#modal2").attr("style", "display:none");
			$("#modal3").attr("style", "display:none");
		});

		$(".close-btn").click(function() {
			$("#modal1").attr("style", "display:none");
			$("#modal2").attr("style", "display:none");
			$("#modal3").attr("style", "display:none");
		});
		
		$('html, body').css({
			'overflow' : 'hidden',
			'height' : '100%'
		}); // 모달팝업 중 html,body의 scroll을 hidden시킴 
		$('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지     
			event.preventDefault();
			event.stopPropagation();
			return false;
		});

		$('html, body').css({
			'overflow' : 'auto',
			'height' : '100%'
		}); //scroll hidden 해제 $('#element').off('scroll touchmove mousewheel'); // 터치무브 및 마우스휠 스크롤 가능
	</script>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티벳샵</title>

<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">

<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<title>Insert title here</title>
<style>
.title {
	margin: 20px 25%;
	font-size: 30px;
}

.info-rect {
	width: 40%;
	height: auto;
	background: #E5E5E5;
	margin: 0 25% 15px 25%;
	padding: 5%;
}

.form-group {
	margin-bottom: 22px;
}

.form-group .form-control {
	width: 33%;
}

.form-group label {
	position: relative;
	display: inline-block;
	width: 150px;
	top: 1px;
}

.form-group .mailsend-margin {
	margin-right: 10%;
}

.form-address {
	width: 50%;
}

#mem_address {
	width: 20%;
}

#id-info {
	font-size: 12px;
	width: auto;
}

#pwd-info {
	position: relative;
	top: 6px;
	font-size: 12px;
	width: auto;
	margin: 0;
}

.secession {
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
	margin: 0 25%;
}

.buttons {
	display: flex;
	margin: 0 25%;
	
}

.correction-btn {
	width: 20%;
	height: 50px;
	margin-right: 5%;
	margin-left: 25%;
	border: none;
	background-color: #1e1e1e;
	border-radius: 6px;
	color: white;
	font-size: 17px;
	font-weight: bold;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
}

.cancel-btn {
	width: 20%;
	height: 50px;
	margin-right: 13%;
	font-size: 17px;
	font-weight: 500;
	padding: 16px 4px;
	font-weight: bold;
	background-color: white;
	border: none;
	border-radius: 6px;
	border: 1px solid #C4C4C4;
	vertical-align: middle;
	cursor: pointer;
}

.secession-btn {
	width: 15%;
	height: 30px;
	align-items: center;
	text-align: center;
	background-color: #696868;
	border-radius: 6px;
	color: white;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
}

#modal1 {
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 10000;
	display: none;
}

#modal2 {
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 10000;
	display: none;
}

#modal3 {
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 10000;
	display: none;
}

.popup {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 20%;
	height: 150px;
	background: white;
	box-shadow: 0 2px 3px 0 rgb(34 36 38/ 15%);
	transform: translateX(-50%) translateY(-50%);
	border-radius: 6px;
	box-sizing: border-box;
	transition: all 0.6s;
	z-index: 10000;
	text-align: center;
}

.popup a {
	margin-left: 575px;
}

.popup-secession {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 45%;
	height: 400px;
	background: white;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
	border-radius: 6px;
	box-sizing: border-box;
	transition: all 0.6s;
	z-index: 10000;
	text-align: center;
	padding: 30px 5%;
}

.popup-head {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}

#benefit-box {
	width: 100%;
	height: 150px;
	border: 1px solid black;
	border-radius: 6px;
	box-sizing: border-box;
	display: flex;
	align-items: center;
	margin-bottom: 30px;
	box-sizing: border-box;
}

#benefit-label1 {
	margin-right: 7%;
	display: flex;
	height: 100%;
	width: 25%;
	border-right: 1px solid black;
}

#benefit-label1 label {
	margin: auto;
}

#benefit-label2 {
	margin-right: 5%;
}

.popup-sub {
	text-align: left;
	margin-bottom: 10px;
}

.dropdown-option {
	display: flex;
	margin-bottom: 40px;
}

.dropdown-option span {
	margin-right: 15px;
}

.selectbox select {
	width: 200px;
}

.submit-btn {
	width: 15%;
	height: 25px;
	background: black;
	border: none;
	border-radius: 6px;
	color: white;
	fontsize: 10px;
	cursor: pointer;
}

.close-btn {
	width: 15%;
	height: 25px;
	background: white;
	border: 1px solid black;
	border-radius: 6px;
	color: black;
	fontsize: 10px;
	cursor: pointer;
}

#modal1-1 {
	margin-top: 35px;
	margin-bottom: 41px;
}

#modal2-1 {
	margin-top: 35px;
}

#modal2-2 {
	margin-bottom: 25px;
}

.mypage-table{
    display: flex;
    height: 60px;
    justify-content: space-around;
    width: 100%;
    align-items: center;
    font-size: 20px;
    font-weight: bold;
    line-height: 1.2;
    border-width: 1px;
    border-bottom: 3px solid rgb(0, 0, 0);
}

.mgb10{
    margin-top: 10px;
    margin-bottom: 0px;
   border-bottom: 3px solid rgb(0, 0, 0);
}

.mypage-front-fonter-orderList:hover{
   text-decoration: underline #000000;
}

.mypage-front-fonter-memModify{
   color: #999;
}

.mypage-front-fonter-memModify:hover{
   text-decoration: underline #999;
}

.mypage-front-fonter-delivery{
   color: #999;
}

.mypage-front-fonter-delivery:hover{
   text-decoration: underline #999;
}
</style>
</head>
<body>
	<section>
		<div class="mypage">
			<div class="mypage-table mgb10">
				<div class="mypage-front-fonter-orderList">
					<a href="${contextPath}/orderList.do" class="font-777">주문내역</a>
				</div>
				<div class="mypage-front-fonter-memModify">
					<a href="" >회원정보</a>
				</div>
				<div class="mypage-front-fonter-delivery">
					<a href="" class="font-777">배송조회</a>
				</div>
			</div>
		</div>
		<div class="title">
			<h1>
				<b>회원정보</b>
			</h1>
		</div>
		<div class="info-rect">

			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control"
					id="mem_id" name="mem_id" placeholder=" "> <label
					id="id-info">(영문소문자/숫자, 4~16자)</label>
				<div class="eheck_font" id="pw2_check"></div>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" id="mem_pw" name="mem_pw" placeholder=" ">
				<label id="pwd-info">(영문 대소문자/숫자/특수문자 중 <br>2가지 이상 조합,
					10자~16자)
				</label>
			</div>
			<div class="form-group">
				<label for="pw2">비밀번호 확인</label> <input type="password"
					class="form-control" id="mem_pw2" name="mem_pw2" placeholder=" ">
				<div class="eheck_font" id="pw2_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_name">이름</label> <input type="text"
					class="form-control" id="mem_name" name="mem_name" placeholder=" ">
				<div class="eheck_font" id="name_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_birth">생년월일</label> <input type="tel"
					class="form-control" id="mem_birth" name="mem_birth"
					placeholder=" ">
				<div class="eheck_font" id="birth_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_phone">휴대폰 번호</label> <input type="tel"
					class="form-control" id="mem_phone" name="mem_phone"
					placeholder=" '-'없이 번호만 입력해주세요 ">
				<div class="eheck_font" id="phone_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_gender">성별 </label> <input type="radio"
					class="mem_gender" name="mem_gender" value="남">남 <input
					type="radio" class="mem_gender" name="mem_gender" value="여">여
			</div>
			<div class="form-group">
				<label for="mem_address">주소 </label> <input class="form-control"
					placeholder="우편번호" name="mem_address" id="mem_address" type="text"
					readonly="readonly">
				<button type="button" class="btn btn-default"
					onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
			<div class="form-group">
				<label></label> <input class="form-address" placeholder="도로명 주소"
					name="mem_address" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<label></label> <input class="form-address" placeholder="상세주소"
					name="mem_detailaddress" type="text" />
			</div>
			<div class="form-group">
				<label for="mem_email">이메일 주소</label> <input type="email"
					class="form-control" id="mem_email" name="mem_email"
					placeholder=" ">
				<div class="eheck_font" id="email_check"></div>
			</div>
			<div class="form-group">
				<label>이메일 수신여부</label> <input type="radio" class="email_send"
					name="email_send" value="수신함"><span>수신함</span><input
					type="radio" class="email_send" name="email_send" value="수신안함"><span
					class="mailsend-margin">수신안함</span> <label id="pwd-info">쇼핑몰에서
					제공하는 유익한 이벤트 <br>소식을 이메일로 받으실 수 있습니다.
				</label>
			</div>
		</div>
		<div class="secession">
			<button class="secession-btn">회원탈퇴</button>
		</div>
		<div class="buttons">
			<button class="correction-btn">회원정보수정</button>

			<button class="cancel-btn">취소</button>
		</div>
	</section>
	<div id="modal1">
		<div class="popup">
			<div>
				<h1 id="modal1-1">작성하신 내용을 수정하시겠습니까?</h1>
			</div>
			<div>
				<button type="button" class="submit-btn" onclick="location.href='#'">확인</button>
				<button class="close-btn">취소</button>
			</div>
		</div>
	</div>
	<div id="modal2">
		<div class="popup">
			<div>
				<h1 id="modal2-1">작성 중인 내용이 있습니다.</h1>
				<h1 id="modal2-2">나가시겠습니까?</h1>
			</div>
			<div>
				<button type="button" class="submit-btn" onclick="location.href='#'">확인</button>
				<button class="close-btn">취소</button>
			</div>
		</div>
	</div>

	<div id="modal3">
		<div class="popup-secession">
			<div class="popup-head">
				<h1>회원탈퇴</h1>
			</div>
			<div id="benefit-box">
				<div id="benefit-label1">
					<label>혜택내역</label>
				</div>
				<div id="benefit-label2">
					<label>회원 탈퇴 시 회원 혜택, 잔여포인트 및 <br>개인정보가 삭제됩니다.
					</label>
				</div>
			</div>
			<div class="popup-sub">
				<label>회원탈퇴 사유</label>
			</div>
			<div class="dropdown-option">
				<div>
					<span>선택</span>
				</div>
				<div class="selectbox">
					<select>
						<option value="그냥">그냥</option>
						<option value="A">A</option>
					</select>
				</div>
			</div>
			<div>
				<button type="button" class="submit-btn" onclick="location.href='#'">확인</button>
				<button class="close-btn">취소</button>
			</div>
		</div>
	</div>
	<script>
		$(".correction-btn").click(function() {
			$("#modal1").attr("style", "display:block");
		});

		$(".cancel-btn").click(function() {
			$("#modal2").attr("style", "display:block");
		});

		$(".secession-btn").click(function() {
			$("#modal3").attr("style", "display:block");
		});
		
		$(".submit-btn").click(function() {
			$("#modal1").attr("style", "display:none");
			$("#modal2").attr("style", "display:none");
			$("#modal3").attr("style", "display:none");
		});

		$(".close-btn").click(function() {
			$("#modal1").attr("style", "display:none");
			$("#modal2").attr("style", "display:none");
			$("#modal3").attr("style", "display:none");
		});
		
		$('html, body').css({
			'overflow' : 'hidden',
			'height' : '100%'
		}); // 모달팝업 중 html,body의 scroll을 hidden시킴 
		$('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지     
			event.preventDefault();
			event.stopPropagation();
			return false;
		});

		$('html, body').css({
			'overflow' : 'auto',
			'height' : '100%'
		}); //scroll hidden 해제 $('#element').off('scroll touchmove mousewheel'); // 터치무브 및 마우스휠 스크롤 가능
	</script>
</body>
>>>>>>> 389120975c33ed21224ab2d351abec41037e832d
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>회원가입</title>

<style>
.title {
	margin: 20px 34%;
	font-size: 30px;
	font-weight: bold;
}

.info-rect {
	width: 32%;
	height: auto;
	background: white;
	margin: 0px 34% 15px;
	padding: 1%;
	border: 1px solid black;
	border-radius: 6px;
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

.correction-btn {
	width: 20%;
	height: 50px;
	margin-right: 5%;
	margin-left: 41%;
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

.checkbox-group {
	width: 18%;
	height: auto;
	background: #E5E5E5;
	margin: 0px 41% 15px;
	padding: 1%;
	border: none;
	border-radius: 6px;
	display: flex;
	flex-direction: column;
}

.check-child {
	margin: 1px 25px;
}

.check-parent {
	margin-bottom: 3px;
}
</style>
</head>
<body>
	<section>
		<div class="title">
			<h1>
				<b>회원가입</b>
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
					placeholder=" 6자리만 입력해주세요. ">
				<div class="eheck_font" id="birth_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_email">이메일 주소</label> <input type="email"
					class="form-control" id="mem_email" name="mem_email"
					placeholder=" ">
				<div class="eheck_font" id="email_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_phone">휴대폰 번호</label> <input type="tel"
					class="form-control" id="mem_phone" name="mem_phone"
					placeholder=" '-'없이 번호만 입력해주세요. ">
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
		</div>
		<div class="checkbox-group">
			<div class="check-parent">
				<input type="checkbox" name="check-Agree" onclick="selectAll(this)">
				<label>전체 동의</label>
			</div>
			<div class="check-child">
				<input type="checkbox" name="check-Agree" class="normal"> <label>개인정보
					처리방침 동의</label>
			</div>
			<div class="check-child">
				<input type="checkbox" name="check-Agree" class="normal"> <label>서비스
					이용약관 동의</label>
			</div>
			<div class="check-child">
				<input type="checkbox" name="check-Agree" class="normal"> <label>마케팅
					수신 동의</label>
			</div>
		</div>
		<div class="cor-button">
			<button class="correction-btn">회원가입</button>
		</div>
	</section>
	<script>
	function selectAll(selectAll)  {
		  const checkboxes 
		     = document.querySelectorAll('input[type="checkbox"]');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
	</script>
</body>
</html>
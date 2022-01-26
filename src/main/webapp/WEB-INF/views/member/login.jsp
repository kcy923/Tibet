<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/js/login.js">

<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
	alert("아이디나 비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>
</c:if>
<title>로그인</title>

</head>

<body>
	<section>
		<div class="title">
			<h1>
				<b>로그인</b>
			</h1>
		</div>
		<div class="abc">
			<form class="form-signin" method="post">
				<div class="login-box">
					<div class="login-id">
						<input type="text" class="login-text-box" name="user_id" placeholder="아이디" required>
					</div>
					<div class="login-pw">
						<input type="password" class="login-text-box" name="user_pw" placeholder="비밀번호" required>
						<p class="checks" id="checks">${findpw_checkf}</p>
					</div>
					<div class="href">
						<a href="${contextPath}/findID.do" class="hover">아이디 찾기</a>
						<a href="${contextPath}/findPW.do" class="hover">비밀번호 찾기</a>
						<a href="${contextPath}/signupForm.do" class="hover">회원가입</a>
					</div>
					<div class="urls">
					<div class="kakao">
						<button type="button" class="kakao-btn"><img src="resources/img/kakao.png"></button>
					</div>
					<div class="naver">
						<button type="button" class="naver-btn"><img src="resources/img/naver.png"></button>
					</div>
					<div class="google">
						<button type="button" class="google-btn"><img src="resources/img/google.png"></button>
					</div>
					</div>
				</div>
				<br> <br>

				<div class="login">
					<input type="submit" class="login-btn" value="로그인">
				</div>
			</form>
		</div>
	</section>
</body>
</html>
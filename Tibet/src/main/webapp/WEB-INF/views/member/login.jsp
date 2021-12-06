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

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/login.css">

<title>Insert title here</title>
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
						<input type="text" class="login-text-box" name="id" placeholder="아이디" required>
					</div>
					<div class="login-pw">
						<input type="password" class="login-text-box" name="password" placeholder="비밀번호" required>
						<p class="checks" id="checks">${findpw_checkf}</p>
					</div>
					<div class="href">
						<a href="${contextPath}/findID.do" class="hover">아이디 찾기</a>
						<a href="${contextPath}/findPW.do" class="hover">비밀번호 찾기</a>
						<a href="${contextPath}/signup.do" class="hover">회원가입</a>
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
					<button type="submit" class="login-btn">로그인</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>
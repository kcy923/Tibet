<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>공지사항</title>
<link rel="stylesheet" href="css/noticeDetail.css">
</head>
<body>
	<section>
		<div class="notice-enter">
			<div class="notice-enter-table mgb10">
				<div class="enter-table-qna">
					<a href="#">Q&A</a>
				</div>
				<div class="enter-table-notice">
					<a href="#">공지사항</a>
				</div>
				<div class="enter-table-member">
					<a href="#">맴버쉽 안내</a>
				</div>
			</div>
		</div>
		<div class="enter-table">
			<div class="enter-table-not mgb15">
				<div class="enter-table-not-tit">
					<label class="enter-not01">제목</label> <label class="enter-not02"
						id="notice01">공지사항 글입니다.</label>
				</div>
				<div class="enter-table-not-name">
					<label class="enter-not01">작성자</label> <label class="enter-not02">tibet관리자</label>
				</div>
				<div class="enter-table-not-date">
					<label class="enter-not01">작성일</label> <label class="enter-not02">202-12-01</label>
				</div>

				<div class="enter-table-content">
					<p>
						<br>
					</p>
					<p>안녕하세요.</p>
					<p>the tibet입니다.</p>
					<p>
						<br>
					</p>
					<p>the tibet을 이용해주시는 모든 고객님들께 진심으로 감사드립니다.</p>
					<p>
						<br>
					</p>
				</div>
				<p>
					<br>
				</p>
				<div class="enter-table-file">
					<label>첨부파일</label> <input class="enter-table-file-btn" type="file">
				</div>
			</div>

			<div class="box-btn">
				<div class="box-btn-text">
					<button type="button" onclick="location.href='notice.html'"
						class="btn-text">목차</button>
				</div>
			</div>

		</div>
	</section>
</body>
</html>
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
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/notice.css">
</head>
<body>
	<section>
		<div class="notice">
			<div class="notice-front-table mgb10">
				<div class="notice-front-fonter-qna">
					<a href="${contextPath}/qna.do" class="font-999">Q&A</a>
				</div>
				<div class="notice-front-fonter-notice">
					<a href="${contextPath}/notice.do">공지사항</a>
				</div>

				<div class="notice-front-fonter-member">
					<a href="${contextPath}/membership.do" class="font-999">멤버쉽 안내</a>
				</div>
			</div>

			<div class="service-notice" style="margin-top: 80px;">
				<table class="service-notice-front">
					<thead class="service-notice-title mgb15">
						<tr>
							<th class="not-no">번호</th>
							<th class="not-tit">제목</th>
							<th class="not-nm">작성자</th>
							<th class="not-date">작성일</th>
						</tr>
					</thead>
					<tbody class="service-notice-content mgb20">
						<c:choose>
							<c:when test="${noticesList == null}">
								<tr>
									<td>
										<p>
											<b><span>등록된 글이 없습니다.</span></b>
										</p>
									</td>
								</tr>
							</c:when>
							<c:when test="${noticesList != null}">
								<c:forEach var="notice" items="${noticesList}" varStatus="notice_num">
									<tr>
										<td class="not-no">${notice.notice_num}</td>
										<td class="not-tit-td"><a href="#">${notice.notice_title}</a></td>   <!-- 공지사항 내용 페이지 만들어야 됨 -->
										<td class="not-nm">${notice.user_id}</td>
										<td class="not-date">${notice.notice_date}</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>

			<div class="paging">
				<a href="#" class="bt"><<</a> <a href="#" class="bt"><</a> <a
					href="#" class="num-on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="bt">></a> <a href="#" class="bt">>></a>
			</div>
		</div>
	</section>
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
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/notice.css">
</head>
<body>
	<section>
		<div class="notice">
			<div class="notice-front-table mgb10">
				<div class="notice-front-fonter-qna">
					<a href="${contextPath}/qna.do" class="font-999">Q&A</a>
				</div>
				<div class="notice-front-fonter-notice">
					<a href="${contextPath}/notice.do">공지사항</a>
				</div>

				<div class="notice-front-fonter-member">
					<a href="${contextPath}/membership.do" class="font-999">멤버쉽 안내</a>
				</div>
			</div>

			<div class="service-notice" style="margin-top: 80px;">
				<table class="service-notice-front">
					<thead class="service-notice-title mgb15">
						<tr>
							<th class="not-no">번호</th>
							<th class="not-tit">제목</th>
							<th class="not-nm">작성자</th>
							<th class="not-date">작성일</th>
						</tr>
					</thead>
					<tbody class="service-notice-content mgb20">
						<tr>
							<td class="not-no">1</td>
							<td class="mgb20-txt"><a href="">공지사항 글입니다.</a></td>
							<td class="not-nm">tibet 관리자</td>
							<td class="not-date">2021-11-26</td>
						</tr>
						<tr>
							<td class="not-no">2</td>
							<td class="mgb20-txt"><a href="">공지사항 글입니다.</a></td>
							<td class="not-nm">tibet 관리자</td>
							<td class="not-date">2021-11-26</td>
						</tr>
						<tr>
							<td class="not-no">3</td>
							<td class="mgb20-txt"><a href="">공지사항 글입니다.</a></td>
							<td class="not-nm">tibet 관리자</td>
							<td class="not-date">2021-11-26</td>
						</tr>
						<tr>
							<td class="not-no">4</td>
							<td class="mgb20-txt"><a href="">공지사항 글입니다.</a></td>
							<td class="not-nm">tibet 관리자</td>
							<td class="not-date">2021-11-26</td>
						</tr>
						<tr>
							<td class="not-no">5</td>
							<td class="mgb20-txt"><a href="">공지사항 글입니다.</a></td>
							<td class="not-nm">tibet 관리자</td>
							<td class="not-date">2021-11-26</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="paging">
				<a href="#" class="bt"><<</a> <a href="#" class="bt"><</a> <a
					href="#" class="num-on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="bt">></a> <a href="#" class="bt">>></a>
			</div>
		</div>
	</section>
</body>
>>>>>>> 389120975c33ed21224ab2d351abec41037e832d
</html>
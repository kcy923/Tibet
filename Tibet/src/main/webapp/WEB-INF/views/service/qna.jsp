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
<title>service</title>
<link rel="stylesheet" href="resources/css/qna.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<section>
		<div class="service">
			<div class="service-front-table mgb10">
				<div class="service-front-fonter-qna">
					<a href="${contextPath}/qna.do">Q&A</a>
				</div>
				<div class="service-front-fonter-notice">
					<a href="${contextPath}/notice.do" class="font-999">공지사항</a>
				</div>

				<div class="service-front-fonter-member">
					<a href="${contextPath}/membership.do" class="font-999"">멤버쉽 안내</a>
				</div>
			</div>

			<div class="box-btn">
				<div class="box-btn-text">
					<button type="button" onclick="location.href='${contextPath}/qnaWrite.do'" class="btn-text">글쓰기</button>
				</div>
			</div>

			<div class="service-qna">
				<table class="service-qna-front">
					<thead class="service-qna-title mgb15">
						<tr>
							<th class="qna-no">번호</th>
							<th class="qna-goods">상품 정보</th>
							<th class="qna-tit">제목</th>
							<th class="qna-nm">작성자</th>
							<th class="qna-date">작성일</th>
						</tr>
					</thead>
					<tbody class="service-qna-content mgb20">
						<c:choose>
							<c:when test="${qnasList == null}">
								<tr>
									<td>
										<p>
											<b><span>등록된 글이 없습니다.</span></b>
										</p>
									</td>
								</tr>
							</c:when>
							<c:when test="${qnasList != null}">
								<c:forEach var="qna" items="${qnasList}" varStatus="qna_num">
									<tr>
										<td class="qna-no">${qna.qna_num}</td>
										<td class="qna-goods"><img src="" alt="" width="90px"></td>
										<c:choose>											
											<c:when test="${qna.qna_lock eq 0}">
												<td class="qna-tit-td"><i class="fas fa-lock-open"></i><a href="#">&nbsp;&nbsp;${qna.qna_title}</a></td>
											</c:when>
											<c:when test="${qna.qna_lock eq 1}">
												<td class="qna-tit-td"><i class="fas fa-lock"></i><a href="#">&nbsp;&nbsp;비밀글입니다.</a></td>
											</c:when>
										</c:choose>
										<td class="qna-nm">${qna.user_id}</td>
										<td class="qna-date"><fmt:formatDate value="${qna.qna_date}" pattern="yyyy.MM.dd"/></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
						<tr>
							<td class="qna-no">1</td>
							<td class="qna-goods"><img src="resources/img/1-1.jpg"
								alt="" width="90px"></td>
							<td class="mgb20-txt"><i class="fas fa-lock"></i> <a href="">비밀글
									입니다.</a></td>
							<td class="qna-nm">작성자</td>
							<td class="qna-date">2021-11-25</td>
						</tr>
						<tr>
							<td class="qna-no">2</td>
							<td class="qna-goods"><img src="resources/img/2-1.jpg"
								alt="" width="90px"></td>
							<td class="mgb20-txt"><i class="fas fa-lock"></i> <a href="">비밀글
									입니다.</a></td>
							<td class="qna-nm">작성자</td>
							<td class="qna-date">2021-11-24</td>
						</tr>
						<tr>
							<td class="qna-no">3</td>
							<td class="qna-goods"><img src="resources/img/3-1.jpg"
								alt="" width="90px"></td>
							<td class="mgb20-txt"><i class="fas fa-lock"></i> <a href="">비밀글
									입니다.</a></td>
							<td class="qna-nm">작성자</td>
							<td class="qna-date">2021-11-25</td>
						</tr>
						<tr>
							<td class="qna-no">4</td>
							<td class="qna-goods"><img src="resources/img/1-1.jpg"
								alt="" width="90px"></td>
							<td class="mgb20-txt"><i class="fas fa-lock-open"></i> <a
								href="">안녕하세요 이곳은 Q&A 페이지 입니다.</a></td>
							<td class="qna-nm">작성자</td>
							<td class="qna-date">2021-11-25</td>
						</tr>
						<tr>
							<td class="qna-no">5</td>
							<td class="qna-goods"><img src="resources/img/4-1.jpg"
								alt="" width="90px"></td>
							<td class="mgb20-txt"><i class="fas fa-lock-open"></i> <a
								href="">안녕하세요 이곳은 Q&A 페이지 입니다.</a></td>
							<td class="qna-nm">작성자</td>
							<td class="qna-date">2021-11-25</td>
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
</html>
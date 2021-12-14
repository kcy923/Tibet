<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>q&a 등록</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/qnaWrite.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<section>
		<div class="service_qna">
			<div class="service-qna_ask-table mgb10">
				<div class="service-front-fonter-qna_ask">Q&amp;A</div>
			</div>
		</div>
		<div class="qna-ask">
			<div class="form">
				<div class="qna-ask-form">
					<label>제목</label> <input type="text" class="input">
				</div>
				<div class="qna-ask-form">
					<label>작성자</label> <input type="text" class="input">
				</div>
				<div class="qna-ask-form">
					<label>비밀번호</label> <input type="password" class="input">
				</div>
				<div class="qna-ask-form">
					<label>공개여부</label> <select>
						<option value="">---선택---</option>
						<option value="공개">공개</option>
						<option value="비공개">비공개</option>
					</select>
				</div>
				<div class="qna-ask-form">
					<label>내용</label>
					<textarea class="textarea">
                </textarea>
				</div>
				<div class="qna-ask-form-img">
					<label>이미지 첨부</label> <input class="qna-ask-form-img-btn"
						type="file">
				</div>
			</div>
		</div>
		<div class="box-btn">
			<div class="box-btn-text">
				<button class="btn-text" id="button-reg">등록</button>
				<button class="btn-text" id="button-can">취소</button>
			</div>
		</div>

	</section>
	<div class="modal1" id="popup-reg">
		<div class="popup" >
			<div class="close1">
				<button id="close-button1">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div class="text111">
			<h1 class="text01">작성하신 내용을 등록하시겠습니까?</h1>
			<h1 class="text01">(등록 후 Q&A 페이지로 이동)</h1>
			</div>
			<button type="button" id="pop1"
				onclick="location.href='${contextPath}/qna.do'">확인</button>
		</div>
	</div>
	<div class="modal2" id="popup-can">
		<div class="popup" >
			<div class="close1">
				<button id="close-button2">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div class="text111">
			<h1 class="text01">작성 중인 내용이 있습니다.</h1>
			<h1 class="text01">나가시겠습니까?</h1>
			</div>
			<button type="button" id="pop1"
				onclick="location.href='${contextPath}/qna.do'">나가기</button>
		</div>
	</div>
	<script>
		$("#button-reg").click(function() {
			$("#popup-reg").attr("style", "display:block");
		});
		
		$("#button-can").click(function() {
			$("#popup-can").attr("style", "display:block");
		});
		
		$("#close-button1").click(function() {
			$(".modal1").attr("style", "display:none");
		});
		
		$("#close-button2").click(function() {
			$(".modal2").attr("style", "display:none");
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
</html>
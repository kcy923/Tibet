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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<title>header</title>
</head>
<body>
	<header>
		<ul class="top-menu">
			<!--  로그인시 로그아웃표시 -->
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.user_id !='admin'}">
					<li><a href="${contextPath}/notice.do">SERVICE</a></li>
					<li><a href="${contextPath}/logout.do">LOGOUT</a></li>
					<li><a href="${contextPath}/memModify.do">MYPAGE</a></li>
					<li><a href="${contextPath}/cart${memberInfo.user_id}.do">CART</a></li>

				</c:when>
				<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.user_id =='admin' }">
					<li><a href="${contextPath}/notice.do">SERVICE</a></li>
					<li><a href="${contextPath}/logout.do">LOGOUT</a></li>
					<li class="no_line"><a
						href="${contextPath}/admin/goods/adminMain.do">Manager</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${contextPath}/notice.do">SERVICE</a></li>
					<li><a href="${contextPath}/login.do">LOGIN</a></li>
					<li><a href="${contextPath}/signupForm.do">SIGN UP</a></li>
				</c:otherwise>
			</c:choose>



			<!-- 관리자로 로그인시 관리자표시 -->



			<li><button id="open-button">
					<i class="fas fa-search"></i>
				</button></li>

		</ul>
		<div id="logo">
			<a href="${contextPath}/main.do">THE TIBET</a>
		</div>
		<ul class="gnb">
			<li class="hamburger"><i class="fa fa-bars"></i></li>
			<li><a href="${contextPath}/productlistNew.do">NEW</a>
				<ul class="sub">
					<li><a href="${contextPath}/new.do">신상품(5%)</a></li>

				</ul></li>
			<li><a href="${contextPath}/outer.do">OUTER</a>
				<ul class="sub">
					<li><a href="${contextPath}/outer-1.do">재킷&점퍼</a></li>
					<li><a href="${contextPath}/outer-2.do">코트</a></li>
				</ul></li>
			<li><a href="${contextPath}/top.do">TOP</a>
				<ul class="sub">
					<li><a href="${contextPath}/top-1.do">티셔츠</a></li>
					<li><a href="${contextPath}/top-2.do">셔츠</a></li>
					<li><a href="${contextPath}/top-3.do">후드&맨투맨</a></li>
					<li><a href="${contextPath}/top-4.do">니트&가디건</a></li>
					<li><a href="${contextPath}/top-5.do">조끼</a></li>
				</ul></li>
			<li><a href="${contextPath}/pants.do">PANTS</a>
				<ul class="sub">
					<li><a href="${contextPath}/pants-1.do">팬츠</a></li>
					<li><a href="${contextPath}/pants-2.do">쇼츠</a></li>
				</ul></li>
			<li><a href="${contextPath}/bag.do">BAG</a>
				<ul class="sub">
					<li><a href="${contextPath}/bag-1.do">숄더 백</a></li>
					<li><a href="${contextPath}/bag-2.do">백팩</a></li>
					<li><a href="${contextPath}/bag-3.do">크로스 백</a></li>
					<li><a href="${contextPath}/bag-4.do">메신저 백</a></li>
				</ul></li>
			<li><a href="${contextPath}/acc.do">ACC</a>
				<ul class="sub">
					<li><a href="${contextPath}/acc-1.do">모자</a></li>
					<li><a href="${contextPath}/acc-2.do">반지&팔찌</a></li>
					<li><a href="${contextPath}/acc-3.do">선글라스</a></li>
					<li><a href="${contextPath}/acc-4.do">벨트</a></li>
				</ul></li>
			<li><a href="${contextPath}/sale.do">SALE</a>
				<ul class="sub">
					<li><a href="${contextPath}/memModify.do">Sale</a></li>
				</ul></li>
		</ul>
		<div class="drop-box"></div>
	</header>

	<div class="modal">
		<div class="modal_body">
			<h1>SEARCH</h1>
			<div class="close">
				<button id="close-button">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div class="wraps">
				<div class="search">
					<input type="text" class="searchTerm"
						placeholder="What are you looking for?">
					<button type="submit" class="searchButton">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<div class="recommend-items">
				<ul>
					<li><a href="#" class="font-777"># 다가오는 겨울에 함께 하기 좋은 윈터 룩</a></li>
					<li><a href="#" class="font-777"># 오늘의 신상 할인 5%~10%</a></li>
					<li><a href="#" class="font-777"># 휘뚜루마뚜루 착용할 수 있는 데일리 니트</a></li>
					<li><a href="#" class="font-777"># 바지 맛집! 인기팬츠 보러가기!</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script>
		$(document).on('click', '.hamburger', function() {
			if (!$(this).hasClass('.sub')) {
				$(".sub").slideToggle(300);
			}
		})

		$("#open-button").click(function() {
			$(".modal").attr("style", "display:block");
		});
		$("#close-button").click(function() {
			$(".modal").attr("style", "display:none");
		});
		
		$('html, body').css({'overflow': 'hidden', 'height': '100%'}); // 모달팝업 중 html,body의 scroll을 hidden시킴 
		$('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지     
			event.preventDefault();     
			event.stopPropagation();     
			return false; 
		});
		
		$('html, body').css({'overflow': 'auto', 'height': '100%'}); //scroll hidden 해제 $('#element').off('scroll touchmove mousewheel'); // 터치무브 및 마우스휠 스크롤 가능
	</script>

</body>
</html>
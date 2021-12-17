<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	int qnaNo = 1; 
	int reviewNo = 1;
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
	<link href="resources/css/style-product.css" rel="stylesheet" type="text/css">
	<script type="text/javascipt" src="resources/js/jquery-3.6.0.min.js"></script>
</head>

<body>
	<section>
		<!-- 전체 박스 시작 -->
		<div class="products-detail">
			<!-- 상단 박스 시작 -->
			<div class="products-detail-box">
				<div class="products-box-info">
					<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
					<div class="products-info-image swiper-container">
						<!-- 이미지 -->
						<div class="product-img">
							<img src="resources/${vo.product_thumbnail}"/>
						</div>
					</div>
				</div>
				<div class="products-box-detail">
					
					<div class="products-box-detail-name">
						<!-- 상품명 -->
						<span>${vo.product_name}</span>
					</div>
					<!-- 가격 -->
					<div class="products-box-detail-price">
						<div>
							<span class="products-box-detail-allPrice-title">상품 금액</span> 
						</div>
						<div>
							<span id="products-price"><fmt:formatNumber value="${vo.product_price}" pattern="###,###,###원"/></span>
						</div>
					</div>
					<div class="products-reserves border-btm-e1e1e1">
						<!-- 판매량 -->
						<span class="products-box-detail-soldCount-figure"><fmt:formatNumber value="${vo.product_price * 0.05}" pattern="###,###,###원"/></span>
						<!-- <span class="products-box-detail-soldCount-figure">적립금 : 1.500원</span> -->
					</div>
					<div class="products-box-detail-postInfo border-btm-e1e1e1">
						<span class="products-box-detail-postInfo-title">배송정보</span> <span
							class="products-box-detail-postInfo-content">일반배송</span>
					</div>
					<div class="products-box-detail-realInfo border-btm-e1e1e1">
						<span class="products-box-detail-realInfo-title">정품인증</span> <span
							class="products-box-detail-realInfo-content">The Tibet 내 모든
							상품은 100% 정품입니다.</span> <span
							class="products-box-detail-realInfo-popover"
							onclick="realInfoBox();"> ∨ </span>
						<div id="realInfo-box">
							&lt;The Tibet 정품인증&gt;<br /> The Tibet에서 판매되는 모든 브랜드 상품은 정식제조, <br />
							정식수입원을 통해 유통되는 100% 정품임을 보증합니다.
						</div>
					</div>

					<!-- 옵션 -->
					<div class="dropdown-option">
						<div>
							<span>color</span>
						</div>
						<div class="selectbox">
							<label for="color_select">-옵션을 선택해주세요-</label>
							<select id="color_select">					
								<!-- <option value="필수" selected>-옵션을 선택해주세요-</option>
								<option value="black">black</option>
								<option value="white">white</option> -->
								<option selected>-옵션을 선택해주세요-</option>
								<c:forEach items="${productDetail}" var="vo">
									<option><c:out value="${vo.product_color}"/></option>
								</c:forEach>
							</select>
							<select name="color_select" size="1">
								<option value="" selected></option>
								
							</select>

						</div>
					</div>
					<div class="dropdown-option">
						<div>
							<span>size</span>
						</div>
						<div class="selectbox">
							<label for="ex_select">-옵션을 선택해주세요-</label>
							<select id="ex_select">
								<option value="필수" selected>-옵션을 선택해주세요-</option>
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
						</div>
					</div>
					<br><br>
					
					<!-- 버튼 시작 -->
					<div id="products-btn">
						<c:choose>
							<c:when test="${sessionScope.principal != null}">
								<button type="button" class="buy-btn"
									onclick="location.href='<%=request.getContextPath()%>/user?cmd=directBuy&prodId=${prodDto.prodId}&userId=${sessionScope.principal.id}';">바로
									구매</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="buy-btn" onclick="needLogin();">바로
									구매</button>
							</c:otherwise>
						</c:choose>
						<!-- 장바구니 버튼 시작 -->
						<c:choose>
							<c:when test="${sessionScope.principal != null}">
								<c:choose>
									<c:when test="${isCart eq true }">
										<button type="button" class="cart-btn"
											onclick="rmvCart(${sessionScope.principal.id}, ${prodDto.prodId});">
											<i class="fas fa-shopping-cart">&nbsp;장바구니</i>
										</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="cart-btn"
											onclick="addCart(${sessionScope.principal.id}, ${prodDto.prodId});">
											<i class="fas fa-shopping-cart">&nbsp;장바구니</i>
										</button>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<button type="button" class="cart-btn" onclick="needLogin();">
									<i class="fas fa-shopping-cart">&nbsp;장바구니</i>
								</button>
							</c:otherwise>
						</c:choose>
						<!-- 장바구니 버튼 끝 -->
					</div>
					<!-- 찜 버튼 시작 -->
					<!-- 
					<c:choose>
						<c:when test="${sessionScope.principal != null}">
							<c:choose>
								<c:when test="${isFavor eq true }">
									<button type="button" class="fav-btn"
										onclick="rmvFavor(${sessionScope.principal.id}, ${prodDto.prodId});">
										<i class="material-icons" style="color: red;">favorite</i>
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="fav-btn"
										onclick="addFavor(${sessionScope.principal.id}, ${prodDto.prodId});">
										<i class="material-icons">favorite_border</i>
									</button>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<button type="button" class="fav-btn" onclick="needLogin();">
								<i class="material-icons">favorite_border</i>
							</button>
						</c:otherwise>
					</c:choose>
					 -->
					<!-- 찜 버튼 끝 -->
					<!-- 버튼 끝 -->
				</div>
			</div>
			<!-- 상단 박스 끝 -->
			<!-- 아래 박스 전체 시작-->
			<div class="wrap-detail-info">
				<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
				<div class="tab-detail-info">
					<ul class="tab">
						<li class="active" id="tab-img-text"><a
							href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
						<li class="active" id="tab-review"><a
							href="#detail-review-box" id="tab-review-a">리뷰</a></li>
						<li class="active" id="tab-qna"><a href="#detail-qna-box"
							id="tab-qna-a">Q&amp;A</a></li>
						<li class="active" id="tab-purchaseInfo"><a
							href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">주문정보</a></li>
					</ul>
				</div>
				<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

				<!-- 상품 상세 설명 이미지/글 시작 -->
				<!-- 우측 하단 sticky  -->
				<div class="detail-sticky-go-to-top-btn-box">
					<a href="#" class="detail-sticky-go-to-top-btn-a"> <img
						class="detail-sticky-go-to-top-btn-img"
						src="resources/img/arrowUp.png" />
					</a>
				</div>
				<!-- 우측 하단 sticky 끝 -->
				<div id="detail-img-text-box">${prodDto.detail}</div>
				<div class="productDetail-img">
					<img src="resources/img/t1-1.jpg"/>
					<img src="resources/img/t2-1.jpg"/>
				</div>
				<!-- 상품 상세 설명 이미지/글 끝 -->

				<!-- 리뷰 시작 -->
				<div id="detail-review-box">
					<div class="detail-review-header">
						리뷰 (${countReview})
						<c:if test="${sessionScope.principal != null}">
							<a
								href="<%=request.getContextPath()%>/review?cmd=reviewWrite&prodNo=${prodDto.prodId}"
								class="detail-qna-header-a" id="detail-qna-write">리뷰작성</a>
						</c:if>
						<a class="detail-qna-header-a"
							href="<%=request.getContextPath()%>/review?cmd=reviewAll&prodNo=${prodDto.prodId}">전체보기</a>
					</div>
					<div class="detail-qna-body">
						<c:if test="${reviewList != null}">
							<c:forEach var="review" items="${reviewList}">
								<div class="detail-qna-item">
									<span class="detail-qna-item-number"><%=reviewNo%></span> <a
										href="<%=request.getContextPath()%>/review?cmd=openReviewDetail&reviewId=${review.id}"
										target="_blank"> <span class="detail-qna-item-detail">${review.detail}</span>
									</a> <span class="detail-qna-item-writerName">
										${fn:substring(review.name, 0, fn:length(review.name)-1)}* </span> <span
										class="detail-qna-item-createDate"> <fmt:formatDate
											value="${review.createDate}" type="date" />
									</span>
								</div>
								<%reviewNo += 1;%>
							</c:forEach>
						</c:if>
					</div>

				</div>
				<!-- 리뷰 끝 -->

				<!-- Q&A 시작 -->
				<div id="detail-qna-box">
					<div class="detail-qna-header">
						Q&amp;A (${countQna})
						<c:if test="${sessionScope.principal != null}">
							<a
								href="<%=request.getContextPath()%>/qna?cmd=qnawrite&prodNo=${prodDto.prodId}"
								class="detail-qna-header-a" id="detail-qna-write">문의하기</a>
						</c:if>
						<a class="detail-qna-header-a"
							href="<%=request.getContextPath()%>/qna?cmd=qnaAll&prodNo=${prodDto.prodId}">전체보기</a>
					</div>
					<br>
					<div class="service-qna">
						<table class="service-qna-front">
							<thead class="service-qna-title mgb15">
								<tr >
									<th class="qna-no">번호</th>
									<th class="qna-tit">제목</th>
									<th class="qna-nm">작성자</th>
									<th class="qna-date">작성일</th>
								</tr>
							</thead>
							<tbody class="service-qna-content mgb20">
								<c:choose>
									<c:when test="${prodQnasList == null}">
										<tr>
											<td>
												<p>
													<b><span>등록된 글이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:when test="${prodQnasList != null}">
										<c:forEach var="qna" items="${prodQnasList}">
										<c:if test="${qna.product_num eq vo.product_num }">
											<c:set var="i" value="${i + 1}"/>
											<tr>
												<td class="qna-no">${i}</td>
												<c:choose>
													<c:when test="${qna.qna_lock eq 0}">
														<td class="qna-tit-td"><i class="fas fa-lock-open"></i><a
															href="#">&nbsp;&nbsp;${qna.qna_title}</a></td>
													</c:when>
													<c:when test="${qna.qna_lock eq 1}">
														<td class="qna-tit-td"><i class="fas fa-lock"></i><a
															href="#">&nbsp;&nbsp;비밀글입니다.</a></td>
													</c:when>
												</c:choose>
												<td class="qna-nm">${qna.user_id}</td>
												<td class="qna-date"><fmt:formatDate value="${qna.qna_date}" pattern="yyyy.MM.dd"/></td>
											</tr>
											</c:if>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
						<br>
						<div class="qna-write">
							<button type="button" onclick="location.href='${contextPath}/qnaWrite.do'" class="qna-btn">문의하기</button>
						</div>
						<ul id="pagingul"></ul>
					</div>
				</div>
				<!-- 
				<div id="detail-qna-box">
					<div class="detail-qna-header">
						Q&amp;A (${countQna})
						<c:if test="${sessionScope.principal != null}">
							<a
								href="<%=request.getContextPath()%>/qna?cmd=qnawrite&prodNo=${prodDto.prodId}"
								class="detail-qna-header-a" id="detail-qna-write">문의하기</a>
						</c:if>
						<a class="detail-qna-header-a"
							href="<%=request.getContextPath()%>/qna?cmd=qnaAll&prodNo=${prodDto.prodId}">전체보기</a>
					</div>
					<div class="detail-qna-body">
						<c:if test="${qnaList != null}">
							<c:forEach var="qna" items="${qnaList}">
								<div class="detail-qna-item">
									<span class="detail-qna-item-number"><%=qnaNo%></span> <a
										href="<%=request.getContextPath()%>/qna?cmd=openQnaDetail&qnaId=${qna.id}"
										target="_blank"> <c:choose>
											<c:when test="${empty qna.password}">
												<span class="detail-qna-item-detail">${qna.detail}</span>
											</c:when>
											<c:otherwise>
												<span class="detail-qna-item-detail">비밀글입니다.</span>
											</c:otherwise>
										</c:choose>
									</a>
									<c:choose>
										<c:when test="${empty qna.password}">
											<span class="detail-qna-item-writerName">
												${fn:substring(qna.name, 0, fn:length(qna.name)-1)}* </span>
										</c:when>
										<c:otherwise>
											<span class="detail-qna-item-writerName"> </span>
										</c:otherwise>
									</c:choose>
									<span class="detail-qna-item-createDate"> <fmt:formatDate
											value="${qna.createDate}" type="date" />
									</span>
								</div>
								<%qnaNo += 1;%>
							</c:forEach>
						</c:if>
					</div>
				</div>
				 -->
				<!-- Q&A 끝 -->

				<!-- 주문정보 시작 -->
				<div id="detail-purchaseInfo-box">
					<div class="detail-purchaseInfo-header">
						주문정보 <span class="products-box-detail-realInfo-popover"
							onclick="addressInfoBox();"> ∨ </span>
					</div>
					<div id="addressInfo-box">
						<b class="bld">[ 배송 정보 ]</b><br />
						<p>
							고객센터 연락이 어려우니 게시판에 문의주시면 빠르게 답변드리도록 하겠습니다.<br />
							CJ대한통운(1588-1255)택배를 이용하며, 매일 오후 1시 전 주문까지만 당일발송합니다.<br />
							발송한날로부터 1~3일 이내 받아보실수 있습니다.<br /> (택배사의 영업사정에 따라 배송지연이 있을 수
							있습니다.)
						</p>
						<b class="bld">[ 교환/환불 정보 ]</b><br />
						<p>
							상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br /> 환불요청 가능 기간은 상품
							수령 후(배송완료 시점으로부터) 7일 이내입니다.<br /> 교환/환불이 발생하는 경우 그 원인을 제공한 자가
							배송비를 부담합니다.<br /> - 고객변심 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 고객이 부담<br />
							- 판매자귀책 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 판매자가 부담<br /> 다음의 경우는
							예외적으로 교환 및 환불이 불가능합니다.<br /> - 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우<br />
							- 소비자 과실로 인한 옷의 변색(예 : 착색, 화장품, 오염 등)<br /> - 착용으로 인한 니트류 상품의
							늘어남 발생 및 가죽 제품의 주름 발생<br /> - 기타 착용 흔적 : 택 제거 등<br /> - 구매확정된
							주문의 경우<br /> - 귀금속류의 경우는 소비자분쟁조정기준에 의거 교환만 가능합니다.<br /> (단,
							함량미달의 경우에는 환불이 가능함)<br /> 구매자 단순변심은 상품수령후 7일이내(구매자 반품배송비 부담)
						</p>
					</div>
				</div>
				<!-- 주문정보 끝 -->

			</div>
			<!-- 아래 박스 전체 끝 -->

		</div>
	</section>
</body>

<script>
	function color_option(){
		String[] colorArray = ${vo.product_color}.split(",");
		
		//List<String> colorList = new ArrayList<>();
		for (int i = 0; i < colorArray.length; i++) {
			//colorList.add(colorArray[i]);
			var option = $("<option>"+colorArray[i]+"</option>");
	        $('#color_select').append(option);
		}
		
		/*var option = $("<option>"+changeItem[count]+"</option>");
        $('#select2').append(option);
		
		var myParent = document.body; 

		//Create and append select list 
		var selectList = document.createElement("select"); 

		selectList.id = "ex_select"; 
		myParent.appendChild(selectList); 

		//Create and append the options 
		for (var i = 0; i < colorArray.length; i++) { 
			var option = document.createElement("option");
			option.value = colorArray[i];
			option.text = colorArray[i];
			selectList.appendChild(option); 
		}*/
	}
	
	function size_option(){
		
	}	
	
	
	
	
	/*-------------------------------------------------------------------------------------------------------------------------------*/

	let totalData = ${qna_num}; //총 데이터 수
	let dataPerPage = 5; //한 페이지에 나타낼 글 수
	let pageCount = 10; //페이징에 나타낼 페이지 수
	let globalCurrentPage = 1; //현재 페이지
	
	 /*
	 $.ajax({ // ajax로 데이터 가져오기
		method: "GET",
		url: "https://url/data?" + data,
		dataType: "json",
		success: function (d) {
		   //totalData 구하기
		   totalData = d.data.length;
	 });
	 */
	 
	 //글 목록 표시 호출 (테이블 생성)
	 displayData(1, dataPerPage);
	 
	 //페이징 표시 호출
	 paging(totalData, dataPerPage, pageCount, 1);
	});
	
	function paging(totalData, dataPerPage, pageCount, currentPage) {
		  console.log("currentPage : " + currentPage);

		  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
		  
		  if(totalPage<pageCount){
		    pageCount=totalPage;
		  }
		  
		  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
		  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
		  
		  if (last > totalPage) {
		    last = totalPage;
		  }

		  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
		  let next = last + 1;
		  let prev = first - 1;

		  let pageHtml = "";

		  if (prev > 0) {
		    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
		  }

		 //페이징 번호 표시 
		  for (var i = first; i <= last; i++) {
		    if (currentPage == i) {
		      pageHtml +=
		        "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
		    } else {
		      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
		    }
		  }

		  if (last < totalPage) {
		    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
		  }

		  $("#pagingul").html(pageHtml);
		  let displayCount = "";
		  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
		  $("#displayCount").text(displayCount);


		  //페이징 번호 클릭 이벤트 
		  $("#pagingul li a").click(function () {
		    let $id = $(this).attr("id");
		    selectedPage = $(this).text();

		    if ($id == "next") selectedPage = next;
		    if ($id == "prev") selectedPage = prev;
		    
		    //전역변수에 선택한 페이지 번호를 담는다...
		    globalCurrentPage = selectedPage;
		    //페이징 표시 재호출
		    paging(totalData, dataPerPage, pageCount, selectedPage);
		    //글 목록 표시 재호출
		    displayData(selectedPage, dataPerPage);
		  });
		}
	
	//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
	function displayData(currentPage, dataPerPage) {

	  let chartHtml = "";

	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	  currentPage = Number(currentPage);
	  dataPerPage = Number(dataPerPage);
	  
	  for (
	    var i = (currentPage - 1) * dataPerPage;
	    i < (currentPage - 1) * dataPerPage + dataPerPage;
	    i++
	  ) {
	    chartHtml +=
	      "<tr><td>" +
	      dataList[i].d1 +
	      "</td><td>" +
	      dataList[i].d2 +
	      "</td><td>" +
	      dataList[i].d3 +
	      "</td></tr>";
	  }
	  $("#dataTableBody").html(chartHtml);
	}
	
	$("#dataPerPage").change(function () {
	    dataPerPage = $("#dataPerPage").val();
	    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
	    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
	    displayData(globalCurrentPage, dataPerPage);
	 });
	
</script>

<script type="text/javascript" src="resources/js/product.js"></script>
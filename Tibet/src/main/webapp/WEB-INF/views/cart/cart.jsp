<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/cart.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<section>		
		<div class="frame">
		<form>
			<div class="favor-head border-btm-black mgb20">장바구니</div>
			 
			<div>
				<table id="cart-table">
					<thead class="cart-table-head">
						<tr>
							<th class="cart-check"><input type="checkbox" name="cartChk" value="selectAll" onclick="selectAll(this); itemSum(this.form);"/></th>
							<th class="cart-img">상품이미지</th>
							<th class="cart-info">상품정보</th>
							<th class="cart-price">판매가</th>
							<th class="cart-count">수량</th>
							<th class="cart-point">적립금</th>
							<th class="cart-total">합계</th>
							<th class="cart-delete"></th>
						</tr>
					</thead>
					<tbody class="cart-table-body">
						<c:choose>
							<c:when test="${fn:length(cartsList) > 0}">
								<c:forEach var="cart" items="${cartsList}">
									<c:set var="i" value="${i + 1}"/>
									<tr id="tr">
										<td class="td-cart-check"><input type="checkbox" onClick="itemSum(this.form);" name="cartChk" value="${cart.product_price * cart.product_count}"/></td>
										<td class="td-cart-img"><a href="#"><img src="resources/${cart.product_thumbnail}" style="height:100px;"/></a></td> 
										<td class="td-cart-info">
											<div>${cart.product_name}</div>
											<div class="product-option">[${cart.product_color}, ${cart.product_size}]</div>
										</td>
										<c:if test="${cart.product_sale eq 0}">
											<td class="td-cart-price"><fmt:formatNumber value="${cart.product_price}" pattern="###,###,###원"/></td>
										</c:if>
										<c:if test="${cart.product_sale ne 0}">
											<td class="td-cart-price">
												<div class="td-cart-price-div"><fmt:formatNumber value="${cart.product_price}" pattern="###,###,###원"/></div>
												<div class="td-cart-sale-div"><fmt:formatNumber value="${cart.product_price - cart.product_sale}" pattern="###,###,###원"/></div>
											</td>
										</c:if>
										<td class="td-cart-count">
											<div class="table_text_align_center quantity_div">
												<button type="button" class="quantity_btn minus-btn">-</button>
												<input type="text" value="${cart.product_count}" class="quantity-input">	
												<button type="button" class="quantity_btn plus-btn">+</button>
											</div>
											<button type="button" class="change-btn" id="change-btn${i}" data-num="${cart.product_num}" data-color="${cart.product_color}" data-size="${cart.product_size}">변경</button>
										</td>
										<td class="td-cart-point"><fmt:formatNumber value="${cart.product_price * 0.05 * cart.product_count}" pattern="###,###,###원"/></td>
										<td class="td-cart-total"><fmt:formatNumber value="${(cart.product_price - cart.product_sale) * cart.product_count}" pattern="###,###,###원"/></td>
										<td class="td-cart-delete">
											<div><i class="fas fa-times" data-num="${cart.product_num}" data-color="${cart.product_color}" data-size="${cart.product_size}" id="delete-btn${i}"></i></div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan='8'>
										<b>담긴 상품이 없습니다.</b>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>			
			</div>

			<div class="cart-under-box">
				<p class="mgt5 mgb0 cart-middle-content">[100,000원 이상 구매 시 무료배송]</p>
				<table class="total-table">
					<thead class="price-table-head">
						<tr>
							<th class="total-product">총 상품금액</th>
							<th class="total-delivery">총 배송비</th>
							<th class="total-discount">총 할인금액</th>
							<th class="total-price">결제예정금액</th>
						</tr>
					</thead>
					<tbody id="price-table-body">
						<tr>
							<td id="total-product-td">0원</td>
							<td id="total-delivery-td">+ 2,500원</td>
							<td id="total-discount-td">- 0원</td>
							<td id="total-price-td">= 2,500원</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="cart-go-to-check-box">
				<button class="cart-go-to-check-btn mgb100">
					<a href="${contextPath}/order.do" class="f18-bd-fff">주문하기</a>
				</button>
			</div>
			</form>
			
			<div id='result'></div>
			
			<!-- 수량 변경 폼 -->
			<form action="${contextPath}/updateCart.do" method="post" class="quantity_update_form">
				<input type="hidden" name="product_num" class="update_product_num">
				<input type="hidden" name="product_count" class="update_product_count">
				<input type="hidden" name="product_color" class="update_product_color">
				<input type="hidden" name="product_size" class="update_product_size">
				<input type="hidden" name="user_id" value="${memberInfo.user_id}">
			</form>
			
			<!-- 삭제 폼 -->
			<form action="${contextPath}/deleteCart.do" method="post" class="delete_form">
				<input type="hidden" name="product_num" class="delete_product_num">
				<input type="hidden" name="product_color" class="delete_product_color">
				<input type="hidden" name="product_size" class="delete_product_size">
				<input type="hidden" name="user_id" value="${memberInfo.user_id}">
			</form>
		</div>
	</section>
	
	<script>		
		/* 전체선택 */
		function selectAll(selectAll)  {
	    	const checkboxes = document.getElementsByName('cartChk');
			  
			checkboxes.forEach((checkbox) => {
				checkbox.checked = selectAll.checked;
			})
		}
		
		/* 수량 조절 버튼 */
		$(".plus-btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".minus-btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			if(quantity > 1){
				$(this).parent("div").find("input").val(--quantity);		
			}
		});
		
		/* 수량 수정 버튼 */
		$("[id^=change-btn]").on("click", function(){
			let productNum = $(this).data("num"); 
			let productCnt = $(this).parent("td").find("input").val();
			let productColor = $(this).data("color"); 
			let productSize = $(this).data("size"); 
			$(".update_product_num").val(productNum);
			$(".update_product_count").val(productCnt);
			$(".update_product_color").val(productColor);
			$(".update_product_size").val(productSize);
			$(".quantity_update_form").submit();			
		});
		
		/* 삭제 버튼 */  
		$("[id^=delete-btn]").on("click", function(e){
			let productNum = $(this).data("num");
			let productColor = $(this).data("color"); 
			let productSize = $(this).data("size"); 
			$(".delete_product_num").val(productNum);
			$(".delete_product_color").val(productColor);
			$(".delete_product_size").val(productSize);
	        $(".delete_form").submit();	
	    });
		
		/* 선택한 상품 총합계 */
		function itemSum(frm){
		   var sum = 0;
		   var count = frm.cartChk.length;
		   
		   for(var i=1; i < count; i++ ){
		       if( frm.cartChk[i].checked == true ){
			    sum += parseInt(frm.cartChk[i].value);
		       }
		   }
		   
		   $("#middle-price").text(sum.toLocaleString());
		   document.getElementById('total-product-td').innerText = sum.toLocaleString() + "원";
		   
		   var delivery = 2500;
		   if(sum >= 100000){
			   delivery = 0;
			   $("#middle-delivery").text(delivery.toLocaleString());
			   document.getElementById('total-delivery-td').innerText = "+ " + delivery.toLocaleString() + "원";
		   } else{
			   $("#middle-delivery").text(delivery.toLocaleString());
			   document.getElementById('total-delivery-td').innerText = "+ " + delivery.toLocaleString() + "원";
		   }
		   
		   var total = 0;
		   total = sum + delivery;
		   document.getElementById('total-price-td').innerText = "= " + total.toLocaleString() + "원";
		}
		
		
		
		const table = document.getElementById('cart-table');
		const totalRowCnt = table.rows.length;
		result.innerText = '전체 행 개수: ' + totalRowCnt + '\n';

		const tbody = table.tBodies[0].rows.length;
		result.innerText += 'Tbody 행 개수 : ' + tbody;
	</script>
</body>
</html>
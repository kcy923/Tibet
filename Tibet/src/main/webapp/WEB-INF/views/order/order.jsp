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
<title>주문</title>

<link rel="stylesheet" href="resources/css/order.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<section>
		<div class="checkout-full-wrp">
			<div class="favor-head border-btm-black mgb20">주문/결제</div>
			
			<div class="order-top-div">
				<table id="order-product-table">
					<thead class="order-product-table-head">
						<tr>
							<th class="order-product-img">상품이미지</th>
							<th class="order-product-info">상품정보</th>
							<th class="order-product-price">판매가</th>
							<th class="order-product-count">수량</th>
							<th class="order-product-point">적립금</th>
							<th class="order-product-total">합계</th>
						</tr>
					</thead>
					<tbody class="order-product-table-body">
						<c:forEach var="nowBuy" items="${nowBuyList}">
							<tr id="tr">
								<td class="td-order-product-img"><a href="#"><img src="resources/${nowBuy.product_thumbnail}" style="height:100px;"/></a></td> 
								<td class="td-order-product-info">
									<div>${nowBuy.product_name}</div>
									<div class="product-option">[${nowBuy.product_color}, ${nowBuy.product_size}]</div>
								</td>
								<c:if test="${nowBuy.product_sale eq 0}">
									<td class="td-order-product-price"><fmt:formatNumber value="${nowBuy.product_price}" pattern="###,###,###원"/></td>
								</c:if>
								<c:if test="${nowBuy.product_sale ne 0}">
									<td class="td-order-product-price">
										<div class="td-order-price-div"><fmt:formatNumber value="${nowBuy.product_price}" pattern="###,###,###원"/></div>
										<div class="td-order-sale-div"><fmt:formatNumber value="${nowBuy.product_price - nowBuy.product_sale}" pattern="###,###,###원"/></div>
									</td>
								</c:if>
								<td class="td-order-product-count">
									<div class="table_text_align_center quantity_div">${nowBuy.product_count}</div>
								</td>
								<td class="td-order-product-point"><fmt:formatNumber value="${nowBuy.product_price * 0.05 * nowBuy.product_count}" pattern="###,###,###원"/></td>
								<td class="td-order-product-total"><fmt:formatNumber value="${(nowBuy.product_price - nowBuy.product_sale) * nowBuy.product_count}" pattern="###,###,###원"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>			
				<div class="order-middle-priceAll">
					<div>
						<div class="f15-555">상품&nbsp;<div id="middle-price">0</div>원</div>
					</div>
					<span>+</span>
					<div>
						<div class="f15-555">배송비&nbsp;<div id="middle-delivery">2,500</div>원</div>
					</div>
					<span>=</span>
					<div>
						<div class="order-middle-totalPrice pdl20 f25-bd-purple">합계&nbsp;<div class="f25-bd-purple">0</div>원</div>
					</div>
				</div>
			</div>
			<p class="order-middle-content">[상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.]</p>

			<div class="checkout-info-wrp">
				<!-- 하단좌측박스 시작 -->
				<div class="checkout-wrp-left">
					<h3 class="f20-bd-333">주문 정보</h3>
					<div class="left-section-delivery-info left-section-box">
						<div class="order-person">
							<label>주문하시는 분 *</label>
							<input type="text" id="input-person"/>
						</div>
						<div class="order-address">
							<label>주소 *</label>
							<input type="text" id="input-order-zipcode" name="input-order-zipcode" readonly="readonly"/>
							<button type="button" id="address-btn" onclick="order_execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button><br>
							<label></label>
							<input type="text" id="input-order-address1" name="input-order-address1" readonly="readonly"/>
							<span>기본주소</span>
							<br>
							<label></label>
							<input type="text" id="input-order-address2" name="input-order-address2"/>
							<span>나머지주소</span>
						</div>
						<div class="order-call">
							<label>일반전화</label>
							<input type="text" id="input-call" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="order-phone">
							<label>휴대전화 *</label>
							<input type="text" id="input-phone" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="order-email">
							<label>이메일 *</label>
							<input type="text" id="input-email"/>
							<p>- 이메일을 통해 주문처리과정을 보내드립니다.</p>
							<p>- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
						</div>
					</div>
				</div>
				<!-- 하단우측박스 시작 -->
				<div class="checkout-wrp-right">
					<h3 class="f20-bd-333">배송 정보</h3>
					<div class="left-section-delivery-info left-section-box">
						<div class="delivery-checkbox">
							<label>배송지 선택</label>
							<span><input type="checkbox" name="delivery-checkbox-input" onclick="checkDelivery(this)" checked="checked"/> 주문자 정보와 동일</span>&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" name="delivery-checkbox-input" onclick="checkDelivery(this)"/> 새로운 배송지</span>
						</div>
						<div class="delivery-person">
							<label>받으시는 분 *</label>
							<input type="text" id="input-person"/>
						</div>
						<div class="delivery-address">
							<label>주소 *</label>
							<input type="text" id="input-delivery-zipcode" name="input-delivery-zipcode" readonly="readonly"/>
							<button type="button" class="address-btn" onclick="delivery_execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>	
							<br>
							<label></label>
							<input type="text" id="input-delivery-address1" name="input-delivery-address1" readonly="readonly"/>
							<span>기본주소</span>
							<br>
							<label></label>
							<input type="text" id="input-delivery-address2" name="input-delivery-address2"/>
							<span>나머지주소</span>
						</div>
						<div class="delivery-call">
							<label>일반전화</label>
							<input type="text" id="input-call" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="delivery-phone">
							<label>휴대전화 *</label>
							<input type="text" id="input-phone" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="delivery-msg">
							<label>배송메시지</label>
							<textarea></textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="total-div">
				<h3 class="f20-bd-333">결제 예정 금액</h3>
				<div class="total-table">
					<table>
						<thead class="price-table-head">
							<tr>
								<th class="total-order">총 주문 금액</th>
								<th class="total-discount">총 할인 + 부가결제 금액</th>
								<th class="total-price">총 결제예정 금액</th>
							</tr>
						</thead>
						<tbody id="price-table-body">
							<tr>
								<td id="total-order-td">0원</td>
								<td id="total-discount-td">- 0원</td>
								<td id="total-price-td">= 0원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="total-discount-div1">
					<div class="total-discount-div2">총 할인금액</div>
					<div>0원</div>
				</div>
			</div>
				
			<div class="order-bottom-div">
				<div class="discount-div">
					<h3 class="f20-bd-333">적립금&쿠폰</h3>
					<div class="discount-section-box">
						<div class="point-div">
							<label>적립금</label>
							<input type="text" id="input-use-point"/>
							<div id="usable-point">[ 사용 가능한 적립금 : 2000원 ]</div>
						</div>
						<div class="coupon-div">
							<label>쿠폰</label>
							<select>
								<option>:::선택해 주세요.:::</option>
								<option>oooo 할인권</option>
							</select>
						</div>
					</div>
				</div>
			
				<div class="pay-div">
					<h3 class="f20-bd-333">결제 수단</h3>
					<div class="pay-section-box">
						<div class="pay-checkbox">
							<span><input type="checkbox" id="pay-card" name="pay-checkbox-input" value="1" onclick="checkPay(this); setDisplay();" checked="checked"/> 카드 결제</span>&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" id="pay-tongjang" name="pay-checkbox-input" value="2" onclick="checkPay(this); setDisplay();"/> 무통장 입금</span>&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" id="pay-phone" name="pay-checkbox-input" value="3" onclick="checkPay(this); setDisplay();"/> 휴대폰 결제</span>
						</div>
						<div id="card-div">
							<i class="fas fa-exclamation-circle"></i> 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br><br>
							<i class="fas fa-exclamation-circle"></i> 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.<br>
							<div class="total-span-div">
								<span class="total-title">카드 결제&nbsp;</span><span class="total-span">최종결제 금액</span>
							</div>		
						</div>
						<div id="tongjang-div">
							<div class="tongjang-top">
								<div>
									<label>입금자명</label>
									<input type="text" id="tongjang-person-input" />
								</div>
								<div>
									<label>입금은행</label>
									<select id="bank_select">
										<option>:::선택해 주세요.:::</option>
										<option value="1">신한은행:000-000-000000 (주)The Tibet</option>
									</select>
									<button type="button" id="bank-btn" onclick="goBank()">은행사이트 바로가기</button>
								</div>
								<i class="fas fa-exclamation-circle"></i> 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.
							</div>
							<div class="tongjang-bottom">
								<div class="bottom-checkbox">
									<label id="receipt-label">현금영수증 신청</label>
									<div>
										<span><input type="checkbox" id="pay-tongjang-receipt" name="tongjang-checkbox-input" value="201" onclick="checkTongjang(this); setDisplay();"/> 현금영수증 신청</span>&nbsp;&nbsp;
										<span><input type="checkbox" id="pay-tongjang-nonreceipt" name="tongjang-checkbox-input" value="202" onclick="checkTongjang(this); setDisplay();" checked="checked"/> 신청안함</span>
									</div>
								</div>
								<div id="receipt-checkbox">
									<label>구분</label>
									<span><input type="checkbox" id="receipt-phone" name="receipt-checkbox-input" value="20101" onclick="checkReceipt(this); setDisplay();" checked="checked"/> 개인</span>&nbsp;&nbsp;
									<span><input type="checkbox" id="receipt-code" name="receipt-checkbox-input" value="20102" onclick="checkReceipt(this); setDisplay();"/> 사업자</span>
								</div>
								<div id="phoneNum-div">
									<label>휴대폰 번호</label>
									<input type="text" id="tongjang-phoneNum-input" placeholder=" '-'없이 번호만 입력해주세요. "/>
								</div>
								<div id="code-div">
									<label>사업자 번호</label>
									<input type="text" id="tongjang-code-input"/>
								</div>
							</div>
							<div class="total-span-div">
								<span class="total-title">무통장 입금&nbsp;</span><span class="total-span">최종결제 금액</span>		
							</div>
						</div>
						<div id="phone-div">
							<i class="fas fa-exclamation-circle"></i> 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.	
							<div class="total-span-div">
								<span class="total-title">휴대폰 결제&nbsp;</span><span class="total-span">최종결제 금액</span>
							</div>		
						</div>
						<div class="total-price-div">0원</div>				
					</div>
				</div>
			</div>
			
			
			
			<div class="total-price-btn-div">
				<button class="total-price-btn">결제하기</button>
			</div>
		</div>
	</section>
	
	<script>
		/* 하나만 체크 */
		function checkDelivery(element) {
			const checkboxes = document.getElementsByName("delivery-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		function checkPay(element) {
			const checkboxes = document.getElementsByName("pay-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		function checkTongjang(element) {
			const checkboxes = document.getElementsByName("tongjang-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		function checkReceipt(element) {
			const checkboxes = document.getElementsByName("receipt-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		
		/* 체크마다 다른 div 띄우기 */
		window.onload = function() {
			$('#card-div').show();
			$('#tongjang-div').hide();
			$('#phone-div').hide();
		};
		
		function setDisplay(){
			if($('input:checkbox[id=pay-card]').is(':checked')){
				$('#card-div').show(),
				$('#tongjang-div').hide(),
				$('#phone-div').hide();				
			} else if($('input:checkbox[id=pay-tongjang]').is(':checked')){
				$('#card-div').hide(),
				$('#tongjang-div').show(),
				$('#phone-div').hide();
				
				if($('input:checkbox[id=pay-tongjang-receipt]').is(':checked')){
					$('#receipt-checkbox').show();
					
					if($('input:checkbox[id=receipt-phone]').is(':checked')){
						$('#phoneNum-div').show(),
						$('#code-div').hide();
					} else if($('input:checkbox[id=receipt-code]').is(':checked')){
						$('#phoneNum-div').hide(),
						$('#code-div').show();
					}
				} else if($('input:checkbox[id=pay-tongjang-nonreceipt]').is(':checked')){
					$('#receipt-checkbox').hide(),
					$('#phoneNum-div').hide(),
					$('#code-div').hide();
				}
			} else if($('input:checkbox[id=pay-phone]').is(':checked')){
				$('#card-div').hide(),
				$('#tongjang-div').hide(),
				$('#phone-div').show();	
			}
		}
		
		
		/* 우편번호 API */
		function order_execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }

	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               console.log(data.zonecode);
	               console.log(fullRoadAddr);
	               
	               
	               $("[name=input-order-zipcode]").val(data.zonecode);
	               $("[name=input-order-address1]").val(fullRoadAddr);
	               
	               document.getElementById('input-order-zipcode').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('input-order-address1').value = fullRoadAddr;
	               /*document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress;*/
	           }
	        }).open();
	    }
		
		function delivery_execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }

	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               console.log(data.zonecode);
	               console.log(fullRoadAddr);
	               
	               
	               $("[name=input-delivery-zipcode]").val(data.zonecode);
	               $("[name=input-delivery-address1]").val(fullRoadAddr);
	               
	               document.getElementById('input-delivery-zipcode').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('input-delivery-address1').value = fullRoadAddr;
	               /*document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress;*/
	           }
	        }).open();
	    }
		
		
		/* 은행사이트 이동 */
		function goBank(){
			var s = document.getElementById("bank_select");
			var bankOption = s.options[s.selectedIndex].value;
			
			if(bankOption == 1) {
				window.open('https://www.shinhan.com/index.jsp');
			}
		}
		
		
		/* 상품 총합계 */
		function itemSum(){
			const table = document.getElementById('order-product-table');
			const tbodyRow = table.tBodies[0].rows.length;
			var sum = 0;
			
			for(var i=0; i<tbodyRow; i++){
				
			}
		}
	</script>
</body>
</html>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/signup.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<title>회원가입</title>


<script>
function fn_overlapped(){
    var _id=$("#_user_id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_user_id').prop("disabled", true);
       	    $('#userr_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	

</script>
<body>
	<section>
		<div class="title">
			<h1>
				<b>회원가입</b>
			</h1>
		</div>
		<form action="${contextPath}/signup.do" method="post">
		<div class="info-rect">

			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control"
					id="user_id" name="user_id" placeholder=" ">					
					<label id="id-info">(영문소문자/숫자, 4~12자)</label>
					<div class="check_font" id="overlapped"></div>


				<!-- <div class="eheck_font" id="pw2_check"></div> -->
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" id="user_pw" name="user_pw" placeholder=" ">
				<label id="pwd-info">(영문 대소문자/숫자/특수문자 중 <br>2가지 이상 조합,
					10자~16자)
				</label>
			</div>
			<!-- <div class="form-group">
				<label for="pw2">비밀번호 확인</label> <input type="password"
					class="form-control" id="user_pw2" name="user_pw2" placeholder=" ">
				<div class="eheck_font" id="pw2_check"></div>
			</div> -->
			<div class="form-group">
				<label for="mem_name">이름</label> <input type="text"
					class="form-control" id="user_name" name="user_name" placeholder=" ">
				<div class="eheck_font" id="name_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_birth">생년월일</label> <input type="tel"
					class="form-control" id="user_birth" name="user_birth"
					placeholder=" 6자리만 입력해주세요. ">
				<div class="eheck_font" id="birth_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_email">이메일 주소</label> <input type="email"
					class="form-control" id="user_email" name="user_email"
					placeholder=" ">
				<div class="eheck_font" id="email_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_phone">휴대폰 번호</label> <input type="tel"
					class="form-control" id="user_phone" name="user_phone"
					placeholder=" '-'없이 번호만 입력해주세요. ">
				<div class="eheck_font" id="phone_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_gender">성별 </label> <input type="radio"
					class="mem_gender" name="user_gender" value="0">남 <input
					type="radio" class="mem_gender" name="user_gender" value="1">여
			</div>
			<div class="form-group">
				<label for="mem_address">주소 </label> <input class="form-control"
					placeholder="우편번호" name="user_zip" id="user_zip" type="text"
					readonly="readonly">
				<button type="button" class="btn btn-default"
					onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
			<div class="form-group">
				<label></label> <input class="form-address" placeholder="도로명 주소"
					name="user_addr1" id="user_addr1" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<label></label> <input class="form-address" placeholder="상세주소"
					name="user_addr2" id="user_addr2" type="text" />
			</div>
		</div>
		<div class="checkbox-group">
			<div class="check-parent">
				<input type="checkbox" name="check-Agree" onclick="selectAll(this)">
				<label>전체 동의</label>
			</div>
			<div class="check-child">
				<input type="checkbox" name="check-Agree" class="normal"> <label>개인정보
					처리방침 동의</label>
			</div>
			<div class="check-child">
				<input type="checkbox" name="check-Agree" class="normal"> <label>서비스
					이용약관 동의</label>
			</div>
			<!-- <div class="check-child">
				<input type="checkbox" name="user_mailSend" id="user_mailSend" class="normal" value="checkbox_Check()"> <label>마케팅
					수신 동의</label>
			</div> -->
			<div class="check-child">
				<input type="checkbox" name="user_mailSend" value='1' id="user_mailSend"/><label>마케팅 수신 동의</label>
				<input type="hidden" name="user_mailSend" value='0' id="user_mailSend_hidden"/>
			</div>
		</div>
		<div class="cor-button">
    	<button type="submit" onclick="joinform_check();">가입하기</button>
    	 			
		</div>
		</form>
	</section>
</body>
</html>
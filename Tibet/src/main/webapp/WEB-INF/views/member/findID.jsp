<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>아이디 찾기</title>
<style>
.title {
	margin: 20px 37%;
	font-size: 30px;
	font-weight: bold;
}

.info-rect {
	width: 20%;
	height: auto;
	background: white;
	margin: 0px 37% 15px;
	padding: 2% 4%;
	border: 1px solid black;
	border-radius: 6px;
}

#checks {
	height:auto;
	text-align: center;
	position: relative;
	top: 30px;
	font-size: 17px;
}

.control-box {
	margin-bottom: 20px;
}

.form-control {
	position: relative;
	width: 100%;
	height: auto;
	padding: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	font-size: 16px;
}

.correction-btn {
	width: 28%;
	height: 50px;
	margin: 0px 37% 15px;
	border: none;
	background-color: #1e1e1e;
	border-radius: 6px;
	color: white;
	font-size: 17px;
	font-weight: bold;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
}
</style>
<script>
$(document).on('click','#findId',function(){
	var name = $('#name').val();
 	var birth = $('#birth').val();
 	var tel = $('#tel').val();

 	var postData = {'user_name' : name , 'user_birth' : birth , 'user_phoneNumber' : tel};

	$.ajax({
        url:'/findId',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",

        success:function(data){
        	var emailLists = data.user_email;
        	var emailLength = emailLists.length
        	var emailfind = emailLists.substring(1, emailLength-1)
       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+emailfind+" 입니다.</h1>")

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});

</script>
</head>
<body>
	<section>
		<div class="title">
			<h1>
				<b>아이디 찾기</b>
			</h1>
		</div>
		<div>
			<form action="${contextPath}/resultID.do" name="checks" class="form-signin" method="POST">
				<div class="info-rect">
					<div class="control-box">
						<input type="text" name="user_name" id="name" class="form-control"
							placeholder="이름" required>
					</div>
					<div>
						<input type="email" name="user_email" id="email" class="form-control"
							placeholder="이메일" required>
					</div>

				</div>
				<button id="correction-btn" class="correction-btn" type="submit" onclick="check()">확인</button>
			</form>
		</div>
	</section>
	<!-- <script>
	function check() {
        if (document.getElementById("user-name").value == "") {

            return false;
  		}
        else if (document.getElementById("user_id").value == "") {

            return false;
        }
        else if (document.getElementById("user_email").value == "") {

            return false;
        }
        }
        else
  		 document.checks.submit();
	
	</script> -->
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>아이디 찾기</title>
<style>
.title {
	margin: 20px 37%;
	font-size: 30px;
	font-weight: bold;
}

.info-rect {
	width: 20%;
	height: auto;
	background: white;
	margin: 0px 37% 15px;
	padding: 2% 4%;
	border: 1px solid black;
	border-radius: 6px;
}

#checks {
	height:auto;
	text-align: center;
	position: relative;
	top: 30px;
	font-size: 17px;
}

.control-box {
	margin-bottom: 20px;
}

.form-control {
	position: relative;
	width: 100%;
	height: auto;
	padding: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	font-size: 16px;
}

.correction-btn {
	width: 28%;
	height: 50px;
	margin: 0px 37% 15px;
	border: none;
	background-color: #1e1e1e;
	border-radius: 6px;
	color: white;
	font-size: 17px;
	font-weight: bold;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
}
</style>
</head>
<body>
	<section>
		<div class="title">
			<h1>
				<b>아이디 찾기</b>
			</h1>
		</div>
		<div>
			<form action="${contextPath}/resultID.do" name="checks" class="form-signin" method="POST">
				<div class="info-rect">
					<div class="control-box">
						<input type="text" name="name" id="name" class="form-control"
							placeholder="이름" required>
					</div>
					<div>
						<input type="email" name="email" id="email" class="form-control"
							placeholder="이메일" required>
					</div>

				</div>
				<button id="correction-btn" class="correction-btn" type="submit" onclick="check()">확인</button>
			</form>
		</div>
	</section>
	<script>
	function check() {
        if (document.getElementById("name").value == "") {

            return false;
  		}
        else if (document.getElementById("member_id").value == "") {

            return false;
        }
        else if (document.getElementById("email").value == "") {

            return false;
        }
        }
        else
  		 document.checks.submit();
	
	</script>
</body>
>>>>>>> 389120975c33ed21224ab2d351abec41037e832d
</html>
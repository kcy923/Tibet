var fn_overlapped = true;
	$(document).ready(function() {//id 중복처리 function
		$('#member_id').blur(function() {
			var id = $('#member_id').val();
			if (id == '') {
				$('#id_check').text('아이디를 입력해주세요');
			} else {
				$.ajax({
					type : 'POST',
					url : '/fn_overlapped.do',
					dataType : "text",
					data : {
						u_id : id
					},
					success : function(data) {
						if (data == 'true') {
							$('#id_check').text('사용가능한 아이디 입니다');
							$('#id_check').css('color', 'black');
							id_overlap = true;
						} else {
							$('#id_check').text('사용할 수 없는 아이디 입니다');
							$('#id_check').css('color', 'red');
							id_overlap = false;
						}
					},
					error : function() {
						$('#id_check').text('오류');
					}

				});
			}
		});
	});

	$(document).ready(function() {//password 일치 여부
		$('#pwd2').blur(function() {

			var pw1 = $('#pwd1').val();
			var pw2 = $('#pwd2').val();

			if (pw1 == pw2) {
				$('#password_check').text("");
			} else {
				$('#password_check').text("비밀번호가 일치하지 않습니다");
			}
		});
	});

		$(document).ready(function() {
			
			$('#email_select').change(function() {
				var email = $('#email_select').val();
				if (email == 'direct') {
					$('#_email2').attr('disabled', false);
					$('#_email2').val('');
					$('#_email2').focus();
				} else {
					$('#_email2').attr('disabled',true);
					$('#_email2').val($('#email_select').val());
					$('#email2').val($('#email_select').val());
				}
			});
		});
		
		$(document).ready(function(){
			
			$('#_email2').blur(function(){
				$('#email2').text($('#_email2').text());
			});
		});
		
		$(document).ready(function(){
			
			$("input").on("propertychange change keyup paste input", function() {
				$(this).css('border-color','');			 
			});
			
			$('select').change(function(){
				$(this).css('border-color','');
			});
			
			$('#email_select').change(function(){
				$('#_email2').css('border','');
			});
		});	
		
		function Sub(){
			var num = 0;
			var list = new Array();
			list[0] = '#member_id';
			list[1] = '#pwd1';
			list[2] = '#pwd2';
			list[3] = '#member_name';
			list[4] = '#member_gender';
			list[5] = '#member_cp1';
			list[6] = '#member_cp2';
			list[7] = '#member_cp3';
			list[8] = '#email1';
			list[9] = '#_email2';
			list[10] = '#postaddr';
			list[11] = '#loadaddr';
			list[12] = '#detailaddr';
			list[13] = '#jiaddr';
			list[14] = '#birth_y';
			list[15] = '#birth_m';
			list[16] = '#birth_d';
			
			
			for(var i = 0 ; i < list.length ; i ++){
				if($(list[i]).val() == ''){$(list[i]).css('border-color','red'); num++;}
			}
			if(id_overlap == true){
			if(num == 0){
			document.signupform.action="membersignup.do";
			document.signupform.submit();
			}else return;
			}else{
				alert('아이디가 중복입니다');
			}
		}
		
		
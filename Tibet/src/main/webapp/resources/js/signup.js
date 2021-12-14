{ 
    var user_id = $("#user_id").val();
    var user_pw = $("#user_pw").val();
    var user_name = $("#user_name").val();
    var user_birth= $("#user_birth").val();
    var user_phone = $("#user_phone").val();
    var user_email = $("#user_email").val();
    var user_addr = $("#user_addr").val();
    var user_addr2 = $("#user_addr").val();
    var user_addr3 = $("#user_addr").val();
    var user_gender = $("#user_gender").val();
    
    if(user_id.length == 0){
        alert("아이디를 입력해 주세요"); 
        $("#user_id").focus();
        return false;
    }
    
    if(user_pw.length == 0){
        alert("비밀번호를 입력해 주세요"); 
        $("#user_pw").focus();
        return false;
    }
    if(user_name.length == 0){
        alert("이름을 입력해주세요");
        $("#user_name").focus();
        return false;
    }
    if(user_birth.length == 0){
    alert("생년월일을 입력해주세요");
    $("#user_birth").focus();
    return false;
    }
    
    if(user_email.length == 0){
        alert("이메일을 입력해주세요");
        $("#email").focus();
        return false;
    }
    
	    if(user_email.length == 0){
        alert("이메일을 입력해주세요");
        $("#email").focus();
        return false;
    }
    
	
    if(user_addr.length == 0 || user_addr2.length == 0 || user_addr3.length == 0 ){
        alert("주소를 입력해주세요");
        $("user_addr").focus();
        return false;
    }
    

 
}
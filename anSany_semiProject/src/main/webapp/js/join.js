$("#memberId").on("keyup",function(event){
    const idValue = $(this).val();
    const idComment = $("#idChkBtn").next();
    //아이디 공백확인
    if(idValue == ""){
        idComment.text("사용할 아이디를 입력하세요");
        idComment.css("color","red");
        idChkResult = false;
        event.preventDefault();
    }else{
        //아이디 유효성 검사
        const idReg = /^[A-za-z0-9]{6,12}$/;
        if(!idReg.test(idValue)|| idValue.length<6){
            idComment.text("아이디는 영어/숫자 조합으로 6~12글자 입니다.");
            idComment.css("color","red");
            idChkResult = false;
            event.preventDefault();
        }else{
            //중복아이디 체크(ajax)
            $.ajax({
				url : "/CheckId.do",
				type: "get"
});
			
            idComment.text("사용 가능한 아이디 입니다");
            idComment.css("color","blue");
            idChkResult = true;
        }
    }
});
//ajax

$("#memberPw").on("keyup",function(event){
    const pwValue = $(this).val();
    const pwComment = $("#memberPw").next();
    //비밀번호 공백확인
    if(pwValue == ""){
        pwComment.text("사용할 비밀번호를 입력하세요");
        pwComment.css("color","red");
        pwChkResult = false;
        event.preventDefault();
    }else{
        //비밀번호 유효성 검사
        const pwReg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,12}$/;
        if(!pwReg.test(pwValue)||pwValue.length<8){
            pwComment.text("비밀번호는 영문자 숫자 조합 8~12글자 입니다.");
            pwComment.css("color","red");
            pwChkResult = false;
            event.preventDefault();
        }else if(pwReg.test(pwValue)){
            pwComment.text("사용가능합니다");
            pwComment.css("color","blue");
            pwChkResult = true;
        }
    }
});

$("#memberPwRe").on("keyup",function(event){
    const pw = $("#memberPw");
    const pwValue = pw.val();
    const pwReComment = $(this).next();
    const pwReValue = $(this).val();
    //비밀번호 일치 확인
    if(pwValue == pwReValue){
        //일치하는 비밀번호
        pwReComment.text("비밀번호가 일치합니다.");
        pwReComment.css("color","blue");
        pwReChkResult = true;
    }else{
        //일치하지 않는 비밀번호
        pwReComment.text("비밀번호가 일치하지않습니다.");
        pwReComment.css("color","red");
        pwReChkResult = false;
        event.preventDefault();
    }
});
$("#memberEmail").on("keyup",function(event){
    const emailValue = $(this).val();
    const emailComment =$(this).next();
    const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    //이메일 공백확인
    if(emailValue == ""){
        emailComment.text("이메일을 입력해주세요");
        emailComment.css("color","red");
        emailChkResult = false;
        event.preventDefault();
    }else{
        if(emailReg.test(emailValue)){
            //이메일 중복확인후
            emailComment.text("사용가능합니다.");
            emailComment.css("color","blue");
            emailChkResult = ture;
        }else{
            emailComment.text("다시입력하세요");
            emailComment.css("color","red");
            emailChkResult = false;
            event.preventDefault();
        }
    }
});
$("#memberName").on("keyup",function(event){
    const nameValue = $(this).val();
    const nameComment = $(this).next();
    const nameReg = /^[가-힣]{2,7}$/;
    //이름 공백확인
    if(nameValue == ""){
        nameComment.text("이름을 입력해주세요");
        nameComment.css("color","red");
        nameChkResult = false;
        event.preventDefault();
    }else{
        if(nameReg.test(nameValue)){
            nameComment.text("사용가능합니다.");
            nameComment.css("color","blue");
            nameChkResult = true;
        }else{
            nameComment.text("이름은 한글로 2~7글자입니다.");
            nameComment.css("color","red");
            nameChkResult = false;
            event.preventDefault();
        }
    }
});

$("#memberBirth").on("keyup",function(event){
    const birthValue = $(this).val();
    const birthComment = $(this).next();
    const birthReg = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
    //생일 공백확인
    if(birthValue == ""){
        birthComment.text("생일을 입력해주세요");
        birthComment.css("color","red");
        birthChkResult = false;
        event.preventDefault();
    }else{
        if(birthReg.test(birthValue)){
            birthComment.text("사용가능합니다.");
            birthComment.css("color","blue");
            birthChkResult = ture;
        }else{
            birthComment.text("생년월일 8자리 - 포함입니다.");
            birthComment.css("color","red");
            birthChkResult = false;
            event.preventDefault();
        }
    }
});

$("#memberPhone").on("keyup",function(event){
    const phoneValue = $(this).val();
    const phoneComment = $(this).next();
    const phoneReg = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
    //휴대폰번호 공백확인
    if(phoneValue == ""){
        phoneComment.text("휴대폰번호를 입력해주세요.");
        phoneComment.css("color","red");
        phoneChkResult = false;
        event.preventDefault();
    }else{
        //핸드폰 유효성 검사
        if(phoneReg.test(phoneValue)){
            phoneComment.text("사용가능합니다.");
            phoneComment.css("color","blue");
            phoneChkResult = ture;
        }else{
            phoneComment.text("핸드폰 번호는 - 포함입니다.");
            phoneComment.css("color","red");
            phoneChkResult = ture;
            event.preventDefault();
        }
    }
});


$(".join-btn").on("click",function(event){
    if(idChkResult && pwChkResult && pwReChkResult && nameChkResult && birthChkResult && phoneChkResult){
        alert("가입에 성공하였습니다.");
    }else{
        alert("입력값을 확인하세요");
        event.preventDefault();
    }
});
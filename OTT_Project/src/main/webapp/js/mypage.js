/*내정보 조회 및 수정
-수정/완료/취소버튼 클릭 시 이벤트*/
    $(document).ready(function(){
        document.getElementById("btn_update2").style="display: none;"
        document.getElementById("btn_update1").style="display: inline-block;"
        document.getElementById("btn_check1").style="display: none;"
        document.getElementById("btn_check2").style="display: none;"
        document.getElementById("btn_cancel").style="display: none;"
        
        $("#member_info_update input").attr('readonly',true);
        $("#member_info_update input").css('background','rgba(239, 239, 239, 0.3)');
         
         /*Mypage-info-tel select*/
         var $tel=$("#myTel");
         $(":radio[name='tel'][value='" + $tel.val() + "']").attr('checked', true);

    });
    function updateFormCheck(){
        let name,nick,hp1,hp2,hp3,email1,email2,email3;
        
        
        let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
        let check2 = /^(?=.*[a-zA-Z])(?=.*[.])[a-zA-Z\.]+$/;
        var check3 = /^[^ㄱ-ㅎ가-힣]+$/;
        
        name = document.getElementById("update_name");
        nick = document.getElementById("update_nick");
        hp1 = document.getElementById("update_hp1");
        hp2 = document.getElementById("update_hp2");
        hp3 = document.getElementById("update_hp3");
        email1 = document.getElementById("update_email1");
        email2 = document.getElementById("update_email2");
        email3 = document.getElementById("update_email3");
        let idcheckcnt = document.getElementById("update_idcheckcnt");
        let nickcheckcnt = document.getElementById("update_nickcheckcnt");
        let hpcheckcnt = document.getElementById("update_hpcheckcnt");
        
        if(name.value == ""){
            alert("이름을 입력해주세요.");
            return false;
        }else if(nick.value == ""){
            alert("닉네임을 입력해주세요.");
            return false;
        }else if(checkCount("tel") == 0){
            alert("통신사를 선택해주세요.");
            return false;
        }else if(hp1.value == ""){
            alert("전화번호 앞자리를 입력해주세요.");
            return false;
        }else if(hp2.value == ""){
            alert("전화번호 중간자리를 입력해주세요.");
            return false;
        }else if(hp3.value == ""){
            alert("전화번호 끝자리를 입력해주세요.");
            return false;
        }else if(email1.value == ""){
            alert("이메일을 입력해주세요.");
            return false;
        }else if(email2.value == ""){
            alert("이메일 주소를 선택해주세요.");
            return false;
        }else if(email3.value == "choice"){
            alert("이메일 주소를 선택해주세요.")
            email3.focus();
            return false;
        }else if(!check3.test(email1.value)){
            alert("이메일에 한글은 사용 불가능합니다.");
            return false;
        }else if(!check2.test(email2.value)){
            alert("이메일 형식을 확인해주세요.");
            return false;
        }else if(nickcheckcnt.value == 0){
            alert("닉네임 중복체크를 해주세요");
            return false;
        }else if(hpcheckcnt.value == 0){
            alert("전화번호 중복체크를 해주세요");
            return false;
        }else{
           let input_list=document.getElementsByClassName("update_input1");
            for(let i=0; i<input_list.length; i++){
                input_list[i].readonly=true;
                $("#member_info_update input").css('background','rgba(239, 239, 239, 0.3)');
            };
            document.getElementById("btn_update2").style="display: none;"
            document.getElementById("btn_update1").style="display: inline-block;"
            document.getElementById("btn_check1").style="display: none;"
            document.getElementById("btn_cancel").style="display: none;"
            member_info_update.submit();
        }
        
    }
    function inputUnlock(){
        document.getElementById("btn_update1").style="display: none;"
        document.getElementById("btn_check1").style="display: inline-block;"
        document.getElementById("btn_update2").style="display: inline-block;"
        document.getElementById("btn_cancel").style="display: inline-block;"
        document.getElementById("btn_check2").style="display: inline-block;"
        
        $("#member_info_update input").not("#update_id").attr('readonly',false);
        $("#member_info_update input").not("#update_id").css('background','white');
    }

    
/*비밀번호 재설정
- 입력값 체크/ 비밀번호 일치 확인*////현재 비밀번호 db 연결 필요
    function password_update_form_check(){
        let cpass, pass, rpass;
        cpass=document.getElementById("update_cpass");
        pass=document.getElementById("update_pass");
        rpass=document.getElementById("update_rpass");
        
        if(cpass.value==""){
            alert("현재 비밀번호 입력해주세요");
            return false;
        }else if(pass.value==""){
            alert("신규 비밀번호 입력해주세요");
            return false;
        }else if(rpass.value==""){
            alert("신규 비밀번호 재확인 입력해주세요");
            return false;
        }else{
            if(rpass.value==pass.value){
                return true;
            }else{
                alert("입력한 비밀번호가 일치하지 않습니다.\n다시 확인해주세요.")
            }
        }
    }
/****************************
mypage-info-update : password, repassword Check
****************************/
function cpassCheck(){
    let pass,cpass,cpassmsg;
    pass = document.getElementById("update_pass");
    cpass = document.getElementById("update_cpass");
    cpassmsg = document.getElementById("update_cpassmsg");
    
    if(pass.value != "" && cpass.value != ""){
        if(pass.value != cpass.value){
            cpassmsg.innerHTML = "비밀번호가 다릅니다.";
            cpassmsg.style.color = "red";
            return false;
        }else{
            cpassmsg.innerHTML = "";
            return true;
        }
    }else if(cpass.value ==""){
        cpassmsg.innerHTML = "비밀번호 확인을 입력해주세요.";
        cpassmsg.style.color = "red";
        return false;
    }else if(cpass.value !== "" || pass.value == cpass.value){
        cpassmsg.innerHTML = "";
        return true;
    }

}
/****************************
mypage-info-update : name, nick, hp, email,
****************************/
   //이름
function textCheck_name(obj){
    let namemsg = document.querySelector("#update_namemsg");
//  let str = obj.value;
//  let check = /^[ㄱ-ㅎ가-힣a-zA-Z]+$/;

    if(obj.value ==""){
        namemsg.innerHTML = "이름을 입력해주세요.";
        namemsg.style.color = "red";
        return false;
//  }else if(!check.test(str)){
//      namemsg.innerHTML = "한글 또는 영문을 사용하세요.";
//      namemsg.style.color = "red";
    }else{
        namemsg.innerHTML = "";
    }
}

function nickchecksave(obj){
    let check_save1 = document.getElementById("update_check_save1");
    check_save1.value = obj.value;
}
//닉네임
function textCheck_nick(obj){
    let nickmsg = document.querySelector("#update_nickmsg");
    let check_save1 = document.getElementById("update_check_save1");
    let check_save2 = document.getElementById("update_check_save2");
    let nickcheckcnt = document.getElementById("update_nickcheckcnt");
    
    let str = obj.value;
    
    check_save2.value = obj.value;
    
    if(obj.value ==""){
        nickmsg.innerHTML = "닉네임을 입력해주세요.";
        nickmsg.style.color = "red";
        return false;
//  }else if(!check.test(str)){
//      nickmsg.innerHTML = "영문과 숫자를 사용하세요.";
//      nickmsg.style.color = "red";
    }else if(check_save1.value !== check_save2.value){
        nickcheckcnt.value = 0;
        nickmsg.innerHTML = "중복체크를 해주세요";
        nickmsg.style.color = "red";
    }else{
        nickmsg.innerHTML = "";
    }
}


//전화번호
function hpchecksave(obj){
    let check_save1 = document.getElementById("update_check_save1");
    check_save1.value = obj.value;
}

function textCheck_hp(obj){
    let hp1,hp2,hp3;
    let hpmsg = document.querySelector("#update_hpmsg");
    let check_save1 = document.getElementById("update_check_save1");
    let check_save2 = document.getElementById("update_check_save2");
    let hpcheckcnt = document.getElementById("update_hpcheckcnt");
    
    check_save2.value = obj.value;
    
    hp1 = document.getElementById("update_hp1");
    hp2 = document.getElementById("update_hp2");
    hp3 = document.getElementById("update_hp3");
    let str1 = hp1.value;
    let str2 = hp2.value;
    let str3 = hp3.value;
    let check1 = /^(?=.*\d)[\d]{3,3}$/;
    let check2 = /^(?=.*\d)[\d]{3,4}$/;
    let check3 = /^(?=.*\d)[\d]{4,4}$/;
    
    if(hp1.value == "" || hp2.value == "" || hp3.value == ""){   //또는
        hpmsg.innerHTML = "전화번호를 입력해주세요.";
        hpmsg.style.color = "red";
        return false;
    }else if(!check1.test(str1)){
        hpmsg.innerHTML = "전화번호 앞자리는 3자리의 숫자를 사용하세요.";
        hpmsg.style.color = "red";
    }else if(!check2.test(str2)){
        hpmsg.innerHTML = "전화번호 중간자리는 3~4자리의 숫자를 사용하세요.";
        hpmsg.style.color = "red";
    }else if(!check3.test(str3)){
        hpmsg.innerHTML = "전화번호 끝자리는 4자리의 숫자를 사용하세요.";
        hpmsg.style.color = "red";
    }else if(check_save1.value !== check_save2.value){
        hpcheckcnt.value = 0;
        hpmsg.innerHTML = "중복체크를 해주세요";
        hpmsg.style.color = "red";
    }else{
        hpmsg.innerHTML = "";
    }
}


//이메일
function textCheck_email(){
    let email1,email2,email3;
    let emailmsg = document.querySelector("#update_emailmsg");
    
    email1 = document.getElementById("update_email1");
    email2 = document.getElementById("update_email2");
    email3 = document.getElementById("update_email3");
    
    let str1 = email1.value;
    let str2 = email2.value;
    //var check = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$/;
    //var check = /^[a-zA-Z\d]+$/;
    
    //let check1 = /^(?=.*[ㄱ-ㅎ가-힣])[ㄱ-ㅎ가-힣]+$/;
    var check1 = /^[^ㄱ-ㅎ가-힣]+$/;
    let check2 = /^(?=.*[a-zA-Z])(?=.*[.])[a-zA-Z\.]+$/;
    //let check2 = /^(?=.*[a-zA-Z])(?=.*[.])(?=.*\s)[a-zA-Z\.\s+]*$/;
//  let check2 = /^[A-Za-z\.\s+]*$/;
    
    
//
    //수정전 - 이메일1채우고 이메일2안채운 상태에서 이메일 3선택 --> 이메일 형식을 확인해주세요 뜸
    if(email1.value == "" || email2.value == ""){
        emailmsg.innerHTML = "이메일을 입력해주세요.";
        emailmsg.style.color = "red";
        return false;
    }else if(!check1.test(str1)){
        emailmsg.innerHTML = "한글은 사용 불가능합니다.";   //영문,숫자 모두 사용하여 조합
        emailmsg.style.color = "red";
    }else if(!check2.test(str2)){
            emailmsg.innerHTML = "이메일 형식을 확인해주세요.";
            emailmsg.style.color = "red";
    
        
    }else if(email1.value !== "" && email2.value !== ""){
        emailmsg.innerHTML = "";
    }
    
} 


/********************
      통신사 체크확인
     ********************/
    function checkCount(pname){
        let list,count;
        
        list = document.getElementsByName(pname);
        count = 0;
        
        for(let i=0;i<list.length;i++){
            if(list[i].checked){
                count++;
            }
        }
        return count;
    }
    
    /********************
     이메일 주소
     ********************/
    function emailCheck(){
        let email1, email2,email3;
        email1 = document.getElementById("update_email1")
        email2 = document.getElementById("update_email2");
        email3 = document.getElementById("update_email3");
        let emailmsg = document.querySelector("#update_emailmsg");
        if(email1.value !== "" && email2.value !== ""){
            emailmsg.innerHTML = "";
        }
        
            
        if(email3.value == "self"){
            //alert("이메일 주소를 입력해주세요.");
            email2.value = "";
        }else{
            email2.value = email3.value;
        }

    }
    
    
    /**
     * 비밀번호 재설정
     */
    
    function textCheck_pass_reset(obj){
        let new_passmsg1 = document.querySelector("#update_new_passmsg1");
        
        let str = obj.value;
        let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
        
        if(obj.value ==""){
            new_passmsg1.innerHTML = "신규 비밀번호를 입력해주세요.";
            new_passmsg1.style.color = "red";
            return false;
        }else if(!check.test(str)){
            new_passmsg1.innerHTML = "8~16자 영문, 숫자, 특수문자를 사용하세요.";
            new_passmsg1.style.color = "red";
            return false;
        }else{
            new_passmsg1.innerHTML = "&nbsp;";
        }
    }
    
    
    /**
     * 비밀번호 재설정 - 비밀번호, 비밀번호 확인 체크
     */
    function cpassCheck2(){
    let new_pass1,new_pass2,new_passmsg2;
    new_pass1 = document.getElementById("update_new_pass1");
    new_pass2 = document.getElementById("update_new_pass2");
    new_passmsg2 = document.getElementById("update_new_passmsg2");

    if(new_pass1.value != "" && new_pass2.value != ""){
        if(new_pass1.value != new_pass2.value){
            new_passmsg2.innerHTML = "비밀번호가 다릅니다.";
            new_passmsg2.style.color = "red";
            return false;
        }else{
            new_passmsg2.innerHTML = "&nbsp;";
            return true;
        }
    }else if(new_pass2.value ==""){
        new_passmsg2.innerHTML = "신규 비밀번호 확인을 입력해주세요.";
        new_passmsg2.style.color = "red";
        return false;
    }else if(new_pass2.value !== "" || new_pass1.value == new_pass2.value){
        new_passmsg2.innerHTML = "&nbsp;";
        return true;
    }
    
    }




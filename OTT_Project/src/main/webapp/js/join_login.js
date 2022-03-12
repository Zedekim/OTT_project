/***
 * 로그인 폼 체크
 ***/
function loginFormCheck(){
	let id, pass;
	id = document.getElementById("id");
	pass = document.getElementById("pass");
	
	if(id.value == ""){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(pass.value == ""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else{
		loginForm.submit();
	}	
}

/***
 * 아이디 찾기 : 이메일
 ***/
function loginForm_id_find_email_Check(){
	let name,email1,email2,email3;
	
	name = document.getElementById("name");
	email1 = document.getElementById("email1");
	email2 = document.getElementById("email2");
	email3 = document.getElementById("email3");
	
	if(name.value == ""){
		alert("이름을 입력해주세요.");
		return false;
	}else if(email1.value == ""){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(email2.value == ""){
		alert("이메일을 선택해주세요.");
		return false;
	}else if(email3.value == "choice"){
		alert("이메일을 선택해주세요.");
		email3.focus();
		return false;
	}else{
		login_id_find_emailForm.submit();
	}
}

/***
 * 아이디 찾기 : 핸드폰
 ***/
function loginForm_id_find_hp_Check(){
	let name,hp1,hp2,hp3;
	
	name = document.getElementById("name");
	hp1 = document.getElementById("hp1");
	hp2 = document.getElementById("hp2");
	hp3 = document.getElementById("hp3");
	
	if(name.value == ""){
		alert("이름을 입력해주세요.");
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
	}else{
		login_id_find_hpForm.submit();
	}
}

/***
 * 비밀번호 찾기
 ***/
function loginForm_pass_find_Check(){
	let id, question, answer;
	id = document.getElementById("id");
	question = document.getElementById("question");
	answer = document.getElementById("answer");
	
	if(id.value == ""){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(question.value == "choice"){
		alert("질문을 선택해주세요.");
		return false;
	}else if(answer.value == ""){
		alert("답변을 입력해주세요.");
		return false;
	}else{
		login_pass_findForm.submit();
	}	
}



/***
 * 비밀번호 재설정 폼 체크
 ***/
function loginForm_pass_reset_Check(){
	let ppass, pass, cpass;
	ppass = document.getElementById("ppass");
	new_pass1 = document.getElementById("new_pass1");
	new_pass2 = document.getElementById("new_pass2");
	
	if(ppass.value == ""){
		alert("현재 비밀번호를 입력해주세요.");
		return false;
	}else if(new_pass1.value == ""){
		alert("신규 비밀번호를 입력해주세요.");
		return false;
	}else if(new_pass2.value == ""){
		alert("신규 비밀번호 확인을 입력해주세요.");
		return false;
	}else{
		login_pass_resetForm.submit();
	}	
}

/***
 * 회원가입 폼 체크(공백체크, 정규식체크)
 ***/

function idchecksave(obj){
	let check_save1 = document.getElementById("check_save1");
	check_save1.value = obj.value;
}

//아이디
function textCheck_id(obj){
	
	let idmsg = document.querySelector("#idmsg");
	let idcheckcnt = document.getElementById("idcheckcnt");
	let check_save1 = document.getElementById("check_save1");
	let check_save2 = document.getElementById("check_save2");
	
	let str = obj.value;
	let check = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
	
	check_save2.value = obj.value;
	
	if(obj.value ==""){
		idmsg.innerHTML = "회원ID를 입력해주세요.";
		idmsg.style.color = "red";
		return false;
	}else if(!check.test(str)){
		idmsg.innerHTML = "6~12자 영문, 숫자를 사용하세요.";
		idmsg.style.color = "red";
	}
	else if(check_save1.value !== check_save2.value){
		idcheckcnt.value = 0;
		idmsg.innerHTML = "중복체크를 해주세요";
		idmsg.style.color = "red";
	}else{
		idmsg.innerHTML = "";
	}
	
}


//비밀번호
function textCheck_pass(obj){
	let passmsg = document.querySelector("#passmsg");
	let pass = document.getElementById("pass");
	let cpass = document.getElementById("cpass");
	let cpassmsg = document.getElementById("cpassmsg");
	let str = obj.value;
	let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
	
	if(obj.value ==""){
		passmsg.innerHTML = "비밀번호를 입력해주세요.";
		passmsg.style.color = "red";
	}else if(!check.test(str)){
		passmsg.innerHTML = "8~16자 영문, 숫자, 특수문자를 사용하세요.";
		passmsg.style.color = "red";
		
	
		
	}else{
		passmsg.innerHTML = "";
	}
	
	if(pass.value != "" && cpass.value != ""){
		if(pass.value != cpass.value){
			cpassmsg.innerHTML = "비밀번호가 다릅니다.";
			cpassmsg.style.color = "red";
			return false;
		}else{
			cpassmsg.innerHTML = "";
			return true;
		}
	}
	
}

/****************************
회원가입 - 비밀번호, 비밀번호 확인 체크
****************************/
function cpassCheck(){
	let pass,cpass,cpassmsg;
	pass = document.getElementById("pass");
	cpass = document.getElementById("cpass");
	cpassmsg = document.getElementById("cpassmsg");
	
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


//이름
function textCheck_name(obj){
	let namemsg = document.querySelector("#namemsg");
//	let str = obj.value;
//	let check = /^[ㄱ-ㅎ가-힣a-zA-Z]+$/;

	if(obj.value ==""){
		namemsg.innerHTML = "이름을 입력해주세요.";
		namemsg.style.color = "red";
		return false;
//	}else if(!check.test(str)){
//		namemsg.innerHTML = "한글 또는 영문을 사용하세요.";
//		namemsg.style.color = "red";
	}else{
		namemsg.innerHTML = "";
	}
}

function nickchecksave(obj){
	let check_save1 = document.getElementById("check_save1");
	check_save1.value = obj.value;
}
//닉네임
function textCheck_nick(obj){
	let nickmsg = document.querySelector("#nickmsg");
	let check_save1 = document.getElementById("check_save1");
	let check_save2 = document.getElementById("check_save2");
	
	let str = obj.value;
	
	check_save2.value = obj.value;
	
	if(obj.value ==""){
		nickmsg.innerHTML = "닉네임을 입력해주세요.";
		nickmsg.style.color = "red";
		return false;
//	}else if(!check.test(str)){
//		nickmsg.innerHTML = "영문과 숫자를 사용하세요.";
//		nickmsg.style.color = "red";
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
	let check_save1 = document.getElementById("check_save1");
	check_save1.value = obj.value;
}

function textCheck_hp(obj){
	let hp1,hp2,hp3;
	let hpmsg = document.querySelector("#hpmsg");
	let check_save1 = document.getElementById("check_save1");
	let check_save2 = document.getElementById("check_save2");
	
	check_save2.value = obj.value;
	
	hp1 = document.getElementById("hp1");
	hp2 = document.getElementById("hp2");
	hp3 = document.getElementById("hp3");
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
	let emailmsg = document.querySelector("#emailmsg");
	
	email1 = document.getElementById("email1");
	email2 = document.getElementById("email2");
	email3 = document.getElementById("email3");
	
	let str1 = email1.value;
	let str2 = email2.value;
	//var check = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$/;
	//var check = /^[a-zA-Z\d]+$/;
	
	//let check1 = /^(?=.*[ㄱ-ㅎ가-힣])[ㄱ-ㅎ가-힣]+$/;
	var check1 = /^[^ㄱ-ㅎ가-힣]+$/;
	let check2 = /^(?=.*[a-zA-Z])(?=.*[.])[a-zA-Z\.]+$/;
	//let check2 = /^(?=.*[a-zA-Z])(?=.*[.])(?=.*\s)[a-zA-Z\.\s+]*$/;
//	let check2 = /^[A-Za-z\.\s+]*$/;
	
	
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


//	if(email1.value == ""){
//		emailmsg.innerHTML = "aa이메일을 입력해주세요.";
//		emailmsg.style.color = "red";
//		return false;
////	}else if(!check.test(str1)){
////		emailmsg.innerHTML = "이메일 형식을 확인해주세요.";   //영문,숫자 모두 사용하여 조합
////		emailmsg.style.color = "red";
////		}else if(!check2.test(str2)){
////			emailmsg.innerHTML = "이메일 형식을 확인해주세요.";
////			emailmsg.style.color = "red";
//		}else if(email1.value !== "" && (email2.value !== "" || email3.value == "naver.com")){
//			emailmsg.innerHTML = "";
//		}
//	}


//답변
function textCheck_answer(obj){
	let answermsg = document.querySelector("#answermsg");
	if(obj.value ==""){
		answermsg.innerHTML = "답변을 입력해주세요.";
		answermsg.style.color = "red";
		return false;
	}else{
		answermsg.innerHTML = "";
	}
}



	function joinFormCheck(){
		let id,pass,cpass,name,nick,hp1,hp2,hp3,email1,email2,question,answer;
		
		
		let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		let check2 = /^(?=.*[a-zA-Z])(?=.*[.])[a-zA-Z\.]+$/;
		var check3 = /^[^ㄱ-ㅎ가-힣]+$/;
		
		id = document.getElementById("id");
		pass = document.getElementById("pass");
		cpass = document.getElementById("cpass");
		name = document.getElementById("name");
		nick = document.getElementById("nick");
		hp1 = document.getElementById("hp1");
		hp2 = document.getElementById("hp2");
		hp3 = document.getElementById("hp3");
		email1 = document.getElementById("email1");
		email2 = document.getElementById("email2");
		question = document.getElementById("question");
		answer = document.getElementById("answer");
		let idcheckcnt = document.getElementById("idcheckcnt");
		let nickcheckcnt = document.getElementById("nickcheckcnt");
		let hpcheckcnt = document.getElementById("hpcheckcnt");
		
		if(id.value == ""){
			alert("회원ID를 입력해주세요.");
			   id.focus();
			return false;
		}else if(pass.value == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if(!check.test(pass.value)){
			alert("8~16자 영문, 숫자, 특수문자를 사용하세요.");
			return false;		
		}else if(cpass.value == ""){
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		}else if(pass.value !== cpass.value){
			alert("비밀번호가 다릅니다.");
			return false
		}else if(name.value == ""){
			alert("이름을 입력해주세요.");
			return false;
		}else if(nick.value == ""){
			alert("닉네임을 입력해주세요.");
			return false;
		}else if(checkCount("gender") == 0){
			alert("성별을 선택해주세요.");
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
		}else if(question.value == "choice"){
			alert("질문을 선택해주세요.");
			return false;
		}else if(answer.value == ""){
			alert("답변을 입력해주세요.");
			return false;
		}else if(idcheckcnt.value == 0 ){
		    alert("아이디 중복체크를 해주세요");
		    return false;
	    }else if(nickcheckcnt.value == 0){
		    alert("닉네임 중복체크를 해주세요");
		    return false;
	    }else if(hpcheckcnt.value == 0){
		    alert("전화번호 중복체크를 해주세요");
		    return false;
		}else{
			joinForm.submit();
		}
		
	}
	
	/********************
		회원가입 - 성별, 통신사 체크확인
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
		회원가입 - 이메일 주소
	 ********************/
	function emailCheck(){
		let email1, email2,email3;
		email1 = document.getElementById("email1")
		email2 = document.getElementById("email2");
		email3 = document.getElementById("email3");
		let emailmsg = document.querySelector("#emailmsg");
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
	
//	function textCheck_pass_reset(obj){
//		let new_passmsg1 = document.querySelector("#new_passmsg1");
//		
//		var str = obj.value;
//		if(obj.value ==""){
//			new_passmsg1.innerHTML = "신규 비밀번호를 입력해주세요.";
//			new_passmsg1.style.color = "red";
//			return false;
//		}else if(str.length <8 || str.length >16){
//			new_passmsg1.innerHTML = "8~16글자 사이로 입력해주세요.";
//			new_passmsg1.style.color = "red";
//			return false;
//		}else{
//			new_passmsg1.innerHTML = "&nbsp;";
//		}
//	}
	function textCheck_pass_reset(obj){
		let new_passmsg1 = document.querySelector("#new_passmsg1");
		
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
	new_pass1 = document.getElementById("new_pass1");
	new_pass2 = document.getElementById("new_pass2");
	new_passmsg2 = document.getElementById("new_passmsg2");

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

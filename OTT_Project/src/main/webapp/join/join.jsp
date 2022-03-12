<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.ott.dao.MemberDao,com.ott.vo.MemberVO, java.util.ArrayList"
    %>
    	<%
		MemberDao dao = new MemberDao();
		ArrayList<MemberVO> id_list = dao.idselect();
		ArrayList<MemberVO> dropid_list = dao.dropidselect();
		ArrayList<MemberVO> nick_list = dao.nickselect();
		ArrayList<MemberVO> hp_list = dao.hpselect();
		
		StringBuffer id_values = new StringBuffer();
		for(int i=0; i<id_list.size(); i++) {
			if(id_values.length()>0) {
				id_values.append(',');
			}
			id_values.append('"').append(id_list.get(i).getId()).append('"');
		}
		
		StringBuffer dropid_values = new StringBuffer();
		for(int i=0; i<dropid_list.size(); i++) {
			if(dropid_values.length()>0) {
				dropid_values.append(',');
			}
			dropid_values.append('"').append(dropid_list.get(i).getDropid()).append('"');
		}
		
		StringBuffer nick_values = new StringBuffer();
		for(int i=0; i<nick_list.size(); i++) {
			if(nick_values.length()>0) {
				nick_values.append(',');
			}
			nick_values.append('"').append(nick_list.get(i).getNick()).append('"');
		}
		
		StringBuffer hp_values = new StringBuffer();
		for(int i=0; i<hp_list.size(); i++) {
			if(hp_values.length()>0) {
				hp_values.append(',');
			}
			hp_values.append('"').append(hp_list.get(i).getHp1()).append('"');
		}
		
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/css/join_login.css" rel="stylesheet">
<script src="http://localhost:9000/OTT_Project/js/join_login.js"></script>
<script type="text/javascript">

function id_overlap_check(){
    let id = document.getElementById("id").value;
    var idcheckcnt = document.getElementById("idcheckcnt");
    var idmsg = document.querySelector("#idmsg");
	const check = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
    
    var flag = true;
    var list = [ <%=id_values.toString()%>];
    var droplist = [ <%=dropid_values.toString()%>];
    //아이디 입력 여부
    if(id=="") {
       alert("아이디를 입력해주세요.");
       return ;
    }
    for(var i=0; i<list.length; i++) {
    	if(id==list[i]){
    	   flag = false;
    	   break;
    	}	
    }
    for(var i=0; i<droplist.length; i++) {
    	if(id==droplist[i]){
    	   flag = false;
    	   break;
    	}	
    }
   

     if(!check.test(id)){ /*정규식에 위반하면 */
   	 	idcheckcnt.value = 0;
   	 	alert("6~12자 영문, 숫자를 사용하세요.");
     }else if(flag == false){
        idcheckcnt.value = 0;
        alert("중복된 아이디 입니다.");
     }else if(flag == true){
         idcheckcnt.value = 1;
         alert("사용 가능한 아이디 입니다.");
         idmsg.innerHTML = "";
     }
 }
 
 
 function nick_overlap_check(){
    var nick = document.getElementById("nick").value;
    var flag = true;
    var list = [ <%=nick_values.toString()%>];
    var nickcheckcnt = document.getElementById("nickcheckcnt");
    var nickmsg = document.querySelector("#nickmsg");
    
    //닉네임 입력 여부
    if(nick=="") {
       alert("닉네임을 입력해주세요.");
       return ;
    }
    for(var i=0; i<list.length; i++) {
       if(nick==list[i]){
          flag = false;
          break;
       }
    }
     if(flag){
        nickcheckcnt.value = 1;
        alert("사용가능한 닉네임 입니다.");
        nickmsg.innerHTML = "";
     }
    else{
       nickcheckcnt.value = 0;
       
       alert("중복된 닉네임입니다.");
       
    }
 }
 
 function hp_overlap_check(){
    var hp1 = document.getElementById("hp1").value;
    var hp2 = document.getElementById("hp2").value;
    var hp3 = document.getElementById("hp3").value;
    var hp;
    hp = hp1 + "-" + hp2 + "-" + hp3;
    var hpcheckcnt = document.getElementById("hpcheckcnt");
    const check1 = /^(?=.*\d)[\d]{3,3}$/;
    const check2 = /^(?=.*\d)[\d]{3,4}$/;
	const check3 = /^(?=.*\d)[\d]{4,4}$/;
	var hpmsg = document.querySelector("#hpmsg");
	
    var flag = true;
    var list = [ <%=hp_values.toString()%>];
    //닉네임 입력 여부
    if(hp1=="" ||hp2=="" ||hp3=="") {
       alert("전화번호를 입력해주세요.");
       return ;
    }else if(!check1.test(hp1)){
    	hpcheckcnt.value = 0;
        alert("전화번호 앞자리는 3자리의 숫자를 사용하세요.");
        return ;
	}else if(!check2.test(hp2)){
		hpcheckcnt.value = 0;
        alert("전화번호 중간자리는 3~4자리의 숫자를 사용하세요.");
        return ;
	}else if(!check3.test(hp3)){
		hpcheckcnt.value = 0;
        alert("전화번호 끝자리는 4자리의 숫자를 사용하세요.");
        return ;
	}
    
    for(var i=0; i<list.length; i++) {
       if(hp==list[i]){
          flag = false;
          break;
       }
    }
    
    if(flag==true){
        hpcheckcnt.value = 1;
        alert("사용가능한 전화번호입니다.");
        hpmsg.innerHTML = "";
    }else if(flag==false){
       hpcheckcnt.value = 0;
       alert("중복된 전화번호 입니다.");
       
    }
 }

</script>

</head>
<body>
	<input type="hidden" id="idcheckcnt" name ="idcheckcnt" value=0>
    <input type="hidden" id="nickcheckcnt" name ="nickcheckcnt" value=0>
    <input type="hidden" id="hpcheckcnt" name ="hpcheckcnt" value=0>
    <input type="hidden" id="check_save1" name ="check_save1" value="">
    <input type="hidden" id="check_save2" name ="check_save2" value="">
	<!-- header start -->
	<iframe src="http://localhost:9000/OTT_Project/header.jsp"  scrolling="no" frameborder="0" width="100%" height="150px"></iframe>
	<div class="content">
      <section class="join">
         <h1>회원가입</h1>
         <form name="joinForm" action="join_proc.jsp" method="post">
            <ul>
	         <li>
	            <label>*회원ID</label>
	            <input type="text" name="id" class="input1" id="id" placeholder="6~12자의 영문,숫자 조합" onblur="textCheck_id(this)" onfocus ="idchecksave(this)"
	            autocomplete="off">
	         	 <button type="button" class="btn_style1" onclick="id_overlap_check()">중복확인</button>
	         	<div id="idmsg"></div>
	         </li>
	         <li>
	            <label>*비밀번호</label>
	            <input type="password" name="pass" class="input1" id="pass" placeholder="8~16자의 영문,숫자,특수문자 조합" onblur="textCheck_pass(this)"
	            autocomplete="off">
	        	<div id="passmsg"></div>
	         </li>
	         <li>
	            <label>*비밀번호 확인</label>
	            <input type="password" name="cpass" class="input1" id="cpass" onblur="cpassCheck()" autocomplete="off">
	            <span id="cpassmsg"></span>
	         </li>
	         <li>
	            <label>*이름</label>
	            <input type="text" name="name" class="input1" id="name" onblur="textCheck_name(this)" autocomplete="off">
	         	<div id="namemsg"></div>
	         </li>
	         <li>
	            <label>*닉네임</label>
	            <input type="text" name="nick" class="input1" id="nick" onblur="textCheck_nick(this)" onfocus = "nickchecksave(this)"
	            autocomplete="off">
	             <button type="button" class="btn_style1" onclick="nick_overlap_check()">중복확인</button>
	         	<div id="nickmsg"></div>
	         </li>
	         <li>
	            <label>*성별</label>
	            <div class="input2">
		            <input type="radio" name="gender" value="m" checked="checked"> 남자
		            <input type="radio" name="gender" value="f"> 여자
	            </div>
	         </li>
	         <li>
	            <label class="no_margin_bottom">*전화번호</label>
	            <div class="input3">
	               <input type="radio" name="tel" value="skt" checked="checked"> SKT <!-- checked="checked" radio버튼 디폴트설정 -->
	               <input type="radio" name="tel" value="kt"> KT
	               <input type="radio" name="tel" value="lgU+"> LGU+
	            </div>
	         </li>
	         <li  class="tel_space">
	         		<span>
	                	<input type="text" name="hp1" class="hp" id="hp1" onblur="textCheck_hp(this)" onfocus="hpchecksave(this)" autocomplete="off">
	               		- <input type="text" name="hp2" class="hp" id="hp2" onblur="textCheck_hp(this)" onfocus="hpchecksave(this)" autocomplete="off">
	               		- <input type="text" name="hp3" class="hp" id="hp3" onblur="textCheck_hp(this)" onfocus="hpchecksave(this)" autocomplete="off">
	            	</span>
	            	<button type="button" class="btn_style1" onclick="hp_overlap_check()">중복확인</button>
	            		<div id="hpmsg"></div>
	         </li>
	         <li>
	            <label>*이메일</label>
	            <input type="text" name="email1" class="email" id="email1" onblur="textCheck_email(this)" autocomplete="off"> @
	            <input type="text" name="email2" class="email" id="email2" onblur="textCheck_email(this)" autocomplete="off">
	            <select class="email2" id="email3" onchange="emailCheck()" onblur="textCheck_email(this)" >
	               <option value="self">직접입력</option>
	               <option value="naver.com">네이버</option>
	               <option value="gmail.com">구글</option>
	               <option value="daum.net">다음</option>
	               
	            </select>
	            <div id="emailmsg"></div>
	         </li>
	         <li>
	            <label class="margin_bottom">*질문</label>
	            <select class="question" name="question" id="question" onchange="Check()">
	               <option value="choice">질문선택</option>
	               <option value="question1">어릴 적 남들에게 알리지 않은 별명은?</option>
	               <option value="question2">졸업한 초등학교 이름은?</option>
	               <option value="question3">어머니의 성함은?</option>
	               <option value="question4">아버지의 성함은?</option>
	               <option value="question5">어릴 적 가장 친했던 친구 이름은?</option>
	            </select>
	         </li>
	         <li>
	            <input type="text" name="answer" class="answer" id="answer" onblur="textCheck_answer(this)"autocomplete="off">
	            <div id="answermsg"></div>
	         </li>
	         <li>

	            <button type="button" class="btn_join" onclick="joinFormCheck()">회원가입</button>

	         </li>
    	  </ul>   
         </form>
      </section>      
   </div>

</body>
</html>
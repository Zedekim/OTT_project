<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.ott.vo.MemberVO, com.ott.dao.MemberDao, java.util.ArrayList" %>
<%
    MemberDao dao = new MemberDao();

    String sid = (String)session.getAttribute("sid");
    MemberVO vo= dao.myInfoSelect(sid);
    
    /**********update(feat.join.jsp)**********/
    ArrayList<MemberVO> nick_list = dao.nickselect(sid);
    ArrayList<MemberVO> hp_list = dao.hpselect(sid);

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
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/mypage/mypage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://localhost:9000/OTT_Project/js/mypage.js"></script>
<script type="text/javascript">
 function nick_overlap_check(){
    var nick = document.getElementById("update_nick").value;
    var flag = true;
    var list = [ <%=nick_values.toString()%>];
    var nickcheckcnt = document.getElementById("update_nickcheckcnt");
    var nickmsg = document.querySelector("#update_nickmsg");
    
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
    var hp1 = document.getElementById("update_hp1").value;
    var hp2 = document.getElementById("update_hp2").value;
    var hp3 = document.getElementById("update_hp3").value;
    var hp;
    hp = hp1 + "-" + hp2 + "-" + hp3;
    var hpcheckcnt = document.getElementById("update_hpcheckcnt");
    const check1 = /^(?=.*\d)[\d]{3,3}$/;
    const check2 = /^(?=.*\d)[\d]{3,4}$/;
    const check3 = /^(?=.*\d)[\d]{4,4}$/;
    var hpmsg = document.querySelector("#update_hpmsg");
    
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
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
       <iframe class="menulist" src="mypage_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
	   
	   <input type="hidden" id="update_idcheckcnt" name ="idcheckcnt" value=0>
	    <input type="hidden" id="update_nickcheckcnt" name ="nickcheckcnt" value=0>
	    <input type="hidden" id="update_hpcheckcnt" name ="hpcheckcnt" value=0>
	    <input type="hidden" id="update_check_save1" name ="check_save1" value="">
	    <input type="hidden" id="update_check_save2" name ="check_save2" value="">
	   <form name="member_info_update" action="http://localhost:9000/OTT_Project/mypage/mypage_info_update_proc.jsp" method="post" id="member_info_update">
	    
	       <div class="mypage_content">
	       <h1>사용자 정보</h1>
	       <p>수정 필요 시 하단의 수정버튼을 눌러주세요.</p>
	           <ul>
	             <li>
	                <label>회원ID</label>
	                <input type="text" name="id" class="update_input1 input1" id="update_id" onblur="textCheck_id(this)" value=<%=vo.getId() %>>
	             </li>
	             <li>
	                <label>이름</label>
	                <input type="text" name="name" class="update_input1 input1" id="update_name" onblur="textCheck_name(this)" autocomplete="off" value=<%=vo.getName() %>>
	                <div id="update_namemsg"></div>
	             </li>
	             <li>
	                <label>닉네임</label>
	                <input type="text" name="nick" class="update_input1 input1" id="update_nick" onblur="textCheck_nick(this)" onfocus = "nickchecksave(this)"
	                       autocomplete="off" value=<%=vo.getNick() %>>
	                <button type="button" class="btn_style1" id="btn_check1" onclick="nick_overlap_check()">중복확인</button>
	                <div id="update_nickmsg"></div>
	             </li>
	             <li>
	                <label class="no_margin_bottom">전화번호</label>
	                <div class="input3">
	                   <input type="hidden" id="myTel" value=<%=vo.getTel() %>>
	                   <input type="radio" name="tel" value="skt" > SKT <!-- checked="checked" radio버튼 디폴트설정 -->
	                   <input type="radio" name="tel" value="kt"> KT
	                   <input type="radio" name="tel" value="lgU+"> LGU+
	                </div>
	             </li>
	             <li  class="tel_space">
	                    <span>
	                        <input type="text" name="hp1" class="hp" id="update_hp1" onblur="textCheck_hp(this)"  onfocus="hpchecksave(this)" autocomplete="off" value=<%=vo.getHp1() %>>
	                        - <input type="text" name="hp2" class="hp" id="update_hp2" onblur="textCheck_hp(this)" onfocus="hpchecksave(this)" autocomplete="off" value=<%=vo.getHp2() %>>
	                        - <input type="text" name="hp3" class="hp" id="update_hp3" onblur="textCheck_hp(this)" onfocus="hpchecksave(this)" autocomplete="off" value=<%=vo.getHp3() %>>
	                    </span>
	                    <button type="button" class="btn_style1" id="btn_check2" onclick="hp_overlap_check()" >중복확인</button>
	                        <div id="update_hpmsg"></div>
	             </li>
	             <li>
	                <label>이메일</label>
	                <input type="text" name="email1" class="email update_input1" id="update_email1" onblur="textCheck_email(this)" autocomplete="off" value=<%=vo.getEmail1() %>> @
	                <input type="text" name="email2" class="email update_input1" id="update_email2" onblur="textCheck_email(this)" autocomplete="off" value=<%=vo.getEmail2() %>>
	                <select class="email2" id="update_email3"  onchange="emailCheck()" onblur="textCheck_email(this)">
	                   <option value="choice">선택</option>
	                   <option value="naver.com">네이버</option>
	                   <option value="gmail.com">구글</option>
	                   <option value="daum.net">다음</option>
	                   <option value="self" selected>직접입력</option>
	                </select>
	                <div id="update_emailmsg"></div>
	             </li>
	             <li>
	                <div class="button_list">
	                  <button type="button" class="btn_style4" id="btn_update1" onclick="inputUnlock()">수  정</button>
	                  <button type="button" class="btn_style4" id="btn_update2" onclick="updateFormCheck()">수정완료</button>
	                  <button type="button" class="btn_style4" id="btn_cancel" onclick="location.href='http://localhost:9000/OTT_Project/mypage/mypage_info.jsp'">취  소</button>
	                </div>
	             </li>
	          </ul>   
	       </div>
	   </form>
	</div>
</body>
</html>
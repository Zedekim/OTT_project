<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/mypage/mypage.css" rel="stylesheet">
<script>
function inputlock(){
	let input_list=document.getElementsByClassName("input_script");
    for(let i=0; i<input_list.length; i++){
        input_list[i].disabled=true;
    };
	document.getElementById("btn_update2").style="display: none;"
	document.getElementById("btn_update1").style="display: inline-block;"
	document.getElementById("btn_cancel").style="display: none;"
}
function inputUnlock(){
	let input_list=document.getElementsByClassName("input_script");
	for(let i=0; i<input_list.length; i++){
		input_list[i].disabled=false;
	};
	document.getElementById("update_id").disabled=true;
    document.getElementById("btn_update1").style="display: none;"
    document.getElementById("btn_update2").style="display: inline-block;"
    	document.getElementById("btn_cancel").style="display: inline-block;"
}
</script>

</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
       <iframe class="menulist" src="http://localhost:9000/OTT_Project/adminpage/admin_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
	   <form name="member_info_update" action="#" method="get">
	       <div class="mypage_content">
	       <h1>사용자 정보</h1>
	       <p>수정 필요 시 하단의 수정버튼을 눌러주세요.</p>
			   <ul>
			       <li class="li_style1">
				       <label class="label_style1">이름</label>
				       <input type="text" name="update_name" class="input_style1 input_script" disabled>
			       </li>
			       <li class="li_style1">
	                   <label class="label_style1">회원 ID</label>
	                   <input type="text" name="update_id" value="aaa" class="input_style1 input_script"" id="update_id" disabled>
	               </li>
	               <li class="li_style1">
	                   <label class="label_style1">닉네임</label>
	                   <input type="text" name="update_nickname" class="input_style1 input_script"" disabled>
	               </li>
	               <li class="li_style1">
	                   <label class="label_style1">전화번호</label>
	                   <input type="text" name="update_hp" class="input_style1 input_script"" disabled>
	               </li>
	               <li class="li_style1">
	                   <label class="label_style1">이메일</label>
	                   <input type="text" name="update_email" class="input_style1 input_script"" disabled>
	               </li>
			   </ul>
			   <div class="button_list">
			     <button type="button" class="btn_style1" id="btn_update1" onclick="inputUnlock()">수  정</button>
			     <button type="button" class="btn_style1" id="btn_update2" onclick="inputlock()">수정완료</button>
			     <a href="http://localhost:9000/OTT_Project/adminpage/adminpage_info.jsp">
			         <button type="button" class="btn_style1" id="btn_cancel">취  소</button>
			     </a>
			   </div>
	       </div>
	   </form>
	</div>
</body>
</html>
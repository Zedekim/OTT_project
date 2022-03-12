<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/mypage/mypage.css" rel="stylesheet">
<script src="http://localhost:9000/OTT_Project/js/mypage.js"></script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
       <iframe class="menulist" src="mypage_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
	   <form name="member_pass_update" action="#" method="get">
	       <div class="mypage_content">
               <h1>비밀번호 재설정</h1>
               <p>인증되었습니다!!<br>새로운 비밀번호를 만들어 주세요.</p>
			   <ul>
			   <li class="li_style1">
                       <label class="label_style2">현재 비밀번호</label>
                   </li>
                   <li>
                       <input type="password" name="update_cpass" class="input_style2" id="update_cpass">
                   </li>
			       <li class="li_style1">
				       <label class="label_style2">신규 비밀번호</label>
			       </li>
			       <li>
				       <input type="password" name="update_pass" class="input_style2" id="update_pass">
				   </li>
			       <li class="li_style1">
	                   <label class="label_style2">신규 비밀번호 재확인</label>
	               </li>
	               <li>
	                   <input type="password" name="update_rpass" class="input_style2" id="update_rpass">
	               </li>
			   </ul>
			   <div>
			     <button type="button" class="btn_style2" id="btn_update1" onclick="password_update_form_check()">완료</button>
			   </div>
	       </div>
	   </form>
	</div>
</body>
</html>
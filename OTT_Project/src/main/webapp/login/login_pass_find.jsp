<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/css/join_login.css" rel="stylesheet">
<script src="http://localhost:9000/OTT_Project/js/join_login.js"></script>
</head>
<body>
<!-- header start -->
	<iframe src="http://localhost:9000/OTT_Project/header.jsp"  scrolling="no" frameborder="0" width="100%" height="150px"></iframe>
<div class="content">
      <section class="loginForm_pass_find">
         <h1>아이디/비밀번호 찾기</h1>
         <span class="text">1.본인인증>2.비밀번호 재설정</span>
         <form name="login_pass_findForm" action="login_pass_find_proc.jsp" method="get">
            <ul>
               <li>
               <div class="btn">
               <a href="http://localhost:9000/OTT_Project/login/login_id_find_hp.jsp" class="href_login_id_find_email">
               	<button type="button" class="btn_style_id">아이디 찾기</button>
               </a>
               <button type="button" class="btn_style_pass">비밀번호 찾기</button>
               </div>
               </li>
               <li>
                  <span class="id_email">회원님의 아이디와 회원가입 시 선택한 질문과 답을 입력해주세요.</span>
               </li>
               <li>
               	<div class="id_email2">
                  <label>*아이디</label>
                  <input type="text" name="name" class="input1" id="id">
                  </div>
               </li>
               <li>
               	<div class="id_email3">
		            <label class="margin_bottom">*질문</label>
		            <select class="input2" id="question" onchange="Check()">
		               <option value="choice">질문선택</option>
		               <option value="question1">어릴 적 남들에게 알리지 않은 별명은?</option>
		               <option value="question2">졸업한 초등학교 이름은?</option>
		               <option value="question3">어머니의 성함은?</option>
		               <option value="question4">아버지의 성함은?</option>
	              	   <option value="question5">어릴 적 가장 친했던 친구 이름은?</option>
		            </select>
		         </div>
	            </li>
	          <li>
	            <input type="text" name="answer" class="input3" id="answer">
	         </li>
               <li>
                  <button type="button" class="btn_style2" onclick="loginForm_pass_find_Check()">확인</button>
               </li>
            </ul>
         
         </form>
      </section>      
      
   </div>
</body>
</html>
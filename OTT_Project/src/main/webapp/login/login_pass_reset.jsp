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
      <section class="loginForm_pass_reset">
         <h1>비밀번호 재설정</h1>
         <div class="text1">인증되었습니다!</div>
         <div class="text2">새로운 비밀번호를 만들어주세요.</div>
         <form name="login_pass_resetForm" action="login_pass_reset_proc.jsp" method="get">
            <ul>
               <li>
                  <label class="new_pass">*현재 비밀번호</label>
               </li>
               <li>
                  <input type="text" name="name" placeholder="현재 비밀번호" class="input1" id="ppass">
               </li>
            
               <li>
                  <label class="new_pass">*신규 비밀번호</label>
               </li>
               <li>
                  <input type="text" name="name" placeholder="8~16글자 영어or숫자or특수문자" class="input1" id="new_pass1" onblur="textCheck_pass_reset(this)">
               </li>
               <li>
               	<span id="new_passmsg1">&nbsp;</span>
               </li>
               <li>
                  <label>*신규 비밀번호 확인</label>
               </li>
               <li>
                  <input type="text" name="name" class="input2" id="new_pass2" placeholder="신규 비밀번호 확인" onblur="cpassCheck2()">
               </li>
               <li>
              	<span id="new_passmsg2">&nbsp;</span>
              	</li>
               <li>
                  <button type="button" class="btn_style2" onclick="loginForm_pass_reset_Check()">완료</button>
               </li>
            </ul>
         </form>
      </section>      
   </div>
</body>
</html>
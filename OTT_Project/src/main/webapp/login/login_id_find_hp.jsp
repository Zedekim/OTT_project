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
      <section class="loginForm_id_find_hp">
         <h1>아이디/비밀번호 찾기</h1>
         <form name="login_id_find_hpForm" action="login_id_find_hp_proc.jsp" method="post">
            <ul>
               <li>
               <div class="btn">
               <button type="button" class="btn_style_id">아이디 찾기</button>
               <a href="http://localhost:9000/OTT_Project/login/login_pass_find.jsp">
               	<button type="button" class="btn_style_pass">비밀번호 찾기</button>
               </a>
               </div>
               </li>
               <li>
                  <span class="id_email">회원님의 이름과 전화번호를 입력해주세요.</span>
               </li>
               <li>
               	<div class="id_email2">
                  <label>*이름</label>
                  <input type="text" name="name" class="input1" id="name">
                  </div>
               </li>
               <li>
               	<div class="id_email3">
                  <label class="no_margin_bottom">*전화번호</label>
               		<div class="input2">
	                  <input type="radio" name="tel" value="skt"> SKT
	                  <input type="radio" name="tel" value="kt"> KT
	                  <input type="radio" name="tel" value="lgU+"> LGU+
               		</div>
               	</div>
               </li>
               <li>
               <div class="hp_tot">
	               <span>
	                  <input type="text" name="hp1" class="hp" id="hp1">
	                  <input type="text" name="hp2" class="hp" id="hp2">
	                  <input type="text" name="hp3" class="hp" id="hp3">
	               </span>
	             </div>
               </li>
               <li>
                  <button type="button" class="btn_style2" onclick="loginForm_id_find_hp_Check()">확인</button>
               </li>
            </ul>
         
         </form>
      </section>      
      
   </div>
</body>
</html>
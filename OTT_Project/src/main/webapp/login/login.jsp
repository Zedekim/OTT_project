<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%//자바코드
	//페이지로 넘어오는 데이터 받기. 무조건 String타입임
	String login_result = request.getParameter("login_result");
	String join_result = request.getParameter("join_result");//join_proc.jsp에서 넘어오는 것
//System.out.println("result--->"+result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/css/join_login.css" rel="stylesheet">
<script src="http://localhost:9000/OTT_Project/js/join_login.js"></script>
<script>
//자바스크립트에서 자바로 쓰인 문자를 사용할 때에는?? result == fail 이라고 적으면 안됨 이건 자바언어임. expression을 사용하고 ''로 묶어준다!!!
	//경고창 띄우는 것은 자바스크립트임	
	if('<%=login_result%>' == 'fail'){ 
		alert("아이디 또는 패스워드가 다릅니다. 확인 후 다시 진행해주세요");
	}
	
	/*회원가입 성공 메시지 출력*/
	if('<%=join_result%>' == 'succ'){
		alert("회원가입에 성공하셨습니다. 로그인 페이지로 이동합니다.");
	}
</script>
</head>
<body>
	<header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
	<div class="content">
      <section class="login">
         <h1>LOGIN</h1>
         <form name="loginForm" action="login_proc.jsp" method="post">
            <ul>
               <li>
                  <label>*아이디</label>
                  <input type="text" name="id" class="input1" id="id">
               </li>
               <li>
                  <label>*비밀번호</label>
                  <input type="password" name="pass" class="input1" id="pass">
               </li>
               <li>

                  <button type="button" class="btn_style" onclick="loginFormCheck()">로그인</button>

               </li>
               <li>
                  <span class="question1">-회원가입을 아직 하지 않으셨나요?</span>
                  <a href="http://localhost:9000/OTT_Project/join/join.jsp">
                  <button type="button" class="btn_style2">회원가입</button>
               	  </a>
               </li>
               <li>
                  <span class="question2">-회원 아이디/비밀번호를 잊으셨나요?</span>
                  <a href="http://localhost:9000/OTT_Project/login/login_id_find_hp.jsp">
                  <button type="button" class="btn_style3">아이디 / 비밀번호찾기</button>
               	  </a>
               </li>
            </ul>
         </form>
      </section>      
   </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.dao.MemberDao, com.ott.vo.MemberVO"%> 

<%
	String sid =(String)session.getAttribute("sid");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
 <title>header</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    a {
      text-decoration: none;
    }
    .topmenu>li a:hover,  .login>li a:hover{
        cursor:pointer;
        background:gray;
        color:white;
        font-weight:bold;
    }

    ul {
      list-style: none;
    }

    header {
      margin: 0 auto;
      width: 100%;
      background-color: whitesmoke;
    }
    li{
        height:39px;
        padding:5px;
        box-sizing: border-box;
    }

    .container {
      width: 1300px;
      height: 100px;
      background-color: whitesmoke;
      margin:auto;
    }

    .logo {
      float: left;
      width: 250px;
      height: 100px;
      line-height: 100px;
      padding-left: 40px;
    }

    .logo h1 {
      font-weight: 700;
      font-size: 50px;
      color: black;
    }

    nav {
      float: right;
      width: 900px;
      height: 100px;
      padding-top: 60px;
    }

    .topmenu {
      height: 40px;
    }

    .topmenu>li {
      float: left;
      position: relative;
    }

    .topmenu>li>a {
      font-size: 18px;
      color: black;
      font-weight: 600;
      padding: 10px 45px;
      /* height:30px; */
    }

    .login {
      height: 40px;
    }

    .login>li {
      float: right;
      position: relative;
      top: 10px;
    }

    .login>li>a {
      font-size: 14px;
      color: black;
      font-weight: 300;
      padding: 10px 10px;
    }
  </style>
</head>

<body>
    <header>
         <div class="container">
          <div class="logo">
            <a href="http://localhost:9000/OTT_Project/main.jsp" target="_parent">
                <img src="http://localhost:9000/OTT_Project/images/KakaoTalk_20220118_124228622.png">
            </a>
          </div>
          <% if(sid == null){ %>
              <nav>
                <ul class="topmenu">
                  <li><a href="http://localhost:9000/OTT_Project/board/noticeboard_list.jsp" target="_parent">공지사항</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/freeboard_list.jsp" target="_parent">자유게시판</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/starboard_list.jsp" target="_parent">평가게시판</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/questionboard_list.jsp" target="_parent">고객센터</a></li>
                </ul>
	            <ul class="login">
	             <li><a href="http://localhost:9000/OTT_Project/login/login.jsp" target="_parent">로그인</a></li> 
	               <li><a href="http://localhost:9000/OTT_Project/join/join.jsp" target="_parent">회원가입</a></li>  
	            </ul>
              </nav>
              <% }else if(sid.equals("admin1")||sid.equals("admin")){ %>
             <nav>
                <ul class="topmenu">
                 
                  <li><a href="http://localhost:9000/OTT_Project/board/noticeboard_list.jsp" target="_parent">공지사항</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/freeboard_list.jsp" target="_parent">자유게시판</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/starboard_list.jsp" target="_parent">평가게시판</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/questionboard_list.jsp" target="_parent">고객센터</a></li>
                </ul>
	            <ul class="login">
	            <!-- <li><a href="http://localhost:9000/OTT_Project/login/login.jsp" target="_parent">로그인</a></li> -->
	            <!-- <li><a href="http://localhost:9000/OTT_Project/join/join.jsp" target="_parent">회원가입</a></li> -->
	            <li><a href="#"><%= sid %>님!!</a></li>
	            <li><a href="http://localhost:9000/OTT_Project/login/logout.jsp" target="_parent">로그아웃</a></li>
	            <li><a href="http://localhost:9000/OTT_Project/mypage/mypage_info.jsp" target="_parent">마이페이지</a></li>
	           	<li><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_freeboard_list.jsp" target="_parent">관리자페이지</a></li>
				
	           	</ul>
	           	</nav> 
				 <% }else{ %>
	           	<nav>
                <ul class="topmenu">
                  <li><a href="http://localhost:9000/OTT_Project/board/noticeboard_list.jsp" target="_parent">공지사항</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/freeboard_list.jsp" target="_parent">자유게시판</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/starboard_list.jsp" target="_parent">평가게시판</a></li>
                  <li><a href="http://localhost:9000/OTT_Project/board/questionboard_list.jsp" target="_parent">고객센터</a></li>
                </ul>
	            <ul class="login">
	            <li><a href="#"><%= sid %>님!!</a></li>
	           	<li><a href="http://localhost:9000/OTT_Project/login/logout.jsp" target="_parent">로그아웃</a></li>
	           	<li><a href="http://localhost:9000/OTT_Project/mypage/mypage_info.jsp" target="_parent">마이페이지</a></li>
	            </ul>
              </nav>
              <% } %>
        </div>
    </header>
</body>
</html>
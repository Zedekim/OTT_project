<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/mypage/mypage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://localhost:9000/OTT_Project/js/mypage.js"></script>
<style>
	section.login{
		/* width:1000px;
		margin:auto;
		height:1000px; */
		height:100%;
		
	}
	section.login div.delete_account {
	    width: 800px;
	    height: 600px;
	    float: left;
	    text-align: center;
	    padding: 50px 0px;
	    margin: auto;
	    box-sizing: border-box
	}
	section.login h1 {
		/*text-align:center;*/
		font-size:25px;
		/*
		border-left: 13px solid #333; 
		border-bottom:1px solid #333;
		width:23%; /*border bottom 占쏙옙占쏙옙*/
		*/
		padding:3px 0 5px 20px;
		margin:60px 150px 60px 250px;
	}
	form[name="delete_accountForm"] ul {
		text-align:center;
		list-style-type:none;
		font-size:12pt;
		/*border:1px solid red;*/
		margin:0; padding:0;
	}
	form[name="delete_accountForm"] ul li label {
		background:white;
		width:100px;
		display:inline-block;
		text-align:left;
		padding:8px 0 8px 20px;
		border-radius:5px;	
		margin-right:10px;
		margin-bottom:20px;
		font-weight:bold;
		font-size:10pt;
		color:gray;
		box-sizing:border-box;
	}
	form[name="delete_accountForm"] ul li  { 
		/*border:1px solid blue;*/
	}	
	form[name="delete_accountForm"] ul li:nth-child(4){ 
		margin-top:40px;
	}
	form[name="delete_accountForm"] ul li:last-child {
		margin-top:5px;
	}
	form[name="delete_accountForm"] ul li input.input1 {
		width:260px;
		height:33px;
		padding:8px 10px;
		border-radius:4px;
		border:1px solid #ddd;
		font-size:9pt;
		box-sizing:border-box;
	}
	form[name="delete_accountForm"] ul li button.btn_style{
		text-align:center;
		padding:5px 103px;
		/*background:black;*/
		background:rgb(60,119,224);
		
		color:white;
		font-size:12pt;
		border-radius:5px;
		margin-left:112px;
		margin-top:25px;
		border:1px solid white;
		cursor:pointer;
		width:260px;
		height:33px;
		box-sizing:border-box;
	}
	form[name="delete_accountForm"] ul li button.btn_style2{
		/*
		padding:5px 50px;
		margin-left:7px;
		background:rgb(52,152,219);
		color:white;
		font-size:6pt;
		border-radius:5px;
		border:1px solid white;
		margin-left:20px;
		font-size:9pt;
		*/
		
		width:160px;
		padding:5px 0;
		color:rgb(60,119,224);
		font-size:6pt;
		border-radius:5px;
		border:1px solid rgb(60,119,224);
		background:white;
		font-size:9pt;
		cursor:pointer;
	}
	form[name="delete_accountForm"] ul li button.btn_style2:hover{
		width:160px;
		padding:5px 0;
		color:white;
		font-size:6pt;
		border-radius:5px;
		border:1px solid white;
		background:rgb(60,119,224);
		font-size:9pt;
		cursor:pointer;
	}
	form[name="delete_accountForm"] ul li button.btn_style3{
		/*
		padding:5px 22px;
		margin-left:7px;
		background:rgb(52,152,219);
		color:white;
		font-size:7pt;
		border-radius:5px;
		border:1px solid white;
		margin-left:9px;
		font-size:9pt;
		*/
		width:160px;
		padding:5px 0;
		color:rgb(60,119,224);
		font-size:6pt;
		border-radius:5px;
		border:1px solid rgb(60,119,224);
		background:white;
		font-size:9pt;
		cursor:pointer;
	}
	form[name="delete_accountForm"] ul li button.btn_style3:hover{
		width:160px;
		padding:5px 0;
		color:white;
		font-size:6pt;
		border-radius:5px;
		border:1px solid white;
		background:rgb(60,119,224);
		font-size:9pt;
		cursor:pointer;
	}
	form[name="delete_accountForm"] ul li span{
	   display:inline-block;
	   font-size:8pt;
	   text-align:left;
	   width:190px;
	   margin-right:5px
	}
</style>
<script>
function deleteFormCheck(){
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
		//아이디비밀번호체크
		
		///////////
		if(confirm("회원탈퇴 시 모든 정보가 삭제되며 복구되지 않습니다.\n정말 탈퇴하시겠습니까?")){
			//삭제
			delete_accountForm.submit();
			
		}else{
			//삭제x
			history.back();
		}
	}	
}
</script>
</head>
<body>
<header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
	<div class="content">
      <section class="login">
       <iframe class="menulist" src="http://localhost:9000/OTT_Project/mypage/mypage_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        
        
        <div class="delete_account">
         <h1>개인정보확인</h1>
         <form name="delete_accountForm" action="delete_account_proc.jsp" method="post">
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
                  <button type="button" class="btn_style" onclick="deleteFormCheck()">확인</button>
               </li>
            </ul>
         </form>
        </div>
         
         
      </section>      
   </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    section.delete_account{
        width:1000px;
        margin:auto;
        height:1000px;
        
    }
    section.delete_account h1 + form{
        width:70%;
        margin:auto;
    }
    section.delete_account h1{
        /*text-align:center;*/
        font-size:30px;
        
        border-left: 13px solid #333; 
        border-bottom:1px solid #333;
        width:23%; /*border bottom 占쏙옙占쏙옙*/
        padding:3px 0 5px 20px;
        margin:60px 0 30px 330px;
    }
    section.delete_account h3{
        text-align:center;
        margin-left:-70px;
    }
    form[name="delete_account_fianlForm"] ul {
        /*text-align:center;*/
        list-style-type:none;
        font-size:12pt;
        /*border:1px solid red;*/
        margin-left:305px;
    }
    form[name="delete_account_fianlForm"] ul label{
        float:left;
    }
    form[name="delete_account_fianlForm"] ul li:nth-child(7) textarea {
    
        border-radius:6px;
        border:1px solid gray;
    }
    
    form[name="delete_account_fianlForm"] ul li:last-child {
        margin-left:110px;
    }
    form[name="delete_account_fianlForm"] ul li:last-child button {
                padding:7px 23px;
        margin-left:-10px;
        /*background:rgb(52,152,219);*/
        background:rgb(60,119,224);
        color:white;
        font-size:9pt;
        border-radius:5px;
        border:1px solid white;
        cursor:pointer;
    }
    
</style>
<script>
    function checkCount(pname){
        let list,count;
        
        list = document.getElementsByName(pname);
        count = 0;
        
        for(let i=0;i<list.length;i++){
            if(list[i].checked){
                count++;
            }
        }
        return count;
    }

    
    function delete_account_finalCheck(){
        let reason1,reason2,reason3,reason4,reason5,reason6,reason7;
        
        reason1 = document.getElementById("reason1");
        reason2 = document.getElementById("reason2");
        reason3 = document.getElementById("reason3");
        reason4 = document.getElementById("reason4");
        reason5 = document.getElementById("reason5");
        reason6 = document.getElementById("reason6");
        reason7 = document.getElementById("reason7");
        
        if(checkCount("reason") == 0){
            alert("탈퇴 사유를 선택해주세요.");
            return false;
        }else{
            <%
                session.invalidate();       
             %>
            location.href="http://localhost:9000/OTT_Project/main.jsp";
        }
        
    }
</script>
</head>
<body>
 <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
      <section class="delete_account"> 
         <h1>회원탈퇴 페이지</h1>
         <h3>탈퇴 사유를 선택해주세요.</h3>
         <form name="delete_account_fianlForm" action="#" method="post">
            <ul>
               <li>
                <input type="radio" name="reason" id="reason1" value="reason1"> 유사한 타사이트 이용
               </li>
               <li>
                <input type="radio" name="reason" id="reason2" value="reason2"> 속도가 느림
               </li>
               <li> 
                <input type="radio" name="reason" id="reason3" value="reason3"> 찾고자 하는 내용이 없음
               </li>
               <li>
                <input type="radio" name="reason" id="reason4" value="reason4"> 자주 이용하지 않음
               </li>
               <li> 
                <input type="radio" name="reason" id="reason5" value="reason5"> 개인정보 변경으로 인한 재가입
               </li>
               <li> 
                <input type="radio" name="reason" id="reason6" value="reason6"> 기타
               </li>
               <li>
                <textarea rows="7" cols="35" placeholder="*300자 이내로 입력해주세요." name="reason" id="reason7"></textarea>
               </li>
                <li>
                    
                   <button type="button" class="btn_style" onclick="delete_account_finalCheck()">확인</button>
                   </a>
                </li>
            </ul>
         </form>
      </section>      
   </div>
</body>
</html>
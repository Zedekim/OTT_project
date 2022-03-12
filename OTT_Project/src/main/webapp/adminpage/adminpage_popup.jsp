<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:9000/OTT_Project/js/adminpage.js"></script>

<script>
/*회원 정지 팝업-유효성 체크*/
function block_popup_formCheck(){
    let list,count, "popmsg";
    
    list = document.getElementsByName("block_period");
    count = 0;
    popmsg=document.getElementById("popmsg");
    
    for(let i=0;i<list.length;i++){
        if(list[i].checked){
            count++;
        }
    }
    
    if(count==0){
    	alert("정지기간을 선택해주세요.");
        return false;
        
    }else{
        block_period_form.submit();
    }
}
</script>
</head>
<body>
    <!-- 팝업창 -->
           <div class="popup_content"> 
             <h1 class="title">사용자 차단</h1> 
             <h3>선택한 사용자를 정지할 기간을 선택해주세요.</h3>
             <form name="block_period_form" action="adminpage_user_blcok_proc.jsp" method="get"> 
                <ul>
                    <li>
                        <input type="radio" name="block_period" value="3days"> 3일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="7days"> 7일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="1month"> 30일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="3months"> 90일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="permanent"> 영구정지
                    </li>
                    <li id="popmsg">
                    </li>
                    <li>
                        <button type="button" class="btn_style5" id="cancel" onclick="window.close()">취소</button>
                        <button type="button" class="btn_style5" id="submit" onclick="block_popup_formCheck()">보내기</button>
                    </li>
                </ul>
             </form> 
         </div> 
</body>
</html>
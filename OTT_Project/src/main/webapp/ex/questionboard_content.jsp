<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/board/board.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
     <div class="notice_content_total">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/board/cs_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        <section class="notice_content">
            <h1>문의사항 상세보기(유저 기준)</h1>
            <table border=1 class="notice_content">
                <tr>
                    <td colspan="3">회원가입에 대한 문의</td>
                </tr>
              
                <tr>
                    <td >user2</td>
                    <td>2022-01-01 19:00:24</td>
                    <td>답변완료</td>
                </tr>
                <tr>
                    <td colspan="3">회원가입이 안돼요 어케 하나요?</td>
                </tr>
               
                
                <tr>
                    <td colspan="3">
                        
                        <a href="http://localhost:9000/OTT_Project/board/questionboard_list.jsp">
                            <button type="button" class="">목록으로</button>
                        </a>
                        
                    </td>
                </tr>
                
            </table>
            
            <table class="" style="text-align: center; border: 2px solid #dddddd; height: 70px;">
	                <tr>
	                    <td class="">관리자</td>
	                    <td class=""><span>회원가입을 잘 하시면 됩니다</span></td>
	                    
	                </tr>
	            </table>
        </section>
        
        
    </div>
</body>
<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>
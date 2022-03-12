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
        <section class="notice_content">
            <h1>faq 상세보기(관리자만 수정하기, 삭제하기 보임)</h1>
            <table border=1 class="notice_content">
                <tr>
                    <td colspan="1">Q. 회원가입이 안될떄</td>
                </tr>
              
                <tr>
                    <td colspan="1">A. 다시 한번 해보세용</td>
                </tr>
               
                
                <tr>
                    <td colspan="1">
                     <a href="http://localhost:9000/OTT_Project/board/faqboard_update_delete.jsp">
                            <button type="button" class="">수정하기</button>
                        </a>
                        <a href="">
                            <button type="button" class="">삭제하기</button>
                        </a>
                        <a href="http://localhost:9000/OTT_Project/board/faqboard_list.jsp">
                            <button type="button" class="">목록으로</button>
                        </a>
                        <a href="">
                            <button type="button" class="">홈으로</button>
                        </a>
                    </td>
                </tr>
                
            </table>
        </section>
        
        
    </div>
</body>
<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>
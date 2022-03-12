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
    <div class="notice_list_total content">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/board/cs_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        <section class="notice_list">
            <h1>문의하기(유저 기준)</h1>
            <table border=1 class="notice_list">
                <!-- <thead class="table-light"> -->
             <tr>
                     <td colspan="3" >
                       <select class="select_style1" name="notice_search" id="notice_search"> 
                                <option value="total">전체</option>
                                <option value="author">내용</option>
                                <option value="title">제목</option>
                      </select>
                     <input class="input_style1" type="text"> <button class="btn_style2" type="button">검색</button>
                     
                     </td>
              </tr>
             
             
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>답변상태</th>
                </tr>
                
                <tr class="need_center">
                    <td>1</td>
                    <td>악성유저 신고 문의</td>
                    <td>답변 미완료</td>
                </tr>
                 <tr class="need_center">
                    <td>2</td>
                    <td>회원가입 문의</td>
                    <td>답변 완료</td>
                </tr>
               <tr class="need_right" >
                    <td colspan="3">
                        <a href="http://localhost:9000/OTT_Project/board/questionboard_write.jsp">
                            <button type="button" class="">글쓰기</button>
                        </a>
                        
                    </td>
               </tr>
       
            <!--  - <tr class="need_center">
                    <td colspan="5"><< 1  2  3  4  5>></td> 
                </tr>  페이징? 으로 대체--> 
                
                <!-- </thead> -->
            </table>
        </section>
        
    </div>
</body>
<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>
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
            <h1>FaQ(관리자만 글쓰기 보여짐)</h1>
            <table border=1 class="notice_list">
                <!-- <thead class="table-light"> -->
             <tr>
                     <td colspan="3" >
                       <select class="select_style1" name="notice_search" id="notice_search"> 
                                <option value="total">전체</option>
                                <option value="author">내용</option>
                                <option value="content">작성자</option>
                                <option value="title">제목</option>
                      </select>
                     <input class="input_style1" type="text"> <button class="btn_style2" type="button">검색</button>
                     
                     </td>
              </tr>
             
             
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                </tr>
                
                <tr class="need_center">
                    <td>1</td>
                    <td>회원가입이 안될때</td>
                    <td>관리자</td>
                </tr>
                 <tr class="need_center">
                    <td>2</td>
                    <td>글쓰기가 안될떄</td>
                    <td>관리자</td>
                </tr>
                 <tr class="need_center">
                    <td>3</td>
                    <td>별점주기가 안될때</td>
                    <td>관리자</td>
                </tr>
                 <tr class="need_center">
                    <td>4</td>
                    <td>회원 탈퇴가 안될때</td>
                    <td>관리자</td>
                </tr>
                 <tr class="need_center">
                    <td>5</td>
                    <td>댓글 신고가 안될때</td>
                    <td>관리자</td>
                </tr>
                 <tr class="need_center">
                    <td>6</td>
                    <td>긴급점검 공지</td>
                    <td>관리자</td>
                </tr>
               <tr class="need_right" >
                    <td colspan="3">
                        <a href="http://localhost:9000/OTT_Project/board/faqboard_write.jsp"><button type="button" class="">글쓰기</button></a>
                        
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
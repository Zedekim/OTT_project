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
    <div class="notice_list_total">
        <section class="notice_list rboard">
            <h1>디즈니 평가게시판</h1>
            <table border=1 class="notice_list rboard_list_table">
                <!-- <thead class="table-light"> -->
             <tr>
                     <td colspan="7" >
                       <select class="select_style1" name="notice_search" id="notice_search"> 
                                <option value="total">전체</option>
                                <option value="platform">플랫폼</option>
                                <option value="title">제목</option>
                                <option value="author">내용</option>
                                <option value="content">작성자</option>
	                     </select>
	                     <input class="input_style1" type="text"> <button class="btn_style2" type="button">검색</button>
                     </td>
                </tr>
                <tr>
                    <th>번호</th>
                    <th>플랫폼</th>
                    <th>평균평점</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                    <th>조회수</th>
                </tr>
                <tr class="need_center">
                    <td>1</td>
                    <td>디즈니</td>
                    <td>*****</td>
                    <td><a href="http://localhost:9000/OTT_Project/board/starboard_content.jsp">넷플리스 좋아</a></td>
                    <td>user1</td>
                    <td>2022-01-01</td>
                    <td>25</td>
                </tr>
                <tr class="need_center">
                    <td>1</td>
                    <td>디즈니</td>
                    <td>*****</td>
                    <td><a href="http://localhost:9000/OTT_Project/board/starboard_content.jsp">넷플리스 좋아</a></td>
                    <td>user1</td>
                    <td>2022-01-01</td>
                    <td>25</td>
                </tr>
                <tr class="need_center">
                    <td>1</td>
                    <td>디즈니</td>
                    <td>*****</td>
                    <td><a href="http://localhost:9000/OTT_Project/board/starboard_content.jsp">넷플리스 좋아</a></td>
                    <td>user1</td>
                    <td>2022-01-01</td>
                    <td>25</td>
                </tr>
                <tr class="need_center">
                    <td>1</td>
                    <td>디즈니</td>
                    <td>*****</td>
                    <td><a href="http://localhost:9000/OTT_Project/board/starboard_content.jsp">넷플리스 좋아</a></td>
                    <td>user1</td>
                    <td>2022-01-01</td>
                    <td>25</td>
                </tr>
               <tr class="need_right" >
                    <td colspan="7">
                        <a href="http://localhost:9000/OTT_Project/board/starboard_write.jsp">
                            <button type="button" class="">글쓰기</button>
                        </a>
                        
                    </td>
               </tr>
            </table>
             <div class="page_button_box">
                <a class ="link2" href=""><button class="page_button" type="button">&#60;&#60;</button></a>
                <a class ="link2" href=""><button class="page_button" type="button">1</button></a>
                <a class ="link2" href=""><button class="page_button" type="button">2</button></a>
                <a class ="link2" href=""><button class="page_button" type="button">3</button></a>
                <a class ="link2" href=""><button class="page_button" type="button">4</button></a>
                <a class ="link2" href=""><button class="page_button" type="button">&#62;&#62;</button></a>
            </div>
        </section>
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 
    </footer>
</body>
</html>
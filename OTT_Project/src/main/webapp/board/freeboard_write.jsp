<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/board/board.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://localhost:9000/OTT_Project/js/board.js"></script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="notice_write">
        <section class="notice_write">
            <h1>자유게시판-글쓰기</h1>
            <form name="freeboard_write_Form" action="freeboard_write_proc.jsp" method="post" id="freeboard_write_Form">
                <table class="board_update_delete_write">
                    <tr>
                        <td>
                            <input type="text" name="title" id="freeboard_write_title" placeholder="제목을 입력해주세요">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea rows="10" cols="50" name="content" id="freeboard_write_content" placeholder="내용을 입력해주세요"></textarea>                   
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="" id="" onclick="freeboard_write_FormCheck()">글쓰기</button>
                            <a href="http://localhost:9000/OTT_Project/board/freeboard_list.jsp">
                                <button type="button" class="">취소</button>
                            </a>
                           
                        </td>
                    </tr>
                </table>
            </form>
        </section>
        
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </footer>
</body>

</html>
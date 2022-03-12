<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://localhost:9000/OTT_Project/js/adminpage.js"></script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/adminpage/admin_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>        <section class="notice_list">
        <div class="notice_write">
	        <section class="notice_write">
	            <h1>문의하기-글쓰기</h1>
	            <form name="aminpage_question_write_Form" action="adminpage_questionboard_write_proc.jsp" method="post">
	            <input type="hidden" name="nid" value=""> 
	                <table class="board_update_delete_write">
	                    <tr>
	                        <td>
	                            <input type="text" name="title" value="" id="questionboard_write_title">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <textarea rows="10" cols="50" name="content" id="questionboard_write_content"></textarea>                   
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <button type="submit" class="" onclick="questionboard_write_FormCheck()">글쓰기</button>
	                            <a href="http://localhost:9000/OTT_Project/adminpage/adminpage_questionboard_list.jsp">
	                                <button type="button" class="">취소</button>
	                            </a>
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </section>
        </div>
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 
    </footer>
</body>
</html>
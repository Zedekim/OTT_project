<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/adminpage/admin_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        <div class="notice_write">
	        <section class="notice_write">
	            <h1>자유게시판-글쓰기</h1>
	            <form name="notice_write_Form" action="board_write_proc.jsp" method="post">
	            <input type="hidden" name="nid" value=""> 
	           
	                <table class="board_update_delete_write">
	                    <tr>
	                      
	                        <td>
	                            <input type="text" name="ntitle" value="" id="ntitle">
	                        </td>
	                    </tr>
	                    <tr>
	                        
	                        <td>
	                            <textarea rows="10" cols="50" name="bcontent" id="bcontent">수정할 내용이 출력되는 공간입니다.
	                            취소하기는 이전페이지로 가게 됩니다.</textarea>                   
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <button type="submit" class="" onclick="">글쓰기</button>
	                            <a href="http://localhost:9000/OTT_Project/adminpage/adminpage_freeboard_list.jsp">
	                                <button type="button" class="">취소</button>
	                            </a>
	                           
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </section>
        </div>
    </div>
</body>
<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>
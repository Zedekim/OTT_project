<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, com.ott.vo.CommentVO, java.util.ArrayList" %>
<%
    BoardDao dao = new BoardDao();

    String num=request.getParameter("num");
    BoardVO vo= dao.select(num,"admin_content");
    ArrayList<CommentVO> clist =dao.select(num);
%>
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
        <div class="notice_content_total">
	        <section class="notice_content">
	            <h1>공지사항 상세보기</h1>
	            <table border=1 class="notice_content admin_board_content_table">
	                <tr>
	                    <td colspan="3"><%=vo.getTitle() %></td>
	                </tr>
	                <tr>
	                    <td ><%=dao.getnick(vo.getId()) %></td>
	                    <td><%=vo.getDate() %></td>
	                    <td><%=vo.getHit() %></td>
	                </tr>
	                <tr>
	                    <td colspan="3">
	                        <%=vo.getContent() %>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="3">
	                        <a href="http://localhost:9000/OTT_Project/adminpage/adminpage_noticeboard_update_delete.jsp">
	                            <button type="button" class="">수정하기</button>
	                        </a>
	                        <a href="">
	                            <button type="button" class="">삭제하기</button>
	                        </a>
	                        <a href="http://localhost:9000/OTT_Project/adminpage/adminpage_noticeboard_list.jsp">
	                            <button type="button" class="">목록으로</button>
	                        </a>
	                        <a href="http://localhost:9000/OTT_Project/main.jsp">
	                            <button type="button" class="">홈으로</button>
	                        </a>
	                    </td>
	                </tr>
	            </table>
	        </section>
        </div>
    </div>
     <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 
    </footer>
</body>
</html>
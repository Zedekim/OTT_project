<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, com.ott.vo.CommentVO, java.util.ArrayList" %>
<%
    BoardDao dao = new BoardDao();

    String num=request.getParameter("num");
    BoardVO vo= dao.select(num,"content");
    ArrayList<CommentVO> clist =dao.select(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/board/board.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://localhost:9000/OTT_Project/js/board.js"></script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
     <div class="content">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/board/cs_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        <div class="notice_content_total">
	        <section class="notice_content">
	            <h1>문의사항 상세보기(유저 기준)</h1>
	            <table border=1 class="notice_content cs_table">
	                <tr>
	                    <td colspan="3"><%=vo.getTitle() %></td>
	                </tr>
	                <tr>
	                    <td ><%=dao.getnick(vo.getId()) %></td>
	                    <td><%=vo.getDate() %></td>
	                    <td>답변완료</td>
	                </tr>
	                <tr>
	                    <td colspan="3"><%=vo.getContent() %></td>
	                </tr>
	                <tr>
	                    <td colspan="3">
	                        
	                        <a href="http://localhost:9000/OTT_Project/board/questionboard_list.jsp">
	                            <button type="button" class="">목록으로</button>
	                        </a>
	                    </td>
	                </tr>
	            </table>
	             <!-- 밑에서 부터 댓글 추가 --> 
	            <div>
	            <form name="questionboard_commentForm" method="post" action="questionboard_comment_write_proc.jsp" id="questionboard_commentForm">
                  <input type="hidden" name="bnum" value="<%=num %>">
                  <table class="cs_comment comment_table" >
                         <tr>
                             <td class="comment_nick"><%=(String)session.getAttribute("sid")%></td>
                             <td class="comment_text">
                                <textarea id = "questionboard_commentText" style="height:50px;" class="form-control" placeholder="댓글을 입력해주세요." name="content"></textarea>
                             </td>
                             <td class="comment_btn">
                                <button type="button" class="comment_btn" onclick="questionboard_comment_FormCheck()">댓글달기</button>
                             </td>
                         </tr>
                </table>
              </form>
                 <table class="cs_comment other_comment">
                     <%for(CommentVO cvo:clist){ %>
                      <tr>
                          <td class="comment_nick"><%=cvo.getId() %></td>
                          <td class="comment_text">
                             <%=cvo.getContent() %>
                          </td>
                      </tr>
                      <%} %>
                 </table>
                </div>
	        </section>
        </div>
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px"></iframe>
    </footer>
</body>

</html>
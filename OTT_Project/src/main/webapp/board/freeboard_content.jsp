<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, com.ott.vo.CommentVO, java.util.ArrayList" %>
<%
    BoardDao dao = new BoardDao();

    String sid = (String)session.getAttribute("sid");
    String num=request.getParameter("num");
    BoardVO vo= dao.select(num,"content");
    ArrayList<CommentVO> clist =dao.select(num);
   /*  System.out.println(num);
    System.out.println(clist.size()); */
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
     <div class="notice_content_total">
        <section class="freeboard_content">
            <h1>자유게시판 상세보기</h1>
            <!-- (권한이 있는 유저만 수정하기, 삭제하기 보임).  -->
            <table border=1 class="freeboard_content">
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
                        <button type="button" class="good" onclick="">
                           <img src="http://localhost:9000/OTT_Project/images/good2.png">
                        </button>
                        <button type="button" class="bad" onclick="">
                         <img src="http://localhost:9000/OTT_Project/images/bad2.png">
                        </button>
                        <br>
	                    <span class = "goodcnt" ><%=vo.getGood() %></span>
	                    <span class = "badcnt" ><%=vo.getBad()%></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                            <a href="http://localhost:9000/OTT_Project/board/freeboard_update_delete.jsp?num=<%=num%>">
                            <button type="button" class="">수정하기</button>
                        </a>
                         <a href="freeboard_delete.jsp?num=<%=num%>">
                            <button type="submit" class="">삭제하기</button>
                        </a>
                        <a href="http://localhost:9000/OTT_Project/board/freeboard_list.jsp">
                            <button type="button" class="">목록으로</button>
                        </a>
                        <a href="http://localhost:9000/OTT_Project/main.jsp">
                            <button type="button" class="">홈으로</button>
                        </a>
                    </td>
                </tr>
            </table>

			   <!-- 밑에서 부터 댓글 추가 --> 
			
			 <form method="post" action="freeboard_comment_write_proc.jsp" id="freeboard_commentForm">
			      <input type="hidden" name="bnum" value="<%=num %>">
			      <table class="comment_table" >
			             <tr>
			                 <td class="comment_nick"><%=(String)session.getAttribute("sid")%></td>
			                 <td class="comment_text">
			                    <textarea id = "freeboard_commentText" style="height:50px;" class="form-control" placeholder="댓글을 입력해주세요." name="content"></textarea>
			                 </td>
			                 <td class="comment_btn">
			                    <button type="button" class="comment_btn" onclick="freeboard_comment_FormCheck()">댓글달기</button>
			                 </td>
			             </tr>
			    </table>
			  </form>
			     <table class="other_comment">
			         <%for(CommentVO cvo:clist){ %>
			          <tr>
			              <td class="comment_nick"><%=cvo.getId() %></td>
			              <td class="comment_text">
			                 <%=cvo.getContent() %>
			              </td>
			          </tr>
			          <%} %>
			     </table>	
       </section>
	</div>
    <script type="text/javascript">
 
    function deletePage(idx){
        if(confirm("글을 삭제합니다")==true){
            location.href=""+idx;
            //delete.jsp?idx= ""안에 들어갈 코드예시. 
        }
    };
    
    
</script>
</body>

<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>
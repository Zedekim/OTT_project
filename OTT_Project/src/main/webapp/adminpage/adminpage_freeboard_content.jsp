<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, com.ott.vo.CommentVO, java.util.ArrayList" %>
<%
    BoardDao dao = new BoardDao();

    String num=request.getParameter("num");
    BoardVO vo= dao.select(num,"admin_content");
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
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
     <div class="content">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/adminpage/admin_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        <div class="notice_content_total">
	        <section class="freeboard_content">
	            <h1>자유게시판 상세보기</h1>
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
	                        <sapn class = "goodcnt" ><%=vo.getGood() %></span>
	                        <span class = "badcnt" ><%=vo.getBad()%></span>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="3">
	                        <a href="http://localhost:9000/OTT_Project/board/freeboard_update_delete.jsp">
	                            <button type="button" class="">수정하기</button>
	                        </a>
	                            <button type="button" class="deletePage()">삭제하기</button>
	                            <!-- idx값은 게시판 고유번호(pk제약. 시퀀스 추가)임 -->
	                        
	                        <a href="http://localhost:9000/OTT_Project/board/freeboard_list.jsp">
	                            <button type="button" class="">목록으로</button>
	                        </a>
	                        <a href="http://localhost:9000/OTT_Project/main.jsp">
	                            <button type="button" class="">홈으로</button>
	                        </a>
	                    </td>
	                </tr>
	            </table>
	        </section>

     
     <!-- 밑에서 부터 댓글 추가 --> 
	
	  <form method="post" action="commentAction.jsp" id="commentForm">
	        
        <table class="content" >
	                <tr>
	                    <td class="">닉네임</td>
	                    <td class="comment_text"><textarea id = "commentText" style="height:50px;" class="form-control" placeholder="댓글을 입력해주세요." name="commentText"></textarea></td>
	                    
	                    <td class="">
	                       <button type="submit">댓글달기</button>
	                    
	                    </td>
	                </tr>
	     </table>
	   </form>
         <table class="other_comment">
	                <tr>
	                    <td class="">2</td>
	                    
	                    <td class="" >누군가 입력한 댓글 내용</td>
	                    
	                </tr>
	     </table>	
	     
	       <table class="other_comment">
                    <tr>
                        <td class="">user3</td>
                        <td class="" >누군가 입력한 댓글 내용2</td>
                        
                    </tr>
         </table>   
       
                
    </div>
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
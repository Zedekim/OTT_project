<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8");

	
    //BoardDao dao = new BoardDao();
    //ArrayList<BoardVO> list = dao.select();
    int count = 0;
    int boardtype = 2;
	BoardDao dao = new BoardDao();
	count = dao.getPageCount(boardtype);
	
    int pageSize = 5;  // 한 페이지에 출력할 레코드 수
    
    /* String sid = request.getParameter("sid"); */
    BoardDao dao1 = new BoardDao();
 String search_value = request.getParameter("serach_value");
   System.out.println("search_value=" + search_value);
    String list_search = request.getParameter("freeboard_list_search");
    String list_search_trim = list_search.trim();
   System.out.println("freeboard_list_search=" +  list_search); 

   
    //a에 쿼리문에서의 board_title 과 같은 값이 들어가야함
    
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null){
    	pageNum = "1";
    }
    
    int currentPage = Integer.parseInt(pageNum); // 현재 페이지
    int startRow = (currentPage - 1) * pageSize+1;
	int endRow = currentPage * pageSize;
					          
	ArrayList<BoardVO> list = new ArrayList<BoardVO>();
	
	if(count > 0){
		list = dao.select_search_freeboard(2, list_search_trim, search_value,startRow, endRow); 
		System.out.println(list.size()); 
	}
%>   
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
    <div class="notice_list_total">
        <section class="notice_list">
            <h1>자유게시판</h1>
            <table border=1 class="notice_list">
                <!-- <thead class="table-light"> -->
             <tr>
                     <td colspan="6" >
                     <form name="freeboard_list_search_Form" action="freeboard_list_search_proc.jsp" method="post">
                       <select class="select_style1" name="freeboard_list_search" id="freeboard_list_search"> 
                                <option value="total">전체</option>
                                <option value="board_content">내용</option>
                                <option value="mem_nick">작성자</option>
                                <option value="board_title">제목</option>
                      </select>
                        
                     <input class="input_style1" type="text" name="serach_value" id="search_value"> <button class="btn_style2" type="submit" onclick="freeboard_search_FormCheck()">검색</button>
                    </form>
                     </td>
              </tr>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                </tr>
                
                <%-- 
                <% for(BoardVO vo : list){%>
                <tr class="need_center">
                    <td><%=vo.getRno() %></td>
                    <td><a href="http://localhost:9000/OTT_Project/board/freeboard_content.jsp?num=<%=vo.getNum()%>
                                 &pageNum=<%=currentPage%>"><%=vo.getTitle()%></a></td>
                    <td><%= dao.getnick(vo.getId()) %></td>
                    <td><%= vo.getDate() %></td>
                    <td><%= vo.getHit() %></td>
                    <td><%= vo.getGood() %></td>
                </tr>
                <% } %>
                --%>
               <%
               		if(count > 0){
               			int number = count - (currentPage - 1) * pageSize;
             						
               			for (int i = 0; i < list.size(); i++){
               				BoardVO board = list.get(i);
                %>
                <tr>
                	<td><%=number--%></td>
                	<td>
                    <a href="http://localhost:9000/OTT_Project/board/freeboard_content.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%>[<%=dao.count_comment(board.getNum()) %>]</a>
                    </td>
                    <td><%=dao.getnick(board.getId())%></td>
                    <td><%=board.getDate()%></td>
                	<td><%=board.getHit()%></td>
                	<td><%=board.getGood()%></td>
                	
               	<%
               	
               			} //for 끝
               		} else {
               	%>
               			<td colspan="6" align="center">게시글이 없습니다.</td>
                <%
               		}
               %>
               </tr>
               
               <tr class="need_right" >
                    <td colspan="6">
                        <a href="http://localhost:9000/OTT_Project/board/freeboard_write.jsp">
                            <button type="button" class="">글쓰기</button>
                        </a>
                        
                    </td>
               </tr>
               
            </table>
            <div class="page_button_box">
            	<%
            		if(count > 0){
            			int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
            			
            			int pageBlock = 3;
            			
            			int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
            			int endPage = startPage + pageBlock -1;
            			
            			if(endPage > pageCount){
            				endPage = pageCount;
            			}
            			
            			if(startPage > pageBlock){
            				%>
            				<a class ="link2" href="freeboard_list.jsp?pageNum=<%=startPage - pageBlock %>">
            				<button class="page_button" type="button">&#60;&#60;</button>
            				</a>
            				<%
            			}
            			
            			for(int i=startPage; i <= endPage; i++){
            				
            				if(i == currentPage){
            					%>
            					<button class="page_button" type="button"><%=i %></button>
            					<%
            				}else{
            					%>
            					<a class ="link2" href="freeboard_list.jsp?pageNum=<%=i%>">
            					<button class="page_button" type="button"><%=i %></button></a>
            					<%
            				}
            			}// for end
            			
            			if(endPage < pageCount){
            				
            				%>
            				<a class ="link2" href="freeboard_list.jsp?pageNum=<%=startPage + pageBlock %>">
            				<button class="page_button" type="button">&#62;&#62;</button></a>
            				<%
            			}
            		
            		}
            	
            	%>
                
                
            </div>
        </section>
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 
    </footer>
</body>
</html>
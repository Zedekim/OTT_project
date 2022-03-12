<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.CommentVO, com.ott.dao.BoardDao,java.util.ArrayList" %>
    
<%
    //BoardDao dao = new BoardDao();
    //ArrayList<BoardVO> list = dao.select();
    int count = 0;
    BoardDao dao = new BoardDao();
    String sid = (String)session.getAttribute("sid");
    count = dao.getMyPageCommentsCount(sid);
    
	if(sid != null){
	    int pageSize = 5;  // 한 페이지에 출력할 레코드 수
	    
	    String pageNum = request.getParameter("pageNum");
	    if (pageNum == null){
	    	pageNum = "1";
	    }
	    
	    int currentPage = Integer.parseInt(pageNum); // 현재 페이지
	    int startRow = (currentPage - 1) * pageSize+1;
		int endRow = currentPage * pageSize;
		
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		if(count > 0){
			list = dao.myCommSelect(sid,startRow, endRow);
		}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/mypage/mypage.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
       <iframe class="menulist" src="mypage_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
	   <div class="mypage_comment_list_total">
	        <section class="mypage_comment_list">
	            <h1>내 댓글</h1>
	            <table border=1 class="mypage_comment_list">
	               <tr>
	                     <td colspan="3" >
		                     <form name="mypage_comment_search_form" action="#" method="get">
			                     <select class="select_style1" name="mypage_comment_search_category" id="mypage_comment_search_category"> 
				                     <option value="total">전체</option>
				                     <option value="content">내용</option>
			                     </select>
			                     <input class="input_style1" type="text" name="mypage_comment_search">
			                     <button type="button" class="btn_style3" onclick="">검색</button>
		                     </form>
	                     </td>
	              </tr>
	              <tr>
	                  <th>선택</th>
	                  <th>내용</th>
	                  <th>작성일자</th>
	              </tr>
	              <form name="mypage_comment_delete_form" action="#" method="get">
	                <%for(CommentVO vo:list){
	                	String url="";
	                	String board_num="";
	                	String title="";
	                	if(vo.getBnum()!=null){
	                		board_num=vo.getBnum();
	                		title=vo.getBtitle();
	                		
		                	if(vo.getBtype()==1){
	                            url="http://localhost:9000/OTT_Project/board/noticeboard_content.jsp?num="+board_num;
	                        }else if(vo.getBtype()==2){
	                            url="http://localhost:9000/OTT_Project/board/freeboard_content.jsp?num="+board_num;
	                        }else if(vo.getBtype()==3){
	                            url="http://localhost:9000/OTT_Project/board/questionboard_content.jsp?num="+board_num;
	                        }else if(vo.getBtype()==4){
	                            url="http://localhost:9000/OTT_Project/board/faqboard_content.jsp?num="+board_num;
	                        }
		                	
	                	}else if(vo.getRnum()!=null){
	                		board_num=vo.getRnum();
	                		title=vo.getRtitle();
	                		url="http://localhost:9000/OTT_Project/board/starboard_content.jsp?num="+board_num;
	                	}
	                %>
		              <tr class="need_center">
		                  <td rowspan="2">
		                   <input type="checkbox" name="mypage_comment_delete" value="1"></button>
		                  </td>
   		                  <td class="left_text1">
   		                      <a href="<%=url%>">
   	       	                   <%=vo.getContent()%>
   	       	                  </a>
   		                  </td>
		                  <td rowspan="2"><%=vo.getDate() %></td>
		              </tr>
		              <tr>
		                <td class="left_text2"><%=title %></td>
		              </tr>
		              <%} %>
		             <tr class="need_right" >
		                  <td colspan="3">
		                      <a href=""><button type="button" class="btn_style3" onclick="">삭제</button></a>
		                  </td>
		             </tr>
	              </form>
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
            				<a class ="link2" href="http://localhost:9000/OTT_Project/mypage/mypage_comments.jsp?pageNum=<%=startPage - pageBlock %>">
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
            					<a class ="link2" href="http://localhost:9000/OTT_Project/mypage/mypage_comments.jsp?pageNum=<%=i%>">
            					<button class="page_button" type="button"><%=i %></button></a>
            					<%
            				}
            			}// for end
            			
            			if(endPage < pageCount){
            				
            				%>
            				<a class ="link2" href="http://localhost:9000/OTT_Project/mypage/mypage_comments.jsp?pageNum=<%=startPage + pageBlock %>">
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
<% }else{ %>
	<script>
		alert("접근권한이 필요한 합니다. 확인 후 진행해주세요.");
		location.href="http://localhost:9000/OTT_Project/login/login.jsp";
	</script>
<% } %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, com.ott.vo.StarBoardVO,java.util.ArrayList" %>
    
<%
    int count = 0;
    BoardDao dao = new BoardDao();
    String sid = (String)session.getAttribute("sid");
    count = dao.getMyPageReviewCount(sid);
    
	if(sid != null){
	    int pageSize = 5;  // 한 페이지에 출력할 레코드 수
	    
	    String pageNum = request.getParameter("pageNum");
	    if (pageNum == null){
	    	pageNum = "1";
	    }
	    
	    int currentPage = Integer.parseInt(pageNum); // 현재 페이지
	    int startRow = (currentPage - 1) * pageSize+1;
		int endRow = currentPage * pageSize;
		
		ArrayList<StarBoardVO> list = new ArrayList<StarBoardVO>();
		if(count > 0){
			list = dao.getMyPageReviewList(sid,startRow, endRow);
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
	   <div class="mypage_review_list_total">
	        <section class="mypage_review_list">
	            <h1>내 평가글</h1>
	            <table border=1 class="mypage_review_list">
	               <tr>
	                     <td colspan="5" >
		                     <form name="mypage_review_search_form" action="" method="get">
			                     <select class="select_style1" name="mypage_review_search_category" id="mypage_review_search_category"> 
				                     <option value="total">전체</option>
				                     <option value="platform">플랫폼</option>
				                     <option value="content">내용</option>
				                     <option value="title">제목</option>
			                     </select>
			                     <input class="input_style1" type="text" name="mypage_review_search">
			                     <button type="submit" class="btn_style3" >검색</button>
		                     </form>
	                     </td>
	              </tr>
	              <tr>
	                  <th>번호</th>
	                  <th>플랫폼</th>
	                  <th>제목</th>
	                  <th>작성일자</th>
	                  <th>조회수</th>
	              </tr>
				        <%
		               		if(count > 0){
		               			int number = count - (currentPage - 1) * pageSize;
		             						
		               			for (int i = 0; i < list.size(); i++){
		               				StarBoardVO board = list.get(i);
		                %>
		                
		                <tr class="need_center">
		                	<td><%=number--%></td>
		                	<td><%=board.getPlat()%></td>
		                	<td>
		                	<a href="http://localhost:9000/OTT_Project/board/starboard_content.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%></a>
		                    </td>
		                    <td><%=board.getDate()%></td>
		                	<td><%=board.getHit()%></td>
		     
		                	
		               	<%
		               			} //for 끝
		               		} else {
		               	%>
		               			<td colspan="6" align="center">게시글이 없습니다.</td>
		                <%
		               		}
		               %>
		             <tr class="need_right" >
		                  <td colspan="5">
		                      <a href="http://localhost:9000/OTT_Project/board/starboard_write.jsp">
		                          <button type="button" class="btn_style3" onclick="">글쓰기</button>
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
            				<a class ="link2" href="starboard_list.jsp?pageNum=<%=startPage - pageBlock %>">
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
            					<a class ="link2" href="starboard_list.jsp?pageNum=<%=i%>">
            					<button class="page_button" type="button"><%=i %></button></a>
            					<%
            				}
            			}// for end
            			
            			if(endPage < pageCount){
            				
            				%>
            				<a class ="link2" href="starboard_list.jsp?pageNum=<%=startPage + pageBlock %>">
            				<button class="page_button" type="button">&#62;&#62;</button></a>
            				<%
            			}
            		
            		}
            	
            	%>
                
                
            </div>
	        </section>
	    </div>
</body>
</html>
<% }else{ %>
	<script>
		alert("접근권한이 필요한 합니다. 확인 후 진행해주세요.");
		location.href="http://localhost:9000/OTT_Project/login/login.jsp";
	</script>
<% } %>
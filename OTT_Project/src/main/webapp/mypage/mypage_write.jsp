
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.BoardVO, com.ott.dao.BoardDao,java.util.ArrayList" %>
    
    <%
	
    //BoardDao dao = new BoardDao();
    //ArrayList<BoardVO> list = dao.select();
    int count = 0;
    BoardDao dao = new BoardDao();
    String sid = (String)session.getAttribute("sid");
    count = dao.getMyPageFreeCount(sid);
    
	if(sid != null){
	    int pageSize = 5;  // 한 페이지에 출력할 레코드 수
	    
	    String pageNum = request.getParameter("pageNum");
	    if (pageNum == null){
	    	pageNum = "1";
	    }
	    
	    int currentPage = Integer.parseInt(pageNum); // 현재 페이지
	    int startRow = (currentPage - 1) * pageSize+1;
		int endRow = currentPage * pageSize;
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		if(count > 0){
			list = dao.MyBoardselect(sid,startRow, endRow);
		}
%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/mypage/mypage.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
       <iframe class="menulist" src="mypage_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
	   <div class="mypage_writing_list_total">
	        <section class="mypage_writing_list">
	            <h1>내 게시글</h1>
	            <table border=1 class="mypage_writing_list">
	               <tr>
	                     <td colspan="4" >
		                     <form name="mypage_writing_search_form" action="" method="get">
			                     <select class="select_style1" name="mypage_writing_search_category" id="mypage_writing_search_category"> 
				                     <option value="total">전체</option>
				                     <option value="content">내용</option>
				                     <option value="title">제목</option>
			                     </select>
			                     <input class="input_style1" type="text" name="mypage_writing_search">
			                     <button type="submit" class="btn_style3">검색</button>
		                     </form>
	                     </td>
	              </tr>
	              <tr>
	                  <th>선택</th>
	                  <th>제목</th>
	                  <th>작성일자</th>
	                  <th>조회수</th>
	              </tr>
	              <form name="mypage_writing_delete_form" action="" method="get">
		               <% for(BoardVO vo : list){
		            	   
		            	   String url="";
	                        if(vo.getType()==1){
	                            url="http://localhost:9000/OTT_Project/board/noticeboard_content.jsp?num=";
	                        }else if(vo.getType()==2){
	                            url="http://localhost:9000/OTT_Project/board/freeboard_content.jsp?num=";
	                        }else if(vo.getType()==3){
	                            url="http://localhost:9000/OTT_Project/board/questionboard_content.jsp?num=";
	                        }else if(vo.getType()==4){
	                            url="http://localhost:9000/OTT_Project/board/faqboard_content.jsp?num=";
	                        }
		               %>
                        <tr class="need_center">
                            <td><input type="checkbox" name="notice_delete_seleted" value=></td>
                            <td>
                                <a href="<%=url+vo.getNum()%>"><%=vo.getTitle()%></a>
                            </td>
                            <td><%= vo.getDate() %></td>
                            <td><%= vo.getHit() %></td>
                        </tr>
                        
                        <%} %> <%-- for end --%>
                        
		             <tr class="need_right" >
		                  <td colspan="4">
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
            				<a class ="link2" href="mypage_write.jsp?pageNum=<%=startPage - pageBlock %>">
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
            					<a class ="link2" href="mypage_write.jsp?pageNum=<%=i%>">
            					<button class="page_button" type="button"><%=i %></button></a>
            					<%
            				}
            			}// for end
            			
            			if(endPage < pageCount){
            				
            				%>
            				<a class ="link2" href="mypage_write.jsp?pageNum=<%=startPage + pageBlock %>">
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
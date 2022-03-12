<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, java.util.ArrayList, java.util.List" %>
    
 <%
    int count = 0;
 	int boardtype = 4;
	BoardDao dao = new BoardDao();
	count = dao.getPageCount(boardtype);
	
	
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
		list = dao.getPageList(boardtype,startRow, endRow);
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/board/board.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/board/cs_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        <div class="notice_list_total">
	        <section class="notice_list">
	            <h1>FAQ</h1>
	            <table border=1 class="notice_list cs_table">
	                <!-- <thead class="table-light"> -->
	             <tr>
	                     <td colspan="3" >
	                       <select class="select_style1" name="notice_search" id="notice_search"> 
	                                <option value="total">전체</option>
	                                <option value="author">내용</option>
	                                <option value="content">작성자</option>
	                                <option value="title">제목</option>
	                      </select>
	                     <input class="input_style1" type="text"> <button class="btn_style2" type="button">검색</button>
	                     
	                     </td>
	              </tr>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                </tr>
	                
	            <%
               		if(count > 0){
               			int number = count - (currentPage - 1) * pageSize;
             
               			for (BoardVO vo : list){
               				
                %>
                <tr>
                	<td><%=number--%></td>
                	<td>
                	<a href="http://localhost:9000/OTT_Project/board/faqboard_content.jsp?num=<%=vo.getNum()%>"><%=vo.getTitle()%></a>
                    </td>
                    <td><%=dao.getnick(vo.getId())%></td>
                	
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
	                    <td colspan="3">
	                        
	                    </td>
	               </tr>
	            </table>
	            <div class="page_button_box">
            	<%
            		if(count > 0){
            			int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
            			
            			int pageBlock = 4;
            			
            			int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
            			int endPage = startPage + pageBlock -1;
            			
            			if(endPage > pageCount){
            				endPage = pageCount;
            			}
            			
            			if(startPage > pageBlock){
            				%>
            				<a class ="link2" href="faqboard_list.jsp?pageNum=<%=startPage - pageBlock %>">
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
            					<a class ="link2" href="faqboard_list.jsp?pageNum=<%=i%>">
            					<button class="page_button" type="button"><%=i %></button></a>
            					<%
            				}
            			}// for end
            			
            			if(endPage < pageCount){
            				
            				%>
            				<a class ="link2" href="faqboard_list.jsp?pageNum=<%=startPage + pageBlock %>">
            				<button class="page_button" type="button">&#62;&#62;</button></a>
            				<%
            			}
            		
            		}
            	
            	%>
            </div>
	        </section>
        </div>
    </div>
</body>
<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>
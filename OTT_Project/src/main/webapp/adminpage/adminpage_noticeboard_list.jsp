<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.BoardVO, com.ott.dao.BoardDao, java.util.ArrayList" %>
<%
    BoardDao dao = new BoardDao();
    ArrayList<BoardVO> list = dao.select(1);
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
        <div class="notice_list_total">
	        <section class="notice_list">
	            <h1>공지사항</h1>
	            
	            <table border=1 class="notice_list">
	                <!-- <thead class="table-light"> -->
	             <tr>
	                     <td colspan="6" >
	                       <select class="select_style1" name="notice_search" id="notice_search"> 
	                                <option value="total">전체</option>
	                                <option value="title">제목</option>
	                                <option value="author">내용</option>
	                                <option value="content">작성자</option>
	                      </select>
	                     <input class="input_style1" type="text"> <button class="" type="button">검색</button>
	                     
	                     </td>
	              </tr>
	                <tr>
	                    <th>선택</th>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일자</th>
	                    <th>조회수</th>
	                </tr>
	                <form name="noticeboard_delete_form" action="" method="get">
	                   <% for(BoardVO vo : list){%>
		                <tr class="need_center">
		                    <td><input type="checkbox" name="notice_delete_seleted" value=></td>
		                    <td><%=vo.getRno() %></td>
		                    <td><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_noticeboard_content.jsp?num=<%=vo.getNum()%>"><%=vo.getTitle()%></a></td>
		                    <td><%= dao.getnick(vo.getId()) %></td>
		                    <td><%= vo.getDate() %></td>
		                    <td><%= vo.getHit() %></td>
		                </tr>
		                <%} %>
		               <tr class="need_right" >
		                    <td colspan="6">
                                <button type="button" class="" onclick="">삭제</button>
	                            <a href="http://localhost:9000/OTT_Project/adminpage/adminpage_noticeboard_write.jsp">
                                    <button type="button" class="">글쓰기</button>
                                </a>
		                    </td>
		               </tr>
	               </form>
	            </table>
	            <div class="page_button_box">
                <a class ="link2" href=""><button class="page_button" type="button">&#60;&#60;</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">1</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">2</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">3</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">4</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">&#62;&#62;</button></a>
	            </div>
	        </section>
        </div>
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 
    </footer>
</body>
</html>
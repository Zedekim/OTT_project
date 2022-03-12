<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.dao.BoardDao"%>

<%
	request.setCharacterEncoding("utf-8");
	String sid = (String)session.getAttribute("sid");
%>
<jsp:useBean id="vo"  class="com.ott.vo.BoardVO"></jsp:useBean> 
<jsp:setProperty property="title" name="vo"/>
<jsp:setProperty property="content" name="vo"/>
<jsp:setProperty property="type" name="vo" value="4"/>

<%
    BoardDao dao = new BoardDao();
    vo.setId(sid);
    int result = dao.insert(vo);
    
    if(result == 1){
        //게시글 등록 완료
        /* session.setAttribute("sid", vo.getId()); */        
        response.sendRedirect("http://localhost:9000/OTT_Project/adminpage/adminpage_faqboard_list.jsp");
    }else{
        response.sendRedirect("http://localhost:9000/OTT_Project/adminpage/adminpage_faqboard_write.jsp?write_result=fail");%>
        alert("글쓰기 실패");
   <% }
    
%>
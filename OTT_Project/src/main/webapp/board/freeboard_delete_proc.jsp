<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.dao.BoardDao"%>

    <%
    String sid = (String)session.getAttribute("sid");
    String num = request.getParameter("num");
    BoardDao dao = new BoardDao();
    int result = dao.delete(sid, num);
    
    if(result ==1) {
        response.sendRedirect("freeboard_list.jsp");
    }else{
        System.out.println("삭제실패");
    }
    
%>
    
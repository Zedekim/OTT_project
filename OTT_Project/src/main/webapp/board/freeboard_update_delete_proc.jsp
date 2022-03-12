<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.ott.vo.BoardVO, com.ott.dao.BoardDao" %>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="vo" class="com.ott.vo.BoardVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*" />

<%
	//System.out.println("num--->" + vo.getNum());
	//System.out.println("title--->" + vo.getTitle());
	//System.out.println("content--->" + vo.getContent());
%>

<%
    BoardDao dao = new BoardDao();
	int result = dao.update(vo);
	
	if(result ==1){
		response.sendRedirect("http://localhost:9000/OTT_Project/board/freeboard_list.jsp");
	}
%>